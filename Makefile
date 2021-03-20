main:	src/hello.asm src/reset.asm
	ca65 src/hello.asm
	ca65 src/reset.asm
	ld65 src/*.o -C nes.cfg -o hello.nes

clean:
	rm -fr src/*.o hello.nes
