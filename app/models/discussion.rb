class Discussion < ApplicationRecord
  belongs_to :channel
  belongs_to :user
  has_many :replies, dependent: :destroy
  has_one_attached :main_picture

  validates :title, :content, presence: true
  resourcify
  extend FriendlyId
  friendly_id :title, use: :slugged
end
