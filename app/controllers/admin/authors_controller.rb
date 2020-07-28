class Admin::AuthorsController < AdminController
  before_action :set_author,except: [:index, :new, :create]

  def index
    @authors = Author.sort_by_created_date.paginate(page:
      params[:page]).per_page(Settings.author.page)
  end

  def new
    @aut = Author.new()
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def create
    @author = Author.new(author_params)
    @author.image.attach(params[:author][:image])
    @author.save
    respond_to do |format|
      format.js
    end
  end

  def update
    @author.update(author_params)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @author.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def set_author
    @author = Author.find_by id: params[:id]
    return @author if @author

    flash[:fails] = t "book.mess.find_fails"
    redirect_to root_url
  end

  def author_params
    params.require(:author).permit(:full_name, :birth_day, :image)
  end

  def check_permission
    return if admin?

    flash[:fails] = t "login.permis"
    redirect_to root_url
  end
end
