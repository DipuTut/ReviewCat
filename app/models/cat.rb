class Cat < ActiveRecord::Base
	belongs_to :user
	belongs_to :category

	has_attached_file :cat_img, styles: { :cat_index => "200x200>", :cat_show => "400x400>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :cat_img, content_type: /\Aimage\/.*\Z/
end
