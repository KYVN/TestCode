int cols, rows;
int scl = 20;
int w = 2000;
int h = 2000;

float[][] terrain;

float glide = 0.0;
float sway = 0.0;
float offsetBasic = 0.065;

void setup() {
  size(displayWidth, displayHeight, P3D);
  cols = w/scl;
  rows = h/scl;
  terrain = new float[cols][rows];
}

void draw() {
  terrain();
  controls();
}

void controls(){
 // if (keyPressed) {
   // if (keyCode == UP) {
      glide -= offsetBasic;
  //  } else if (keyCode == DOWN) {
  //    glide += offsetBasic ;
  //  } else if (keyCode == LEFT) {
  //    sway -= offsetBasic;
  //  } else if (keyCode == RIGHT) {
  //    sway += offsetBasic ;
  //  } 
  //} else {
  //}
}

void terrain() {
  float yoff = glide;
  for (int y = 0; y < rows; y++) {
    float xoff = sway;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff +=0.065;
    }
    yoff+=0.065;
  }
  background(0);
  stroke(0);
  fill(255);
  translate(width/2, height/2);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    endShape();
  }
}
