# frozen_string_literal: true
require "rails_helper"

RSpec.describe FormsHelper, type: :helper do
  let(:object_name) { :form }
  let(:attribute_name) { :attribute }
  let(:builder) {
    ActionView::Helpers::FormBuilder.new(object_name, nil, nil, {})
  }

  describe "#form_field_name" do
    it "outputs the correct format" do
      result = helper.form_field_name(builder, attribute_name)
      expect(result).to eq("form[attribute]")
    end
  end

  describe "#form_field_id" do
    it "outputs the correct format" do
      result = helper.form_field_id(builder, attribute_name)
      expect(result).to eq("form_attribute")
    end

    context "the builder is for a nested attributes" do
      let(:object_name) { :"form[attributes]" }

      it "outputs the correct format" do
        result = helper.form_field_id(builder, attribute_name)
        expect(result).to eq("form_attributes_attribute")
      end
    end
  end
end
