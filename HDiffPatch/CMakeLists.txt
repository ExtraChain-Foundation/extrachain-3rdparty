cmake_minimum_required(VERSION 3.10)
project(HDiffPatch C CXX)

# Configuration options
option(DIR_DIFF "Enable directory diff support" ON)
option(USE_MT "Enable multithreading" ON)
option(USE_LIBDEFLATE "Use libdeflate" ON)
option(USE_ZLIB "Compile zlib source code" ON)
option(USE_LZMA "Compile LZMA source code" ON)
option(USE_ARM64_ASM "Use ARM64 ASM optimization for LZMA" OFF)
option(USE_CRC_EMU "Use software CRC" OFF)
option(SUPPORT_ATOMIC_U64 "Support atomic uint64" ON)
option(USE_ZSTD "Compile Zstandard source code" ON)
option(USE_MD5 "Use MD5 checksum" ON)
option(USE_VCDIFF "Support VCDIFF" ON)
option(USE_BSDIFF "Support bsdiff & bspatch" ON)
option(USE_BZIP2 "Support bzip2 compression" ON)

# Set paths for external libraries
set(HDiffPatch "${CMAKE_CURRENT_SOURCE_DIR}/HDiffPatch")
set(LZMA_PATH "${CMAKE_CURRENT_SOURCE_DIR}/lzma/C")
set(ZSTD_PATH "${CMAKE_CURRENT_SOURCE_DIR}/zstd/lib")
set(BZ2_PATH "${CMAKE_CURRENT_SOURCE_DIR}/bzip2")
set(ZLIB_PATH "${CMAKE_CURRENT_SOURCE_DIR}/zlib")
set(LDEF_PATH "${CMAKE_CURRENT_SOURCE_DIR}/libdeflate")
set(MD5_PATH "${CMAKE_CURRENT_SOURCE_DIR}/libmd5")

# Conditional definitions and compilations
if(USE_BZIP2)
    set(BZIP2_SOURCES
            ${BZ2_PATH}/blocksort.c
            ${BZ2_PATH}/bzlib.c
            ${BZ2_PATH}/compress.c
            ${BZ2_PATH}/crctable.c
            ${BZ2_PATH}/decompress.c
            ${BZ2_PATH}/huffman.c
            ${BZ2_PATH}/randtable.c
    )
endif()

if(USE_ZLIB)
    set(ZLIB_SOURCES
            ${ZLIB_PATH}/adler32.c
            ${ZLIB_PATH}/crc32.c
            ${ZLIB_PATH}/inffast.c
            ${ZLIB_PATH}/inflate.c
            ${ZLIB_PATH}/inftrees.c
            ${ZLIB_PATH}/trees.c
            ${ZLIB_PATH}/zutil.c
            ${ZLIB_PATH}/deflate.c
    )
endif()

if(USE_LZMA)
    set(LZMA_SOURCES
            ${LZMA_PATH}/LzmaDec.c
            ${LZMA_PATH}/Lzma2Dec.c
            ${LZMA_PATH}/CpuArch.c
            ${LZMA_PATH}/Alloc.c
            ${LZMA_PATH}/LzFind.c
            ${LZMA_PATH}/LzFindOpt.c
            ${LZMA_PATH}/LzmaEnc.c
            ${LZMA_PATH}/Lzma2Enc.c
            ${LZMA_PATH}/XzDec.c
            ${LZMA_PATH}/XzEnc.c
            ${LZMA_PATH}/7zDec.c
            ${LZMA_PATH}/7zCrc.c
            ${LZMA_PATH}/7zCrcOpt.c
            ${LZMA_PATH}/7zStream.c
            ${LZMA_PATH}/Alloc.c
            ${LZMA_PATH}/Bra.c
            ${LZMA_PATH}/Bra86.c
            ${LZMA_PATH}/BraIA64.c
            ${LZMA_PATH}/Delta.c
            ${LZMA_PATH}/LzFindMt.c
            ${LZMA_PATH}/MtCoder.c
            ${LZMA_PATH}/MtDec.c
            ${LZMA_PATH}/Sha256.c
            ${LZMA_PATH}/Sha256Opt.c
            ${LZMA_PATH}/Threads.c
            ${LZMA_PATH}/Xz.c
            ${LZMA_PATH}/XzCrc64.c
            ${LZMA_PATH}/XzCrc64Opt.c
    )
endif()

if(USE_ZSTD)
    set(ZSTD_SOURCES
            ${ZSTD_PATH}/common/debug.c
            ${ZSTD_PATH}/common/entropy_common.c
            ${ZSTD_PATH}/common/error_private.c
            ${ZSTD_PATH}/common/fse_decompress.c
            ${ZSTD_PATH}/common/xxhash.c
            ${ZSTD_PATH}/common/zstd_common.c
            ${ZSTD_PATH}/common/pool.c
            ${ZSTD_PATH}/common/threading.c
            ${ZSTD_PATH}/decompress/huf_decompress.c
            ${ZSTD_PATH}/decompress/zstd_ddict.c
            ${ZSTD_PATH}/decompress/zstd_decompress.c
            ${ZSTD_PATH}/decompress/zstd_decompress_block.c
            ${ZSTD_PATH}/compress/fse_compress.c
            ${ZSTD_PATH}/compress/hist.c
            ${ZSTD_PATH}/compress/huf_compress.c
            ${ZSTD_PATH}/compress/zstd_compress.c
            ${ZSTD_PATH}/compress/zstd_compress_literals.c
            ${ZSTD_PATH}/compress/zstd_compress_sequences.c
            ${ZSTD_PATH}/compress/zstd_compress_superblock.c
            ${ZSTD_PATH}/compress/zstd_double_fast.c
            ${ZSTD_PATH}/compress/zstd_fast.c
            ${ZSTD_PATH}/compress/zstd_lazy.c
            ${ZSTD_PATH}/compress/zstd_ldm.c
            ${ZSTD_PATH}/compress/zstd_opt.c
            ${ZSTD_PATH}/compress/zstdmt_compress.c
    )
