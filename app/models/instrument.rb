class Instrument < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_attachment :photo
end
