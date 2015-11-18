module ApplicationHelper

  def new_form (form_builder, field_name)

    result = "<p> #{form_builder.label(field_name)} <br>#{form_builder.text_field(field_name)}</p>"
    result.html_safe

  end

  def type_selector (form_builder,name, tasktype)

    result = "<p> #{form_builder.label(tasktype)}</p> <br> <p>#{form_builder.collection_select(:task, :tasktype_id, Tasktype.all, :id, :tasktype_name, {:prompt => true})}}</p>"
    result.html_safe
  end
 # {form_builder.collection_select(:task, :tasktype_id, Tasktype.all, :id, :tasktype_name, {:prompt => true})}
end

