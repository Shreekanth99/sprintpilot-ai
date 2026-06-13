class Sprint < ApplicationRecord
  belongs_to :project

  has_many :stories, dependent: :nullify
  has_many :stories,
           dependent: :nullify

  enum :status, {
    planned: 0,
    active: 1,
    completed: 2
  }
end
