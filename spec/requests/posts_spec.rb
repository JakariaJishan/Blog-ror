require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:user) { User.create(name: 'John', posts_counter: 0) }
  describe 'GET/index' do
    it 'response status is success' do
      get user_posts_path(user.id)
      expect(response.status).to eq(200)
    end

    it 'correct template is rendered' do
      get user_posts_path(user.id)
      expect(response).to render_template(:index)
    end

    it 'response body includes correct placeholder text' do
      get user_posts_path(user.id)
      expect(response.body).to include('user/user_id/posts')
    end
  end

  describe 'GET/show' do
    let!(:post) { Post.create(author: user, title: 'post', text: 'this is text', comments_counter: 0, likes_counter: 0) }

    it('response status is success') do
      get user_post_path(user.id, post.id)
      expect(response.status).to eq(200)
    end
    it('correct template is rendered') do
      get user_post_path(user.id, post.id)
      expect(response).to render_template(:show)
    end
    it 'response body includes correct placeholder text' do
      get user_post_path(user.id, post.id)
      expect(response.body).to include('user/user_id/posts/id')
    end
  end
end
