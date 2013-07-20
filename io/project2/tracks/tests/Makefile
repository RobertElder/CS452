a.out: track_data.o tests.o
	gcc -DTESTS -o a.out track_data.o tests.o
track_data.o: ../track_data.c ../track_data.h ../track_node.h
	gcc -c -DTESTS ../track_data.c
tests.o: tests.c 
	gcc -c -DTESTS tests.c

clean:
	-@rm -f a.out *.o
