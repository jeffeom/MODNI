class Comment < ActiveRecord::Base
  belongs_to :vlog
  belongs_to :event
  belongs_to :user

  validates :body, presence: true
end
