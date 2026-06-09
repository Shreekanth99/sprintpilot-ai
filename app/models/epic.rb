class Epic < ApplicationRecord
  belongs_to :project

  has_many :stories, dependent: :destroy
end
