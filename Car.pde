class Car {
  private float x;
  private float y;
  private color clr;
  private float theSize;
  private int score;  // New variable to hold the score

  public Car(float xp, float yp, float size, color c) {
    theSize = size;
    setPosition(xp);
    y = yp;
    clr = c;
    score = 0;     
  }

  public void display() {
    float wheelOffset = theSize / 4;
    rectMode(CENTER);
    stroke(0);
    fill(clr);
    rect(x, y, theSize, theSize / 2);

  
    fill(255);       // White text for visibility
    textAlign(CENTER, CENTER);
    text(score, x, y);

    // Draw the wheels
    fill(0);
    rect(x - wheelOffset, y - wheelOffset, wheelOffset, wheelOffset / 2);
    rect(x + wheelOffset, y - wheelOffset, wheelOffset, wheelOffset / 2);
    rect(x - wheelOffset, y + wheelOffset, wheelOffset, wheelOffset / 2);
    rect(x + wheelOffset, y + wheelOffset, wheelOffset, wheelOffset / 2);
  }

  public void move() {
    x = x + random(0, 10);
  }
  
  public float getPosition() {
    return x + theSize / 2;
  }
  
  public void setPosition(float newPos) {
    x = newPos - theSize / 2;
  }

  // New method to increase the score
  public void increaseScore() {
    score++;
  }
}
