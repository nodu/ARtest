class Article < ActiveRecord::Base
  has_many :comments, { dependent: :destroy }
  # takes 2 arguments, the name and an options hash, but ruby doesn't need {}

  # -> includes: [:comment]
end
