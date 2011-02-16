<% if moduled? -%>
module <%= module_name %>
  
<% end -%>
class Permission < ActiveRecord::Base
  
  has_many :role_permissions<% if moduled? %>, :class_name => '<%= module_name %>::RolePermission'<% end %>
  has_many :roles, :through => :user_roles<% if moduled? %>, :class_name => '<%= module_name %>::Role'<% end %>

  has_many :user_permissions<% if moduled? %>, :class_name => '<%= module_name %>::UserPermission'<% end %>
  has_many :users, :through => :user_permissions<% if moduled? %>, :class_name => '<%= module_name %>::User'<% end %>
  
end
<% if moduled? -%>
  
end
<% end -%>
