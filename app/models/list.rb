class List < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true

  has_many :items, dependent: :destroy
end
