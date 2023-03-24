# Jeu du Démineur

Le but du projet est de créer une bibilothèque R incluant une application Shiny permettant de jouer au Démineur.

# Règles du jeu

Le jeu consiste à localiser des mines cachées dans un champs virtuel avec pour seule indication le nombres de mines dans les zones adjacentes. Le champs de mine est représenté par un grille.

Chaque case de la grille peut soit cacher une une mine, soit être vide. Le but du jeu est de découvrir toutes les cases vides sans faire exploser les mines.

De plus, lorsque le joueur choisis une case libre et que toutes les cases adjacentes le sont aussi, une case vide est affichée. Sinon au moins une des cases voisines contient une mine et un chiffre apparaît, indiquant le nombre de cases adjacentes contenant une mine.

Ainisi, le joueur peut progresser dans le déminage du terrain. S'il se trompe et choisis une case contenant une mine, il a perdu.


# Membres du groupe

Abdoulaye Diop : abdoulaye.diop03@etu.umontpellier.fr

Emma Sinibaldi : emma.sinibaldi@etu.umontpellier.fr
