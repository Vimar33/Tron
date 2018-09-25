//Création des 2 joueurs
Joueur J1 = new Joueur(200, 400, color(255, 0, 0), 'z', 's', 'q', 'd', 2);
Joueur J2 = new Joueur(600, 400, color(0, 255, 0), 'o', 'l', 'k', 'm', -2);

float vitessedep=2;
float tailleJ=5;

void setup() {
  size(800, 800);
  background(0);
}

void draw() {
  //bordure blanche
  strokeWeight(50);
  stroke(255);
  noFill();
  rect(0, 0, width, height);

  //Partie en cours
  if (!((J1.Collision())||((J2.Collision())))) {
    J1.dessiner_joueur();
    J1.keyPressed();
    J1.deplacement();

    J2.dessiner_joueur();
    J2.keyPressed();
    J2.deplacement();
  } 
  //Jeu perdu
  else {
    jeu_perdu();
    noLoop();
  }
}

//Affichage du jeu perdu
void jeu_perdu() {
  strokeWeight(50);
  stroke(255);
  noFill();
  rect(0, 0, width, height);
  textAlign(CENTER);
  textSize(100);
  fill(0, 0, 255);
  text("Game over", width/2, height/2);

//Messages de fin de jeu
  if ((J1.Collision())&&!(J2.Collision())) {
    textSize(50);
    fill(J1.couleur);
    text("Joueur 1 a perdu", width/2, height/2+150);
  } 
  if ((J2.Collision())&&!(J1.Collision())) {
    textSize(50);
    fill(J2.couleur);
    text("Joueur 2 a perdu", width/2, height/2+150);
  }
  if ((J1.Collision())&&(J2.Collision())) {
    textSize(50);
    fill(0, 0, 255);
    text("Match Nul", width/2, height/2+150);
  }
}