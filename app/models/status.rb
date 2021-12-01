class Status < ApplicationRecord
  validates :label, presence: true, uniqueness: true
end
