require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "should have many articles" do
    title: "Valid Title",
    body: "This is a valid body with more than 10 characters."

    article1 = Article.create(title: "Article 1", body: "Body 1", category: category)
    article2 = Article.create(title: "Article 2", body: "Body 2", category: category)
  
    assert_equal 2, category.articles.length, "Category should have two associated articles"
    assert article1.persisted?, "Could not save article1"
    assert article2.persisted?, "Could not save article2"
  end


  test "should not save category without name" do
      category = Category.create(name: "Sample Category", description: "Category description")
  
      category_without_name = Category.new(description: "This is a valid description.")
  
     assert_not category_without_name.save, "Saved the category without a name"
  end

  test "should not save category without description" do

        category = Category.create(name: "Sample Category", description: "Category description")
    
        category_without_description = Category.new(name: "This is a valid name")
    
       assert_not category_without_description.save, "Saved the category without a description"
  end

    test "should return the total number of articles in a category" do
        category = Category.create(name: "Sample Category", description: "Category description")

      Article.create(title: "Article 1", body: "Body 1", category: category)
      Article.create(title: "Article 2", body: "Body 2", category: category)
      Article.create(title: "Article 3", body: "Body 3", category: category)

    assert_equal 3, category.total_articles, "Could not get the correct total number of articles"
  end
  test "should get category index" do
    get categories_url
    assert_response :success
  end

  test "should get new category" do
    get new_category_url
    assert_response :success
  end
  test "should create category" do
    assert_difference('Category.count') do
      post categories_url, params: { category: { name: "New Category", description: "New Category Description" } }
    end
  test "should show category" do
    assert_difference('Category.count') do
      get category_url(@category)
      assert_response :success
  end
  test "should get edit" do
    get edit_category_url(@category)
    assert_response :success
  end
  test "should update category" do
    assert_redirected_to category_url(@category)
    @category.reload
    assert_equal "Updated Category", @category.name
  end
  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete category_url(@category)
    end
end
