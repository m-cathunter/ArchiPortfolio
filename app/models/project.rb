class Project < ApplicationRecord
  belongs_to :user
  validates :title, presence: true,
            length: { minimum: 6}

  has_attached_file :project_img, :styles => { :project_index => "350x250", :project_show => "350x250" }, default_url => "/images/:style/missing.png"
  validates_attachment_content_type :project_img, content_type: /\Aimage/\.*\z/
end
