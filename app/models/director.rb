# == Schema Information
#
# Table name: directors
#
#  id         :integer          not null, primary key
#  name       :string
#  dob        :string
#  bio        :text
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Director < ApplicationRecord
    
# - name: must be present; must be unique in combination with dob
validates :name, :presence => true, :uniqueness => { :scope => :dob }

# - dob: no rules
# - bio: no rules
# - image_url: no rules   

# Who directed Life Is Beautiful?
# Movie.find_by(:title => "Life Is Beautiful")
# m.director_id
# Director.find_by(:id => m.director_id).name

# How many movies in our list were directed by Francis Ford Coppola?
# Director.find_by(:director_id => 2).count

# What is the most recent movie in our list directed by Francis Ford Coppola?

has_many(:movies, :class_name => "Movie", :foreign_key => "director_id")
    
end
