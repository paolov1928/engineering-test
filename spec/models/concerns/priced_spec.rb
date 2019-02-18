# frozen_string_literal: true
#
require "rails_helper"

RSpec.describe Priced, type: :model do
  with_model :WithPricing do
    table(id: :uuid) do |t|
      t.integer :price_fractional
      t.timestamps
    end

    model do
      include Priced
    end
  end

  subject(:with_pricing) { WithPricing.create }

  describe "Validations" do
    it { is_expected.to allow_values(nil, "0.00", "100.00").for(:price) }
    it { is_expected.not_to allow_values("-1.00").for(:price) }
  end
end
