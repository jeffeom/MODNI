class Event < ActiveRecord::Base
  belongs_to :user

  has_many :comments, dependent: :nullify

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true

  mount_uploader :image, ImageUploader

  def next
    Event.where(["id < ?", id]).last
  end

  def previous
    Event.where(["id > ?", id]).first
  end
end
