json.array!(@knowledge_topics) do |knowledge_topic|
  json.extract! knowledge_topic, :id, :knowledge_area, :knowledge_unit, :knowledge_topic, :year_added, :active, :correct_answers, :incorrect_answers, :temp_correct_answer, :temp_incorrect_answer
  json.url knowledge_topic_url(knowledge_topic, format: :json)
end
