
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




# Fonction pour calculer le nombre de mines adjacentes
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



# Fonction pour afficher le tableau de jeu, sera utile dans la fonction suivante
afficher_plateau <- function(plateau) {
  nb_lig<- nrow(plateau)
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
  
  affichage_plateau <- matrix("-", nrow = nb_lig, ncol = nb_col)
  
  
  while (TRUE) {
    afficher_plateau(affichage_plateau)
    ligne <- as.integer(readline("Entrer le numéro de ligne: "))
    colonne <- as.integer(readline("Entrer le numéro de colonne: "))
    
    
    if (plateau[ligne,colonne] == "-1") {
      print("C'est perdu!")
      break
    } else {
      affichage_plateau[ligne,colonne] <- as.character(plateau[ligne,colonne])
      if (sum(affichage_plateau == "-") == nb_mines) {
        print("C'est gagné!")
        break
      }
    }
  }
}


jouer()

