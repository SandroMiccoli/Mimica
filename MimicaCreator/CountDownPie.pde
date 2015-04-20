// Class CountDownPie
//
// Creates a dynamic pie that represents a count down in seconds

class CountDownPie {

  int x, y; // pie position
  int w, h; // width and height
  float sec; // time in seconds each cycle will last
  float counter=0.001;
  float inc=0;

  boolean end=false;

  CountDownPie(int _x, int _y, int _w, int _h, float _sec) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    end=false;
    sec = _sec;

    inc = 360 / (frameRate * sec);
  }

  public void drawPie() {
    noStroke();
    fill(211);
    arc(this.x, this.y, this.w, this.h, -HALF_PI, -HALF_PI+radians(this.counter), PIE);
    if (this.counter>360) {
      this.counter=0;
      this.end = true;
    } else if (counter==0) {
      this.counter+=this.inc;
    } else
      this.counter+=this.inc;
      
   
    
  }

  public boolean endOfCountDown() {
    return this.end;
  }
}
