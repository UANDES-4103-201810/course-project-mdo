class Promise < ApplicationRecord
  belongs_to :project
  has_many :users, :through => :buys

  validates :price, :quantity, numericality: {greater_than: 0}
  validates :project_id, :quantity, :price, :release_date, :description, presence: true

  def amount_by_promise
    Buy.where(:promise_id => self.id).count * self.price
  end
end
