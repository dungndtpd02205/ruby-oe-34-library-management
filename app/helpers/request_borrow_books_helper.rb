module RequestBorrowBooksHelper
  def load_user_and_book user, book
    @list = {user: load_user(user), book: load_book(book)}
  end

  def list_book
    books = String.new
    Book.sort_name_or_create_at.each{|book| books += book.name + ", "}
    books
  end

  def load_request request
    @request = {user: load_user(request.user_id), book: load_book(request.book_id)}

    accept = link_to t("borrow.accept"),
      admin_request_borrow_book_path(request.id), method: :put
    reject = link_to t("borrow.reject"),
      admin_request_borrow_book_path(request.id), method: :delete,
      data:{confirm: t("borrow.confirm")}, remote: true, class: :delete
    return_book = link_to t("borrow.return"),
      admin_request_borrow_book_path(request.id), method: :put

    @request[:status] = request.status
    if request.status.nil?
      @request[:status] = t("borrow.wait")
      @request[:active] = accept+" | "+reject
    elsif request.status.eql? Settings.borrow.borrowing
      @request[:active] = return_book
    end

    @request
  end

  def check_time_borrow request
    check_date = request.end_date < Time.zone.now
    check_tus = request.status.eql? Settings.borrow.borrowing
    Settings.borrow.text if check_date && check_tus
  end

  def load_user id
    user = User.find_by id: id
    return user if user

    flash[:fails] = t "borrow.user"
    redirect_to root_url
  end

  def load_book id
    book = Book.find_by id: id
    return book if book

    flash[:fails] = t "borrow.book"
    redirect_to root_url
  end
end
