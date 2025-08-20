class Todo < ApplicationRecord
  validates :title, presence: true
  default_scope -> { order(id: :asc) }
end
