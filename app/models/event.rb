class Event < ApplicationRecord
    #only one creator
    belongs_to :creator, class_name: "User", foreign_key: "user_id"
    
    #for event has many attendees
    has_many :event_attendances, foreign_key: :attended_event_id
    has_many :attendees , through: :event_attendances

    #validations
    validates :title, presence:{message: "must be there"}
    validates :date, presence: true

    #past and future scope of event
    scope :past , -> { where('date < ?', Time.now)}
    scope :future, -> { where('date > ?', Time.now)}
end
