#encoding: utf-8
class User < ActiveRecord::Base
  attr_accessible :email, :password
  has_many :codes
end
