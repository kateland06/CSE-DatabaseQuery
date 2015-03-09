rails generate scaffold KnowledgeTopic knowledge_area:string knowledge_unit:string knowledge_topic:string year_added:integer active:boolean correct_answers:integer incorrect_answers:integer temp_correct_answer:integer temp_incorrect_answer:integer


rails generate scaffold ProgramEducationalObjective accredidation_body:string title:string description:string year_added:integer active:boolean correct_answers:integer incorrect_answers:integer temp_correct_answer:integer temp_incorrect_answer:integer


rails generate scaffold StudentLearningOutcome accredidation_body:string title:string description:string year_added:integer active:boolean correct_answers:integer incorrect_answers:integer temp_correct_answer:integer temp_incorrect_answer:integer


rails generate scaffold Question question_text:string answer:string date_created:date creator:string active:boolean correct_answers:integer incorrect_answers:integer temp_correct_answer:integer temp_incorrect_answer:integer


rails generate scaffold Student w_number:string last_name:string first_name:string gender:string ethnicity:string high_school_gpa:float act:integer mpl:integer act_math:integer


rails generate scaffold Section course_registration_number:integer faculty:string course:string semester:string year_offered:integer section:integer student:references academic_progress:string grade:string quiz_score:float


rails generate scaffold PeoCoveredBySlos student_learning_outcome:references program_educational_objective:references


rails generate scaffold SloCoveredByKts student_learning_outcome:references knowledge_topic:references 


rails generate scaffold Answer question:references section:references student:references knowledge_topic:references is_correct:boolean answer_text:string 


rails generate scaffold ProgramOfStudy program:string section:references


rails generate scaffold Prerequisite section:references student:references course:string year_taken:integer faculty:string semester:string 



rake db:migrate RAILS_ENV=development 
