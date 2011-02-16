<% if moduled? -%>
module <%= module_name %>
  
<% end -%>
class UserPermission < ActiveRecord::Base
  
  belongs_to :user<% if moduled? %>, :class_name => '<%= module_name %>::User'<% end %>
  belongs_to :permission<% if moduled? %>, :class_name => '<%= module_name %>::Permission'<% end %>

end
<% if moduled? -%>
  
end
<% end -%>