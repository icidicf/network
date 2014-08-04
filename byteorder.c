#include <stdio.h>
/*
test result on ubuntu
root@ubuntu:/ws/network_programming/network# uname -a
Linux ubuntu 3.11.0-18-generic #32-Ubuntu SMP Tue Feb 18 21:13:28 UTC 2014 i686 i686 i686 GNU/Linux


root@ubuntu:/ws/network_programming/network# ./a.out 
litte endian
*/


void byteorder()
{
    union
    {
        short value;
        char union_byte[sizeof(short)];
    } test;
    test.value = 0x0102;

    if((test.union_byte[0]==0x01)&&(test.union_byte[1]==0x02))
        printf("big endian\n");
    else if((test.union_byte[0]==0x02)&&(test.union_byte[1]==0x01))
        printf("litte endian\n");
    else 
        printf("unexpected result\n");

}

main(void)
{
    byteorder();

}

