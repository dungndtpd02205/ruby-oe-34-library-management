class BooksController < ApplicationController
  def index
    @books = Book.sort_name_or_create_at.paginate(page: params[:page]).per_page(Settings.book.pagi)
    return unless search_params

    search_books
  end

  private

  def search_params
    params.permit(:attributes, :value)
  end

  def search_books
    attribute = search_params[:attributes]
    value = search_params[:value]

    @books =  case attribute
              when Settings.book.name
                Book.search_by_book_name value
              when Settings.book.cate
                Book.joins(:categories).search_by_category_name value
              when Settings.book.author
                Book.joins(:author).search_by_author_name value
              when Settings.book.publish
                Book.joins(:publisher).search_by_publish_name value
              else
                @books
              end.sort_name_or_create_at.paginate(page: params[:page]).per_page(Settings.book.pagi)
    return if @books.present?

    flash[:fails] = t "book.mess.find_fails"
    redirect_to books_url
  end
end
