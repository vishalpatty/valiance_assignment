setwd("F://Working Directory//Valiance")
data<-read.csv("ps_pharmacist.csv")
str(data)
data[is.na(data)] <- 0 #equating NA to Zero
data
y <- as.list.data.frame(data$Pharamacist.Required)
x <- as.character(data$Category)
#Required no of pharmacist
barplot(y,names.arg = x, col = "Red", xlab = "Required No. of Pharmacists (on 31st March 2016)", 
        main = "State/Union Territory wise no. of Required Pharmacists in PHCs & CHCs in Tribal Areas",
        horiz = T, xlim = c(0,600), las=1, space = 1, border = "Yellow", xpd = F)
#Pharmacist Sanctioned
z<-as.list.data.frame(data$Pharamacist.Sanctioned)
barplot(z,names.arg = x, col = "Blue", xlab = " No. of Pharmacists sanctioned (on 31st March 2016)", 
        main = "State/Union Territory wise no of sanctioned Pharmacists in PHCs & CHCs in Tribal Areas",
        horiz = T, xlim = c(0,700), las=1, space = 1, border = "Red", xpd = F)
w<-as.list.data.frame(data$Pharamacist.In.Position)
barplot(w,names.arg = x, col = "White", xlab = " No. of Pharmacists in Position (on 31st March 2016)", 
        main = "State/Union Territory wise no of working Pharmacists in PHCs & CHCs in Tribal Areas",
        horiz = T, xlim = c(0,600), las=1, space = 1, border = "Blue", xpd = F)
v<-as.list.data.frame(data$Vacant)
barplot(v,names.arg = x, col = "green", xlab = " No. of Pharmacists Vacancy (on 31st March 2016)", 
        main = "State/Union Territory wise no of Pharmacists Vacancies in PHCs & CHCs in Tribal Areas",
        horiz = T, xlim = c(0,160), las=1, space = 1, border = "black", xpd = F)
u<-as.list.data.frame(data$Shortfall)
barplot(u,names.arg = x, col = "black", xlab = " No. of Pharmacists Shortfall(on 31st March 2016)", 
        main = "State/Union Territory wise no of Pharmacists Shortfall in PHCs & CHCs in Tribal Areas",
        horiz = T, xlim = c(0,600), las=1, space = 1, border = "cyan", xpd = F)

No.ofPharmacists<-c(sum(y),sum(w),sum(z),sum(z)-sum(w),sum(y)-sum(w))
Category <- c("Required No. of Pharmacist (R)", "Pharmacists in Position (P)",
     "No. of Sanctioned Pharmacists(S)", "Vacancy(S-P)" ,"Shortfall(R-P)")
#Overall Data
c<-data.frame(Category,No.ofPharmacists)
c
Pie1<-c(c$No.ofPharmacists[2], c$No.ofPharmacists[5])
pie(Pie1, labels = c("Pharmacists in Position", "Shortfall"), 
    main = "Shortfall in total no. of Required Pharmacists")
Pie2<-c(c$No.ofPharmacists[2], c$No.ofPharmacists[4])
pie(Pie2, labels = c("Pharmacists in Position", "Vacancy"), 
    main = "Vacancy in total no. of Sanctioned Pharmacists")