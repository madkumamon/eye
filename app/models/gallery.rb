class Gallery < ActiveRecord::Base
  belongs_to :category
  has_many :comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "128x128>" }
end
