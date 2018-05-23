class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects
  has_many :projects, :through => :funds
  has_and_belongs_to_many :projects
  has_many :promises, :through => :buys

  has_one_attached :image

  validates :email, format: {with: /\A.+@.+\..+\z/}
  validates :encrypted_password, length: { minimum: 8 }
  #validates :name, :security_question, :security_answer, presence: true
  #validate :born_at_least_yesterday

  def born_at_least_yesterday
    if birth_date.present? && birth_date >= Date.today
      errors.add(:expiration_date, "can't be born in the future")
    end
  end
end
