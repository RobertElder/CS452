#valgrind -v --leak-check=full --show-reachable=yes --track-origins=yes ./a.out

a.out: track_data.o tests.o
	gcc -g -DTESTS -o a.out track_data.o tests.o
track_data.o: ../track_data.c ../track_data.h ../track_node.h
	gcc -g -c -DTESTS ../track_data.c
tests.o: tests.c 
	gcc -g -c -DTESTS tests.c

clean:
	-@rm -f a.out *.o
