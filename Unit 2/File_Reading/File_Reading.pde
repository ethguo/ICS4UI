String[] lines = loadStrings("input.txt");
PrintWriter fOut = createWriter("output.txt");
for (int i = 0; i < lines.length; i++) {
  int x = parseInt(lines[i]);
  fOut.println(x + 1);
}
fOut.close();
