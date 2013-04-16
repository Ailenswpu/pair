#encoding : utf-8
class Code < ActiveRecord::Base
  attr_accessible :code
  CODE_THEME = %w( Ruby Python JavaScript C++ C Lisp Clojure Lua C# Java)
end
