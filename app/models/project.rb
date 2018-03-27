class Project < ApplicationRecord
  belongs_to :user
  validates :title, presence: true,
            length: { minimum: 6}
end
