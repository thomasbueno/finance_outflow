class Expense < ApplicationRecord
  validates :description, presence: true
  validates :category, presence: true
  validates :value, presence: true
  validates :date, presence: true
end
