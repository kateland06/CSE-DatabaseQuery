# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141202104751) do

  create_table "answers", force: true do |t|
    t.integer  "question_id"
    t.integer  "section_id"
    t.integer  "student_id"
    t.integer  "knowledge_topic_id"
    t.boolean  "is_correct"
    t.string   "answer_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["knowledge_topic_id"], name: "index_answers_on_knowledge_topic_id"
  add_index "answers", ["question_id"], name: "index_answers_on_question_id"
  add_index "answers", ["section_id"], name: "index_answers_on_section_id"
  add_index "answers", ["student_id"], name: "index_answers_on_student_id"

  create_table "knowledge_topics", force: true do |t|
    t.string   "knowledge_area"
    t.string   "knowledge_unit"
    t.string   "knowledge_topic"
    t.integer  "year_added"
    t.boolean  "active"
    t.integer  "correct_answers"
    t.integer  "incorrect_answers"
    t.integer  "temp_correct_answer"
    t.integer  "temp_incorrect_answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "peo_covered_by_slos", force: true do |t|
    t.integer  "student_learning_outcome_id"
    t.integer  "program_educational_objective_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "peo_covered_by_slos", ["program_educational_objective_id"], name: "index_peo_covered_by_slos_on_program_educational_objective_id"
  add_index "peo_covered_by_slos", ["student_learning_outcome_id"], name: "index_peo_covered_by_slos_on_student_learning_outcome_id"

  create_table "prerequisites", force: true do |t|
    t.integer  "section_id"
    t.integer  "student_id"
    t.string   "course"
    t.integer  "year_taken"
    t.string   "faculty"
    t.string   "semester"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prerequisites", ["section_id"], name: "index_prerequisites_on_section_id"
  add_index "prerequisites", ["student_id"], name: "index_prerequisites_on_student_id"

  create_table "program_educational_objectives", force: true do |t|
    t.string   "accredidation_body"
    t.string   "title"
    t.string   "description"
    t.integer  "year_added"
    t.boolean  "active"
    t.integer  "correct_answers"
    t.integer  "incorrect_answers"
    t.integer  "temp_correct_answer"
    t.integer  "temp_incorrect_answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "program_of_studies", force: true do |t|
    t.string   "program"
    t.integer  "section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "program_of_studies", ["section_id"], name: "index_program_of_studies_on_section_id"

  create_table "questions", force: true do |t|
    t.string   "question_text"
    t.string   "answer"
    t.date     "date_created"
    t.string   "creator"
    t.boolean  "active"
    t.integer  "correct_answers"
    t.integer  "incorrect_answers"
    t.integer  "temp_correct_answer"
    t.integer  "temp_incorrect_answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.integer  "course_registration_number"
    t.string   "faculty"
    t.string   "course"
    t.string   "semester"
    t.integer  "year_offered"
    t.integer  "section"
    t.integer  "student_id"
    t.string   "academic_progress"
    t.string   "grade"
    t.float    "quiz_score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["student_id"], name: "index_sections_on_student_id"

  create_table "slo_covered_by_kts", force: true do |t|
    t.integer  "student_learning_outcome_id"
    t.integer  "knowledge_topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slo_covered_by_kts", ["knowledge_topic_id"], name: "index_slo_covered_by_kts_on_knowledge_topic_id"
  add_index "slo_covered_by_kts", ["student_learning_outcome_id"], name: "index_slo_covered_by_kts_on_student_learning_outcome_id"

  create_table "student_learning_outcomes", force: true do |t|
    t.string   "accredidation_body"
    t.string   "title"
    t.string   "description"
    t.integer  "year_added"
    t.boolean  "active"
    t.integer  "correct_answers"
    t.integer  "incorrect_answers"
    t.integer  "temp_correct_answer"
    t.integer  "temp_incorrect_answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "w_number"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "gender"
    t.string   "ethnicity"
    t.float    "high_school_gpa"
    t.integer  "act"
    t.integer  "mpl"
    t.integer  "act_math"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
