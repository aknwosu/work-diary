# frozen_string_literal: true

class MainController < ApplicationController
  def index
    @user = User.find(session[:user_id]) if session[:user_id]
  end
end
