# [stream-mt] added stream & multi-thread support for [libdeflate]
[stream-mt] base on [libdeflate], added support compress & decompress by stream, and added base API for support parallel compress.
And at the same time, try to keep it simple and fast.
See programs/pgzip.c, a demo of multi-thread compress and streaming compress & decompress, support large file, run fast & always uses limited memory.

[stream-mt]:https://github.com/sisong/libdeflate/tree/stream-mt
[libdeflate]:https://github.com/ebiggers/libdeflate
[zlib]:https://github.com/madler/zlib

## benchmark: [zlib] vs [libdeflate] vs [stream-mt]
### test program version
 [zlib] v1.3.1   
 gzip in [libdeflate] v1.20   
 pgzip in [stream-mt] based on [libdeflate] v1.20   
### some files for compress&decompress testing:   
| |file name|file original size|
|----:|:----|----:|
|1|Chrome_107.0.5304.122-x64-Stable.win.tar|278658560|
|2|Emacs_28.2-universal.mac.tar|196380160|
|3|gcc_12.2.0.src.tar|865884160|
|4|jdk_x64_mac_openj9_16.0.1_9_openj9-0.26.0.tar|363765760|
|5|linux_5.19.9.src.tar|1269637120|
### test infos
 PC: Windows11, CPU R9-7945HX, SSD PCIe4.0x4 4T, DDR5 5200MHz 32Gx2   
 Only test deflate compress & decompress, no crc; build by vc2022;   
 The time counted includes the time of read & write file data;   
 `-9` means compressor run with compress level of 9;   
 `-p-16` means pgzip compressor run with 16 threads; decompressor support up 3 threads; 
