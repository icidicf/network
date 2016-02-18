all: tlv_test

tlv_test: main.o tlv_chain.o 
	    gcc -std=c99 main.o tlv_chain.o -o tlvTest

main.o: main.c
	    gcc -c -std=c99 main.c

tlv_chain.o: tlv_chain.c
	    gcc -c -std=c99 tlv_chain.c


clean:
	    rm *o tlvTest
