class PostPresenter
  def initialize(post)
    @post = post
  end

  attr_reader :post

  def updated_on
    'Updated on ' + post.updated_at.to_s
  end

  def created_at
    'Posted on ' + post.created_at.strftime("%d of %B %Y")
  end

  def description
    post.description
  end

  def keywords
    post.keywords
  end

  def category
    Category.published.friendly.find(post.category_id)
  rescue StandardError
  end

  def post_title
    post.title
  end
end
