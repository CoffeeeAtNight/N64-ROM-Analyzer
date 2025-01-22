#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>


void print_start_msg();
void load_rom(char* romPath);
void exit_program();

void s_gets(char* str, int n)
{
	int str_read = read(0, str, n -1);
    	if (str_read <= 0) {
		fprintf(stdin, "Error: Failed to read input \n");
		return;
	}

	str[str_read] = '\0';
	for (int i = 0; i < str_read; i++) {
		if (str[i] == '\n') {
			str[i] = '\0';
			break;
		}
	}
}

int main() 
{
	char buffer[1024];
	print_start_msg();

	s_gets(buffer, 1024);

	load_rom(buffer);

	exit_program();
}
