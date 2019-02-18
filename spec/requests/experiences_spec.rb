# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Configuring an experience", type: :request do
  let(:experience) { create(:experience) }
  let(:valid_params) {
    {
      "experience": {
        "name": "Rise Festival",
        "tagline": "Party on top of the world next December at Europe's leading snow sports and music festival.",
        "overview":
        "Europe's biggest snow sports and music festival Rise is back for a fifth year running to take over the beautiful Les 2 Alpes resort for this party on top of the world.",
          "ticket_types_attributes": {
            "0": {
              "name": "Third release", "price": "259.00", "tagline": "", "_destroy": "false"
            }
          },
          "extras_attributes": {
            "0": {
              "name": "Platinum Ski Hire", "price": "199.00", "tagline": "Advanced equipment for experienced skiers.", "_destroy": "false"
            }  }
      }
    }
  }

  let(:invalid_params) {
    {
      "experience": {
        "tagline": "Lorem ipsum dolor sit amet, consectetur adipiscing
        elit. Vivamus a mi sem. Pellentesque tempus vitae lectus ut
        efficitur. Sed at enim non enim interdum fermentum quis sed massa.
          Aenean dictum augue nec erat laoreet sagittis. Morbi id elementum
        ex, vitae hendrerit nisi. Morbi convallis lorem sit amet efficitur
        posuere.",
      }
    }
  }

  it "correctly updates the experience with valid params" do
    put experience_path(experience, params: valid_params)

    expect(flash[:notice]).not_to be_nil
    expect(response).to redirect_to(action: "edit")
  end

  context "the update failed with the params" do
    it "re-renders show with validation message" do
      put experience_path(experience, params: invalid_params)

      expect(response).not_to redirect_to(action: "edit")
      expect(response.body).to include("is too long (maximum is 140 characters)")
    end
  end
end
