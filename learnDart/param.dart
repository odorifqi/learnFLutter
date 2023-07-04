int sum(a, [int? b, int c = 1]) {
  return b != null ? a + b + c : a + c;
}

void main() {
  multiple(a, b) {
    return a * b;
  }

  print(sum(7));
  print(sum(7, 2));
  print(sum(7, 2, 10));
}
