#include <stdio.h>
#include <unistd.h>

int main(int argc, char *argv[]) {

    printf("Hello, World!\n");
    int i=0;
    while (1) {
        printf("Number #%d\n", i++);
        usleep(500 *1000); // 500ms Delay
    }
    return 0;
}