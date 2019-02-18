# frozen_string_literal: true
module AttachmentsHelper
  def attachment_signature(attachment)
    if valid_and_attached?(attachment)
      attachment.blob.signed_id
    end
  end

  def attachment_url(attachment)
    if valid_and_attached?(attachment)
      url_for(attachment)
    end
  end

  private
  def valid_and_attached?(attachment)
    if attachment.present?
      attachment.respond_to?(:attached?) && attachment.attached?
    end
  end
end
