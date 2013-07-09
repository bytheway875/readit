class Link < ActiveRecord::Base
  attr_accessible :title, :link
  belongs_to :user
end
