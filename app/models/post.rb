class Post < ActiveRecord::Base
  state_machine :state, :initial => :not_published do
    state :not_published
    state :published

    event :publish do
      transition :not_published => :published
    end

    event :unpublish do
      transition :published => :not_published
    end
  end

  #attr_accessible :content, :name, :title, :state_event, :tags_attributes

  #validates :name,  :presence => true
  validates :title, :presence => true,
            :length => { :minimum => 5 }
  validates :state,  :presence => true,
            :format => { :with => /published|not_published/ }

  has_many :comments, :dependent => :destroy
  #has_many :tags

  #accepts_nested_attributes_for :tags, :allow_destroy => true,
  #  :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
