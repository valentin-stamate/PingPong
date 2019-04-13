class Ball{
  public float x = width/2,y = height/2;
  private float xspeed = 4;
  private float yspeed = 1;
  private int ball_size = 20;
  
  private float r = 10;
  
  Ball() {
    reset();
  }
  
  public void show(){
    fill(255);
    strokeWeight(0);
    ellipseMode(CENTER);
    ellipse(x,y,ball_size,ball_size);
  }
  // checks edges and winner
  void edges(){
    if(y < ball_size/2 || y > height-ball_size/2){
     yspeed*=-1;
    }
    //check for left platform
    if(x <= ball_size/2){
     right_score++;
     reset();
    }
    //check for right platform
    if(x >= width - ball_size/2){
     left_score++;
     reset(); 
    }
 }
  // update position on every call based on speed
  public void update(){
    x+=xspeed;
    y+=yspeed;
  }
  
  
  // you already know what this is doing
  public void reset(){
    this.x = width/2;
    this.y = height/2;
    
    float angle = random(-PI/4 , PI/4);
    xspeed = 5 * cos(angle);
    yspeed = 5 * sin(angle);
    if(random(1) < 0.5)
      xspeed *=-1;
    
  }
}
