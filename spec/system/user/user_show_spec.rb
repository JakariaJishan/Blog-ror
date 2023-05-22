require 'rails_helper'

RSpec.describe 'Users show page', type: :system do
 
  before(:each) do
    @user = User.create(name: 'Jishan', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=374&q=80', bio: 'Teacher from Mexico.', posts_counter: 2) 

    @post1 = Post.create(author: @user, title: 'title1', text: 'this is text 1', comments_counter: 2, likes_counter: 4)
    @post2 = Post.create(author: @user, title: 'title2', text: 'this is text 2', comments_counter: 2, likes_counter: 4)
    @post3 = Post.create(author: @user, title: 'title3', text: 'this is text 3', comments_counter: 2, likes_counter: 4)
    @post4 = Post.create(author: @user, title: 'title4', text: 'this is text 4', comments_counter: 2, likes_counter: 4)

  end

  it 'should show user profile pic' do
    visit user_path(@user.id)
    expect(page).to have_selector('img')
  end
  it 'should show user name' do
    visit user_path(@user.id)
    expect(page).to have_content('Jishan')
  end
  it 'should show number of posts' do
    visit user_path(@user.id)
    expect(page).to have_content('Number of posts: 6')
  end
  it 'should show users bio' do
    visit user_path(@user.id)
    expect(page).to have_content('Teacher from Mexico.')
  end
  it 'should show user first three posts' do
    visit user_path(@user.id)
    expect(page).to have_content('this is text 1')
    expect(page).to have_content('this is text 2')
    expect(page).to have_content('this is text 3')
    expect(page).to_not have_content('this is text 4')
  end
  it 'should show button' do
    visit user_path(@user.id)
    expect(page).to have_content('see all posts')
  end

  it 'should show click on a see more post, it redirects me to that post\'s all page' do
    visit user_path(@user.id)
    click_link 'see all posts'
    expect(page).to have_content('title1')
  end
end