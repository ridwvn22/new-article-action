class CategoriesController < ApplicationController
    # before_action :set_category, only: [:show, :edit, :update, :destroy]
    http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
    
    def index
      @categories = Category.all
    end
  
    # def show
    #   # Display category details and associated articles
    #   @articles = @category.articles
    # end

    def show
        @category = Category.find(params[:id])
    end

    def edit
        @category = Category.find(params[:id])
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
        redirect_to @category, notice: 'Category was created. '
        else
        render :new
    end

    def update
        @category = Category.find(params[:id])
        if
        @category.update(category_params)
            redirect_to @category, notice: 'Category was updated. '
        else
            render :edit
    end
    
    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to categories_path, notice: 'Category was deleted. '
        end
    end

    private
  
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params

        params.require(:category).permit(:name, :description)
    end
  end
end