class Admin::RequestBorrowBooksController < AdminController
  include RequestBorrowBooksHelper

  before_action :find_request, only: [:destroy, :update]

  def index
    @requests = RequestBorrowBook.sortby_created_date.paginate(page:
      params[:page]).per_page(Settings.book.pagi)
  end

  def destroy
    check_method_success @request.destroy, t("borrow.reject")
  end

  def update
    case @request.status
    when nil
      mess = t("borrow.accept")
      status = 0
    when Settings.borrow.borrowing
      mess = t("borrow.reuturn")
      status = 1
    end
    check_method_success @request.update_attribute(:status, status), mess
  end

  private

  def find_request
    @request = RequestBorrowBook.find_by id: params[:id]
    return @request if @request

    flash[:fails] = t("borrow.fails")
    redirect_to root_url
  end

  def check_method_success true_false, mess
    if true_false
      flash[:success] = t("borrow.mess_s", mess: mess)
    else
      flash[:fails] = t("borrow.mess_f", mess: mess)
    end
    redirect_to admin_request_borrow_books_url
  end
end
