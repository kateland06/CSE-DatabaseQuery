class Result
  
  def self.combine_table_lines(results)
    
    i = 0
    newIndex = 0
    newData =  []
    s1 = results[0].title
    newData << [s1, 0, 0]
    
    while (i < results.length)      
      s1 = results[i].title
      s2 = newData[newIndex][0]
      
      if not s1.eql? s2
         newData << [s1, 0, 0]
         newIndex = newIndex + 1    
      end
        
      if results[i].is_correct
        newData[newIndex][1] = results[i].total_answers
      else
        newData[newIndex][2] = results[i].total_answers
      end 

      i = i + 1
    end # end loop

    return newData   

  end # end method




  def self.getRow(ary, title)
    i = 0
    
    while (i < ary.length)      
      t = ary[i][0]
      if t.eql? title
        return i
      end
      i = i + 1   
    end # end loop
    ary << [title, 0, 0, 0, 0, 0, 0]
    return i
  end

  def self.combine_table_lines_with_semesters(slos_fall, slos_spring, slos_summer)
    
    fall = combine_table_lines(slos_fall)
    spring = combine_table_lines(slos_spring)
    summer = combine_table_lines(slos_summer)
    
    i = 0
    newData =  []
    
    while (i < fall.length)      
      s1 = fall[i][0]
      newData << [s1, 0, 0, 0, 0, fall[i][1], fall[i][2]]
      i = i + 1   
    end # end loop


    i = 0
    
    while (i < spring.length)      
      s1 = spring[i][0]
      
      rowIndex = getRow(newData, s1)
      
      newData[rowIndex][1] = spring[i][1]
      newData[rowIndex][2] = spring[i][2]
      
      i = i + 1   
    end # end loop

    i = 0
    
    while (i < summer.length)      
      s1 = summer[i][0]
      
      rowIndex = getRow(newData, s1)
      
      newData[rowIndex][3] = summer[i][1]
      newData[rowIndex][4] = summer[i][2]
      
      i = i + 1   
    end # end loop

    return newData   
    
  end #end method

  def self.make_percentages(results)
    newData = Array.new
    results.each {|row|
      title = row[0]
      spring = row[1].to_f/(row[1] + row[2])
      summer = row[3].to_f/(row[3] + row[4])
      fall = row[5].to_f/(row[5] + row[6])
      
      newData << [title, spring, summer, fall]
    }
    
    return newData
      
  end

   def self.make_percentages_per_semester(results)
    newData = Array.new
    results.each {|row|
      title = row[0]
      semester = row[1].to_f/(row[1] + row[2])
      newData << [title, semester]
    }
    
    return newData
      
  end
  
  def self.getStudentIDArray(results)
    newData = Array.new
    results.each {|row|
      stud = row.student_id
      newData.append stud
    }
    
    return newData
      
  end


  def self.combine_letter_grades(grades)
    i = 0
    newIndex = 0
    newData =  []
    s1 = grades[0].course
    newData << [s1, 0, 0, 0, 0, 0]
    
    while (i < grades.length)      
      s1 = grades[i].course
      s2 = newData[newIndex][0]
      
      if not s1.eql? s2
       newData << [s1, 0, 0, 0, 0, 0]
       newIndex = newIndex + 1    
      end
        
      if grades[i].grade.to_str.eql? 'A'
        newData[newIndex][1] = grades[i].total_students
      elsif grades[i].grade.to_str.eql? 'B'
        newData[newIndex][2] = grades[i].total_students
      elsif grades[i].grade.to_str.eql? 'C'
        newData[newIndex][3] = grades[i].total_students
      elsif grades[i].grade.to_str.eql? 'D'
        newData[newIndex][4] = grades[i].total_students
      else
        newData[newIndex][5] = grades[i].total_students
      end 

      i = i + 1
    end # end loop

    return newData   

  end # end method
  
  def self.combine_grades_to_graph(group1, group2)
        
   percentage1 = convert_to_percentages(group1)
   percentage2 = convert_to_percentages(group2)
   
   i = 0
    newData =  []
    
    while (i < percentage1.length)      
      s1 = percentage1[i][0]
      newData << [s1, percentage1[i][1], percentage1[i][2],percentage1[i][3],percentage1[i][4],percentage1[i][5],0, 0, 0, 0, 0]
      i = i + 1   
    end # end loop


    i = 0
    
    while (i < percentage2.length)      
      s1 = percentage2[i][0]
      
      rowIndex = getRowAny(newData, s1, ["", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
      
      newData[rowIndex][6] = percentage2[i][1]
      newData[rowIndex][7] = percentage2[i][2]
      newData[rowIndex][8] = percentage2[i][3]
      newData[rowIndex][9] = percentage2[i][4]
      newData[rowIndex][10] = percentage2[i][5]
      
      i = i + 1   
    end # end loop
  
   return newData
     
   end #end method


 def self.getRowAny(ary, title, newRowLook)
    i = 0
    
    while (i < ary.length)      
      t = ary[i][0]
      if t.eql? title
        return i
      end
      i = i + 1   
    end # end loop
    ary << newRowLook
    ary[ary.length - 1][0] = title
    return i
  end
 
  def self.convert_to_percentages(result)
   newData =  []
   
   result.each {|row|
     course = row[0].to_str
     if course.eql? 'CS 1180' or course.eql? 'CS 1181' or course.eql? 'CEG 3310' or course.eql? 'CS 3100'
       newData << [row[0], row[1], row[2], row[3], row[4], row[5]]
       total = row[1] + row[2] + row[3] + row[4] + row[5]
       newData[newData.length - 1][1] = newData[newData.length - 1][1].to_f/total
       newData[newData.length - 1][2] = newData[newData.length - 1][2].to_f/total
       newData[newData.length - 1][3] = newData[newData.length - 1][3].to_f/total
       newData[newData.length - 1][4] = newData[newData.length - 1][4].to_f/total
       newData[newData.length - 1][5] = newData[newData.length - 1][5].to_f/total
     end
   }
    
   return newData
  end # end method

  def self.number_grades_per_class(group1, group2)
    newData =  []
   
   group1.each {|row|
     course = row[0].to_str
     if course.eql? 'CS 1180' or course.eql? 'CS 1181' or course.eql? 'CEG 3310' or course.eql? 'CS 3100'
       total = row[1] + row[2] + row[3] + row[4] + row[5]
       newData << [row[0], total, 0]
     end
   }

   
    i = 0
    
    while (i < group2.length)      
      course = group2[i][0]
     
     if course.eql? 'CS 1180' or course.eql? 'CS 1181' or course.eql? 'CEG 3310' or course.eql? 'CS 3100'
       total = group2[i][1] + group2[i][2] + group2[i][3] + group2[i][4] + group2[i][5]
      
       rowIndex = getRowAny(newData, course, ["", 0, 0])
      
      newData[rowIndex][2] = total
     end # end if
     i = i + 1   
    end # end loop
  
   return newData
  end # end method

end
  
