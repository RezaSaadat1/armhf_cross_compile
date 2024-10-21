#include <stdio.h>
#include <unistd.h>
#include <sys/utsname.h>


int main() {
    struct utsname name;
    uname(&name);
    printf("Hello World from System: %s/%s %s\n", name.nodename, name.sysname, name.machine);
    
    #ifdef TARGET
    printf("This code is running on target \n");
    #endif

    #ifdef HOST
    printf("This code is running on Host \n");
    #endif

    #ifdef arm64
    printf("This code is running on Cross Target: arm64 \n");
    #elif armhf
    printf("This code is running on Cross Target: armhf \n");
    #elif armel
    printf("This code is running on Cross Target: armel \n");
    #elif riscv64
    printf("This code is running on Cross Target: riscv64 \n");
    #elif amd64
    printf("This code is running on Cross Target: amd64 \n");
    #elif i386
    printf("This code is running on Cross Target: i386 \n");
    #else
    printf("This code is running on an unknown architecture \n");
    #endif
    
    // Check if running as root
    if (geteuid() == 0) {
        printf("The program is running as root.\n");
    } else {
        printf("The program is not running as root.\n");
    }

    // Get the current user's login name
    char *username = getlogin();
    if (username) {
        printf("The current user is: %s\n", username);
    } else {
        printf("Failed to get the current user.\n");
    }

    int i = 0;
    while (1) {
        printf("Number #%d\n", i++);
        if (!(i % 10)) {
            fflush(stdout);
        }
        usleep(500 * 1000); // 500ms Delay
    }
    return 0;
}
