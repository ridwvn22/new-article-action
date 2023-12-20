require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "should have many comments" do
    article = Article.new(
      title: "Valid Title",
      body: "This is a valid body with more than 10 characters."
    )
    comment1 = Comment.new(commenter: "Commenter 1", body: "Comment body 1")
    comment2 = Comment.new(commenter: "Commenter 2", body: "Comment body 2")

    article.comments << comment1
    article.comments << comment2

    assert_equal 2, article.comments.length, "Article should have two comments"
    assert article.save, "Could not save article with comments"
  end

  test "should belong to a category" do
    category = Category.create(name: "Sample Category", description: "Category description")

    article = Article.new(
      title: "Valid Title",
      body: "This is a valid body with more than 10 characters.",
      category: category
    )

    assert article.save, "Could not save article with a category"
    assert_equal category.id, article.category.id, "Article should belong to the specified category"
  end


  test "should not save article without title" do
    category = Category.create(name: "Sample Category", description: "Category description")

    article = Article.new(
      body: "This is a valid body with more than 10 characters.",
      category: category
    )

    assert_not article.save, "Saved the article without a title"
  end

  test "should not save article with short body" do
    category = Category.create(name: "Sample Category", description: "Category description")

    article = Article.new(
      title: "Valid Title",
      body: "Short",
      category: category
    )

    assert_not article.save, "Saved the article with a short body"
  end

  test "should not save article without category" do
    article = Article.new(
      title: "Valid Title",
      body: "This is a valid body with more than 10 characters."
    )

    assert_not article.save, "Saved the article without a category"
  end
  test "should return the last five articles" do
    articles = []
    5.times do |i|
      articles << Article.create(title: "Article #{i}", body: "Body #{i}")
    end
    last_five_articles = Article.last_five
  
    assert_equal articles.last(5), last_five_articles, "Could not get the last five articles"
  end
  test "should get index" do
    get articles_url
    assert_response :success
    end
    
    test "should show article" do
    article = articles(:one)
    get article_url(article)
    assert_response :success
    end
    test "should get new" do
      get new_article_url
      assert_response :success
    end
  
    test "should create article" do
      assert_difference('Article.count') do
        post articles_url, params: { article: { title: "New Article", body: "New Article Body" } }
      end
      assert_redirected_to article_url(Article.last)
    end
  
    test "should get edit" do
      get edit_article_url(@article)
      assert_response :success
    end

    test "should update article" do
      assert_redirected_to article_url(@article)
      @article.reload
      assert_equal "Updated Article", @article.title
    end
  
    test "should destroy article" do
      assert_difference('Article.count', -1) do
        delete article_url(@article)
    end
end