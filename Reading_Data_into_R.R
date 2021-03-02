#Reading Data into R

#CSV data

theUrl <- "https://www.jaredlander.com/data/Tomato%20First.csv"
tomato <- read.table (file = theUrl, header = TRUE, sep = ",")

head(tomato)

#stringsAsFactors
#Setting stringsAsFactors to FALSE prevents charactr columns 
#from being converted to factors
x <- 10:1
y <- -4:5
q <- c("Hockey", "Football", "Baseball", "Curling", "Rugby", "Lacrosse",
       "Basketball", "Tennis", "Cricket", "Soccer")
theDF <- data.frame(First=x, Second=y, Sport=q, stringsAsFactors = FALSE)
theDF$Sport

#Excel Data
#the simplest method is to convert it to CSV, then load it into R

#Reading from DataBases

require(RODBC)
db <- odbcConnect("QV Training")

# simple SELECT * query from one table
ordersTable <- sqlQuery(db, "SELECT * FROM Orders",  stringsAsFactors=FALSE)

# simple SELECT * query from one table
detailsTable <- sqlQuery(db, "SELECT * FROM [Order Details]", 
                         stringsAsFActors=FALSE)

#do a join between the two tables
longQuery <- "SELECT * FROM Orders, [Order Details]
              WHERE Orders.OrderID = [Order Details].OrderID"

detailsJoin <- sqlQuery(db, longQuery, stringsAsFactors=FALSE)

head(ordersTable)

odbcClose("QV Training")

#Data from other Statistical Tools
#read.spss    SPSS
#read.dta     Stat
#read.ssd     SAS
#read.octave  Octave
#read.mtp     Minitab
#read.systat  systat

#RData Files
#save the tomato data.frame to disk
save(tomato, file = "data/tomato.rdata")
head(tomato)

#remove tomato from memory
rm(tomato)

#check if it still exists
head(tomato)

#read it from the rdata file
load("data/tomato.rdata")
head(tomato)

#create some objects

n <- 20
r <- 1:10
w <- data.frame(n, r)

#check them out
n
r
w

#save them
save(n, r, w, file = "data/multiple.rdata")

#delete them
rm(n, r, w)
#are they gone
n

#load them back
load("data/multiple.rdata")
#check them out again
n

#Data Included in R
require(ggplot2)
data(diamonds)
head(diamonds)

#Extract Data from Websites

#Simple HTML tables
require(XML)
theUrl <- "http://www.jaredlander.com/2012/02/another-kind-of-super-bowl-pool"

bowlPool <- readHTMLTable(theUrl, which = 1, header = FALSE, 
                          stringsAsFactors = False)
bowlPool

