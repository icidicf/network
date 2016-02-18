MAKEFLAGS=-B -s

# Optimization flags breaks 

#CFLAGS=-march=k8 -Wall -pedantic -mtune=k8 -std=gnu99 
CFLAGS=-O0  

all:
	make ibmPing

ibmPing:
	gcc ${CFLAGS} ibmPing.c -o ibmPing 
	sudo chown root:root ibmPing 
	sudo chmod +s ibmPing

clean:
	rm -f ibmPing
