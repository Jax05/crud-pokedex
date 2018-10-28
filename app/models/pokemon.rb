class Pokemon < ActiveRecord::Base
  validates_presence_of :name, :type, :description
  belongs_to :user
end
