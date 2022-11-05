class ArticlesController < ApplicationController
  # http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD'], except: [:index, :show]

  def index
    @articles = Article.kept
  end

  def show
    @article = Article.kept.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.kept.find(params[:id])
  end

  def update
    @article = Article.kept.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.kept.find(params[:id])
    @article.discard

    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end