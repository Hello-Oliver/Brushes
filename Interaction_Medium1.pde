//General setting
int state = 0;
boolean triger = false;
float guideRoundR = 140;
float guideRoundr = 120;
//Guide text font
PFont f;  

//chinese ink feel
float speed;
boolean showInstruction1;

//Particle Growth
ArrayList<Particle> pts;
boolean onPressed;
boolean showInstruction2;

char cs = 'r';
color csr;
color csg;
color csb;

//Chinese Brush
float inkRoundR = 70;
float inkRoundr = 50;

int fontColor = #82806d;
int strokeColor = 0;
int alpha = 100;
int maxBrushWidth =1000;
boolean showInstruction3;
boolean pausing;
int brushWidth=1;
float sw = brushWidth;  //originally 0



void setup() {
//General setting
  size(720, 540);
  //white background
  background(241, 245, 242); 
  f = createFont("Calibri", 24, true);
  showInstruction1 = true;
  showInstruction2 = true;
  showInstruction3 = true;
  
  //Particle Growth
  pts = new ArrayList<Particle>();
  
  //Chinese Brush
  pausing = false;
  
}

void draw() {
  
  //print(frameCount);
  if (state == 0) { 
    drawZero();
  } 
  
  else if (state == 1) {
    drawOne();
  } 
  
  else if (state == 2) {
    drawTwo();
  } 
  
  else if (state == 3) {
    drawThree();
  }
  
  else if (state == 4) {
    drawFour();
  }
  
}

void mousePressed() {
  //General setting
  if (state == 0) {
    
    if (dist(mouseX, mouseY, 180, 180)<guideRoundr/2) {
      state = 1;
    }
    
    if (dist(mouseX, mouseY, 360, 180)<guideRoundr/2) {
      state = 2;
    }
    
    if (dist(mouseX, mouseY, 540, 180)<guideRoundr/2) {
      state = 3;
    }
    
    if (dist(mouseX, mouseY, 640, 90)<guideRoundr/4) {
      state = 4;
    }
  }
  
  if (state == 3) {
    
    if (dist(mouseX, mouseY, 90, 90) < inkRoundr/2) {
      alpha = 100;
    }
    
  }
  
  //Particle Growth
  onPressed = true;
  
  //Chinese Brush
  pausing = true;
  //alpha = 100;
  
}

void mouseReleased() {
  //Particle growth
  onPressed = false;
  
  //Chinese Brush
  strokeColor = 0;
  
}

void mouseDragged(){
  //Chinese Brush
  pausing = false;

}

void keyPressed() {
  //General Setting
  //if (showInstruction1) {
  //  background(255);
  //  showInstruction1 = false;
  //}
  
  //if (showInstruction2) {
  //  background(255);
  //  showInstruction2 = false;
  //}
  
  //if (showInstruction3) {
  //  background(255);
  //  showInstruction3 = false;
  //}
  
  //Particle Growth
  if (key == 'c') {
    
    for (int i=pts.size()-1; i>-1; i--) {
      pts.remove(i);
    }
    
    background(255);
    
  }
  
  //Chinese Brush
  pausing = true;
  alpha = 100;
  
}

