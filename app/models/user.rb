class User < ActiveRecord::Base
  has_many :vlogs, dependent: :nullify
  has_many :events, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_many :vlogs_comments, through: :vlogs, source: :comments
  has_many :events_comments, through: :events, source: :comments
end
