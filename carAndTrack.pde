 //<>//
Car[] cars;           
RaceTrack track;
boolean raceOver;
int numCars = 5;      

void setup() {
  size(1000, 600);
  track = new RaceTrack();
  
  
  cars = new Car[numCars];
  float spacing = height / (numCars + 1);  
  
 
  for (int i = 0; i < numCars; i++) {
    float yPos = spacing * (i + 1);
    cars[i] = new Car(track.getStartPosition(), yPos, 60, color(random(255), random(255), random(255)));
  }
  
  raceOver = false;
}

void draw() {
  background(70);
  track.display();
  
 
  for (Car car : cars) {
    car.display();
    if (!raceOver) {
      car.move();
    }
  }
  
  
  if (!raceOver) {
    detectWinners();
  }
}

void detectWinners() {
  boolean anyCarCrossed = false;
  
 
  for (Car car : cars) {
    if (car.getPosition() >= track.getFinishPosition()) {
      car.increaseScore();   
      anyCarCrossed = true;
    }
  }
  

  if (anyCarCrossed) {
    raceOver = true;
    println("Press 's' to restart");
  }
}


void detectOneWinner() {
  Car furthestCar = null;
  float maxDistance = track.getFinishPosition();

  for (Car car : cars) {
    float carPos = car.getPosition();
    if (carPos >= track.getFinishPosition() && (furthestCar == null || carPos > maxDistance)) {
      furthestCar = car;
      maxDistance = carPos;
    }
  }

  if (furthestCar != null) {
    furthestCar.increaseScore();
  }
}

void keyPressed() {
  if (key == 's' && raceOver) {
    float startLine = track.getStartPosition();
    for (Car car : cars) {
      car.setPosition(startLine);
    }
    raceOver = false;
  }
}
