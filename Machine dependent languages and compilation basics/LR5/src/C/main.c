#include <stdio.h>
#include <string.h>

extern void sort_str(char* str, char* sorted_str);

int main() {
    char str[256] = {};
    puts("Введите слова:");
    fgets(str, 255, stdin);
    str[strlen(str) - 1] = '\0';

    char sorted_str[256] = {};
    sort_str(sorted_str, str);

    puts("Слова, отсортированные по длине:");
    puts(sorted_str);

    return 0;
}
