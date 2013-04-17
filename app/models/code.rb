#encoding : utf-8
class Code < ActiveRecord::Base
  attr_accessible :code, :title,:user_id
  belongs_to :user
  CODE_THEME = %w( Ruby Python JavaScript C++ C Lisp Clojure Lua C# Java)
end
