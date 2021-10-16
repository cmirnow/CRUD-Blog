class CategoryPresenter
  def initialize(category)
    @category = category
  end

  attr_reader :category

  def title
    category.title
  end

  def description
    category.description
  end
end
