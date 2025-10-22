#include <iostream>
#include "incbin.h"

INCBIN(EmbedExample, "embed_example.txt");


int main() {
    size_t fileSize = gEmbedExampleSize;
    printf("%.*s\n", (int)fileSize, gEmbedExampleData); // specify size since file content is not null-terminated
    return 0;
}
