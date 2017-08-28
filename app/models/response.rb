class Response < ApplicationRecord
  has_many :answers, :dependent => :delete_all
end
