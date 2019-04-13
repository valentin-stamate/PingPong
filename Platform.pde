class Platform{
  private int plat_w = 10,plat_h = 150;
  public float x , y = height/2;
  private float yspeed = 0;
  // the constructor that sets something
  Platform(int x){// constructor
   this.x = x;
  }
  // show the actual platform
  public void show(){
    fill(255);
    strokeWeight(0);
    rectMode(CENTER);
    rect(x,y,this.plat_w,plat_h);
    
    update();
  }
  // update the position
  public void update(){
   y+=yspeed;
   y = constrain(y,plat_h/2+5,height - plat_h/2-5);
  }
  // move
  public void move(int y){
   yspeed = y;
  }
  // stop move
  public void stopMove(){
   yspeed = 0; 
  }
  
}
