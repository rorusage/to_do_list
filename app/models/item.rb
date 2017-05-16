class Item < ActiveRecord::Base
  validates :content, presence: true
  belongs_to :list

  def done?
    done
  end
end
