class Experience::TicketType < ApplicationRecord
  include Priced
  default_scope -> { reorder(:sold_out, :created_at) }
  belongs_to :experience,
    inverse_of: :ticket_types,
    touch: true
end
