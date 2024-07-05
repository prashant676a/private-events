class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :created_events, class_name: "Event"

  # for user has many attended events
  has_many :event_attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :event_attendances
end