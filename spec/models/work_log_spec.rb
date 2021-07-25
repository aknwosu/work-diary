require 'rails_helper'

RSpec.describe WorkLog, type: :model do
  let(:user) { FactoryBot.create(:user) }

  it 'should exist with correct parameters' do
    work_log = user.work_logs.create(clock_in: Time.now)
    expect(work_log.clock_in).to be_present
  end

  it 'should not create timer if one is running' do
    user.work_logs.create(clock_in: Time.now)
    falsy_work_log = user.work_logs.create(clock_in: Time.now)
    expect(falsy_work_log.errors.full_messages[0]).to eq('Clock already running')
  end

  it 'should not set clock_in to future time' do
    work_log = user.work_logs.create(clock_in: Time.now + 1)
    expect(work_log.errors.full_messages[0]).to eq('Clock cannot be set in the future')
  end

  it 'should not set clock_in to future time' do
    work_log = user.work_logs.create(clock_in: Time.now + 1)
    expect(work_log.errors.full_messages[0]).to eq('Clock cannot be set in the future')
  end

  it 'should not set clock_out to future time' do
    work_log = user.work_logs.create(clock_in: Time.now, clock_out: Time.now + 1)
    expect(work_log.errors.full_messages[0]).to eq('Clock cannot be set in the future')
  end

  it 'should not have clock_out greater than clock_in' do
    work_log = user.work_logs.create(clock_in: Time.now, clock_out: Time.now - 1)
    expect(work_log.errors.full_messages[0]).to eq('Clock in must start before clocking out')
  end
end
