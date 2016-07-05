class User < ActiveRecord::Base
  validates_length_of :name, within: 3..20
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
