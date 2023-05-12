require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 2) }

  subject { Post.new(author: user, title: 'title1', text: 'this is text', comments_counter: 2, likes_counter: 4) }

  before { subject.save }

  it('title should be valid') do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it('title should be less than 250 character') do
    subject.title = 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin word, consectetur'

    expect(subject).to_not be_valid
  end

  it('likes counter should be positive integer') do
    subject.likes_counter = -3
    expect(subject).to_not be_valid
  end

  it('comments counter should be positive integer') do
    subject.comments_counter = -3
    expect(subject).to_not be_valid
  end

  it('last_five_comments method should return last five comments') do
    Comment.create(text: 'comment 1', post: subject, author: user)
    Comment.create(text: 'comment 2', post: subject, author: user)
    Comment.create(text: 'comment 3', post: subject, author: user)
    Comment.create(text: 'comment 4', post: subject, author: user)
    Comment.create(text: 'comment 5', post: subject, author: user)
    Comment.create(text: 'comment 6', post: subject, author: user)

    expect(subject.last_five_comments.length).to equal(5)
  end
end
