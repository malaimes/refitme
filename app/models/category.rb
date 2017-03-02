class Category < ActiveRecord::Base
	has_many :units, dependent: :destroy
  belongs_to :type
	validates :title, presence: true,
                    length: { minimum: 5 }
  validates :type_id, presence: true
end