void drawZero() {
  
  //print("initial state 0");
  background(241, 245, 242);

  // button 1
  fill(244, 131, 108); 
  noStroke();
  ellipse(180, 180, guideRoundR, guideRoundR);
  fill(255, 0, 0); 
  noStroke();
  ellipse(180, 180, guideRoundr, guideRoundr);
  textAlign(CENTER);
  textFont(f);
  textSize(15);
  fill(0, 0, 0);
  text("Chinese Ink Feel", 180, 185);
  
  // button 2
  fill(244, 131, 108); 
  noStroke();
  ellipse(360, 180, guideRoundR, guideRoundR);
  fill(255, 0, 0); 
  noStroke();
  ellipse(360, 180, guideRoundr, guideRoundr);
  textAlign(CENTER);
  textFont(f);
  textSize(15);
  fill(0, 0, 0);
  text("Blue Free Growth", 360, 185);

  // button 3
  fill(244, 131, 108); 
  noStroke();
  ellipse(540, 180, guideRoundR, guideRoundR);
  fill(255, 0, 0); 
  noStroke();
  ellipse(540, 180, guideRoundr, guideRoundr);
  textAlign(CENTER);
  textFont(f);
  textSize(15);
  fill(0, 0, 0);
  text("Chinese Brush", 540, 185);
  
  // button 4
  fill(244, 131, 108); 
  noStroke();
  ellipse(640, 90, guideRoundR/2, guideRoundR/2);
  fill(255, 0, 0); 
  noStroke();
  ellipse(640, 90, guideRoundr/2, guideRoundr/2);
  textAlign(CENTER);
  textFont(f);
  textSize(15);
  fill(0, 0, 0);
  text("Info", 640, 95);
  
  //Text information 
  fill(128);
  textAlign(CENTER, CENTER);
  textFont(f);
  textLeading(36);
  textSize(20);
  text("Click on one button to get inside of the corresponding drawing paper ." + 
    "\n" +
    "Try drag and click on the paper." + 
    "\n" +
    "Press 'c' to clear the stage." + 
    "\n" +
    "Press 'q' to go to the guide stage." + 
    "\n"
    , width*0.5, height*0.5 + 100);
}

void drawOne() {
  
  //print("ink state 1");
  if (triger == false) {
    background(241, 245, 242);
    triger = true;
  }
  
  if(keyPressed) {
    
    if (showInstruction1) {
      background(255);
      showInstruction1 = false;
    }
  
  }

  if (keyPressed) {
    
    if (key == 'c' || key == 'C') {
      triger = false;
    }
    
  }

  if (keyPressed) {
    
    if (key == 'q' || key == 'Q') {
      state = 0;
      triger = false;
      showInstruction1 = true;
    }
    
  }
  
  if (showInstruction1) {
    
    background(255);
    fill(128);
    textAlign(CENTER, CENTER);
    textFont(f);
    textLeading(36);
    text("Keep the paper clean and" + "\n" + 
    "Press any key to start" + "\n" +
    "Left click to create random-colored rectangulars." + "\n" +
    "right click to create a series of random-colored rounds." + "\n" +
    "Press 'c' to clear the stage." + "\n" +
    "Press 'q' to go to the guide stage." + "\n"
      , width*0.5, height*0.5);
      
  }

  speed=abs(mouseX*1.15-pmouseX);
  println(speed);
  smooth();
  noStroke();
  float first_ellipse=speed;

  if (!mousePressed) {
    fill (10, 10, 10, 10);
    ellipse (mouseX, mouseY, first_ellipse, first_ellipse);
  };

  if (mousePressed && (mouseButton == RIGHT)) {
    fill(random(225), 50, random(150), random(150 ));
    ellipse(mouseX+random(-40, 40), mouseY+random(-40, 40), first_ellipse, first_ellipse);
  }
  noStroke();
  
  if(mousePressed){
      
    if(abs(pmouseX - mouseX) + abs(pmouseY - mouseY)  < 5){
      polish();
    }
  
  }


  //if (keyPressed) {
  //  background(200) ;
  //}

  if (mousePressed && (mouseButton == LEFT)) {
    stroke (10) ;
    fill(random(150), 50, random(250), 25);

    noStroke ();
    rect (360, 270, mouseX - 360, mouseY - 270) ;
  }
}

