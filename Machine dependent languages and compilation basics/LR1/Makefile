TARGET = source.out

help:
	@echo Available goals:
	@echo ' run   - create and run without debugging '
	@echo ' debug - create and debug  '
	@echo ' help  - show this message '
$(TARGET): $(TARGET).asm	
	nasm -f elf -l $(TARGET).lst $(TARGET).asm
	ld -m elf_i386 -o $(TARGET) $(TARGET).o 
run: $(TARGET)
	./$(TARGET)
debug: $(TARGET)
	edb --run $(TARGET)