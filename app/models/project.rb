class Project < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :promises
  has_many :users, :through => :funds
  has_many :users, :through => :wishlists

  has_one_attached :picture

  #validates :ammount, :days_to_go, numericality: {greater_than: 0}
  #validates :ammount, :days_to_go, :title, :description, :delivery_date, :user_id, :category_id, presence: true
  #

end