### test result average
|Program|C ratio|C ave. mem|C ave. speed|D ave. mem|D max mem|D ave. speed|
|:----|----:|----:|----:|----:|----:|----:|
|filecopy|100.000%|1.0M|2954.7MB/s|1.0M|1.0M|2862MB/s|
|zlib-1|38.628%|1.4M|157.9MB/s|1.1M|1.1M|565MB/s|
|zlib-2|37.820%|1.4M|147.3MB/s|1.1M|1.1M|583MB/s|
|zlib-3|37.192%|1.3M|121.9MB/s|1.1M|1.1M|596MB/s|
|zlib-4|36.070%|1.3M|106.0MB/s|1.1M|1.1M|596MB/s|
|zlib-5|35.418%|1.3M|81.4MB/s|1.1M|1.1M|611MB/s|
|zlib-6|35.112%|1.3M|56.9MB/s|1.1M|1.1M|618MB/s|
|zlib-7|35.024%|1.3M|47.2MB/s|1.1M|1.1M|622MB/s|
|zlib-8|34.945%|1.3M|32.1MB/s|1.1M|1.1M|631MB/s|
|zlib-9|34.923%|1.3M|26.7MB/s|1.1M|1.1M|634MB/s|
||
|gzip -1|37.558%|570.9M|331.3MB/s|569.3M|1214.2M|763MB/s|
|gzip -2|36.237%|571.3M|244.5MB/s|569.3M|1214.2M|766MB/s|
|gzip -3|35.875%|571.3M|225.4MB/s|569.3M|1214.2M|772MB/s|
|gzip -4|35.651%|571.3M|210.1MB/s|569.3M|1214.2M|780MB/s|
|gzip -5|35.055%|571.3M|185.5MB/s|569.3M|1214.2M|782MB/s|
|gzip -6|34.819%|571.3M|151.9MB/s|569.3M|1214.2M|780MB/s|
|gzip -7|34.702%|571.3M|110.8MB/s|569.3M|1214.2M|776MB/s|
|gzip -8|34.601%|571.3M|68.5MB/s|569.3M|1214.2M|772MB/s|
|gzip -9|34.589%|571.3M|55.0MB/s|569.3M|1214.2M|771MB/s|
|gzip -10|33.943%|579.3M|17.7MB/s|569.3M|1214.2M|783MB/s|
|gzip -11|33.881%|579.3M|10.1MB/s|569.3M|1214.2M|786MB/s|
|gzip -12|33.863%|579.3M|7.3MB/s|569.3M|1214.2M|786MB/s|
||
|pgzip -1 -p-1|37.558%|4.9M|346.1MB/s|1.3M|1.3M|1110MB/s|
|pgzip -2 -p-1|36.237%|5.3M|260.4MB/s|1.7M|2.5M|1093MB/s|
|pgzip -3 -p-1|35.875%|5.3M|239.5MB/s|1.6M|2.4M|1112MB/s|
|pgzip -4 -p-1|35.650%|5.3M|221.2MB/s|1.4M|1.8M|1111MB/s|
|pgzip -5 -p-1|35.055%|5.3M|193.7MB/s|1.4M|1.8M|1109MB/s|
|pgzip -6 -p-1|34.820%|5.3M|156.4MB/s|1.6M|2.4M|1122MB/s|
|pgzip -7 -p-1|34.703%|5.3M|113.0MB/s|1.7M|2.4M|1138MB/s|
|pgzip -8 -p-1|34.602%|5.3M|69.7MB/s|1.6M|2.4M|1112MB/s|
|pgzip -9 -p-1|34.589%|5.3M|55.8MB/s|1.7M|2.4M|1132MB/s|
|pgzip -10 -p-1|33.943%|13.3M|16.7MB/s|1.6M|2.4M|1149MB/s|
|pgzip -11 -p-1|33.883%|13.3M|9.2MB/s|1.6M|2.4M|1164MB/s|
|pgzip -12 -p-1|33.865%|13.3M|6.5MB/s|1.5M|2.4M|1156MB/s|
||
|pgzip -1 -p-4|37.558%|25.9M|1309.6MB/s|2.4M|2.4M|1428MB/s|
|pgzip -2 -p-4|36.237%|27.7M|979.5MB/s|2.6M|3.0M|1401MB/s|
|pgzip -3 -p-4|35.875%|27.7M|902.5MB/s|2.6M|3.0M|1439MB/s|
|pgzip -4 -p-4|35.651%|27.7M|839.7MB/s|2.5M|3.0M|1438MB/s|
|pgzip -5 -p-4|35.055%|27.7M|733.1MB/s|2.5M|3.0M|1418MB/s|
|pgzip -6 -p-4|34.820%|27.7M|598.4MB/s|2.6M|3.0M|1449MB/s|
|pgzip -7 -p-4|34.703%|27.7M|430.2MB/s|2.7M|3.0M|1452MB/s|
|pgzip -8 -p-4|34.602%|27.7M|264.3MB/s|2.6M|3.0M|1438MB/s|
|pgzip -9 -p-4|34.589%|27.7M|209.2MB/s|2.7M|3.0M|1438MB/s|
|pgzip -10 -p-4|33.945%|59.6M|64.2MB/s|2.6M|3.0M|1438MB/s|
|pgzip -11 -p-4|33.884%|59.6M|35.1MB/s|2.6M|3.0M|1438MB/s|
|pgzip -12 -p-4|33.866%|59.6M|25.0MB/s|2.5M|3.0M|1449MB/s|
||
|pgzip -1 -p-16|37.558%|101.4M|3854.0MB/s|2.4M|2.4M|1459MB/s|
|pgzip -2 -p-16|36.237%|108.5M|3176.4MB/s|2.6M|3.0M|1404MB/s|
|pgzip -3 -p-16|35.875%|108.5M|2921.3MB/s|2.6M|3.0M|1434MB/s|
|pgzip -4 -p-16|35.651%|108.5M|2732.7MB/s|2.5M|3.0M|1438MB/s|
|pgzip -5 -p-16|35.055%|108.5M|2468.7MB/s|2.5M|3.0M|1406MB/s|
|pgzip -6 -p-16|34.820%|108.5M|2024.7MB/s|2.6M|3.0M|1438MB/s|
|pgzip -7 -p-16|34.703%|108.5M|1496.1MB/s|2.7M|3.0M|1446MB/s|
|pgzip -8 -p-16|34.602%|108.5M|904.2MB/s|2.6M|3.0M|1425MB/s|
|pgzip -9 -p-16|34.589%|108.5M|692.7MB/s|2.7M|3.0M|1416MB/s|
|pgzip -10 -p-16|33.946%|236.1M|233.5MB/s|2.6M|3.0M|1427MB/s|
|pgzip -11 -p-16|33.884%|236.1M|128.0MB/s|2.6M|3.0M|1448MB/s|
|pgzip -12 -p-16|33.865%|236.1M|89.9MB/s|2.5M|3.0M|1429MB/s|
   
   
----------
----------
----------
# Overview

libdeflate is a library for fast, whole-buffer DEFLATE-based compression and
decompression.

The supported formats are:

- DEFLATE (raw)
- zlib (a.k.a. DEFLATE with a zlib wrapper)
- gzip (a.k.a. DEFLATE with a gzip wrapper)

libdeflate is heavily optimized.  It is significantly faster than the zlib
library, both for compression and decompression, and especially on x86 and ARM
processors.  In addition, libdeflate provides optional high compression modes
that provide a better compression ratio than the zlib's "level 9".

libdeflate itself is a library.  The following command-line programs which use
this library are also included:

