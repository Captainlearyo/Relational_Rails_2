class Movie < ApplicationRecord
belongs_to :director

validates_presence_of :name
validates_presence_of :length
validates :in_theaters, inclusion: [true, false]

def self.in_theaters_filter
  where(in_theaters: true)
end

end