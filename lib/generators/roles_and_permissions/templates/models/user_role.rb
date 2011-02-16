<% if moduled? -%>
module <%= module_name %>
  
<% end -%>
class UserRole < ActiveRecord::Base
  
  belongs_to :user<% if moduled? %>, :class_name => '<%= module_name %>::User'<% end %>
  belongs_to :role<% if moduled? %>, :class_name => '<%= module_name %>::Role'<% end %>

end
<% if moduled? -%>
  
end
<% end -%>