* `libdeflate-gzip`, a program which can be a drop-in replacement for standard
  `gzip` under some circumstances.  Note that `libdeflate-gzip` has some
  limitations; it is provided for convenience and is **not** meant to be the
  main use case of libdeflate.  It needs a lot of memory to process large files,
  and it omits support for some infrequently-used options of GNU gzip.

* `benchmark`, a test program that does round-trip compression and decompression
  of the provided data, and measures the compression and decompression speed.
  It can use libdeflate, zlib, or a combination of the two.

* `checksum`, a test program that checksums the provided data with Adler-32 or
  CRC-32, and optionally measures the speed.  It can use libdeflate or zlib.

For the release notes, see the [NEWS file](NEWS.md).

## Table of Contents

- [Building](#building)
  - [Using CMake](#using-cmake)
  - [Directly integrating the library sources](#directly-integrating-the-library-sources)
- [API](#api)
- [Bindings for other programming languages](#bindings-for-other-programming-languages)
- [DEFLATE vs. zlib vs. gzip](#deflate-vs-zlib-vs-gzip)
- [Compression levels](#compression-levels)
- [Motivation](#motivation)
- [License](#license)

# Building

## Using CMake

libdeflate uses [CMake](https://cmake.org/).  It can be built just like any
other CMake project, e.g. with:

    cmake -B build && cmake --build build

By default the following targets are built:

- The static library (normally called `libdeflate.a`)
- The shared library (normally called `libdeflate.so`)
- The `libdeflate-gzip` program, including its alias `libdeflate-gunzip`

Besides the standard CMake build and installation options, there are some
libdeflate-specific build options.  See `CMakeLists.txt` for the list of these
options.  To set an option, add `-DOPTION=VALUE` to the `cmake` command.

Prebuilt Windows binaries can be downloaded from
https://github.com/ebiggers/libdeflate/releases.

## Directly integrating the library sources

Although the official build system is CMake, care has been taken to keep the
library source files compilable directly, without a prerequisite configuration
step.  Therefore, it is also fine to just add the library source files directly
to your application, without using CMake.

You should compile both `lib/*.c` and `lib/*/*.c`.  You don't need to worry
about excluding irrelevant architecture-specific code, as this is already
handled in the source files themselves using `#ifdef`s.

If you are doing a freestanding build with `-ffreestanding`, you must add
`-DFREESTANDING` as well (matching what the `CMakeLists.txt` does).

## Supported compilers

- gcc: v4.9 and later
- clang: v3.9 and later (upstream), Xcode 8 and later (Apple)
- MSVC: Visual Studio 2015 and later
- Other compilers: any other C99-compatible compiler should work, though if your
  compiler pretends to be gcc, clang, or MSVC, it needs to be sufficiently
  compatible with the compiler it pretends to be.

The above are the minimums, but using a newer compiler allows more of the
architecture-optimized code to be built.  libdeflate is most heavily optimized
for gcc and clang, but MSVC is supported fairly well now too.

The recommended optimization flag is `-O2`, and the `CMakeLists.txt` sets this
for release builds.  `-O3` is fine too, but often `-O2` actually gives better
results.  It's unnecessary to add flags such as `-mavx2` or `/arch:AVX2`, though
you can do so if you want to.  Most of the relevant optimized functions are
built regardless of such flags, and appropriate ones are selected at runtime.

# API

libdeflate has a simple API that is not zlib-compatible.  You can create
compressors and decompressors and use them to compress or decompress buffers.
See libdeflate.h for details.

There is currently no support for streaming.  This has been considered, but it
always significantly increases complexity and slows down fast paths.
Unfortunately, at this point it remains a future TODO.  So: if your application
compresses data in "chunks", say, less than 1 MB in size, then libdeflate is a
great choice for you; that's what it's designed to do.  This is perfect for
certain use cases such as transparent filesystem compression.  But if your
application compresses large files as a single compressed stream, similarly to
the `gzip` program, then libdeflate isn't for you.

Note that with chunk-based compression, you generally should have the
uncompressed size of each chunk stored outside of the compressed data itself.
This enables you to allocate an output buffer of the correct size without
guessing.  However, libdeflate's decompression routines do optionally provide
the actual number of output bytes in case you need it.

Windows developers: note that the calling convention of libdeflate.dll is
"cdecl".  (libdeflate v1.4 through v1.12 used "stdcall" instead.)

# Bindings for other programming languages

The libdeflate project itself only provides a C library.  If you need to use
libdeflate from a programming language other than C or C++, consider using the
following bindings:

* C#: [LibDeflate.NET](https://github.com/jzebedee/LibDeflate.NET)
* Go: [go-libdeflate](https://github.com/4kills/go-libdeflate)
* Java: [libdeflate-java](https://github.com/astei/libdeflate-java)
* Julia: [LibDeflate.jl](https://github.com/jakobnissen/LibDeflate.jl)
* Nim: [libdeflate-nim](https://github.com/gemesa/libdeflate-nim)
* Perl: [Gzip::Libdeflate](https://github.com/benkasminbullock/gzip-libdeflate)
* PHP: [ext-libdeflate](https://github.com/pmmp/ext-libdeflate)
* Python: [deflate](https://github.com/dcwatson/deflate)
* Ruby: [libdeflate-ruby](https://github.com/kaorimatz/libdeflate-ruby)
* Rust: [libdeflater](https://github.com/adamkewley/libdeflater)

Note: these are third-party projects which haven't necessarily been vetted by
the authors of libdeflate.  Please direct all questions, bugs, and improvements
for these bindings to their authors.

Also, unfortunately many of these bindings bundle or pin an old version of
libdeflate.  To avoid known issues in old versions and to improve performance,
before using any of these bindings please ensure that the bundled or pinned
version of libdeflate has been upgraded to the latest release.

# DEFLATE vs. zlib vs. gzip

The DEFLATE format ([rfc1951](https://www.ietf.org/rfc/rfc1951.txt)), the zlib
format ([rfc1950](https://www.ietf.org/rfc/rfc1950.txt)), and the gzip format
([rfc1952](https://www.ietf.org/rfc/rfc1952.txt)) are commonly confused with
each other as well as with the [zlib software library](http://zlib.net), which
actually supports all three formats.  libdeflate (this library) also supports
all three formats.

Briefly, DEFLATE is a raw compressed stream, whereas zlib and gzip are different
wrappers for this stream.  Both zlib and gzip include checksums, but gzip can
include extra information such as the original filename.  Generally, you should
choose a format as follows:

- If you are compressing whole files with no subdivisions, similar to the `gzip`
  program, you probably should use the gzip format.
- Otherwise, if you don't need the features of the gzip header and footer but do
  still want a checksum for corruption detection, you probably should use the
  zlib format.
- Otherwise, you probably should use raw DEFLATE.  This is ideal if you don't
  need checksums, e.g. because they're simply not needed for your use case or
  because you already compute your own checksums that are stored separately from
  the compressed stream.

Note that gzip and zlib streams can be distinguished from each other based on
their starting bytes, but this is not necessarily true of raw DEFLATE streams.

# Compression levels

An often-underappreciated fact of compression formats such as DEFLATE is that
there are an enormous number of different ways that a given input could be
compressed.  Different algorithms and different amounts of computation time will
result in different compression ratios, while remaining equally compatible with
the decompressor.

For this reason, the commonly used zlib library provides nine compression
levels.  Level 1 is the fastest but provides the worst compression; level 9
provides the best compression but is the slowest.  It defaults to level 6.
libdeflate uses this same design but is designed to improve on both zlib's
performance *and* compression ratio at every compression level.  In addition,
libdeflate's levels go [up to 12](https://xkcd.com/670/) to make room for a
minimum-cost-path based algorithm (sometimes called "optimal parsing") that can
significantly improve on zlib's compression ratio.

If you are using DEFLATE (or zlib, or gzip) in your application, you should test
different levels to see which works best for your application.

# Motivation

Despite DEFLATE's widespread use mainly through the zlib library, in the
compression community this format from the early 1990s is often considered
obsolete.  And in a few significant ways, it is.

So why implement DEFLATE at all, instead of focusing entirely on
bzip2/LZMA/xz/LZ4/LZX/ZSTD/Brotli/LZHAM/LZFSE/[insert cool new format here]?

To do something better, you need to understand what came before.  And it turns
out that most ideas from DEFLATE are still relevant.  Many of the newer formats
share a similar structure as DEFLATE, with different tweaks.  The effects of
trivial but very useful tweaks, such as increasing the sliding window size, are
often confused with the effects of nontrivial but less useful tweaks.  And
actually, many of these formats are similar enough that common algorithms and
optimizations (e.g. those dealing with LZ77 matchfinding) can be reused.

In addition, comparing compressors fairly is difficult because the performance
of a compressor depends heavily on optimizations which are not intrinsic to the
compression format itself.  In this respect, the zlib library sometimes compares
poorly to certain newer code because zlib is not well optimized for modern
processors.  libdeflate addresses this by providing an optimized DEFLATE
implementation which can be used for benchmarking purposes.  And, of course,
real applications can use it as well.

# License

libdeflate is [MIT-licensed](COPYING).

I am not aware of any patents or patent applications relevant to libdeflate.
