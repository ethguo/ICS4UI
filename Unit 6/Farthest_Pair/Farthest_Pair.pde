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

  points = new Vector[numPoints];
  for (int i = 0; i < numPoints; i++) {
    points[i] = new Vector(random(50, width-50), random(50, width-50));
  }

  farthestPair = getFarthestPairBruteForce(points);
  farthestPair2 = getFarthestPairMonotoneChain(points);
  print(farthestPair[0].x);
  print(", ");
  println(farthestPair[0].y);
  print(farthestPair[1].x);
  print(", ");
  println(farthestPair[1].y);
}

Vector[] getFarthestPairBruteForce(Vector[] points) {
  float dist;
  float bestDist = 0;
  Vector[] bestPoints = new Vector[2];

  for (int i = 0; i < numPoints; i++) {
    for (int j = 0; j < numPoints; j++) {
      dist = getDistance(points[i], points[j]);
      if (dist > bestDist) {
        bestDist = dist;
        bestPoints[0] = points[i];
        bestPoints[1] = points[j];
      }
    }
  }

  return bestPoints;
}

Vector[] getFarthestPairMonotoneChain(Vector[] points) {
  Vector[] pointsSorted = mergeSort(points, 0, numPoints-1);

  Stack<Vector> upper = new Stack<Vector>();
  Stack<Vector> lower = new Stack<Vector>();

  for (int i = 0; i < numPoints; i++) {
    Vector point = pointsSorted[i];
    while (upper.size() > 1 && getDirection(upper.peek(1), upper.peek(), point) <= 0) {
      upper.pop();
    }
    while (lower.size() > 1 && getDirection(lower.peek(1), lower.peek(), point) >= 0) {
      lower.pop();
    }
    upper.push(point);
    lower.push(point);
  }
  // At this point, upper and lower contain the top half and bottom half of the convex hull
  // (the leftmost and rightmost points are in both sets)

  upper.reverse();

  for (Vector p : upper) {
    // Colour all the points in the upper set red.
    p.colour = #FF0000;
  }
  for (Vector p : lower) {
    // For all the points in the lower set,
    // If the point is already coloured red (i.e. in upper), then colour it yellow.
    // Else, colour it green.
    p.colour = (p.colour == #FF0000) ? #FFFF00 : #00FF00;
  }

  float bestDist = 0;
  Vector[] bestPoints = new Vector[2];

  Vector p1 = upper.peek();
  Vector p2 = lower.peek();
  while (upper.size() > 0 || lower.size() > 0) {
    float dist = getDistance(p1, p2);
    if (dist > bestDist) {
      bestDist = dist;
      bestPoints[0] = p1;
      bestPoints[1] = p2;
    }
    print(upper.size());
    println(p1);
    print(lower.size());
    println(p2);

    if (upper.isEmpty()) {
      p2 = lower.pop();
    }
    else if (lower.isEmpty()) {
      p1 = upper.pop();
    }
    else if (
          (upper.peek().y - p1.y) * (p2.x - lower.peek().x)
          < (upper.peek().x - p1.x) * (p2.y - lower.peek().y))
      p1 = upper.pop();
    else
      p2 = lower.pop();

    println();
  }

  return bestPoints;
}

void draw() {
  background(0);

  stroke(#FFFF00);
  line(farthestPair[0].x, height-farthestPair[0].y, farthestPair[1].x, height-farthestPair[1].y);

  stroke(#00FFFF);
  line(farthestPair2[0].x, height-farthestPair2[0].y, farthestPair2[1].x, height-farthestPair2[1].y);

  // farthestPair[0].colour = #0000FF;
  // farthestPair[1].colour = #0000FF;
  for (int i = 0; i < numPoints; i++) {
    points[i].drawPoint();
  }
}

float getDistance(Vector a, Vector b) {
  float dx = b.x - a.x;
  float dy = b.y - a.y;
  return sqrt(dx*dx + dy*dy);
}

float getDirection(Vector p, Vector q, Vector r) {
  /* Returns a positive number if pqr is a clockwise turn,
   * negative if pqr is a counterclockwise turn,
   * zero if they are colinear.
   */
  return (q.y - p.y)*(r.x - p.x) - (q.x - p.x)*(r.y - p.y);
}

Vector[] mergeSort(Vector[] a, int start, int end) {
  // Merge sort, implemented with 
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