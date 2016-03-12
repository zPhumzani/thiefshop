class Tagging < ActiveRecord::Base
  belongs_to :classified
  belongs_to :tag
end
