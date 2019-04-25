# frozen_string_literal: true
require "rails_helper"



RSpec.describe Experience, :type => :model do
  subject(:experience) { create(:experience) }

  it "is valid with valid attributes" do
    subject.name = "Anything"
    subject.tagline = "Anything"
    subject.overview = "Anything"
    expect(subject).to be_valid
  end

end
