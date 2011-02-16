require 'migration_helpers'

class RolesAndPermissionsCreate < ActiveRecord::Migration
  extend MigrationHelpers
  
  def self.up
    create_table :roles do |t|
      t.string :name, :unique => true
    end

    create_table :user_roles do |t|
      t.references :user
      t.references :role
    end

    add_foreign_key_and_index :user_roles, :user_id, :users
    add_foreign_key_and_index :user_roles, :role_id, :roles
    
    create_table :permissions do |t|
      t.string :name, :unique => true
    end
    
    create_table :user_permissions do |t|
      t.references :user
      t.references :permission
    end

    add_foreign_key_and_index :user_permissions, :user_id, :users 
    add_foreign_key_and_index :user_permissions, :permission_id, :permissions 
    
    create_table :role_permissions do |t|
      t.references :role
      t.references :permission
    end

    add_foreign_key_and_index :role_permissions, :role_id, :roles 
    add_foreign_key_and_index :role_permissions, :permission_id, :permissions 
  end
  
  def self.down
    remove_foreign_key :role_permissions, :permission_id 
    remove_foreign_key :role_permissions, :role_id 
    drop_table :role_permissions

    remove_foreign_key :user_permissions, :permission_id 
    remove_foreign_key :user_permissions, :user_id 
    drop_table :user_permissions

    drop_table :permissions

    remove_foreign_key :user_roles, :role_id 
    remove_foreign_key :user_roles, :user_id 
    drop_table :user_roles
    
    drop_table :roles
  end
end