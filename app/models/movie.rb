# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string
#  year        :integer
#  duration    :integer
#  description :text
#  image_url   :string
#  director_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Movie < ApplicationRecord
    
# - director_id: must be present
validates :director_id, :presence => true

# - title: must be present; must be unique in combination with year
validates :title, :presence => true, :uniqueness => { :scope => :year }

# - year: must be integer between 1870 and 2050
validates :year, :numericality => { :only_integer => true, :greater_than_or_equal_to => 1870, :less_than_or_equal_to => 2050 }

# - duration: must be integer between 0 and 2764800, but it can be blank (hint: there is an option `:allow_blank => true`)
validates :duration, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 2764800 }

# - description: no rules
# - image_url: no rules


# In what year was the oldest movie in our list released?
# Movie.minimum(:year)
# Movie.order("year ASC").first


# In what year was the most recent movie in our list released?
# Movie.order("year DESC").first
# Movie.order("year ASC").last

# What is the duration of the shortest movie in our list?
# Movie.minimum(:duration)
# Movie.order("duration ASC").first

# What is the longest movie in our list?
# Movie.maximum(:duration)
# Movie.order("duration DESC").first

# How many movies in our list have the word 'godfather' in their titles?
# Movie.where(":title LIKE '%Godfather%'")

belongs_to(:director, :class_name => "Director", :foreign_key => "director_id")

has_many(:characters, :class_name => "Character", :foreign_key => "movie_id")
has_many(:actors, :class_name => "Actor", :foreign_key => "movie_id")


    
end
