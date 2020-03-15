import ddf.minim.*; //the sound file is imported from minim
Minim minim;
AudioSample rain1; //the sound file named 'rain1' is created

void setup(){
  size(1200, 800); //the size of my project
  //fullScreen();
   background(random(255), random(255), random(255));
  smooth();
  noStroke();
  generateSkyline();
  minim = new Minim(this);
  rain1 = minim.loadSample("rain1.wav"); //the sound file 'rain1' is declared and told to load the sound file. 
}
void draw(){
  if(mousePressed){
    generateSkyline(); //when the mouse is pressed, the skyline is then generated. 
     rain1.trigger();
  }
  }