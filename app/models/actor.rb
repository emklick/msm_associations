# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  name       :string
#  dob        :string
#  bio        :text
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Actor < ApplicationRecord
    
#  - name: must be present; must be unique in combination with dob
validates :name, :presence => true, :uniqueness => { :scope => :dob }

#  - dob: no rules
#  - bio: no rules
#  - image_url: no rules     

   has_many :characters
   has_many :movies, :through => :characters    
   
has_many(:movies, :class_name => "Movies", :foreign_key => "actor_id")
has_many(:character, :class_name => "characters", :foreign_key => "actor_id")   
    
end
