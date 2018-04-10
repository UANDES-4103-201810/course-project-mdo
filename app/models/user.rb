class User < ApplicationRecord
  has_many :projects
  has_many :projects, :through => :funds
  has_and_belongs_to_many :projects
  has_many :promises, :through => :buys

  validates :email, format: {with: /\A.+@.+\..+\z/}
  validates :password, length: { minimum: 8 }
  validates :birth_date, numericality: {less_than: Date.today()}
  validates :name, :security_question, :security_answer, presence: true
end
