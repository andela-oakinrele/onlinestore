module RolesHelper

  def edit_link(role)
    if role.title == "Admin" || role.title == "User" || role.title == "Vendor"
      link(role, disabled: true)
    else
      link(role)
    end
  end

  def link(role, property = {})
    properties = {
        class: "button small-button edit",
        onclick: "metroDialog.open('#editrole'); updateRole(#{role.to_json})"
    }.merge(property)
    # binding.pry
    content_tag( :button, "Edit", properties, role_path(role))
  end
end
