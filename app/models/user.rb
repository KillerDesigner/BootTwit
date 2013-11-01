class User < ActiveRecord::Base
  attr_accessible :password, :tweet_id, :username

  has_many :tweets


end