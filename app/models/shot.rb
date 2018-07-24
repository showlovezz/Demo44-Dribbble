class Shot < ApplicationRecord
	validates :title, presence: true, length: {minimum: 5}
	validates :description, presence: true
	validates :link, presence: true
	belongs_to :user
	mount_uploader :image, PhotoUploader
end
