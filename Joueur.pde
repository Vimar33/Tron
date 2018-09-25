class Joueur {
  float pos_x;
  float pos_y;
  color couleur;
  float dep_x;
  float dep_y;

  // Booléns servant à déterminer la direction du joueur
  boolean UPJ, DOWNJ, LEFTJ, RIGHTJ;

  //Touches attribuées aux joueurs
  char TUPJ, TDOWNJ, TLEFTJ, TRIGHTJ;

  //Constructeur positions du joueur pos_x et pos_y / couleur / touches / deplacement initial
  Joueur(float pos_x, float pos_y, color couleur, char TUPJ, char TDOWNJ, char TLEFTJ, char TRIGHTJ, float dep_x)
  {
    this.pos_x=pos_x;
    this.pos_y=pos_y;
    this.couleur=couleur;
    this.TUPJ=TUPJ;
    this.TDOWNJ=TDOWNJ;
    this.TLEFTJ=TLEFTJ;
    this.TRIGHTJ=TRIGHTJ;
    this.dep_x=dep_x;
  }
  void keyPressed() {
    //touches saises au clavier
    if (key == this.TUPJ) {
      if (!(this.dep_y>0)) { //empêcher le retour en arrière
        this.dep_x=0;
        this.dep_y=-vitessedep; //déplacement J1 vers le haut
      }
    }
    if (key == this.TDOWNJ) {
      if (!(this.dep_y<0)) {
        this.dep_x=0;
        this.dep_y=vitessedep;//déplacement J1 vers le bas
      }
    }
    if (key == this.TRIGHTJ) {
      if (!(this.dep_x<0)) {
        this.dep_x=+vitessedep;//déplacement J1 vers la droite
        this.dep_y=0;
      }
    }
    if (key == this.TLEFTJ) {
      if (!(this.dep_x>0)) {
        this.dep_x=-vitessedep;//déplacement J1 vers la gauche
        this.dep_y=0;
      }
    }
  }
  // fonction pour dessiner le déplacement du joueur
  void dessiner_joueur() {
    noStroke();
    fill(this.couleur);
    rect(this.pos_x, this.pos_y, tailleJ, tailleJ);
  }
// fonction permettant de gérer les déplacements des joueurs
  void deplacement() {
    this.pos_x=this.pos_x+this.dep_x;
    this.pos_y=this.pos_y+this.dep_y;
  }
//fonctions booléennes pour les collisions
  boolean Collision_gauche() {
    return ((dep_x<0) && (get((int)(this.pos_x), (int)(this.pos_y))!=color(0)));
  }
  boolean Collision_droite() {
    return ((dep_x>0) && (get((int)(this.pos_x+tailleJ), (int)(this.pos_y))!=color(0)));
  }
  boolean Collision_haut() {
    return ((dep_y<0) && (get((int)(this.pos_x), (int)(this.pos_y))!=color(0)));
  }
  boolean Collision_bas() {
    return ((dep_y>0) && (get((int)(this.pos_x), (int)(this.pos_y+tailleJ))!=color(0)));
  }
  boolean Collision() {
    return (Collision_gauche() || Collision_droite() || Collision_haut() || Collision_bas());
  }
  
}