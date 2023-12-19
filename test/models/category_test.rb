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


  test "should not save category without name" do
      category = Category.create(name: "Sample Category", description: "Category description")
  
      category_without_name = Category.new(description: "This is a valid description.")
  
     assert_not category_without_name.save, "Saved the category without a name"

  test "should not save category without description" do
        category = Category.create(name: "Sample Category", description: "Category description")
    
        category_without_description = Category.new(name: "This is a valid name")
    
       assert_not category_without_description.save, "Saved the category without a description"


    test "should return the total number of articles in a category" do
        category = Category.create(name: "Sample Category", description: "Category description")

      Article.create(title: "Article 1", body: "Body 1", category: category)
      Article.create(title: "Article 2", body: "Body 2", category: category)
      Article.create(title: "Article 3", body: "Body 3", category: category)

    total_articles_count = category.total_articles

    assert_equal 3, total_articles_count, "Could not get the correct total number of articles"
  end
end
