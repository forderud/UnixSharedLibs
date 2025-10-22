Test of using https://github.com/graphitemaster/incbin for binary file embeding

## Linux
Everything seem to work fine, with no observed problems.

## MacOS & iOS problem
Observed build warning:
```
In file included from main.cpp:2:
./incbin.h:166:6: warning: "incbin is incompatible with bitcode. Using the library will break upload to App Store if you have bitcode enabled. Add `#define INCBIN_SILENCE_BITCODE_WARNING` before including this header to silence this warning." [-W#warnings]
  166 | #    warning "incbin is incompatible with bitcode. Using the library will break upload to App Store if you have bitcode enabled. Add `#define INCBIN_SILENCE_BITCODE_WARNING` before including this header to silence this warning."
      |      ^
1 warning generated.
```

This is a blocker, since it will prevent usage in Apple App store apps. Will probably need to use `ld -r -b binary` instead.

## Windows
Not attractive, since adoption will require adoption of an ad-hoc `incbin.exe` preprocessor tool. It's then better to instead rely on `RCDATA` embeding.

## WASM
Unsupported platform. Will probably need to use `--embed-file` instead.