void drawTwo() {
  
  //print("growth state 2");
  if (triger == false) {
    background(241, 245, 242);
    triger = true;
  }
  
  if (keyPressed) {

    if (showInstruction2) {
      background(255);
      showInstruction2 = false;
    }

  }

  if (keyPressed) {
    
    if (key == 'c' || key == 'C') {
      triger = false;
    }
    
  }

  if (keyPressed) {
    
    if (key == 'q' || key == 'Q') {
      state = 0;
      triger = false;
      showInstruction2 = true;
    }
    
  }

  if (showInstruction2) {
    
    background(255);
    fill(128);
    textAlign(CENTER, CENTER);
    textFont(f);
    textLeading(36);
    text("Keep the paper clean and" + "\n" + 
    "Press any key to start" + "\n" +
    "Click and drag to draw." + "\n" +
    "Press 'c' to clear the stage." + "\n" +
    "Press 'q' to go to the guide stage." + "\n"
      , width*0.5, height*0.5);
      
  }

  //Change the color style of the particles
  //csb = color(random(255), random(255), 255);
  //csr = color(255, random(255), random(255));
  //csg = color(random(255), 255, random(255));  
    
  if (keyPressed) {
    
    if (key == 'r') {
      
      //state = 0;
      //triger = false;
      cs = 'r';
      
    }
    
    else if(key == 'g'){
      
      cs = 'g';
      
    }
    
    else if(key == 'b'){
      
      //blue style
      cs = 'b';
      
    }
  }
  
  
  if (onPressed) {
    
    for (int i=0; i<10; i++) {
      Particle newP = new Particle(mouseX, mouseY, i+pts.size(), i+pts.size(), cs);
      pts.add(newP);
    }
    
  }

  for (int i=0; i<pts.size(); i++) {
    
    Particle p = pts.get(i);
    p.update();
    p.display();
    
  }

  for (int i=pts.size()-1; i>-1; i--) {
    
    Particle p = pts.get(i);
    
    if (p.dead) {
      pts.remove(i);
    }
    
  }
}


float brushStroke(){
  float speed = (abs(mouseX-pmouseX) + abs(mouseY-pmouseY))/10; //originally /5
  speed = constrain(speed, 1, brushWidth);
  speed *= -1;
  sw += speed + 3;
  sw = constrain(sw, 2 , 25);
  return sw;
}

void polish(){

        noStroke();
        fill(165,100);
        if(round(random(1)) == 1){
          ellipse(mouseX + random(-40 , 40), 
                  mouseY + random(-40 , 40),
                  70 + random(20),
                  70 + random(20));       
        }
        noStroke();
        fill(175,100);
        if(round(random(1)) == 1){
           ellipse(mouseX + random(-40 , 40), 
                  mouseY + random(-40 , 40),
                  70 + random(20),
                  70 + random(20));  
        }
        noStroke();
        fill(185,100);
        if(round(random(1)) == 1){
          ellipse(mouseX + random(-10 , 10), 
                  mouseY + random(-10 , 10),
                  40 + random(20),
                  40 + random(20));      
        }
        noStroke();
        fill(195,100);
        if(round(random(1)) == 1){
             ellipse(mouseX + random(-40 , 40), 
                  mouseY + random(-40 , 40),
                  70 + random(20),
                  70 + random(20));      
        }
        noStroke();
        fill(215,100);
        if(round(random(1)) == 1){
             ellipse(mouseX + random(-40 , 40), 
                  mouseY + random(-40 , 40),
                  70 + random(20),
                  70 + random(20));       
        }
        noStroke();
        fill(205,100);
        if(round(random(1)) == 1){
         ellipse(mouseX + random(-40 , 40), 
                  mouseY + random(-40 , 40),
                  70 + random(20),
                  70 + random(20));        
        }
        noStroke();
        fill(205,100);
        if(round(random(1)) == 1){
         ellipse(mouseX + random(-40 , 40), 
                  mouseY + random(-40 , 40),
                  70 + random(20),
                  70 + random(20));     
        }
        noStroke();
        fill(205,100);
        if(round(random(1)) == 1){
           ellipse(mouseX + random(-40 , 40), 
                  mouseY + random(-40 , 40),
                  70 + random(20),
                  70 + random(20));      
        }
  
}


