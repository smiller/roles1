require 'rails/generators'
require 'rails/generators/migration'
require 'rails/generators/active_record'

class RolesAndPermissionsGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  
  source_root File.expand_path('../templates', __FILE__)
  argument :module_for_models, :type => :string, :default => ''
  
  def generate_migration
    migration_template 'migrations/migration.rb', 'db/migrate/roles_and_permissions_create.rb'
  end
  
  def generate_models
    template    'models/role.rb',             "#{path_for_models}/role.rb"
    template    'models/permission.rb',       "#{path_for_models}/permission.rb"
    template    'models/user_role.rb',        "#{path_for_models}/user_role.rb"
    template    'models/user_permission.rb',  "#{path_for_models}/user_permission.rb"
    template    'models/role_permission.rb',  "#{path_for_models}/role_permission.rb"
  end
  
  def generate_migration_helper
    copy_file   'lib/migration_helpers.rb',   'lib/migration_helpers.rb'
  end
  
  def path_for_models
    default_path = 'app/models'
    module_for_models.blank? ? default_path : '#{default_path}/#{module_for_models}'
  end

  # Discussed at https://rails.lighthouseapp.com/projects/8994/tickets/
  # 3820-make-railsgeneratorsmigrationnext_migration_number-method-a-class-method-
  # so-it-possible-to-use-it-in-custom-generators
  def self.next_migration_number(dirname)
    ActiveRecord::Generators::Base.next_migration_number(dirname)
  end
  
  def module_name
    module_for_models.capitalize
  end
  
  def moduled?
    !module_for_models.blank?
  end

end