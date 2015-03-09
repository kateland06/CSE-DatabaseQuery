class ImportingController < ApplicationController
  def index
  end
  
  def loadQuiz
    Importing.importQuiz(params[:file], params[:crn],params[:course],params[:courseNumber],params[:instrLastName],params[:instrFirstName],params[:semester],params[:year],params[:section])
    
    #Fall 2012
    #Importing.importQuiz(params[:file], 73196,"CS",1181,"Rizki",'Mateen', "Fall",2014, 1)
    #Importing.importQuiz(params[:file], 73069,"CEG",3320,"Doom",'Travis', "Fall",2014, 1)
    
    
    #Fall 2013
    #Importing.importQuiz(params[:file], 73204,"CS",3100,"Chen",'Keke', "Fall",2013, 1)
    #Importing.importQuiz(params[:file], 73196,"CS",1181,"Rizki",'Mateen', "Fall",2013, 1)
    #Importing.importQuiz(params[:file], 73205,"CS",3100,"Buck",'Eric', "Fall",2013, 2)
    #Importing.importQuiz(params[:file], 79901,"CEG",3310,"Raymer",'Michael', "Fall",2013, 1)
    
    #Spring 2013
    #Importing.importQuiz(params[:file], 11256,"CEG",3320,"Doom",'Travis', "Spring",2013, 1)
    #Importing.importQuiz(params[:file], 11250,"CEG",3310,"Raymer",'Michael', "Spring",2013, 1)
    #Importing.importQuiz(params[:file], 10378,"CS",3100,"Chen",'Keke', "Spring",2013, 2)
    #Importing.importQuiz(params[:file], 10358,"CS",1181,"Rizki",'Mateen', "Spring",2013, 1)
    #Importing.importQuiz(params[:file], 10377,"CS",3100,"Buck",'Eric', "Spring",2013, 1)
    #Importing.importQuiz(params[:file], 15393,"CS",1181,"Rizki",'Mateen', "Spring",2013, 90)
    
    #Summer 2013
    #Importing.importQuiz(params[:file], 40973,"CS",1181,"Wlodarski",'Daniel', "Summer", 2013, 1)

    #Spring 2014
    #Importing.importQuiz(params[:file], 11256,"CEG",3320,"Doom",'Travis', "Spring",2014, 1)
    #Importing.importQuiz(params[:file], 11250,"CEG",3310,"Watkins",'Kera', "Spring",2014, 1)
    #Importing.importQuiz(params[:file], 11251,"CEG",3310,"Jean",'Jack', "Spring",2014, 2)
    #Importing.importQuiz(params[:file], 10378,"CS",3100,"Liu",'Meilin', "Spring",2014, 2)
    #Importing.importQuiz(params[:file], 20358,"CS",1181,"Ondrasek",'Michael', "Spring",2014, 1)
    #Importing.importQuiz(params[:file], 10377,"CS",3100,"Liu",'Meilin', "Spring",2014, 1)
    #Importing.importQuiz(params[:file], 15393,"CS",1181,"Ondrasek",'Michael', "Spring",2014, 90)
    #Importing.importQuiz(params[:file], 11265,"CEG",4350,"Chung",'Soon', "Spring",2014, 1)
    
    #Fall 2014
    #Importing.importQuiz(params[:file], 73206,"CS",3180,"Buck",'Erik', "Fall",2014, 1)
    #Importing.importQuiz(params[:file], 73196,"CS",1181,"Ondrasek",'Michael', "Fall",2014, 1)
    #Importing.importQuiz(params[:file], 73204,"CS",3100,"Rizki",'Mateen', "Fall",2014, 1)
    #Importing.importQuiz(params[:file], 79901,"CEG",3310,"Raymer",'Michael', "Fall",2014, 1)
    #Importing.importQuiz(params[:file], 73069,"CEG",3320,"Banerjee",'Tanvi', "Fall",2014, 1)
    #Importing.importQuiz(params[:file], 73073,"CEG", 4110,"Doran",'Derek', "Fall",2014, 1)
    #Importing.importQuiz(params[:file], 73080,"CEG", 4350,"Chung",'Soon', "Fall",2014, 1)
    
    #Summer 2014
    #Importing.importQuiz(params[:file], 40973,"CS",1181,"Wlodarski",'Daniel', "Summer", 2014, 1)
    #Importing.importQuiz(params[:file], 45343,"CEG",3310,"Doom",'Travis', "Summer",2014, 1)
    #Importing.importQuiz(params[:file], 44706,"CS",3100,"Buck",'Eric', "Summer",2014, 1)

    
    render "index"
  end
  
  def loadSlo
    Importing.importSloData(params[:file])
    render "index"
  end
  
  def loadIRreport
    Importing.importing_ir_report(params[:file])
    render "index"
  end
  
  def loadSloCoveredByKt
    Importing.importSloKTData(params[:file])
    render "index"
  end
  
end
