# frozen_string_literal: true
class VariantSerializer < ActiveModel::Serializer
  attributes :id, :name, :sold_out, :display_price, :product_pricing_unit, :tagline

  def display_price
    object.price.format
  end

  def product_pricing_unit
    "pp"
  end
end
