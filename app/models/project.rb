class Project < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews
#  validates :title, presence: true,
      #      length: { minimum: 6}

  has_attached_file :project_img, :styles => { :project_index => "350x350", :project_show => "350x350" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :project_img, content_type: /\Aimage\/.*\z/
end
