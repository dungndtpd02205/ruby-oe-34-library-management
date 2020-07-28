class AuthorsController < ApplicationController
  include SessionsHelper

  before_action :set_author,only: :show

  def show
    @books = Book.joins(
      :author).search_by_author_name(@author.full_name).paginate(page:
        params[:page]).per_page(Settings.author.page)
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end
end
