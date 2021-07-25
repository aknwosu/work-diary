require 'rails_helper'

RSpec.describe 'UsersControllers', type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe '#index' do
    let(:path) { root_path }
    subject { response }
    it 'fetches the root route' do
      get path
      expect(response).to have_http_status(:ok)
    end
  end
end
