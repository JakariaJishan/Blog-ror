require 'rails_helper'

RSpec.describe 'Users content', type: :system do
 
  before(:each) do
    @user = User.create(name: 'Jishan', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=374&q=80', bio: 'Teacher from Mexico.', posts_counter: 2) 
  end

  it 'should show all users name' do
    visit('/users')
    expect(page).to have_content('Jishan')
  end
  it 'should show all photos for the users' do
    visit('/users')
    expect(page).to have_selector('img')
  end
  it 'redirects to user show page after clicking on user' do
    visit('/users')
    click_link 'Jishan'
    expect(page).to have_content('Teacher from Mexico.')
  end
end