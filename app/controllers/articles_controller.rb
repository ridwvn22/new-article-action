class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_category, only: %i[show edit update destory]

  def index
    @articles = Article.all
  end
  
  before_action :set_category

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = @category.articles
  end

  def show
    # @article = Article.find(params[:id])
  end

  def new
    # @article = Article.new
    @article = @category.articles.build
  end

  def create
    # @article = Article.new(article_params)

    # if @article.save
    #   redirect_to @article
    # else
    #   render :new, status: :unprocessable_entity
    # end
    @article = @category.articles.build(article_params)
    if @article.save
      redirect_to category_article_path(@category, @article), notice: 'Article was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @article = Article.find(params[:id])
  end

  def update
    # @article = Article.find(params[:id])

    # if @article.update(article_params)
    #   redirect_to @article
    # else
    #   render :edit, status: :unprocessable_entity
    # end
    # @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to category_article_path(@category, @article), notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    # @article = Article.find(params[:id])
    #redirect_to root_path, status: :see_other

    @article.destroy
    redirect_to category_articles_path(@category), notice: 'Article was successfully destroyed.'    
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end