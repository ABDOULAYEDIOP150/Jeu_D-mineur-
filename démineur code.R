
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




# Fonction pour calculer le nombre de mines adjacentes à une case sans bombe
calculer_mines_adjacentes <- function(plateau, i, j) {
  nb_mines_adjacentes <- 0
  for (k in (i-1):(i+1)) {
    for (l in (j-1):(j+1)) {
      if (k >= 1 & k <= nrow(plateau) & l >= 1 & l <= ncol(plateau)) {
        if (plateau[k,l] == -1) {
          nb_mines_adjacentes <- nb_mines_adjacentes + 1
        }
      }
    }
  }
  return(nb_mines_adjacentes)
}

#calculer_mines_adjacentes(plateau,7,4)
#calculer_mines_adjacentes(plateau,2,5)




# Fonction pour afficher le tableau de jeu
afficher_plateau <- function(plateau) {
  nb_lig <- nrow(plateau)
  nb_col <- ncol(plateau)
  for (i in 1:nb_lig) {
    for (j in 1:nb_col) {
      if (plateau[i, j] == -1) {
        cat("* ")
      } else {
        cat(plateau[i, j], " ")
      }
    }
    cat("\n")
  }
}








# Fonction pour jouer une partie 

jouer <- function() {
  
  affichage_plateau <- matrix("-", nb_lig, nb_col)
  nb_lig <- nrow(plateau)
  nb_col <- ncol(plateau)
  game_over <- FALSE
  
  while (!game_over) {
    afficher_plateau(plateau)
    i <- as.integer(readline("Entrer le numéro de ligne: "))
    j <- as.integer(readline("Entrer le numéro de colonne: "))
    
    
    if (plateau[i,j] == "-1") {
      cat("C'est perdu!\n")
      plateau[plateau == -1] <- "*"
      afficher_plateau(plateau)
      game_over <- TRUE
    } else {
      plateau[i, j] <- calculer_mines_adjacentes(plateau, i, j) 
      if (all(plateau[plateau != -1] != 0)) {
        cat("C'est gagné!\n")
        afficher_plateau(plateau)
        game_over <- TRUE
      }
    }
  }
}


jouer()

