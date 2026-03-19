# TestMoodleR
Function to create and validate questions for Moodle tests in R.

### How to ?

You can download the file  "Function moodle test.R" and run the code to add the function to your environment. 

The function has different arguments: 

- num: the question number
- Qname: the question name
- Qtext: the question text. Here, feel free to add html code to include URLs and other dynamic text functions!
- QrepCat: a vector that precise the response category
- QrepCorrect: a value, or vector, indicating the correct answers. Note that if more than one answer are correct, the question is automatically multiple choice.

The function then returns a character variable that is compatible with the moodle .gift import option.

Working exemple: 

```{r}

## For one question
num <- 1
Qname <- "First question"
Qtext <- "For this question, please select the letter A"
QrepCat <- c("A",
             "B",
             "C", 
             "D",
             "E",
             "F",
             "G",
             "H", 
             "I",
             "J")
QrepCorrect <- "A"


oneQ <- createQ(num=num, Qname = Qname, Qtext = Qtext, QrepCat = QrepCat, QrepCorrect = QrepCorrect)

cat(oneQ)




## But also possible to loop it over multiple instance to import many questions at once:
num <- c(1:10) 
Qname <- paste0("Q", 1:10)
Qtext <- paste0("For this question, please select the letter ", c("A",
                                                                 "B",
                                                                 "C", 
                                                                 "D",
                                                                 "E",
                                                                 "F",
                                                                 "G",
                                                                 "H", 
                                                                 "I",
                                                                 "J"))
QrepCat <- c("A",
             "B",
             "C", 
             "D",
             "E",
             "F",
             "G",
             "H", 
             "I",
             "J")
QrepCorrect <- c("A",
                 "B",
                 "C", 
                 "D",
                 "E",
                 "F",
                 "G",
                 "H", 
                 "I",
                 "J")


for (i in 1:10) {
  if (i==1) {
    Q_all <- createQ(num=num[i], Qname = Qname[i], Qtext = Qtext[i], QrepCat = QrepCat, QrepCorrect = QrepCorrect[i])
  } else {
    Q <- createQ(num=num[i], Qname = Qname[i], Qtext = Qtext[i], QrepCat = QrepCat, QrepCorrect = QrepCorrect[i])
    
    Q_all <- paste(Q_all, Q, sep = "\n\n")
  }
  
}

cat(Q_all)

```
