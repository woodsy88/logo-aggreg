class Board < ApplicationRecord
  belongs_to :user
  has_many :sections
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
end
