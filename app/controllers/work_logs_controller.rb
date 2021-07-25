# frozen_string_literal: true

class WorkLogsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_work_log, only: %i[edit update show destroy]

  def index
    @work_logs = current_user.work_logs.order(created_at: :desc)
  end

  def create
    @work_log = current_user.work_logs.new(clock_in: Time.now)
    if @work_log.save
      flash[:notice] = 'Clock is now running'
    else
      flash[:notice] = 'Clock is already running'
    end
		redirect_to work_logs_path
  end

  def edit; end

  def clock_out
    if current_clock.present?
      current_clock.update(clock_out: Time.now)
    else
      flash[:notice] = 'Clock is not running'
    end
    redirect_to work_logs_path
  end

  def update
    if @work_log.update(work_log_params)
      redirect_to work_logs_path, notice: 'Updated successfully'
    else
			flash[:error] = @work_log.errors.full_messages
      render(:edit)
    end
  end

  def destroy
    @work_log.destroy
    redirect_to work_logs_path, notice: 'Deleted successfully'
  end

  private

  def set_work_log
    @work_log = current_user.work_logs.find(params[:id])
  end

  def work_log_params
    params.require(:work_log).permit(:clock_in, :clock_out, :description)
  end
end
