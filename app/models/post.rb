class Post < ActiveRecord::Base
	extend FriendlyId
  	friendly_id :title, use: [:slugged, :finders]
	acts_as_votable
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_attached_file :image, styles: { medium: "700x500#", small: "350x250#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :image, presence: true




  # :history => won't change friendly id after updating :column_name
  # :finder => no need to add .friendly method with Model anymore (gem's version should be above v5.0)
  # use: [:slugged, :history, :finder]


    # for genereate friendly_id
  def should_generate_new_friendly_id?
    new_record? || title_changed?
  end

  # for locale sensitive transliteration with friendly_id
  def normalize_friendly_id(input)
    input.to_s.to_slug.transliterate(:russian).normalize.to_s
  end

end
