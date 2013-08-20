class PostType < Post
  include ApplicationType

  validates :title, :presence => true,
            :length => { :minimum => 5 }
  validates :state,  :presence => true,
            :format => { :with => /published|not_published/ }
end
