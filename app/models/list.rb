class List < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true

  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true

  def done?
    done
  end
end
