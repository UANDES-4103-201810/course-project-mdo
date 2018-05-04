class Buy < ApplicationRecord
  belongs_to :promise
  belongs_to :user
end
