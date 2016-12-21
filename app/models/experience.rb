class Experience < ApplicationRecord
  belongs_to :user
  has_many :comments, :as => :commentable

  validates :topic, presence: true
  validates :content, presence: true
  validates :user, presence: true

  acts_as_votable
  
end
