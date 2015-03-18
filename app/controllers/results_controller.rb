class ResultsController < ApplicationController
  def index
  end
  
  def answers
  end
  
  def query
	@domain = params[:domain]
	@dattribute = params[:dattribute]
	@dfilter = params[:dfilter]
	@range = params[:range]
	@rattribute = params[:rattribute]
	
	if @dattribute == nil || @dfilter == nil
		@dattribute = ""
		@dfilter = ""
	end
	
	@results = @domain.constantize.joins(@range.to_sym).where(@dattribute+@dfilter).select(@rattribute)
	
	render "/results/query"
  end
  
  def search
    @answers = Answer.select( :answer_text, :is_correct, "count(answers.id) AS number_students_selected").group(:answer_text)
    @correct = Answer.where(is_correct: true).select( :is_correct, "count(answers.id) AS number").group(:is_correct).first
    @incorrect = Answer.where(is_correct: false).select( :is_correct, "count(answers.id) AS number").group(:is_correct).first
    render "/results/answers"
  end
  
  def abetReport
    @slos = Answer.joins(knowledge_topic: :student_learning_outcomes).select( 'student_learning_outcomes.title', :is_correct, "count(answers.id) AS total_answers").group('student_learning_outcomes.id', :is_correct)
    @slos_combined = Result.combine_table_lines(@slos)
    
    
    @slos_fall = @slos.joins(:section).select( 'student_learning_outcomes.title', :is_correct, "count(answers.id) AS total_answers").where("sections.semester = 'Fall' AND sections.year_offered = 2014" ).group('student_learning_outcomes.id', :is_correct)
    @slos_spring = @slos.joins(:section).select( 'student_learning_outcomes.title', :is_correct, "count(answers.id) AS total_answers").where("sections.semester = 'Spring' AND sections.year_offered = 2014" ).group('student_learning_outcomes.id', :is_correct)
    @slos_summer = @slos.joins(:section).select( 'student_learning_outcomes.title', :is_correct, "count(answers.id) AS total_answers").where("sections.semester = 'Summer' AND sections.year_offered = 2014" ).group('student_learning_outcomes.id', :is_correct)
    @slos_combined_semesters = Result.combine_table_lines_with_semesters(@slos_fall, @slos_spring, @slos_summer)
    @slos_percentages = Result.make_percentages(@slos_combined_semesters)
    
    
    @pathway_1160 = Section.select(:student_id, :course).distinct.where(course: ['CS 1160', 'CS 1161'])
    @ary_1160_students = Result.getStudentIDArray(@pathway_1160)
    @pathway_1180 = Section.select(:student_id).distinct.where.not(student_id: @ary_1160_students)
    @ary_1180_students = Result.getStudentIDArray(@pathway_1180)
    
    @grades_1160 = Section.select(:course, :grade, "count(*) As total_students").where(student_id: @ary_1160_students).where.not(grade: nil).group(:course, :grade)
    @grades_1180 = Section.select(:course, :grade, "count(*) As total_students").where(student_id: @ary_1180_students).where.not(grade: nil).group(:course, :grade)
    
    @grades_combined_1160 = Result.combine_letter_grades(@grades_1160)
    @grades_combined_1180 = Result.combine_letter_grades(@grades_1180)
    @grades_for_graph = Result.combine_grades_to_graph(@grades_combined_1160,@grades_combined_1180)
    @retention_for_graphing = Result.number_grades_per_class(@grades_combined_1160,@grades_combined_1180)
    
    @kts = Answer.joins(:knowledge_topic).select( 'knowledge_topics.knowledge_topic AS title', :is_correct, "count(answers.id) AS total_answers").group(:knowledge_topic, :is_correct)
    @kts_combined = Result.combine_table_lines(@kts)
    
    @questions = Answer.joins(:question).select( 'question_text AS title', :is_correct, "count(answers.id) AS total_answers").group(:question_text, :is_correct)
    @questions_combined = Result.combine_table_lines(@questions)
    
    @pathway_2570 = Section.select(:student_id, :course).distinct.where(course: 'MTH 2570')
    @ary_2570_students = Result.getStudentIDArray(@pathway_2570)
    @pathway_2200 = Section.select(:student_id).distinct.where(course: ['CS 2200', 'CS 1200'])
    @ary_2200_students = Result.getStudentIDArray(@pathway_2200)
    
    @grades_2570 = Section.select(:course, :grade, "count(*) As total_students").where(student_id: @ary_2570_students).where.not(grade: nil).group(:course, :grade)
    @grades_2200 = Section.select(:course, :grade, "count(*) As total_students").where(student_id: @ary_2200_students).where.not(grade: nil).group(:course, :grade)
    
    @grades_combined_2570 = Result.combine_letter_grades(@grades_2570)
    @grades_combined_2200 = Result.combine_letter_grades(@grades_2200)
    @grades_for_graph_discrete = Result.combine_grades_to_graph(@grades_combined_2570,@grades_combined_2200)
    @retention_for_graphing_discrete = Result.number_grades_per_class(@grades_combined_2570,@grades_combined_2200)
    
    
    render "/results/reportABET"
  end
  
  
end