void drawThree(){
  //print("information state 3");

  if (triger == false) {
    background(241, 245, 242);
    triger = true;
    
  }
  
  if (keyPressed) {

    if (showInstruction3) {
      background(255);
      showInstruction3 = false;
    }
  
  }

  if (keyPressed) {
    
    if (key == 'q' || key == 'Q') {
      state = 0;
      triger = false;
      showInstruction3 = true;
    }
    
  } 
  
  if (keyPressed) {
    
    if (key == 'c' || key == 'C') {
      triger = false;
      brushWidth = 1;
      alpha = 100;
    }
    
  }
  
  if (showInstruction3) {
    background(241, 245, 242);
    fill(fontColor);
    textAlign(CENTER, CENTER);
    textSize(15);
    text("Keep the paper clean and" + "\n" + 
    "Press any key to start" + "\n" +
    "Drag and write"+"\n"+
    "the width of writing will change with your drag speed"
      ,width*0.5, height*0.4);
    text("press 'c' to clear"+ "\n" + 
    "Press 'q' to go to the guide stage." + "\n"
      , width*0.5, height*0.8);
    }
    
  else{
  
    //ink field
    fill(80, 80, 80); 
    noStroke();
    ellipse(90, 90, inkRoundR, inkRoundR);
    fill(0, 0, 0); 
    noStroke();
    ellipse(90, 90, inkRoundr, inkRoundr);
    textAlign(CENTER);
    textFont(f);
    textSize(15);
    fill(0, 0, 0);
    text("Ink", 100, 100);
  
  }  
  
    
  strokeWeight(brushWidth);
  //colorMode(RGB, 0, 0, 0, 100);
  
  if (mousePressed == true) {
    if (pausing == true){
    // start - while pressing AND not moving - grow ink
        if (brushWidth < maxBrushWidth) {
          brushWidth += 1;
        }
        noStroke();
        fill(strokeColor);
        ellipse(mouseX, mouseY,brushWidth/4 ,brushWidth/4);
    }
        

    else { 
      //drawing
      // while the drawing is progressing - lower alpha of stroke
      // improvement - and add (up alpha on) stripes, 
      //ie dry brush
      strokeWeight(brushStroke()); 
      // change width according to speed of stroke
      stroke(strokeColor,alpha);

      line(mouseX, mouseY, pmouseX, pmouseY);
      

      
      //gradient
      if (alpha > 1){ 
        // disable option of no line at all
        alpha-=1;
      }
      
    }
  }
  

}



void drawFour() {
  //print("information state 4");

  if (triger == false) {
    background(241, 245, 242);
    triger = true;
    
  }

  if (keyPressed) {
    if (key == 'q' || key == 'Q') {
      state = 0;
      triger = false;
    }
  } 

  fill(128);
  textAlign(CENTER, CENTER);
  textFont(f);
  textLeading(36);
  textSize(20);
  text("Get idea from processing source website." + "\n" +
    "Chinese Ink Feel uses diffrent kinds of input of mouse to get a better interaction." + "\n" +
    "Blue Free Growth imports a class named 'Particle' from the open source website." + "\n" +
    "Press 'q' to go to the guide stage." + "\n"
    , width*0.5, height*0.5 + 100);
}




class Particle {
  PVector loc, vel, acc;
  int lifeSpan, passedLife;
  boolean dead;
  float alpha, weight, weightRange, decay, xOffset, yOffset;
  color c;

  Particle(float x, float y, float xOffset, float yOffset, char rgb) {
    loc = new PVector(x, y);

    float randDegrees = random(360);
    vel = new PVector(cos(radians(randDegrees)), sin(radians(randDegrees)));
    vel.mult(random(5));

    acc = new PVector(0, 0);
    lifeSpan = int(random(30, 90));
    decay = random(0.75, 0.9);
    
    if(rgb == 'r'){
      c = color(255, random(255), random(255));
    }
    else if(rgb == 'g'){
      c = color(random(255), 255, random(255));
    }
    else if(rgb == 'b'){
      c = color(random(255), random(255), 255);
    }
    //c = color(random(255), random(255), 255);
    //c = color(255, random(255), random(255));
    //c = color(random(255), 255, random(255));
    
    weightRange = random(3, 50);

    this.xOffset = xOffset;
    this.yOffset = yOffset;
  }

