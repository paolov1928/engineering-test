# frozen_string_literal: true
module Priced
  def self.included(base)
    base.class_eval do
      monetize :price_fractional
      validates :price,
        presence: true,
        money: { greater_than_or_equal_to: 0, allow_nil: true }
    end
  end
end

