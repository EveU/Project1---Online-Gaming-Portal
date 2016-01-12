class User < ActiveRecord::Base

  has_many :plays
  has_many :plays, :class_name => "Play", :foreign_key => "opponent_id"
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
