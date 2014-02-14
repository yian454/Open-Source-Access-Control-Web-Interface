class Resource < ActiveRecord::Base
  attr_accessible :supercategory, :user_id, :resource_category_id, :name, :serial, :specs, :status, :donatable, :picture, :picture_file_name, :picture_content_type, :picture_file_size, :picture_updated_at, :notes, :estimated_value, :disposed_at, :modified_by

  belongs_to :owner, :class_name => "ToolshareUser" #TODO: remove owner
  belongs_to :user
  belongs_to :resource_category
  has_attached_file :picture,  #TODO: move to local storage
                    :styles => { :medium => "300x300>",
	                         :thumb => "100x100>",
				 :tiny => "50x50>"},
                    :storage => :s3,
                    :s3_credentials => Rails.root.join('config', 's3.yml'),
                    :path => ":attachment/:id/:style.:extension",
                    :bucket => 'Toolshare'

  def resource_category_name
    resource_category.name if resource_category
  end
end