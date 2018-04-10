class Buy < ApplicationRecord
  belongs_to :promise
  belongs_to :user

  validates :promise_id, :user_id, presence: true
end
