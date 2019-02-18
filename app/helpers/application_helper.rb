module ApplicationHelper
  def faux_image_tag(img_src, html_options = {})
    full_path = asset_path(img_src)

    html_options[:class] = Array(html_options[:class])
    html_options[:class] << "faux-image"

    html_options[:style] = "background-image:url('#{full_path}');#{html_options[:style]}"

    if block_given?
      content_tag(:div, html_options) do
        yield
      end
    else
      content_tag(:div, "", html_options)
    end
  end

  def serialize(*args)
    ActiveModelSerializers::SerializableResource.new(*args)
  end
end
