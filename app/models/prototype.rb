class Prototype < ApplicationRecord
  def change
    add_reference :prototypes, :user, foreign_key: true
  end
  
  belongs_to :user
  has_many :comments
  has_one_attached :image

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true
end
