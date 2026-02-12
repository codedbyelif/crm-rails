class Lead < ApplicationRecord
  validates :status, presence: true, inclusion: { in: %w[New Contacted Qualified Lost Won] }
  validates :source, presence: true
end
