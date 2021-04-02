class Site < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :users, through: :comments

  validates :link, presence: true
end
