class Experience < ApplicationRecord
  include UrlHelper
  has_many :ticket_types
  has_many :extras, as: :product, inverse_of: :product

  has_one_attached :hero_image
  has_one_attached :overview_image

  validates :name, :tagline, :overview, presence: true

  validates :tagline, length: { maximum: 140 }
  validates :overview, length: { maximum: 800 }

  accepts_nested_attributes_for :ticket_types,
    allow_destroy: true,
    reject_if: ->(attrs) { attrs["name"].blank? }

  accepts_nested_attributes_for :extras,
    allow_destroy: true,
    reject_if: ->(attrs) { attrs["name"].blank? }

  def hero_image_url
    image_url(hero_image)
  end

  def overview_image_url
    image_url(overview_image)
  end

  def to_s
    name
  end
  private
  def image_url(image)
    UrlHelper.helper.url_for(image)
  end
end
