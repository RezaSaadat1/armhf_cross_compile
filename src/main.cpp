#include <stdio.h>
#include <unistd.h>
#include <sys/utsname.h>


int main() {
    struct utsname name;
    uname(&name);
    printf("Hello World from System: %s/%s %s\n", name.nodename, name.sysname, name.machine);
    
    #ifdef ARM_TARGET
    printf("this code is running on ARM target \n");
    #endif

    #ifdef HOST_TARGET
    printf("This code is running in Host \n");
    #endif

    int i=0;
    while (1) {
        printf("Number #%d\n", i++);
        usleep(500 *1000); // 500ms Delay
    }
    return 0;
}