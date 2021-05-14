rce: main.o takepic.o
	gcc $(CFLAGS) -o rce main.o takepic.o
main.o: ./src/main.c ./include/takepic.h
	gcc $(CFLAGS) -c ./src/main.c 
takepic.o: ./src/takepic.c ./include/takepic.h
	gcc $(CFLAGS) -c ./src/takepic.c
clean:
	rm -f *.o rce ./pics/*