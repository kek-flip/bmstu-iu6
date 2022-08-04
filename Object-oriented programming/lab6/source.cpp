#include <iostream>
#include <algorithm>
#include <stdlib.h>
#include <time.h>

using namespace std;

bool ascendingSort(int a, int b) {
    return a > b;
}
bool descendingSort(int a, int b) {
    return a < b;
}

void heapify(int arr[], int n, int i, bool (*comp)(int, int)) {
    int chosenVal = i;
    int l = 2 * i + 1;
    int r = 2 * i + 2;
    
    if (l < n)
        if (comp(arr[l], arr[chosenVal]))
            chosenVal = l;

    if (r < n)
        if (comp(arr[r], arr[chosenVal]))
            chosenVal = r;

    if (chosenVal != i) {
        swap(arr[i], arr[chosenVal]);
        heapify(arr, n, chosenVal, comp);
    }
}

void heapSort(int arr[], int n, bool (*comp)(int, int)) {
    for (int i = n / 2 - 1; i >= 0; i--)
        heapify(arr, n, i, comp);
    
    for (int i = n - 1; i >= 0; i--) {
        swap(arr[0], arr[i]);
        heapify(arr, i, 0, comp);
    }
}


int main() {
    srand(time(NULL));
    int a[50] = {};

    int n = 15;
    cout << "Array before sort:" << endl;
    for (int i = 0; i < n; i++) {
        a[i] = rand() % 100;
        cout << a[i] << ' ';
    }
    cout << endl;

    heapSort(a, n, ascendingSort);

    cout << "Array after ascending sort:" << endl;
    for (int i = 0; i < n; i++) {
        cout << a[i] << ' ';
    }
    cout << endl;

    heapSort(a, n, descendingSort);
    cout << "Array after descending sort:" << endl;
    for (int i = 0; i < n; i++) {
        cout << a[i] << ' ';
    }  
    cout << endl;   
}