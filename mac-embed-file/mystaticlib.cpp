#include <iostream>
#include <mach-o/getsect.h> // for getsectiondata
#include <mach-o/ldsyms.h>  // for _mh_execute_header


void print_embedded_file (const char* segment_name) {
    unsigned long embed_example_size = 0;
    const uint8_t* embed_example_start = getsectiondata(&_mh_execute_header, "__TEXT", segment_name, &embed_example_size);

    printf("Content of %s (%u bytes):\n", segment_name, embed_example_size);
    printf("%.*s\n", (int)embed_example_size, embed_example_start); // specify size since file content is not null-terminated
}
