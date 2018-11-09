class Tag < ApplicationRecord
  has_many :tagarticles
  has_many :articles, through: :tagarticles, dependent: :destroy
end
