class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects
  has_many :projects, :through => :funds
  has_many :projects, :through => :wishlists
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

  def in_wishlist(project)
    wish = Wishlist.where(:user_id => self.id, :project_id => project).first
    if wish == nil
      "none"
    else
      wish.id
    end
  end

  def my_wishlist
    Wishlist.where(:user_id => self.id)
  end
end
