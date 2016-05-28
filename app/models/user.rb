class User < ActiveRecord::Base
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
  :trackable, :validatable, :confirmable

  has_one :pomodoros_made

  after_create :create_pomodoros_made


  def create_pomodoros_made
    self.create_pomodoros_made
  end

end
