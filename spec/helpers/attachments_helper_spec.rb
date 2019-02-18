# frozen_string_literal: true
require "rails_helper"

RSpec.describe AttachmentsHelper do
  let(:blob) {
    double(ActiveStorage::Blob, filename: "test.png", signed_id: "123")
  }

  let(:attachment) {
    double(ActiveStorage::Attachment,
           attached?: true,
           blob: blob,
           to_model: ActiveStorage::Attachment)
  }

  describe "#attachment_signature" do
    it "returns the signed ID of the attachments blob" do
      expect(helper.attachment_signature(attachment))
        .to eq(blob.signed_id)
    end

    context "the attachment isn't 'attached'" do
      let(:attachment) { double(ActiveStorage::Attachment, attached?: false) }

      it "returns nil" do
        expect(helper.attachment_signature(attachment)).to be_nil
      end
    end

    context "we get passed a nil, rather than an attachment" do
      it "returns nil" do
        expect(helper.attachment_signature(nil)).to be_nil
      end
    end

    context "the input isn't an attachment" do
      it "returns nil" do
        expect(helper.attachment_signature("not an attachment")).to be_nil
      end
    end
  end

  describe "#attachment_signature" do
    it "returns the path to access the raw contents of the upload" do
      expect(helper.attachment_url(attachment)).to be_a(String)
      expect(helper.attachment_url(attachment))
        .to start_with("/rails/active_storage/blobs")
    end

    context "the attachment isn't 'attached'" do
      let(:attachment) { double(ActiveStorage::Attachment, attached?: false) }

      it "returns nil" do
        expect(helper.attachment_url(attachment)).to be_nil
      end
    end

    context "we get passed a nil, rather than an attachment" do
      it "returns nil" do
        expect(helper.attachment_signature(nil)).to be_nil
      end
    end

    context "the input isn't an attachment" do
      it "returns nil" do
        expect(helper.attachment_signature("not an attachment")).to be_nil
      end
    end
  end
end
