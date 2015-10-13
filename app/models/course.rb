class Course < ActiveRecord::Base
  has_many :projects 
end
