class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :section
  belongs_to :student
  belongs_to :knowledge_topic
end
