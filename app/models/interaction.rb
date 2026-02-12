class Interaction < ApplicationRecord
  belongs_to :interactable, polymorphic: true
  validates :interaction_type, presence: true, inclusion: { in: %w[Call Email Meeting Note] }
  validates :occurred_at, presence: true
end
