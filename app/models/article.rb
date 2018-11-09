class Article < ApplicationRecord
  belongs_to :author

  has_many :tagarticles
  has_many :tags, through: :tagarticles, dependent: :destroy
end
