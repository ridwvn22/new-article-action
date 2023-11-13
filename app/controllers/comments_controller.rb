class CommentsController < ApplicationController
    http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

    def create
    @article = Article.find(params[:article_id])
    # ...
    end
    
    def create
      @category = Category.find(params[:category_id])
      @article = Article.find(params[:article_id])
  
      @comment = @article.comments.create(comment_params)
  
      redirect_to category_article_path(@category, @article)
    end
  
    def destroy
      @category = Category.find(params[:category_id])
      @article = Article.find(params[:article_id])
  
      @comment = @article.comments.find(params[:id])
      
      @comment.destroy
      redirect_to category_article_path(@category, @article), status: :see_other
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
  end


