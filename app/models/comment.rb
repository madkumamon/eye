class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :gallery, :counter_cache => true
  default_scope order("created_at DESC")
  validates :message,:user_id,:gallery_id, :presence => true
end
