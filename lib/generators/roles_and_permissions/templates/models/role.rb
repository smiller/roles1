<% if moduled? -%>
module <%= module_name %>
  
<% end -%>
class Role < ActiveRecord::Base
  
  has_many :role_permissions<% if moduled? %>, :class_name => '<%= module_name %>::RolePermission'<% end %>
  has_many :permissions, :through => :role_permissions<% if moduled? %>, :class_name => '<%= module_name %>::Permission'<% end %>

  has_many :user_roles<% if moduled? %>, :class_name => '<%= module_name %>::UserRole'<% end %>
  has_many :users, :through => :user_roles<% if moduled? %>, :class_name => '<%= module_name %>::User'<% end %>

end
<% if moduled? -%>
  
end
<% end -%>