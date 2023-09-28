class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_create :update_posts_count
  after_destroy :update_posts_count

  def update_posts_count
    author.update(posts_counter: author.posts.count)
  end

  def last_five_comments
    comments.order(created_at: :desc).limit(5)
  end
end
