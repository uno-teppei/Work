require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET/posts/index' do
    let(:post) { create(:post) }

    it '空港投稿画面表示に成功すること' do
      get posts_path
      expect(response).to have_http_status(302)
    end
  end
end
