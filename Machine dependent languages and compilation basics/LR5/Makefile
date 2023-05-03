.PHONY: asm src ld build

build: asm src link

asm:
	nasm -f elf64 -o build/libasm.o src/asm/libasm.asm

src: 
	gcc -o build/main.o -c src/C/main.c
	gcc -o build/lib.o -c src/C/lib.c

link: asm src
	gcc -o main.out -static build/lib.o build/libasm.o build/main.o

run: build
	./main.out

debug: build
	edb --run main.out
