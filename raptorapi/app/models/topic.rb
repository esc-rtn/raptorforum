class Topic < ActiveRecord::Base
  has_many :replies
end
