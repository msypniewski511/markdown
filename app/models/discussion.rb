class Discussion < ApplicationRecord
  belongs_to :channel
  belongs_to :user
  has_many :replies, dependent: :destroy
  has_one_attached :main_picture

  validates :title, :content, presence: true
  resourcify
  extend FriendlyId
  friendly_id :title, use: :slugged

  validate :main_picture_format

  private

  def main_picture_format
    return unless main_picture.attached?
    return if main_picture.blob.content_type.start_with? 'image/'
    main_picture.purge_later
    errors.add(:main_picture, 'needs to be an image')
  end
end
