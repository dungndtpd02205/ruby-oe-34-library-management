class RequestBorrowBooksController < ApplicationController
  include RequestBorrowBooksHelper

  before_action :prepare_save_request, only: :create

  def new
    @request_borrow_book = RequestBorrowBook.new()
  end

  def create
    prepare_save_request
    if @request_borrow_book.save
      flash[:success] = t("borrow.borrow")
      redirect_to books_url
    else
      params[:book_id] = @request_borrow_book.book_id
      render :new
    end
  end

  private

  def params_request
    params.require(:request_borrow_book).permit(:user_id,
      :book_id, :start_date, :end_date)
  end

  def prepare_save_request
    book = Book.find_by(name: params_request[:book_id])
    if book.nil?
      flash[:fails] = t "borrow.book"
      redirect_to root_url
    end
    @request_borrow_book = book.request_borrow_books.build(params_request)
    @request_borrow_book.book_id = book.id
  end
end
