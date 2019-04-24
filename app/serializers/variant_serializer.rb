# frozen_string_literal: true
class VariantSerializer < ActiveModel::Serializer
  attributes :id, :name, :sold_out, :display_price, :product_pricing_unit, :tagline, :segment

  def display_price
    object.price.format
  end

  def product_pricing_unit
    "pp"
  end

  def segment
    if object.name.downcase.include? "release"
   return "Rise Festival"
 elsif object.name.downcase.include? "ticket"
   return "Short Stay Tickets"
 elsif object.name.downcase.include? "hire"
   return "Equipment Hire"
 elsif object.name.downcase.include? "lesson"
   return "Lessons"
    else
       return "unknown"
    end

  end
end
