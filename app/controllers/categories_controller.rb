class CategoriesController < ApplicationController
        def create
          @article = Article.find(params[:article_id])
          @category = @article.categories.create(category_params)
          redirect_to article_path(@article)
        end
      
        private
          def category_params
            params.require(:category).permit(:title, :body, :category_id)
          end
      end      
end
