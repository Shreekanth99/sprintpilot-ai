class Project < ApplicationRecord
  belongs_to :organization

  has_many :epics, dependent: :destroy
  has_many :sprints, dependent: :destroy

  validates :name, presence: true
end
