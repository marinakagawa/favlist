class Bookmark < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :link, presence: true, format: /\A#{URI::regexp(%w(http https))}\z/
end
