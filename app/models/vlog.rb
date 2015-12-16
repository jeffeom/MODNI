class Vlog < ActiveRecord::Base
  belongs_to :user

  has_many :comments, dependent: :nullify

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
  validates :link, presence: true, uniqueness: true
end
