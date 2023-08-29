class Director< ApplicationRecord
  has_many :movies, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :age
  validates :alive, inclusion: [true, false]
  end