endif()

# HDiffPatch library sources
set(HDIFFPATCH_SOURCES
        ${HDiffPatch}/libHDiffPatch/HPatch/patch.c
        ${HDiffPatch}/libHDiffPatch/HPatchLite/hpatch_lite.c
        ${HDiffPatch}/file_for_patch.c
        ${HDiffPatch}/hdiffz_import_patch.c
        ${HDiffPatch}/libHDiffPatch/HDiff/diff.cpp
        ${HDiffPatch}/libHDiffPatch/HDiff/match_block.cpp
        ${HDiffPatch}/libHDiffPatch/HDiff/private_diff/bytes_rle.cpp
        ${HDiffPatch}/libHDiffPatch/HDiff/private_diff/suffix_string.cpp
        ${HDiffPatch}/libHDiffPatch/HDiff/private_diff/compress_detect.cpp
        ${HDiffPatch}/libHDiffPatch/HDiff/private_diff/limit_mem_diff/digest_matcher.cpp
        ${HDiffPatch}/libHDiffPatch/HDiff/private_diff/limit_mem_diff/stream_serialize.cpp
        ${HDiffPatch}/libHDiffPatch/HDiff/private_diff/libdivsufsort/divsufsort64.cpp
        ${HDiffPatch}/libHDiffPatch/HDiff/private_diff/libdivsufsort/divsufsort.cpp
)

# Optional sources based on configuration
if(DIR_DIFF)
    list(APPEND HDIFFPATCH_SOURCES
            ${HDiffPatch}/dirDiffPatch/dir_diff/dir_diff.cpp
            ${HDiffPatch}/dirDiffPatch/dir_diff/dir_diff_tools.cpp
            ${HDiffPatch}/dirDiffPatch/dir_diff/dir_manifest.cpp
            ${HDiffPatch}/dirDiffPatch/dir_patch/dir_patch.c
            ${HDiffPatch}/dirDiffPatch/dir_patch/dir_patch_tools.c
            ${HDiffPatch}/dirDiffPatch/dir_patch/new_dir_output.c
            ${HDiffPatch}/dirDiffPatch/dir_patch/new_stream.c
            ${HDiffPatch}/dirDiffPatch/dir_patch/ref_stream.c
            ${HDiffPatch}/dirDiffPatch/dir_patch/res_handle_limit.c
            ${HDiffPatch}/libHDiffPatch/HDiff/private_diff/limit_mem_diff/adler_roll.c
    )
endif()

# Add sources from configured libraries
if(USE_BZIP2)
    list(APPEND HDIFFPATCH_SOURCES ${BZIP2_SOURCES})
endif()

if(USE_ZLIB)
    list(APPEND HDIFFPATCH_SOURCES ${ZLIB_SOURCES})
endif()

if(USE_LZMA)
    list(APPEND HDIFFPATCH_SOURCES ${LZMA_SOURCES})
endif()

if(USE_ZSTD)
    list(APPEND HDIFFPATCH_SOURCES ${ZSTD_SOURCES})
endif()

# Create static library
add_library(hdiffpatch STATIC ${HDIFFPATCH_SOURCES}
        ${HDiffPatch}/bsdiff_wrapper/bsdiff_wrapper.cpp
        ${HDiffPatch}/bsdiff_wrapper/bspatch_wrapper.c
        ${HDiffPatch}/vcdiff_wrapper/vcpatch_wrapper.c
        ${HDiffPatch}/vcdiff_wrapper/vcdiff_wrapper.cpp
        ${HDiffPatch}/libParallel/parallel_channel.cpp
        ${HDiffPatch}/libParallel/parallel_import.cpp
        ${HDiffPatch}/compress_parallel.cpp

        ${LDEF_PATH}/lib/deflate_compress.c
        ${LDEF_PATH}/lib/deflate_decompress.c
        ${LDEF_PATH}/lib/utils.c
        ${LDEF_PATH}/lib/x86/cpu_features.c

        ${MD5_PATH}/md5.c

        ${HDiffPatch}/hdiffz.cpp ${HDiffPatch}/hpatchz.c)

target_compile_definitions(
    hdiffpatch PUBLIC
    -DNDEBUG
    -D_IS_NEED_MAIN=0
    -D_LARGEFILE_SOURCE
    -D_FILE_OFFSET_BITS=64
    -D_CRT_SECURE_NO_WARNINGS
    -D_ChecksumPlugin_md5
    -DZSTD_DISABLE_ASM=1
)

# Include directories
target_include_directories(hdiffpatch PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${LZMA_PATH}
        ${ZSTD_PATH}
        ${ZSTD_PATH}/common
        ${ZSTD_PATH}/compress
        ${ZSTD_PATH}/decompress
        ${ZLIB_PATH}
        ${BZ2_PATH}
        ${MD5_PATH}
        ${LDEF_PATH}
)
