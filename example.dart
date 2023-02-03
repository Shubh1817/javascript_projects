import 'dart:io';

void main() {
  print("Enter the number of rows: ");
  int rows = int.parse(stdin.readLineSync()!);
  print("Enter the number of columns: ");
  int cols = int.parse(stdin.readLineSync()!);
  List<List<int>> arr = create2DArray(rows, cols);
    print("Enter the sort index of columns: ");
  int colsIndex = int.parse(stdin.readLineSync()!);
  print(sort2DArrayColumnValues(arr, colsIndex));
}

List<List<int>> create2DArray(int rows, int cols) {
  List<List<int>> arr =
      List.generate(rows, (_) => List.filled(rows, cols), growable: false);
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      print("Enter value for row $i and column $j: ");
      int value = int.parse(stdin.readLineSync()!);
      arr[i][j] = value;
    }
  }
  return arr;
}
// use this method to sort on the basis of column index.
List<List<int>> sort2DArrayColumnValues(List<List<int>> arr, int columnIndex) {
  print(arr);
  for (int i = 0; i < arr.length; i++) {
    for (int j = 0; j < arr.length - i - 1; j++) {
      if (arr[j][columnIndex] > arr[j + 1][columnIndex]) {
        int temp = arr[j][columnIndex];
        arr[j][columnIndex] = arr[j + 1][columnIndex];
        arr[j + 1][columnIndex] = temp;
      }
    }
  }
  return arr;
}


// [[11, 12, 1], [112, 114, 0], [1, 2, 5]] --> input array
// [[11, 12, 0], [112, 114, 1], [1, 2, 5]] --> output array
