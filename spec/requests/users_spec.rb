require 'rails_helper'

RSpec.describe 'Users', type: :request do
    
    describe "GET/index" do
        it 'response status is success' do
            get users_path
            expect(response.status).to eq(200)
        end

        it 'correct template is rendered' do
            get users_path
            expect(response).to render_template(:index)
        end

        it 'response body includes correct placeholder text' do
            get users_path
            expect(response.body).to include("users")
        end

    end

    describe 'GET/show' do
        let!(:user) { User.create(name:'jack', posts_counter:0)}
        it('response status is success') do
            get user_path(user.id)
            expect(response.status).to eq(200)
        end
        it('correct template is rendered') do
            get user_path(user.id)
            expect(response).to render_template(:show)
        end
        it 'response body includes correct placeholder text' do
            get user_path(user.id)
            expect(response.body).to include("user/show")
        end
    end
end 