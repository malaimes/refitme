class Category < ActiveRecord::Base
	has_many :units

	validates :title, presence: true,
                    length: { minimum: 5 }
end
