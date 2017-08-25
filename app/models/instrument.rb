class Instrument < ApplicationRecord
  belongs_to :user
  has_attachment :photo
end
