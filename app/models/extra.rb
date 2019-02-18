class Extra < ApplicationRecord
  include Priced
  default_scope -> { reorder(:sold_out, :created_at) }
  belongs_to :product, polymorphic: true
end
