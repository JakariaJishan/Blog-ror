require 'rails_helper'

RSpec.describe 'Post show page', type: :system do
  before(:each) do
    @user = User.create(name: 'Jishan', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=374&q=80', bio: 'Teacher from Mexico.', posts_counter: 2)

    @post = Post.create(author: @user, title: 'title1', text: 'this is text', comments_counter: 2, likes_counter: 4)

    @comment1 = Comment.create(post: @post, author: @user, text: 'First comment')
    @comment2 = Comment.create(post: @post, author: @user, text: 'Second comment')
  end

  it 'should show post title' do
    visit user_post_path(@user.id, @post.id)
    expect(page).to have_content('title1')
  end
  it 'should show post author' do
    visit user_post_path(@user.id, @post.id)
    expect(page).to have_content('Jishan')
  end
  it 'should show number of comments' do
    visit user_post_path(@user.id, @post.id)
    expect(page).to have_content('4')
  end
  it 'should show number of likes' do
    visit user_post_path(@user.id, @post.id)
    expect(page).to have_content('4')
  end
  it 'should show post body' do
    visit user_post_path(@user.id, @post.id)
    expect(page).to have_content('this is text')
  end
  it 'should show post body' do
    visit user_post_path(@user.id, @post.id)
    expect(page).to have_content('Jishan')
  end
  it 'should show comments of commenters' do
    visit user_post_path(@user.id, @post.id)
    expect(page).to have_content('Jishan')
  end

  it 'should show click on a post, it redirects me to that post\'s show page' do
    visit user_posts_path(@user.id)
    click_link 'this is text'
    expect(page).to have_content('First comment')
    expect(page).to have_content('Second comment')
  end
end
