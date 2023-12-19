require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test "should belong to an article" do
    article = Article.create(
      title: "Valid Title",
      body: "This is a valid body with more than 10 characters."
    )
  
    comment = Comment.new(
      title: "Comment Title",
      body: "This is a valid comment body.",
      article: article
    )
  
    assert comment.save, "Could not save comment with an article"
    assert_equal article.id, comment.article.id, "Comment should belong to the specified article"  
end
