class Organization < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :teams, dependent: :destroy
  has_many :projects, dependent: :destroy

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
end
