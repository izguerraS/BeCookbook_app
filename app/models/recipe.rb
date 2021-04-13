class Recipe < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :title, uniqueness: true

  validates :ingredients, presence: true
  validates :directions, presence: true

  # validates :chef, presence: true

  validates :prep_time, presence: true
  validates :prep_time, numericality: { greater_than: 0 }

end
