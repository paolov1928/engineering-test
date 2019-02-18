# frozen_string_literal: true
module FormsHelper
  def form_field_id(*args)
    form_field_name(*args).gsub(/[\[\]]/, "[" => "_", "]" => "")
  end

  def form_field_name(builder, attribute_name)
    "#{builder.object_name}[#{attribute_name}]"
  end
end
