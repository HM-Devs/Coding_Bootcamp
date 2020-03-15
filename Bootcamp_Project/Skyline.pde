color sky = color(random(255)); //the colour of the sky is set as random.
color outline = color(0); //the outline of each building is set at 0 (black), so the image result is much clearer.
float sunX = -(width / 2), sunY = -(height / 2); 

void drawSkyline(float groundLevel, float minLength, float maxLength, 
      float minHeight, float maxHeight, float swellX, float swellAmount,
      float layer){ //designated variable names.
        
  color buildingColor = color(random(255), random(255), random(255)); //the colour of each building in the sketch changes constantly, as each value is set to be random.      
  fill(buildingColor);
  float x = 0, y = groundLevel;
  rect(0, groundLevel, width, height - groundLevel);
  while(x < width){ //when x is less than the width of the sketch..
    fill(buildingColor); //the building is filled in the correct colour.
    float bLength = random(minLength, maxLength); //the length of the buildings are allocated.
    float bHeight = (maxHeight - minHeight) * noise(x) + minHeight;
    float swellOffset = swellAmount - abs(x - swellX) / 4;
    bHeight += swellOffset;
    rect(x, groundLevel - bHeight, bLength + 1, bHeight + groundLevel); //the position of the buildings are made clear.
    fill(outline); //the outline of the building is now filled in.
    if(y < bHeight){
      float sideHeight = bHeight - y;
      rect(x - 2, groundLevel - bHeight, bLength / 10 + random(2), 
            sideHeight);  //if variables are used to designate a shape.
    }
    x += bLength;
    y = bHeight;
  }
}
void drawSun(float x, float y){
  for(int i = 1; i < 70; i++){
    fill(outline, 3);
    ellipse(x, y, i * (height/16), i * (height/16));
  }
}
void generateSkyline(){
  background(random(255), random(255), random(255));
  for(int i = 0; i < 4; i++){
    float ground = height/3 + (i + 1) * i * (height/12);
    float widthMin = 5 + i * 3;
    float widthMax = (i + 1) * 20;
    float heightMin = i * 10;
    float heightMax = (i + 1) * (height/6);
    float sX = random(width / 2, width);
    float sA = height/6 + i * (height/12);
    drawSkyline(ground, widthMin, widthMax, heightMin, heightMax, sX, sA, (i + 1)/2);
  }
  drawSun(sunX, sunY);
}