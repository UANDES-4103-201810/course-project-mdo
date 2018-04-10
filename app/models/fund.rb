class Fund < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :money, numericality: {greater_than: 0}
  validates :money, :project_id, :user_id, presence: true
end
