class Section < ActiveRecord::Base
  belongs_to :student
  has_many :answers
  has_many :program_of_studies
  has_many :prerequisites
end
