class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
	has_many :units, dependent: :destroy
  belongs_to :type
	validates :title, presence: true,
                    length: { minimum: 5 }
  validates :type_id, presence: true

    # for genereate friendly_id
  def should_generate_new_friendly_id?
    new_record? || slug.blank?
  end

  # for locale sensitive transliteration with friendly_id
  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end
  
end
