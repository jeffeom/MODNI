class Event < ActiveRecord::Base
  belongs_to :user
  
  has_many :comments, dependent: :nullify

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
end
