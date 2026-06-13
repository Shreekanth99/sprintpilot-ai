class Epic < ApplicationRecord
  belongs_to :project

  has_many :stories, dependent: :destroy

  validates :title, presence: true
end
