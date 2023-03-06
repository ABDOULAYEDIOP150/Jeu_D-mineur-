


nb_mines <- 40
nb_col <- 20
nb_lig <- 24


plateau <- matrix(0, nb_lig, nb_col)
plateau


mines <- function(plateau, nb_mines) {
  for (i in 1:n_mines) {
    repeat {
      plateau <- sample(1:nb_lig, 1)
      plateau <- sample(1:nb_col, 1)
    }
  }
  return(plateau)