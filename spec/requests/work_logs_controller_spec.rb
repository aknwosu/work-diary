require 'rails_helper'

RSpec.describe 'WorkLogsControllers', type: :request do
  let(:user) { FactoryBot.create(:user) }
  before do
    allow_any_instance_of(WorkLogsController).to receive(:current_user).and_return(user)
  end

  describe 'GET /index' do
    it 'returns correct status' do
      get work_logs_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'create' do
    it 'should create a new work log and redirect to work_logs_path' do
      post work_logs_path
      expect(response).to redirect_to(work_logs_path)
      expect(flash[:notice]).to eql('Clock is now running')
    end

    it 'should not create if one is running' do
      post work_logs_path
      post work_logs_path
      expect(flash[:notice]).to eql('Clock is already running')
    end
  end

  describe 'clock_out' do
    it 'clock out the last running clock' do
      post work_logs_path
      put clock_out_work_logs_path
      expect(response).to redirect_to(work_logs_path)
      expect(flash[:notice]).to eql('Clock is now running')
    end

    it 'should not make any changes if no clock is running' do
      post work_logs_path
      put clock_out_work_logs_path
      put clock_out_work_logs_path
      expect(flash[:notice]).to eql('Clock is not running')
    end
  end
end
