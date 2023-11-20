/usr/bin/gcc -o menu menu.cpp

/usr/local/bin/nasm -f macho cn1.asm -o cn1.o
/usr/local/bin/nasm -f macho cn2.asm -o cn2.o
/usr/local/bin/nasm -f macho cn3.asm -o cn3.o

/usr/bin/gcc -o program menu cn1.o cn2.o cn3.o