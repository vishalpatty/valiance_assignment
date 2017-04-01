library(shiny)
dta<-read.csv("ps_pharmacist.csv")
dta<-dta[,-(8:9)]
dta[is.na(dta)] <- 0 #equating NA to Zero
x <- as.character(dta$Category)
y <- as.list.data.frame(dta$Pharamacist.Required)
z<-as.list.data.frame(dta$Pharamacist.Sanctioned)
w<-as.list.data.frame(dta$Pharamacist.In.Position)
v<-as.list.data.frame(dta$Vacant)
u<-as.list.data.frame(dta$Shortfall)
No.ofPharmacists<-c(sum(y),sum(w),sum(z),sum(z)-sum(w),sum(y)-sum(w))
Category <- c("Required No. of Pharmacist (R)", "Pharmacists in Position (P)",
              "No. of Sanctioned Pharmacists(S)", "Vacancy(S-P)" ,"Shortfall(R-P)")
#Overall Data
c<-data.frame(Category,No.ofPharmacists)
c
Pie1<-c(c$No.ofPharmacists[2], c$No.ofPharmacists[5])
Pie2<-c(c$No.ofPharmacists[2], c$No.ofPharmacists[4])



shinyServer(
  function(input,output){
    output$smr<-renderPrint({
      summary(dta)
    })
    output$str<-renderPrint({
      str(dta)
    })
    output$data<-renderPrint({
      print(dta)
    })
    output$req<-renderPlot({
    if (input$visualisation1==0){
        NULL
      }
    else if (input$visualisation1==1){
        barplot(y,names.arg = x, col = input$color, 
                xlab = "Required No. of Pharmacists (on 31st March 2016)", 
                main = "State/Union Territory wise no. of Required Pharmacists in PHCs 
                & CHCs in Tribal Areas", horiz = T, xlim = c(0,600), las=1, space = 1,
                border = "Yellow", xpd = F)
      }
    else if (input$visualisation1==2)
    {
        barplot(z,names.arg = x, col = input$color, 
                xlab = " No. of Pharmacists sanctioned (on 31st March 2016)", 
                main = "State/Union Territory wise no of sanctioned Pharmacists in PHCs 
                & CHCs in Tribal Areas", horiz = T, xlim = c(0,700), las=1, 
                space = 1, border = "Red", xpd = F)
      }
    else if (input$visualisation1==3)
    {
        barplot(w,names.arg = x, col = input$color, 
              xlab = " No. of Pharmacists in Position (on 31st March 2016)", 
              main = "State/Union Territory wise no of working Pharmacists in PHCs 
              & CHCs in Tribal Areas", horiz = T, xlim = c(0,600), las=1, 
              space = 1, border = "Blue", xpd = F)
      }
    else if (input$visualisation1==4)
    {
        barplot(v,names.arg = x, col = input$color, 
                xlab = " No. of Pharmacists Vacancy (on 31st March 2016)", 
                main = "State/Union Territory wise no of Pharmacists Vacancies in PHCs & CHCs in Tribal
                Areas", horiz = T, xlim = c(0,160), las=1, space = 1, border = "black", xpd = F)
      }
    else if (input$visualisation1==5)
    {
        barplot(u,names.arg = x, col = input$color, 
                xlab = " No. of Pharmacists Shortfall(on 31st March 2016)", 
                main = "State/Union Territory wise no of Pharmacists Shortfall in PHCs & CHCs in Tribal 
                Areas", horiz = T, xlim = c(0,600), las=1, space = 1, border = "cyan", xpd = F)
      }
      else if (input$visualisation1==6)
      {
        pie(Pie2, labels = c("Pharmacists in Position", "Vacancy"), 
            col=c(input$color, "Magenta"),
            main = "Vacancy in total no. of Sanctioned Pharmacists")
      }
      else if (input$visualisation1==7)
      {
        pie(Pie1, labels = c("Pharmacists in Position", "Shortfall"), 
            col=c(input$color, "Pink"), 
            main = "Shortfall in total no. of Required Pharmacists")
      }
      
    })
  }
)