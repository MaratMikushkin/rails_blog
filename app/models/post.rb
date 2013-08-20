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

  has_many :comments, :dependent => :destroy
end
