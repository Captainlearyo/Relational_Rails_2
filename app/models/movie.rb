class Movie < ApplicationRecord
belongs_to :director

validates_presence_of :name
validates_presence_of :length
validates :in_theaters, inclusion: [true, false]
end