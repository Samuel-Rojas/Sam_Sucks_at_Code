#include <stdio.h>
#include <stdbool.h>

int main(void) {
    char name[10];

   printf("What is your name ?");
    scanf("%s",&name);
    printf("Your name is %s", name);
}