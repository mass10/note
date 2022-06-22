#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {

	if (argc == 1)
		return 0;

	int required = atoi(argv[1]);

	printf("[ERROR] Application exitted by status (%d)\n", required);

	return required;
}
