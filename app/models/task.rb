class Task < ApplicationRecord
  belongs_to :story

  belongs_to :assignee,
             class_name: "User",
             optional: true

  enum :status, {
    todo: 0,
    in_progress: 1,
    review: 2,
    done: 3
  }

  validates :title,
            presence: true
end
