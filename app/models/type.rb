class Type < ActiveRecord::Base
  has_many :catrgories, dependent: :destroy
  validates :title, presence: true
end
