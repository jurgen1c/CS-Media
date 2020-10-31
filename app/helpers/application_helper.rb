module ApplicationHelper

  def flash_message
    if flash[:notice]
      content_tag :p, notice, class: 'bg-success m-0 text-white text-center'
    elsif flash[:alert]
      content_tag :p, alert, class: 'bg-danger m-0 text-white text-center'
    end
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new

    id = new_object.object_id

    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end

    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
