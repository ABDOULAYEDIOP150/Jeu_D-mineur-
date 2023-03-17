
#Données de départ

nb_mines <- 40
nb_col <- 20
nb_lig <- 24



#Création d'un plateau de jeu vide (rempli de O)
plateau <- matrix(0, nb_lig, nb_col)
plateau

positions_mines <- cbind(sample(1:nb_lig, size = nb_mines, replace = TRUE),
                   sample(1:nb_col, size = nb_mines, replace = TRUE))





#position des bombes sur le plateau de jeu

for (i in 1:nb_mines) {
  plateau[positions_mines[i, 1], positions_mines[i, 2]] <-"-1"
}
plateau





#Calcul du nombre de mines adjacentes aux bombes


for (i in 1:nb_lig) {
  for (j in 1:nb_col) {
    if (plateau[i,j] == -1) {
      for (k in max(1, i-1):min(nb_lig, i+1)) {
        for (l in max(1, j-1):min(nb_col, j+1)) {
          if (plateau[k,l] != -1) {
            plateau[k,l] <- plateau[k,l] + 1
          }
        }
      }
    }
  }
}
