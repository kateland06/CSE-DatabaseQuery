class Student < ActiveRecord::Base
  has_many :answers
  has_many :prerequisites
  has_many :sections
end
