class Api::V1::SessionsController < Devise::SessionsController

  skip_before_filter :verify_authenticity_token

  def show
    pomodoros_count = current_user.pomodoros_made.count
    render :status => 200,
           :json => { :success => true,
                      :data => { :pomodoros_count => pomodoros_count } }
  end

  def update
    raise params.inspect
    render :status => 200,
           :json => { :success => true,
                      :data => { :pomodoros_count => pomodoros_count } }
  end

end
