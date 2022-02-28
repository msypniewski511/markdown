class Reply < ApplicationRecord
  belongs_to :discussion
  belongs_to :user
  validates :reply, presence: true
  resourcify
  
  extend FriendlyId
  friendly_id :for_slug, use: :slugged
  protected
  def for_slug
    reply[0..100]
  end
end
