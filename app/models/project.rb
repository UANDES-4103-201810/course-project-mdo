class Project < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :promises
  has_many :users, :through => :funds
  has_many :users, :through => :wishlists

  has_one_attached :picture

  def markdown
    Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end

  #validates :ammount, :days_to_go, numericality: {greater_than: 0}
  #validates :ammount, :days_to_go, :title, :description, :delivery_date, :user_id, :category_id, presence: true

  def funded_amount
    donations = Fund.where(:project_id => self.id).sum(:money)
    promises = 0
    Promise.where(:project_id => self.id).each do |p|
      promises += p.amount_by_promise
    end

    donations + promises
  end

  def image_url
    if self.picture.attached?
      Rails.application.routes.url_helpers.url_for(self.picture)
    else
      ""
    end
  end

  def as_json(options = { })
    # just in case someone says as_json(nil) and bypasses
    # our default...
    super((options || { }).merge({
         :methods => [:funded_amount, :image_url]
     }))
  end

  def self.by_category(category_id)
    if category_id.present?
      Project.where(:category_id => category_id)
    else
      Project.all
    end
  end
end

