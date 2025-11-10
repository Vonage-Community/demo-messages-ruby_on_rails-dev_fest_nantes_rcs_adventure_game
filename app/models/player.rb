class Player < ApplicationRecord
  has_many :games, dependent: :destroy
end
