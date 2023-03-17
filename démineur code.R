


nb_mines <- 40
nb_col <- 20
nb_lig <- 24


plateau <- matrix(0, nb_lig, nb_col)
plateau

positions_mines <- cbind(sample(1:nb_lig, size = nb_mines, replace = TRUE),
                   sample(1:nb_col, size = nb_mines, replace = TRUE))



#position des bombes sur le plateau de jeu

for (i in 1:nb_mines) {
  plateau[positions_mines[i, 1], positions_mines[i, 2]] <-"X"
}
plateau

