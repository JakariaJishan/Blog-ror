require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.new(name: 'Tom', posts_counter: 0) }
  let(:post) { Post.create(author: user, title: 'Hello', likes_counter: 0, comments_counter: 0) }

  it 'update_like_counter method should return 1' do
    Comment.create(text: 'comment1', author: user, post:)
    expect(post.comments_counter).to equal(1)
  end

  it 'update_like_counter method should increment user likes counter by one' do
    Comment.create(text: 'comment1', author: user, post:)
    Comment.create(text: 'comment2', author: user, post:)
    expect(post.comments_counter).to equal(2)
  end
end
