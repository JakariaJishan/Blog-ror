require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 2) }

  before { subject.save }

  it('user name should be valid') do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it('return false if posts_counter is not a positive integer') do
    subject.posts_counter = -5
    expect(subject).to_not be_valid
  end

  let(:user) { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0) }

  it('last_three_post method should return last three posts') do
    Post.create(author: user, title: 'title1', likes_counter: 0, comments_counter: 0)
    Post.create(author: user, title: 'title2', likes_counter: 0, comments_counter: 0)
    Post.create(author: user, title: 'title3', likes_counter: 0, comments_counter: 0)
    Post.create(author: user, title: 'title4', likes_counter: 0, comments_counter: 0)
    expect(user.last_three_post.length).to equal(3)
  end
end
