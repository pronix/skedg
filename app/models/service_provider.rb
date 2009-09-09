class ServiceProvider < ActiveRecord::Base
  acts_as_authentic
  validates_presence_of :name, :contribution_type_id, :provider_type_id 
end
