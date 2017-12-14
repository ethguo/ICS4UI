// Vector[] points = new Vector[] {
//   new Vector( 20,  20),
//   new Vector(100,  50),
//   new Vector(200, 200),
//   new Vector(500, 125),
//   new Vector(400, 300),
//   new Vector( 40, 300)
// };

int numPoints = 25;
Vector[] points;
Vector[] farthestPair;
Vector[] farthestPair2;

void setup() {
  size(600, 600);
  noLoop();

  // Randomly generate a bunch of (x, y) points
  points = new Vector[numPoints];
  for (int i = 0; i < numPoints; i++) {
    points[i] = new Vector(random(50, width-50), random(50, width-50));
  }

  // Get the farthest pair, according to each algorithm
  farthestPair = getFarthestPairBruteForce(points);
  farthestPair2 = getFarthestPairMonotoneChain(points);

  println("Farthest pair according to brute force search:");
  println(farthestPair[0]);
  println(farthestPair[1]);
  println("Farthest pair according to monotone chain + rotating calipers:");
  println(farthestPair2[0]);
  println(farthestPair2[1]);

  // Check if the two algorithms returned the same set of two points.
  boolean resultsMatch = (farthestPair[0] == farthestPair2[0] && farthestPair[1] == farthestPair2[1])
                      || (farthestPair[0] == farthestPair2[1] && farthestPair[1] == farthestPair2[0]);

  println("Results match?: " + resultsMatch);
}

Vector[] getFarthestPairBruteForce(Vector[] points) {
  float dist;
  float bestDist = 0;
  Vector[] farthestPair = new Vector[2];

  for (int i = 0; i < numPoints; i++) {
    for (int j = 0; j < numPoints; j++) {
      dist = getDistance(points[i], points[j]);
      if (dist > bestDist) {
        bestDist = dist;
        farthestPair[0] = points[i];
        farthestPair[1] = points[j];
      }
    }
  }

  return farthestPair;
}

Vector[] getFarthestPairMonotoneChain(Vector[] points) {
  // MONOTONE CHAIN STEP

  // Get a copy of the points array, sorted by ascending x-coordinate
  Vector[] pointsSorted = mergeSort(points, 0, numPoints-1);
  
  Stack<Vector> upper = new Stack<Vector>();
  Stack<Vector> lower = new Stack<Vector>();

  // Repeatedly try adding the next point, while removing any points that are "inside" the new hull.
  for (int i = 0; i < numPoints; i++) {
    Vector point = pointsSorted[i];
    while (upper.size() > 1 && getDirection(upper.peek(1), upper.peek(), point) <= 0)
      upper.pop();
    while (lower.size() > 1 && getDirection(lower.peek(1), lower.peek(), point) >= 0)
      lower.pop();

    upper.push(point);
    lower.push(point);
  }
  // At this point, upper and lower contain the top half and bottom half of the convex hull
  // (the leftmost and rightmost points are in both sets)

  for (Vector p : upper) {
    // Colour all the points in the upper set red.
    p.colour = #FF0000;
  }
  for (Vector p : lower) {
    // For all the points in the lower set,
    // If the point is already coloured red (i.e. point is in both sets), then colour it yellow.
    // Else, colour it green.
    p.colour = (p.colour == #FF0000) ? #FFFF00 : #00FF00;
  }


  // ROTATING CALIPERS STEP

  // Flip the lower set, so that the two ends of the "calipers" start on opposite sides of the convex hull.
  lower.reverse();

  float bestDist = 0;
  Vector[] farthestPair = new Vector[2];

  while (upper.size() > 1 || lower.size() > 1) {
    Vector p1 = upper.peek();
    Vector p2 = lower.peek();

    // Check if this pair of points is farther than the farthest pair found so far.
    float dist = getDistance(p1, p2);
    if (dist > bestDist) {
      bestDist = dist;
      farthestPair[0] = p1;
      farthestPair[1] = p2;
    }

    // If there is only one element left in either the upper or lower set, just check it against each remaining point in the opposite set.
    if (upper.size() == 1)
      lower.pop();
    else if (lower.size() == 1)
      upper.pop();
    // If there are more than one points in each set, check which end of the "calipers" we should move in order to rotate clockwise.
    else if (getCrossProductFromPoints(p1, upper.peek(1), lower.peek(1), p2) > 0)
      lower.pop();
    else
      upper.pop();
  }

  return farthestPair;
}

void draw() {
  background(0);

  // Draw a yellow line representing the farthest pair, according to the brute force algorithm.
  // If the two algorithms returned the same thing, this line should be hidden by cyan line.
  stroke(#FFFF00);
  line(farthestPair[0].x, height-farthestPair[0].y, farthestPair[1].x, height-farthestPair[1].y);

  // Draw a cyan line representing the farthest pair according to the second algorithm.
  stroke(#00FFFF);
  line(farthestPair2[0].x, height-farthestPair2[0].y, farthestPair2[1].x, height-farthestPair2[1].y);

  for (int i = 0; i < numPoints; i++) {
    points[i].drawPoint();
  }
}

float getDistance(Vector a, Vector b) {
  // Calculates the Euclidean distance between points a and b.
  float dx = b.x - a.x;
  float dy = b.y - a.y;
  return sqrt(dx*dx + dy*dy);
}

float getDirection(Vector p, Vector q, Vector r) {
  // Returns a positive number if pqr is a clockwise turn,
  // negative if pqr is a counterclockwise turn,
  // zero if they are colinear.
  return (q.y - p.y)*(r.x - p.x) - (q.x - p.x)*(r.y - p.y);
}

float getCrossProductFromPoints(Vector a1, Vector a2, Vector b1, Vector b2) {
  // Calculates the "cross product" between vector a and vector b.
  // Vector a is the vector between point a1 and point a2, and likewise for Vector b.
  Vector a = a2.minus(a1);
  Vector b = b2.minus(b1);
  return a.y * b.x - a.x * b.y;
}

Vector[] mergeSort(Vector[] a, int start, int end) {
  // Merge sort an array of Vectors in order of ascending x-coordinate.
  Vector[] b = new Vector[a.length];
  if (start == end) {
    return new Vector[] {a[start]}; // Singleton array
  }
  else {
    int middle = (start + end) / 2;

    Vector[] leftHalf = mergeSort(a, start, middle);
    Vector[] rightHalf = mergeSort(a, middle+1, end);
    
    return merge(leftHalf, rightHalf);
  }
}

Vector[] merge(Vector[] a, Vector[] b) {
  // The merge step for merge sort.
  Vector[] merged = new Vector[a.length + b.length];

  int iA = 0;
  int iB = 0;
  int iMerged = 0;

  while (iA < a.length && iB < b.length) {
    if (a[iA].isBefore(b[iB])) {
      merged[iMerged] = a[iA];
      iA++;
    }
    else {
      merged[iMerged] = b[iB];
      iB++;
    }
    iMerged++;
  }

  while (iA < a.length) {
    merged[iMerged] = a[iA];
    iA++;
    iMerged++;
  }
  while (iB < b.length) {
    merged[iMerged] = b[iB];
    iB++;
    iMerged++;
  }

  return merged;
}