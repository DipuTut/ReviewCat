class AddAttachmentCatImgToCats < ActiveRecord::Migration
  def self.up
    change_table :cats do |t|
      t.attachment :cat_img
    end
  end

  def self.down
    remove_attachment :cats, :cat_img
  end
end
