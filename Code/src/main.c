#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include "../include/takepic.h"

void mata_proc(){
    puts("Até amanha!");
    exit(1);
}

int main(int argc, char **argv){

    char dir[100] = "./pics";

    if (argc > 1) {
        int N = *argv[2] - '0';
        char *path_back = argv[1];
    } else {
        int N;
        puts("Instalador, posicione a camera para tirar foto de fundo.");
        int i;
        for(i = 3; i>0; i--){
            usleep(1000000);
            printf("%d\n", i); 
        }
        char *path_back = takeshoot(dir);

        printf("%s\n", path_back);

        puts("Agora indique o numero maximo de pessoas para este espaço.");

        scanf("%d", &N);
    }

    char arg[100];
    signal(SIGINT, mata_proc);
    while(1){
        puts("Precione Crtl+C para Finalizar.");
        usleep(2000000);
        char *path = takeshoot(dir); // Tira uma foto
        strcpy(arg, "cd build; ./sample/crwd_fd ../data/models .");
        strcat(arg, path);
        system(arg);
    }
    return 0;
}
