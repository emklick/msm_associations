# == Schema Information
#
# Table name: characters
#
#  id         :integer          not null, primary key
#  movie_id   :integer
#  actor_id   :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Character < ApplicationRecord
    
# - movie_id: must be present
validates :movie_id, :presence => true

# - actor_id: must be present
validates :actor_id, :presence => true


# - name: no rules   
    
belongs_to(:actor, :class_name => "Actor", :foreign_key => "actor_id")    
    
end
