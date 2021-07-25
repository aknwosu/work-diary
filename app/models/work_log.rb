class WorkLog < ApplicationRecord
  belongs_to :user

  validates :clock_in, presence: true
  validate :is_running, if: -> { self.new_record? }
  validate :start_time_valid
  validate :clock_time_cannot_be_future

  def is_running
    errors.add(:clock, 'already running') if current_timer
  end

  def current_timer
    user.work_logs.find_by(clock_out: nil)
  end

  private

  def start_time_valid
    if clock_out.present? && clock_in > clock_out
      errors.add(:clock_in, 'must start before clocking out')
    end
  end

  def clock_time_cannot_be_future
    if clock_in.present? && clock_in > Time.now
      errors.add(:clock, 'cannot be set in the future')
    end
    if clock_out.present? && clock_out > Time.now
      errors.add(:clock, 'cannot be set in the future')
    end
  end
end
