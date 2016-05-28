class Api::V1::PomodorosMadeController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def show
    pomodoros_count = current_user.pomodoros_made.count
    render :status => 200,
           :json => { :success => true,
                      :data => { :pomodoros_count => pomodoros_count } }
  end

  def update
    auth_token = params[:user][:auth_token]
    pomodoros_count = params[:pomodoros_made][:count]
    err = "token :#{auth_token}, count:#{pomodoros_count}"
    raise err.inspect
    pomodoros_made = User.where(authentication_token: auth_token).first.pomodoros_made
    pomodoros_made.count = pomodoros_count
    pomodoros_made.save
    render :status => 200,
           :json => { :success => true,
                      :data => { :info => 'Pomodoros updated' } }
  end

end
