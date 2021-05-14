#!/bin/bash

cd opencv-mtcnn
mkdir build
cd build
cmake ..
cmake --build .

#cd build; ./sample/crwd_fd ../data/models ../mercado2.jpg
./sample/crwd_fd ../data/models ../pics/Figura_Fri_May_14_00-48-34_2021.jpg



#clear

