class Story < ApplicationRecord
  belongs_to :epic
  belongs_to :sprint, optional: true

  has_many :tasks, dependent: :destroy

  enum :status, {
    backlog: 0,
    todo: 1,
    in_progress: 2,
    review: 3,
    done: 4
  }
end
