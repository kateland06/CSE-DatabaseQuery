class Importing
  
  def self.importSloData(file)

    sheet1 = open_spreadsheet(file)
    index = 2 #Skip row of headers
    numberOfLines = sheet1.last_row
    
    # loop for each student in the file
    while (index < numberOfLines) do
      row = sheet1.row(index)
      slo = StudentLearningOutcome.find_or_create_by(accredidation_body: row[0], title: row[1] )
      slo.description = row[2]
      slo.active = true
      if not slo.year_added
        slo.year_added = row[3]
      end
      slo.save
      index = index + 1      
    end # end loop   while (currentRowIndex < numberOfLines) do
  end # end method
  
  def self.importSloKTData(file)

    sheet1 = open_spreadsheet(file)
    index = 2 #Skip row of headers
    numberOfLines = sheet1.last_row
    
    # loop for each student in the file
    while (index < numberOfLines) do
      row = sheet1.row(index)
      slo = StudentLearningOutcome.find_or_create_by(accredidation_body: row[0], title: row[1] )
      kt  = KnowledgeTopic.find_or_create_by(knowledge_area: row[2], knowledge_topic: row[3])
      k = SloCoveredByKt.find_or_create_by(knowledge_topic: kt, student_learning_outcome: slo)
      index = index + 1      
    end # end loop   while (currentRowIndex < numberOfLines) do
  end # end method
  
  
  def self.importQuiz(file, crn, course, courseNumber, instrLastName, instrFirstName, semester, courseYear, section)
    crn_altered = crn + courseYear
    self.uploadingClassQuizResults(course, instrFirstName, instrLastName, semester, file, courseYear, crn_altered, courseNumber, section)
  end 
  
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end


  #Method called to load the data
  def self.uploadingClassQuizResults (course, instrFirstName, instrLastName, semester, file, courseYear, crn, courseNumber, section)
    
    sheet1 = open_spreadsheet(file)
    currentRowIndex = 2 #Skip row of headers
    numberOfLines = sheet1.last_row

    # for each student import quiz results
    while (currentRowIndex < numberOfLines) do
      currentRow = sheet1.row(currentRowIndex)
      
      ######## CHECK TO SEE IF SKIP STUDENT ########
      initialExperienceRowIndex = getInitialExperienceRowIndex( sheet1, currentRowIndex)
      initialExperienceRowContent = sheet1.row(initialExperienceRowIndex)
      
      if (initialExperienceRowContent[15].eql?"unchecked") #If this isn't the first attempt, skip this student
          currentRowIndex = getNextStudentRowIndex(sheet1, initialExperienceRowIndex)
          currentRow = sheet1.row(currentRowIndex)    
          next
      end
      ####### END SECTION ON SKIPPING STUDENT #######
    
    
      ####### LOAD THE STUDENT QUIZ RESULTS #########
      uid = currentRow[0]
      totalNumQuestions = 0;
      numQuestionsCorrect = 0;
      while (currentRow[0].eql? uid) do
        if ( currentRow[10].eql? "Demographics" )
          currentRowIndex = handleDemographicsInformation(sheet1, (currentRowIndex + 1), crn)
          currentRow = sheet1.row(currentRowIndex)
        elsif currentRow[0] 
          tmpArray = handleQuizQuestions(sheet1, (currentRowIndex + 1), crn, totalNumQuestions, numQuestionsCorrect)
          currentRowIndex = tmpArray[0]
          totalNumQuestions = tmpArray[1]
          numQuestionsCorrect = tmpArray[2]
          currentRow = sheet1.row(currentRowIndex)
        end
      end #end student technical sections loop   while (currentRow[0].eql? uid) do
      loadSection(crn, instrLastName, instrFirstName, course, courseNumber, courseYear, semester, section, uid, totalNumQuestions, numQuestionsCorrect)
      ####### END LOAD STUDENT QUIZ RESULTS #########

    end # end student loop   while (currentRowIndex < numberOfLines) do
  end # end method

  # returns with line one past the end summary line
  def self.handleDemographicsInformation(sheet1, currentRowIndex, crn) 
      rowContent = sheet1.row(currentRowIndex)
      programsOfStudy = Array.new
      uid = rowContent[0]
      fName = rowContent[2]
      lName = rowContent[3]
      acaProgress = "Other, including non-degree seeking students"
      gender = "I prefer not to provide this information."
      ethnicity = "I prefer not to provide this information"
        
      until rowContent[10].eql? "Summary: Demographics"
      
        while(rowContent[10].include? "Program of study") do
            if (rowContent[15].eql? "Checked")
              rowContent[14].gsub!("&nbsp;", " ")
              programsOfStudy.push ActionController::Base.helpers.sanitize(rowContent[14], :tags=>[])
            end        
            currentRowIndex += 1
            rowContent = sheet1.row(currentRowIndex)
        end
                
        #Remove this with update to remove UID question
        if ( rowContent[10].include? "Student identification") 
            currentRowIndex += 1
            rowContent = sheet1.row(currentRowIndex)
        end
        
        #Academic Progress
        while(rowContent[10].include? "Academic progress") do
            if (rowContent[15].eql? "Checked")
            	rowContent[14].gsub!("&nbsp;", " ")
                acaProgress = ActionController::Base.helpers.sanitize(rowContent[14], :tags=>[])
            end
            currentRowIndex += 1
            rowContent = sheet1.row(currentRowIndex)
        end
        
        #Gender
        while (rowContent[10].include? "Gender") do
            if (rowContent[15].eql? "Checked")
            	rowContent[14].gsub!("&nbsp;", " ")
                gender = ActionController::Base.helpers.sanitize(rowContent[14], :tags=>[])
            end
            currentRowIndex += 1
            rowContent = sheet1.row(currentRowIndex)
        end
          
        #Ethnicity
        while (rowContent.include? "Ethnicity" ) do
            if (rowContent[15].eql? "Checked")
            	rowContent[14].gsub!("&nbsp;", " ")
                ethnicity = ActionController::Base.helpers.sanitize(rowContent[14], :tags=>[])
            end
            currentRowIndex += 1
            rowContent = sheet1.row(currentRowIndex)
        end
          
        #Jump Course lines 
        if (rowContent[10].include? "Course number")
           currentRowIndex += 1
           rowContent = sheet1.row(currentRowIndex)
        end
        if (rowContent[10].include? "Year")
           currentRowIndex += 1
           rowContent = sheet1.row(currentRowIndex)
        end
        while (rowContent[10].include? "Term") do
           currentRowIndex += 1
           rowContent = sheet1.row(currentRowIndex)
        end
        if (rowContent[10].include? "Initial experience")
           currentRowIndex += 1
           rowContent = sheet1.row(currentRowIndex)
        end
        
      end
      
      loadDemographicInfo(crn, uid, fName, lName, gender, acaProgress, ethnicity)
      
      loadProgramOfStudy(uid, crn, programsOfStudy)
      
      currentRowIndex += 1
      return currentRowIndex 
    end
  
  def self.getInitialExperienceRowIndex( sheet1, currentRowIndex)
      
      rowContent = sheet1.row(currentRowIndex)
      until (rowContent[10] =~ /Initial experience/i)
            currentRowIndex += 1
            rowContent = sheet1.row(currentRowIndex)
      end
      return currentRowIndex
  end    

  def self.getNextStudentRowIndex(sheet1, currentRowIndex)
      currentRow = sheet1.row(currentRowIndex)
      student = rowContent[0]
      
      while (currentRow[0].eql? student) do
            currentRowIndex += 1
            currentRow = sheet1.row(currentRowIndex)
      end
      return currentRowIndex     
  end

  def self.loadSection(crn, instrLastName, instrFirstName, course, courseNumber, courseYear, semester, section, uid, totalNumQuestions, numQuestionsCorrect) 
    stu = Student.find_or_create_by(w_number: uid)
    s = Section.find_or_create_by(course_registration_number: crn, student: stu )
    s.course_registration_number = crn
    s.faculty = instrFirstName + " " + instrLastName
    s.course = course + " " + courseNumber.to_s
    s.year_offered = courseYear
    s.semester = semester
    s.section = section
    s.quiz_score = numQuestionsCorrect.to_f/totalNumQuestions
    s.save
   
  end
    
  def self.cleanCourseString(course)
    if course.include? "CS"
      index = course.index("CS")
      course = course[index, 7]
      if !course.include? " "
         course = course.chop
      end
    elsif course.include? "CEG"
      index = course.index("CEG")
      course = course[index, 8]
      if !course.include? " "
         course = course.chop
      end
    elsif course.include? "MTH"
      index = course.index("MTH")
      course = course[index, 8]
      if !course.include? " "
         course = course.chop
      end
    elsif course.include? "EGR"
      index = course.index("EGR")
      course = course[index, 8]
      if !course.include? " "
        course = course.chop
      end
    elsif course.include? "other"
      course = "other"
    else
      course = "NONE"
    end
    return course   
  end
     
  def self.getProgramFromString(course)
    program = course
  
    if course.include? "CS"
      program = "CS"
    elsif course.include? "CEG"
      program = "CEG"
    elsif course.include? "MTH"
      program = "MTH"
    elsif course.include? "EGR"
      program = "EGR"
    end 
  
    return program
  end
    
  def self.getNumberFromString(course)
    number = 9999
  
    if course.include? "CS"
      parts = course.partition("CS")
      number = parts[2].strip.to_i
    elsif course.include? "CEG"
      parts = course.partition("CEG")
      number = parts[2].strip.to_i
    elsif course.include? "MTH"
      parts = course.partition("MTH")
      number = parts[2].strip.to_i
    elsif course.include? "EGR"
      parts = course.partition("EGR")
      number = parts[2].strip.to_i
    end 
  
    return number
  end
  
  def self.cleanSemester( semester )
    if semester.include? "Summer"
      semester = "Summer"
    elsif semester.include? "Spring"
      semester = "Spring"
    else
      semester = "Fall"
    end
    return semester
  end
  
  def self.findPreCourse(prCourse)
      prCourse = cleanCourseString(prCourse)
      program = getProgramFromString(prCourse)
      number = getNumberFromString(prCourse)
      course = program + " " + number.to_s
      return course 
  end
    
  def self.loadPrerequisite(uid, prCourse, crn, prYear, prSemester, prInstructor)
    stu = Student.find_or_create_by(w_number: uid)
    sec = Section.find_or_create_by(student: stu, course_registration_number: crn)
    p = Prerequisite.find_or_create_by(student: stu, section: sec)
    course = findPreCourse(prCourse)
    p.course = course
    p.year_taken = prYear
    p.semester = prSemester
    p.faculty = prInstructor
    p.save
  end
  
  def self.getKnowledgeTopic(topic)
      ary = topic.split("/")
      ary_ka = ary[0].split(":")
      ka = ary_ka[ary_ka.length - 1]
      
      #For testing things that are not actually part of the KT list (mostly math concepts)
      if (not ary[1]) 
        k = KnowledgeTopic.find_or_create_by(knowledge_topic: ka)
        return k
      end
      
      ary = ary[1].split(":")
      ku = ary[0]
      kt = ary[1]
      
      k = KnowledgeTopic.find_or_create_by(knowledge_topic: kt)
      k.knowledge_unit = ku
      k.knowledge_area = ka
      k.save
      
      return k
      
  end
  
  def self.findQuestion(qTitle)
    q = Question.find_or_create_by(question_text: qTitle)
    q.active = true
    q.save
    return q
  end
  
  def self.loadQuestionAnswer(qTitle, qAnswer, uid, crn, correct, qKnowTopic)
    s = Student.find_or_create_by(w_number: uid)
    que = findQuestion(qTitle)
    kt = getKnowledgeTopic(qKnowTopic)
    section = Section.find_or_create_by(course_registration_number: crn, student: s)
    a = Answer.find_or_create_by(student: s, question: que, section: section)
    a.answer_text = qAnswer
    a.is_correct = correct
    if correct
      if(que.correct_answers)
        que.correct_answers += 1
      else
        que.correct_answers = 1
      end
      if(kt.correct_answers)
        kt.correct_answers += 1
      else
        kt.correct_answers = 1
      end
    else
      if(que.incorrect_answers)
        que.incorrect_answers += 1
      else
        que.incorrect_answers = 1
      end
      if(kt.incorrect_answers)
        kt.incorrect_answers += 1
      else
        kt.incorrect_answers = 1
      end  
    end
    que.save
    kt.save
    a.knowledge_topic = kt
    a.save
  end
   
  def self.loadDemographicInfo(crn, uid, fName, lName, gender, acaProgress, ethnicity)
    s = Student.find_or_create_by(w_number: uid)
    sec = Section.find_or_create_by(course_registration_number: crn, student: s)
    s.first_name = fName
    s.last_name = lName
    s.gender = gender
    sec.academic_progress = acaProgress
    s.ethnicity = ethnicity
    s.save
    sec.save
  end
    
  def self.loadProgramOfStudy(uid, crn, programsOfStudy)
    s = Student.find_or_create_by(w_number: uid)
    sec = Section.find_or_create_by(course_registration_number: crn, student: s)
    programsOfStudy.each { |current_program| 
      p = ProgramOfStudy.find_or_create_by(section: sec, program: current_program)
    }   
  end
    
     
  def self.handleQuizQuestions(sheet1, currentRowIndex, crn, totalNumQuestions, numQuestionsCorrect)
    currentRow = sheet1.row(currentRowIndex)
  
    until currentRow[7]
      if (currentRow[10].include? "Prerequisite course")
          currentRowIndex = handlePrerequisiteClasses(sheet1, currentRowIndex, crn)
          currentRow = sheet1.row(currentRowIndex)
      elsif currentRow[10]
          tmpArray = handleTechnicalQuestions(sheet1, currentRowIndex, crn, totalNumQuestions, numQuestionsCorrect)
          currentRowIndex = tmpArray[0]
          totalNumQuestions = tmpArray[1]
          numQuestionsCorrect = tmpArray[2]
          currentRow = sheet1.row(currentRowIndex)
      else
          currentRowIndex += 1
          currentRow = sheet1.row(currentRowIndex)
      end
        
    end
    currentRowIndex = currentRowIndex + 1
    return [currentRowIndex, totalNumQuestions, numQuestionsCorrect]
  end
  
  def self.handleTechnicalQuestions(sheet1, currentRowIndex, crn, totalNumQuestions, numQuestionsCorrect)
    currentRow = sheet1.row(currentRowIndex)
    uid = currentRow[0]
    #Each Question in this section
    until (currentRow[7])
      qNum = currentRow[8].to_i
      qTitle = ActionController::Base.helpers.sanitize(currentRow[11], :tags=>[])
      qTitle.gsub!("&nbsp;", " ")
      qKnowTopic = currentRow[10]
      correct = false
      
      # Find the answer
      while (currentRow[8].to_i == qNum) do 
          if (currentRow[15].eql? "Checked")
              qAnswer = ActionController::Base.helpers.sanitize(currentRow[14], :tags=>[])
              qAnswer.gsub!("&nbsp;", " ")
              if (currentRow[16].to_i > 0)
                  correct = true
                  numQuestionsCorrect += 1
              end
          end
          currentRowIndex += 1
          currentRow = sheet1.row(currentRowIndex)
          
      end # loop through question answers
      
      totalNumQuestions += 1
      loadQuestionAnswer(qTitle, qAnswer, uid, crn, correct, qKnowTopic)
  
    end #Move to next question
  
  #array to return multiple values
  
      return [currentRowIndex, totalNumQuestions, numQuestionsCorrect]
  end
    
  def self.handlePrerequisiteClasses(sheet1, currentRowIndex, crn)
    
    currentRow = sheet1.row(currentRowIndex)
    uid = currentRow[0]
    prCourse = "I am not familiar with prequisite concepts appearing above"

    while (currentRow[10].include? "Prerequisite course") do
        if (currentRow[15].eql? "Checked") 
            prCourse = ActionController::Base.helpers.sanitize(currentRow[14], :tags=>[])
            prCourse.gsub!("&nbsp;", " ")
        end
        currentRowIndex+= 1
        currentRow = sheet1.row(currentRowIndex)
    end
      
    prYear = currentRow[15]
    currentRowIndex += 1
    currentRow = sheet1.row(currentRowIndex)
    
    prSemester = "Other"
    while(currentRow[10].include? "Term of prerequisite course") do
        if (currentRow[15].eql? "Checked") 
            prSemester = ActionController::Base.helpers.sanitize(currentRow[14], :tags=>[])
            prSemester.gsub!("&nbsp;", " ")
        end
        currentRowIndex += 1
        currentRow = sheet1.row(currentRowIndex)
    end
    
    prInstructor = currentRow[15]
    currentRowIndex += 1
     
    loadPrerequisite(uid, prCourse, crn, prYear, prSemester, prInstructor)
    
    return currentRowIndex
  end

  def self.importing_ir_report(file)
    
    course_list = [[8, "CS", "1150"],[10, "CS", "1160"],[13, "CS", "1200"],[16, "CS", "1161"],[19, "MTH", "2200"],[20, "CS", "1180"],[25, "MTH", "2570"],[28, "CS", "1181"],[33, "CEG", "2350"],[36, "MTH", "2300"],[39, "CEG", "3310"],[42, "MTH", "2310"],[46, "MTH", "2240"],[48, "MTH", "2280"],[50, "CS", "2200"],[53, "CS", "3100"],[58, "CEG", "3320"]]    
    
    
    sheet1 = open_spreadsheet(file)
    numberOfLines = sheet1.last_row
    
    for index in 5..numberOfLines
      	row = sheet1.row(index)
      	studentID = row[0]

      	if(studentID =~ /^u\d+/i )
      		stu = Student.find_or_create_by(w_number: row[2])

      		course_list.each {|c|
         		course_cell = c[0]
         		if row[course_cell]
          			grade = row[c[0]].to_str
            		
            		splitGrade = grade.to_str.split("/")
            		
            		# Grab the Semester and year taken
            		if(splitGrade[0] =~ /^\w+\s+\d+$/i)
            			classTaken = splitGrade[0].to_str.split(" ")
            			semesterTaken = classTaken[0]
            			yearTaken = classTaken[1] 
            		end

            		# Grab the Grade
            		if(splitGrade[1] =~ /^\w+/)
            			letterGrade = splitGrade[1]
            		else
            			letterGrade = "0"
            		end

            		cour = c[1] + " " + c[2]

            		if(letterGrade =~ /a|b|c|d|f|x|w/i)
            			sect = Section.find_or_create_by(student: stu, course: cour )
            			sect.semester = semesterTaken
            			sect.year_offered = yearTaken
              			sect.grade = letterGrade
              			sect.student = stu
              			sect.save
            		end
            	end
        	}

        	# Save student information
      		stu.act = row[64]
      		stu.act_math = row[63]
      		stu.mpl = row[62]
      		stu.high_school_gpa = row[61]
      		stu.save    
        end       
    end
  end

end #end of view
    
    

    