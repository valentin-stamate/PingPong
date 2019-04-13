import processing.sound.*;

SoundFile ping;

Integer x = 0;

Platform platform_1;
Platform platform_2;

Ball ball;

int left_score = 0;
int right_score = 0;

void setup(){
  frameRate(60);
  size(600, 400);
  
  ping = new SoundFile(this, "sounds/platform_hit.mp3");
  
  ball = new Ball();
  
  platform_1 = new Platform(10);
  platform_2 = new Platform(width-10);
}

void draw(){
  background(10);
  // this that need to be uodated every time
  platform_1.show();
  platform_2.show();
  ball.show();
  ball.edges();
  ball.update();
  
  //ball interaction
    // left platform
  if(ball.x - 6 <= platform_1.x + 6 &&
              ball.y<=platform_1.y+75&&
              ball.y>=platform_1.y-75){
    // this is how the ball angle is after hitting the platform
    //search "pong angle segments"
    
    //math and logic stuff here
    float dif = ball.y - (platform_1.y - platform_1.plat_h/2);
    float angle = map(dif, 0, platform_1.plat_h, -PI/4 , PI/4);
    // 10 for speed , you can increse it or decrease it
    // for hardcore ones 0.1 is the best
    ball.xspeed = 10 * cos(angle);
    ball.yspeed = 10 * sin(angle);
    
    ping.play();
    //ball.xspeed*=-1; //old fashion
  }
    //right platform
  if(ball.x + 6 >= platform_2.x - 6 &&
              ball.y<=platform_2.y+75&&
              ball.y>=platform_2.y-75){
    // this is how the ball angle is after hitting the platform
    //search "pong angle segments"
    
    
    //math and logic stuff here
    float dif = ball.y - (platform_2.y - platform_2.plat_h/2);
    //somehow i managed to solve the problem with that "-at cos()" and those values --PI/4, PI/4
    float angle = map(dif, 0, platform_2.plat_h, -PI/4, PI/4);
    // 10 for speed , you can increse it or decrease it
    // for hardcore ones 0.1 is the best
    ball.xspeed = -10 * cos(angle);
    ball.yspeed = 10 * sin(angle);
    
    ping.play();
    //ball.xspeed*=-1; //old fashion
    
  }
  
  // showing score;
  fill(255);
  textSize(13);
  text(left_score, 100, 20);
  text(right_score, width - 100, 20);
  
}

void keyReleased(){
  platform_1.stopMove();
  platform_2.stopMove();
}
// controls
void keyPressed(){
  
  if(key=='w') platform_1.move(-15);
  if(key=='s') platform_1.move(15); 
  if(keyCode==UP) platform_2.move(-15);
  if(keyCode==DOWN) platform_2.move(15);
}
