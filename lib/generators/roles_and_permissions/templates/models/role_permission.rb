<% if moduled? -%>
module <%= module_name %>
  
<% end -%>
class RolePermission < ActiveRecord::Base
  
  belongs_to :role<% if moduled? %>, :class_name => '<%= module_name %>::Role'<% end %>
  belongs_to :permission<% if moduled? %>, :class_name => '<%= module_name %>::Permission'<% end %>

end
<% if moduled? -%>
  
end
<% end -%>