#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <time.h>
#include "../include/takepic.h"

void rmspace(char *p){
    for (; *p; ++p){
        if (*p == ' ')
            *p = '_';
        if (*p == ':')
            *p = '-';
        if (*p == '\n')
            *p = '\0';
    }
}


char* takeshoot(char* dir){
    char path[100];
    char arg[100];

    time_t rawtime;

    time (&rawtime);
    sprintf(path,"%s/Figura_%s", dir, ctime(&rawtime));
    rmspace(path);
    strcat(path, ".jpg");
    strcpy(arg, "raspistill -o ");
    strcat(arg, path);
    system(arg);
    char* str;
    str = malloc(100);
    strcpy(str, path);
    return str;
}
