class Promise < ApplicationRecord
  belongs_to :project
  has_many :users, :through => :buys

  validates :price, :quantity, numericality: {greater_than: 0}
  validates :project_id, :quantity, :price, :release_date, :description, presence: true
end
