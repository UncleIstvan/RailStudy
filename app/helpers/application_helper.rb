module ApplicationHelper

  def new_form (form_builder, field_name)

    "<p> #{form_builder.label(field_name)} <br>#{form_builder.text_field(field_name)}</p>".html_safe

  end

  def collection_selector (form_builder, field_name, method, collection, value_method, text_method, options = {}, html_options = {})
    "<p> #{form_builder.label field_name} </p> <p> #{form_builder.collection_select(method, collection, value_method, text_method, options, html_options)}</p>".html_safe
  end

  def bs_glyph (glyph_name, text_before = '', text_after = '')

    "#{text_before} <span class=\"glyphicon glyphicon-#{glyph_name.gsub(/\s/, '-')}\"></span> #{text_after}".html_safe
  end

end