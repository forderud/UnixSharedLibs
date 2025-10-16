#include <iostream>

extern char _binary_embed_example_txt_start[]; // start of embedded ASCII file
extern char _binary_embed_example_txt_end[];


int main() {
    printf("Content of embed_example.txt:\n");
    size_t fileSize = _binary_embed_example_txt_end - _binary_embed_example_txt_start;
    printf("%.*s\n", fileSize, _binary_embed_example_txt_start); // specify size since file content is not null-terminated
    return 0;
}
