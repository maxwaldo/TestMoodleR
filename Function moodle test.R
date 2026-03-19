
createQ <- function(num, Qname, Qtext, QrepCat, QrepCorrect) {
  
  topText <- paste0("// question: ", num, " name: ", Qname)
  
  corrAnswer <- which(QrepCat %in% QrepCorrect)
  
  if (length(corrAnswer)<1) {
    print(paste0("No correct answer for ", Qname))
  }
  
  if (length(corrAnswer)>1) {
    textAnswer <- rep("  ~%-100%", length(QrepCat))
    
    percentCorr <- rep(round(100/length(corrAnswer), 5), length(corrAnswer))
    
    percentCorr[length(percentCorr)] <- 100 - sum(percentCorr[-length(percentCorr)])
    
    percentCorrAnswer <- paste0("  ~%", percentCorr, "%")
    
    textAnswer[corrAnswer] <- percentCorrAnswer
    
    textAnswer <- paste0(textAnswer, "<p>", QrepCat, "</p>")
  } else {
    textAnswer <- rep("  ~", length(QrepCat))
    textAnswer[corrAnswer] <- "  ="
    
    textAnswer <- paste0(textAnswer, "<p>", QrepCat, "</p>")
    
  }
  
  textQuestion <- paste(topText, paste0("::",Qname, "::",Qtext,"{"),
                        paste(textAnswer, collapse = "\n"),
                        "}",
                        sep = "\n")
  
  return(textQuestion)
}

