class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, foreign_key:'post_id'
  has_many :likes, foreign_key:'post_id'


  after_save :increment_counter

  def last_five_comments
    comments.order(created_at: :desc).limit(5)
  end

  def increment_counter
    author.increment!(:posts_counter)
  end
end
