class Api::V1::PomodorosMadeController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def show
    auth_token = params[:auth_token]
    pomodoros_made_count = User.where(authentication_token: auth_token.to_s).first.pomodoros_made.count
    render :status => 200,
           :json => { :success => true,
                      :data => {  :count => pomodoros_made_count,
                                  :info => 'Pomodoros updated' } }
  end

  def update
    auth_token = params[:user][:auth_token]
    pomodoros_count = params[:pomodoros_made][:count]
    pomodoros_made = User.where(authentication_token: auth_token.to_s).first.pomodoros_made
    pomodoros_made.count = pomodoros_count
    pomodoros_made.save
    render :status => 200,
           :json => { :success => true,
                      :data => { :info => 'Pomodoros updated' } }
  end

end
