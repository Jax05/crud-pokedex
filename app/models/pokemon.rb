class Pokemon < ActiveRecord::Base
  validates_presence_of :name, :type_name, :description
  belongs_to :user
end
