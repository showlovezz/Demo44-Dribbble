class Shot < ApplicationRecord
	belongs_to :user
	validates :title, presence: true, length: {minimum: 5}
	validates :description, presence: true
	validates :link, presence: true
end
