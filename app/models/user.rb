class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
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

  def funded
    Project.where(:id => Fund.where(:user_id => self.id, :approved => true)).to_a
  end

  def bought
    a = []
    Buy.where(:user_id => self.id, :approved => true).each do |p|
      b = Project.find(Promise.find(p.promise_id).project_id)
      unless a.include?(b)
        a << b
      end
    end
    a
  end

  def all_funded
    a = self.funded
    b = self.bought
    c = []
    a.each do |p|
      unless c.include?(p)
        c << p
      end
    end
    b.each do |p|
      unless c.include?(p)
        c << p
      end
    end
    c
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
    end
  end
end
