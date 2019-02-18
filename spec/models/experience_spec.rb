# frozen_string_literal: true
require "rails_helper"

RSpec.describe Experience, type: :model do
  subject(:experience) { create(:experience) }
  describe "Validations" do
    it { is_expected.to validate_presence_of(:overview) }
    it { is_expected.to validate_presence_of(:tagline) }
    it { is_expected.to validate_length_of(:overview).is_at_most(800) }
    it { is_expected.to validate_length_of(:tagline).is_at_most(140) }
  end

  describe "#to_s" do
    it "returns the experience name" do
      expect(experience.to_s).to eq(experience.name)
    end
  end
end
