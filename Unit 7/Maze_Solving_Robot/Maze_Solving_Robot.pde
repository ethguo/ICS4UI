Maze maze;
Robot robot;
int robotSpeed = 2;
int stepNumber = 0;


void solveMaze() {
  if ( robot.atExit() )  //Base case: we've found the exit
    System.out.println("FOUND THE EXIT!");

  else {  //Recursive case:  Use the right-hand-rule to determine 
          //the next direction, and then walk 1 step

    if ( robot.canTurnRight() ) {
      robot.turnRight();
      robot.forwardOneStep();
    } 
    
    else if (robot.canGoStraight()) 
      robot.forwardOneStep();

    else if (robot.canTurnLeft()) {
      robot.turnLeft();
      robot.forwardOneStep();
    } 
    
    else {
      robot.turnAround();
      robot.forwardOneStep();
    }

    solveMaze(); //Recursive call.  By now, the robot has changed its location and/or direction
  }
} 


void draw() {
  if( stepNumber < robot.path.size() ) {
    background(0);
    maze.drawMe();
    robot.drawMe( stepNumber ); 
    stepNumber++;
  }
}


void setup() {
  size(500, 500);
  background(0);
  frameRate( robotSpeed );
  
  maze = new Maze( 7, 6 ); //create an empty 7x6 maze

  maze.digColumn(0, 2, 3);
  maze.digColumn(1);       //fill all of column 1
  maze.digColumn(4, 0, 2); //fill column 4 from rows 0-2
  maze.digRow(2, 1, 5);    //fill row 2 from columns 1-5
  maze.digRow(4, 1, 6);    //fill all of row 4
  maze.setExit(0, 4);      //the exit is is row 0, column 4

  robot = new Robot( maze );
  robot.setPosition(0, 1, "down" );  //robot starts in row 0, column 1, heading down

  solveMaze();
}    