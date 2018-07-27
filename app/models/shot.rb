class Shot < ApplicationRecord
	validates :title, presence: true, length: {minimum: 5}
	validates :description, presence: true
	validates :link, presence: true

	mount_uploader :image, PhotoUploader

	is_impressionable

	acts_as_votable
	
	belongs_to :user
	has_many :comments, dependent: :destroy
end
