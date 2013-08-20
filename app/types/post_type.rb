class PostType < Post
  include ApplicationType

  validates :title, :presence => true, :length => { :minimum => 5 }
  permit :title, :text, :state_event
end