  void update() {
    if (passedLife>=lifeSpan) {
      dead = true;
    } else {
      passedLife++;
    }

    alpha = float(lifeSpan-passedLife)/lifeSpan * 70+50;
    weight = float(lifeSpan-passedLife)/lifeSpan * weightRange;

    acc.set(0, 0);

    float rn = (noise((loc.x+frameCount+xOffset)*0.01, (loc.y+frameCount+yOffset)*0.01)-0.5)*4*PI;
    float mag = noise((loc.y+frameCount)*0.01, (loc.x+frameCount)*0.01);
    PVector dir = new PVector(cos(rn), sin(rn));
    acc.add(dir);
    acc.mult(mag);

    float randDegrees = random(360);
    PVector randV = new PVector(cos(radians(randDegrees)), sin(radians(randDegrees)));
    randV.mult(0.5);
    acc.add(randV);

    vel.add(acc);
    vel.mult(decay);
    vel.limit(3);
    loc.add(vel);
  }

  void display() {
  
    strokeWeight(weight+1.5);
    stroke(0, alpha);
    point(loc.x, loc.y);

    strokeWeight(weight);
    stroke(c);
    point(loc.x, loc.y);
  }
}


class Particle_triangle {
  float l = 3;
  PVector loc, vel, acc;
  int lifeSpan, passedLife;
  boolean dead;
  float alpha, weight, weightRange, decay, xOffset, yOffset;
  float dx, dy;
  color c;

  Particle_triangle(float x, float y, float xOffset, float yOffset, char rgb) {
    loc = new PVector(x, y);

    float randDegrees = random(360);
    vel = new PVector(cos(radians(randDegrees)), sin(radians(randDegrees)));
    vel.mult(random(5));

    acc = new PVector(0, 0);
    lifeSpan = int(random(30, 90));
    decay = random(0.75, 0.9);
    
    if(rgb == 'r'){
      c = color(255, random(255), random(255));
    }
    else if(rgb == 'g'){
      c = color(random(255), 255, random(255));
    }
    else if(rgb == 'b'){
      c = color(random(255), random(255), 255);
    }
    //c = color(random(255), random(255), 255);
    //c = color(255, random(255), random(255));
    //c = color(random(255), 255, random(255));
    
    weightRange = random(3, 50);

    this.xOffset = xOffset;
    this.yOffset = yOffset;
  }

  void update() {
    if (passedLife>=lifeSpan) {
      dead = true;
    } else {
      passedLife++;
    }

    alpha = float(lifeSpan-passedLife)/lifeSpan * 70+50;
    weight = float(lifeSpan-passedLife)/lifeSpan * weightRange;

    acc.set(0, 0);

    float rn = (noise((loc.x+frameCount+xOffset)*0.01, (loc.y+frameCount+yOffset)*0.01)-0.5)*4*PI;
    float mag = noise((loc.y+frameCount)*0.01, (loc.x+frameCount)*0.01);
    PVector dir = new PVector(cos(rn), sin(rn));
    acc.add(dir);
    acc.mult(mag);

    float randDegrees = random(360);
    PVector randV = new PVector(cos(radians(randDegrees)), sin(radians(randDegrees)));
    randV.mult(0.5);
    acc.add(randV);

    vel.add(acc);
    vel.mult(decay);
    vel.limit(3);
    loc.add(vel);
  }

  void display() {
 
    strokeWeight(weight+1.5);
    stroke(0, alpha);
    fill(c);
    dx = l * vel.x /sqrt(sq(vel.x) + sq(vel.y)); 
    dy = l * vel.y /sqrt(sq(vel.x) + sq(vel.y));
    triangle(loc.x + dx, loc.y + dy,
             loc.x - dx/2 + dy/2, loc.y - dy/2 + dx/2,
             loc.x - dx/2 - dy/2, loc.y - dy/2 - dx/2);
    

    strokeWeight(weight);
    stroke(c);
    fill(c);
    triangle(loc.x + dx, loc.y + dy,
             loc.x - dx/2 + dy/2, loc.y - dy/2 + dx/2,
             loc.x - dx/2 - dy/2, loc.y - dy/2 - dx/2);
  }
}
