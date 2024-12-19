// Insertion Sort
void insertionSort(List<int> arr) {
  for (int i = 1; i < arr.length; i++) {
    int key = arr[i];
    int j = i - 1;

    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j = j - 1;
    }
    arr[j + 1] = key;
  }
}

// Selection Sort
void selectionSort(List<int> arr) {
  int n = arr.length;
  for (int i = 0; i < n - 1; i++) {
    int minIdx = i;

    for (int j = i + 1; j < n; j++) {
      if (arr[j] < arr[minIdx]) {
        minIdx = j;
      }
    }

    int temp = arr[minIdx];
    arr[minIdx] = arr[i];
    arr[i] = temp;
  }
}

// Bubble Sort
void bubbleSort(List<int> arr) {
  int n = arr.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
}

// Merge Sort
void merge(List<int> arr, int left, int mid, int right) {
  int n1 = mid - left + 1;
  int n2 = right - mid;

  List<int> L = List.filled(n1, 0);
  List<int> R = List.filled(n2, 0);

  for (int i = 0; i < n1; i++) L[i] = arr[left + i];
  for (int j = 0; j < n2; j++) R[j] = arr[mid + 1 + j];

  int i = 0, j = 0, k = left;

  while (i < n1 && j < n2) {
    if (L[i] <= R[j]) {
      arr[k] = L[i];
      i++;
    } else {
      arr[k] = R[j];
      j++;
    }
    k++;
  }

  while (i < n1) {
    arr[k] = L[i];
    i++;
    k++;
  }

  while (j < n2) {
    arr[k] = R[j];
    j++;
    k++;
  }
}

void mergeSort(List<int> arr, int left, int right) {
  if (left < right) {
    int mid = (left + right) ~/ 2;

    mergeSort(arr, left, mid);
    mergeSort(arr, mid + 1, right);

    merge(arr, left, mid, right);
  }
}

// Quick Sort
int partition(List<int> arr, int low, int high) {
  int pivot = arr[high];
  int i = (low - 1);

  for (int j = low; j < high; j++) {
    if (arr[j] < pivot) {
      i++;
      int temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
    }
  }

  int temp = arr[i + 1];
  arr[i + 1] = arr[high];
  arr[high] = temp;

  return i + 1;
}

void quickSort(List<int> arr, int low, int high) {
  if (low < high) {
    int pi = partition(arr, low, high);

    quickSort(arr, low, pi - 1);
    quickSort(arr, pi + 1, high);
  }
}

void main() {
  List<int> arr = [64, 34, 25, 12, 22, 11, 90];
  print("Original array: $arr");

  // Insertion Sort
  insertionSort(arr);
  print("Sorted array using Insertion Sort: $arr");

  // Selection Sort
  arr = [64, 34, 25, 12, 22, 11, 90];
  selectionSort(arr);
  print("Sorted array using Selection Sort: $arr");

  // Bubble Sort
  arr = [64, 34, 25, 12, 22, 11, 90];
  bubbleSort(arr);
  print("Sorted array using Bubble Sort: $arr");

  // Merge Sort
  arr = [64, 34, 25, 12, 22, 11, 90];
  mergeSort(arr, 0, arr.length - 1);
  print("Sorted array using Merge Sort: $arr");

  // Quick Sort
  arr = [64, 34, 25, 12, 22, 11, 90];
  quickSort(arr, 0, arr.length - 1);
  print("Sorted array using Quick Sort: $arr");
}
