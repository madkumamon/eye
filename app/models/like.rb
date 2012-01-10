class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :gallery, :counter_cache => true
  validates :user_id, :uniqueness => {:scope => :gallery_id}
end
