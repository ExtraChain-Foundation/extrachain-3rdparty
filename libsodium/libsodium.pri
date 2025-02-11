INCLUDEPATH += $$PWD/include/sodium
INCLUDEPATH += $$PWD/include

win32-clang-msvc: QMAKE_CFLAGS += -msse4.1 -maes -mavx2 -msse2 -mssse3 -mpclmul # -march=native
DEFINES += SODIUM_STATIC

DISTFILES += \
    $$PWD/crypto_stream/salsa20/xmm6/salsa20_xmm6-asm.S

HEADERS += \
    $$PWD/crypto_core/ed25519/ref10/fe_25_5/base.h \
    $$PWD/crypto_core/ed25519/ref10/fe_25_5/base2.h \
    $$PWD/crypto_core/ed25519/ref10/fe_25_5/constants.h \
    $$PWD/crypto_core/ed25519/ref10/fe_25_5/fe.h \
    $$PWD/crypto_core/ed25519/ref10/fe_51/base.h \
    $$PWD/crypto_core/ed25519/ref10/fe_51/base2.h \
    $$PWD/crypto_core/ed25519/ref10/fe_51/constants.h \
    $$PWD/crypto_core/ed25519/ref10/fe_51/fe.h \
    $$PWD/crypto_generichash/blake2b/ref/blake2.h \
    $$PWD/crypto_generichash/blake2b/ref/blake2b-compress-avx2.h \
    $$PWD/crypto_generichash/blake2b/ref/blake2b-compress-sse41.h \
    $$PWD/crypto_generichash/blake2b/ref/blake2b-compress-ssse3.h \
    $$PWD/crypto_generichash/blake2b/ref/blake2b-load-avx2.h \
    $$PWD/crypto_generichash/blake2b/ref/blake2b-load-sse2.h \
    $$PWD/crypto_generichash/blake2b/ref/blake2b-load-sse41.h \
    $$PWD/crypto_onetimeauth/poly1305/donna/poly1305_donna.h \
    $$PWD/crypto_onetimeauth/poly1305/donna/poly1305_donna32.h \
    $$PWD/crypto_onetimeauth/poly1305/donna/poly1305_donna64.h \
    $$PWD/crypto_onetimeauth/poly1305/onetimeauth_poly1305.h \
    $$PWD/crypto_onetimeauth/poly1305/sse2/poly1305_sse2.h \
    $$PWD/crypto_pwhash/argon2/argon2-core.h \
    $$PWD/crypto_pwhash/argon2/argon2-encoding.h \
    $$PWD/crypto_pwhash/argon2/argon2.h \
    $$PWD/crypto_pwhash/argon2/blake2b-long.h \
    $$PWD/crypto_pwhash/argon2/blamka-round-avx2.h \
    $$PWD/crypto_pwhash/argon2/blamka-round-avx512f.h \
    $$PWD/crypto_pwhash/argon2/blamka-round-ref.h \
    $$PWD/crypto_pwhash/argon2/blamka-round-ssse3.h \
    $$PWD/crypto_pwhash/scryptsalsa208sha256/crypto_scrypt.h \
    $$PWD/crypto_pwhash/scryptsalsa208sha256/pbkdf2-sha256.h \
    $$PWD/crypto_scalarmult/curve25519/ref10/x25519_ref10.h \
    $$PWD/crypto_scalarmult/curve25519/sandy2x/consts.S \
    $$PWD/crypto_scalarmult/curve25519/sandy2x/consts_namespace.h \
    $$PWD/crypto_scalarmult/curve25519/sandy2x/curve25519_sandy2x.h \
    $$PWD/crypto_scalarmult/curve25519/sandy2x/fe.h \
    $$PWD/crypto_scalarmult/curve25519/sandy2x/fe51.h \
    $$PWD/crypto_scalarmult/curve25519/sandy2x/fe51_mul.S \
    $$PWD/crypto_scalarmult/curve25519/sandy2x/fe51_namespace.h \
    $$PWD/crypto_scalarmult/curve25519/sandy2x/fe51_nsquare.S \
    $$PWD/crypto_scalarmult/curve25519/sandy2x/fe51_pack.S \
    $$PWD/crypto_scalarmult/curve25519/sandy2x/ladder.S \
    $$PWD/crypto_scalarmult/curve25519/sandy2x/ladder.h \
    $$PWD/crypto_scalarmult/curve25519/sandy2x/ladder_namespace.h \
    $$PWD/crypto_scalarmult/curve25519/sandy2x/sandy2x.S \
    $$PWD/crypto_scalarmult/curve25519/scalarmult_curve25519.h \
    $$PWD/crypto_shorthash/siphash24/ref/shorthash_siphash_ref.h \
    $$PWD/crypto_sign/ed25519/ref10/sign_ed25519_ref10.h \
    $$PWD/crypto_stream/chacha20/dolbeau/chacha20_dolbeau-avx2.h \
    $$PWD/crypto_stream/chacha20/dolbeau/chacha20_dolbeau-ssse3.h \
    $$PWD/crypto_stream/chacha20/dolbeau/u0.h \
    $$PWD/crypto_stream/chacha20/dolbeau/u1.h \
    $$PWD/crypto_stream/chacha20/dolbeau/u4.h \
    $$PWD/crypto_stream/chacha20/dolbeau/u8.h \
    $$PWD/crypto_stream/chacha20/ref/chacha20_ref.h \
    $$PWD/crypto_stream/chacha20/stream_chacha20.h \
    $$PWD/crypto_stream/salsa20/ref/salsa20_ref.h \
    $$PWD/crypto_stream/salsa20/stream_salsa20.h \
    $$PWD/crypto_stream/salsa20/xmm6/salsa20_xmm6.h \
    $$PWD/crypto_stream/salsa20/xmm6int/salsa20_xmm6int-avx2.h \
    $$PWD/crypto_stream/salsa20/xmm6int/salsa20_xmm6int-sse2.h \
    $$PWD/crypto_stream/salsa20/xmm6int/u0.h \
    $$PWD/crypto_stream/salsa20/xmm6int/u1.h \
    $$PWD/crypto_stream/salsa20/xmm6int/u4.h \
    $$PWD/crypto_stream/salsa20/xmm6int/u8.h \ \
    $$PWD/include/sodium.h \
    $$PWD/include/sodium/core.h \
    $$PWD/include/sodium/crypto_aead_aes256gcm.h \
    $$PWD/include/sodium/crypto_aead_chacha20poly1305.h \
    $$PWD/include/sodium/crypto_aead_xchacha20poly1305.h \
    $$PWD/include/sodium/crypto_auth.h \
    $$PWD/include/sodium/crypto_auth_hmacsha256.h \
    $$PWD/include/sodium/crypto_auth_hmacsha512.h \
    $$PWD/include/sodium/crypto_auth_hmacsha512256.h \
    $$PWD/include/sodium/crypto_box.h \
    $$PWD/include/sodium/crypto_box_curve25519xchacha20poly1305.h \
    $$PWD/include/sodium/crypto_box_curve25519xsalsa20poly1305.h \
    $$PWD/include/sodium/crypto_core_ed25519.h \
    $$PWD/include/sodium/crypto_core_hchacha20.h \
    $$PWD/include/sodium/crypto_core_hsalsa20.h \
    $$PWD/include/sodium/crypto_core_ristretto255.h \
    $$PWD/include/sodium/crypto_core_salsa20.h \
    $$PWD/include/sodium/crypto_core_salsa2012.h \
    $$PWD/include/sodium/crypto_core_salsa208.h \
    $$PWD/include/sodium/crypto_generichash.h \
    $$PWD/include/sodium/crypto_generichash_blake2b.h \
    $$PWD/include/sodium/crypto_hash.h \
    $$PWD/include/sodium/crypto_hash_sha256.h \
    $$PWD/include/sodium/crypto_hash_sha512.h \
    $$PWD/include/sodium/crypto_kdf.h \
    $$PWD/include/sodium/crypto_kdf_blake2b.h \
    $$PWD/include/sodium/crypto_kx.h \
    $$PWD/include/sodium/crypto_onetimeauth.h \
    $$PWD/include/sodium/crypto_onetimeauth_poly1305.h \
    $$PWD/include/sodium/crypto_pwhash.h \
    $$PWD/include/sodium/crypto_pwhash_argon2i.h \
    $$PWD/include/sodium/crypto_pwhash_argon2id.h \
    $$PWD/include/sodium/crypto_pwhash_scryptsalsa208sha256.h \
    $$PWD/include/sodium/crypto_scalarmult.h \
    $$PWD/include/sodium/crypto_scalarmult_curve25519.h \
    $$PWD/include/sodium/crypto_scalarmult_ed25519.h \
    $$PWD/include/sodium/crypto_scalarmult_ristretto255.h \
    $$PWD/include/sodium/crypto_secretbox.h \
    $$PWD/include/sodium/crypto_secretbox_xchacha20poly1305.h \
    $$PWD/include/sodium/crypto_secretbox_xsalsa20poly1305.h \
    $$PWD/include/sodium/crypto_secretstream_xchacha20poly1305.h \
    $$PWD/include/sodium/crypto_shorthash.h \
    $$PWD/include/sodium/crypto_shorthash_siphash24.h \
    $$PWD/include/sodium/crypto_sign.h \
    $$PWD/include/sodium/crypto_sign_ed25519.h \
    $$PWD/include/sodium/crypto_sign_edwards25519sha512batch.h \
    $$PWD/include/sodium/crypto_stream.h \
    $$PWD/include/sodium/crypto_stream_chacha20.h \
    $$PWD/include/sodium/crypto_stream_salsa20.h \
    $$PWD/include/sodium/crypto_stream_salsa2012.h \
    $$PWD/include/sodium/crypto_stream_salsa208.h \
    $$PWD/include/sodium/crypto_stream_xchacha20.h \
    $$PWD/include/sodium/crypto_stream_xsalsa20.h \
    $$PWD/include/sodium/crypto_verify_16.h \
    $$PWD/include/sodium/crypto_verify_32.h \
    $$PWD/include/sodium/crypto_verify_64.h \
    $$PWD/include/sodium/export.h \
    $$PWD/include/sodium/randombytes.h \
    $$PWD/include/sodium/randombytes_internal_random.h \
    $$PWD/include/sodium/randombytes_sysrandom.h \
    $$PWD/include/sodium/runtime.h \
    $$PWD/include/sodium/sodium_version.h \
    $$PWD/include/sodium/utils.h

SOURCES += \
    $$PWD/crypto_aead/aes256gcm/aesni/aead_aes256gcm_aesni.c \
    $$PWD/crypto_aead/chacha20poly1305/sodium/aead_chacha20poly1305.c \
    $$PWD/crypto_aead/xchacha20poly1305/sodium/aead_xchacha20poly1305.c \
    $$PWD/crypto_auth/crypto_auth.c \
    $$PWD/crypto_auth/hmacsha256/auth_hmacsha256.c \
    $$PWD/crypto_auth/hmacsha512/auth_hmacsha512.c \
    $$PWD/crypto_auth/hmacsha512256/auth_hmacsha512256.c \
    $$PWD/crypto_box/crypto_box.c \
    $$PWD/crypto_box/crypto_box_easy.c \
    $$PWD/crypto_box/crypto_box_seal.c \
    $$PWD/crypto_box/curve25519xchacha20poly1305/box_curve25519xchacha20poly1305.c \
    $$PWD/crypto_box/curve25519xchacha20poly1305/box_seal_curve25519xchacha20poly1305.c \
    $$PWD/crypto_box/curve25519xsalsa20poly1305/box_curve25519xsalsa20poly1305.c \
    $$PWD/crypto_core/ed25519/core_ed25519.c \
    $$PWD/crypto_core/ed25519/core_ristretto255.c \
    $$PWD/crypto_core/ed25519/ref10/ed25519_ref10.c \
    $$PWD/crypto_core/hchacha20/core_hchacha20.c \
    $$PWD/crypto_core/hsalsa20/core_hsalsa20.c \
    $$PWD/crypto_core/hsalsa20/ref2/core_hsalsa20_ref2.c \
    $$PWD/crypto_core/salsa/ref/core_salsa_ref.c \
    $$PWD/crypto_generichash/blake2b/generichash_blake2.c \
    $$PWD/crypto_generichash/blake2b/ref/blake2b-compress-avx2.c \
    $$PWD/crypto_generichash/blake2b/ref/blake2b-compress-ref.c \
    $$PWD/crypto_generichash/blake2b/ref/blake2b-compress-sse41.c \
    $$PWD/crypto_generichash/blake2b/ref/blake2b-compress-ssse3.c \
    $$PWD/crypto_generichash/blake2b/ref/blake2b-ref.c \
    $$PWD/crypto_generichash/blake2b/ref/generichash_blake2b.c \
    $$PWD/crypto_generichash/crypto_generichash.c \
    $$PWD/crypto_hash/crypto_hash.c \
    $$PWD/crypto_hash/sha256/cp/hash_sha256_cp.c \
    $$PWD/crypto_hash/sha256/hash_sha256.c \
    $$PWD/crypto_hash/sha512/cp/hash_sha512_cp.c \
    $$PWD/crypto_hash/sha512/hash_sha512.c \
    $$PWD/crypto_kdf/blake2b/kdf_blake2b.c \
    $$PWD/crypto_kdf/crypto_kdf.c \
    $$PWD/crypto_kx/crypto_kx.c \
    $$PWD/crypto_onetimeauth/crypto_onetimeauth.c \
    $$PWD/crypto_onetimeauth/poly1305/donna/poly1305_donna.c \
    $$PWD/crypto_onetimeauth/poly1305/onetimeauth_poly1305.c \
    $$PWD/crypto_onetimeauth/poly1305/sse2/poly1305_sse2.c \
    $$PWD/crypto_pwhash/argon2/argon2-core.c \
    $$PWD/crypto_pwhash/argon2/argon2-encoding.c \
    $$PWD/crypto_pwhash/argon2/argon2-fill-block-avx2.c \
    $$PWD/crypto_pwhash/argon2/argon2-fill-block-avx512f.c \
    $$PWD/crypto_pwhash/argon2/argon2-fill-block-ref.c \
    $$PWD/crypto_pwhash/argon2/argon2-fill-block-ssse3.c \
    $$PWD/crypto_pwhash/argon2/argon2.c \
    $$PWD/crypto_pwhash/argon2/blake2b-long.c \
    $$PWD/crypto_pwhash/argon2/pwhash_argon2i.c \
    $$PWD/crypto_pwhash/argon2/pwhash_argon2id.c \
    $$PWD/crypto_pwhash/crypto_pwhash.c \
    $$PWD/crypto_pwhash/scryptsalsa208sha256/crypto_scrypt-common.c \
    $$PWD/crypto_pwhash/scryptsalsa208sha256/nosse/pwhash_scryptsalsa208sha256_nosse.c \
    $$PWD/crypto_pwhash/scryptsalsa208sha256/pbkdf2-sha256.c \
    $$PWD/crypto_pwhash/scryptsalsa208sha256/pwhash_scryptsalsa208sha256.c \
    $$PWD/crypto_pwhash/scryptsalsa208sha256/scrypt_platform.c \
    $$PWD/crypto_pwhash/scryptsalsa208sha256/sse/pwhash_scryptsalsa208sha256_sse.c \
    $$PWD/crypto_scalarmult/crypto_scalarmult.c \
    $$PWD/crypto_scalarmult/curve25519/ref10/x25519_ref10.c \
    $$PWD/crypto_scalarmult/curve25519/sandy2x/curve25519_sandy2x.c \
    $$PWD/crypto_scalarmult/curve25519/sandy2x/fe51_invert.c \
    $$PWD/crypto_scalarmult/curve25519/sandy2x/fe_frombytes_sandy2x.c \
    $$PWD/crypto_scalarmult/curve25519/scalarmult_curve25519.c \
    $$PWD/crypto_scalarmult/ed25519/ref10/scalarmult_ed25519_ref10.c \
    $$PWD/crypto_scalarmult/ristretto255/ref10/scalarmult_ristretto255_ref10.c \
    $$PWD/crypto_secretbox/crypto_secretbox.c \
    $$PWD/crypto_secretbox/crypto_secretbox_easy.c \
    $$PWD/crypto_secretbox/xchacha20poly1305/secretbox_xchacha20poly1305.c \
    $$PWD/crypto_secretbox/xsalsa20poly1305/secretbox_xsalsa20poly1305.c \
    $$PWD/crypto_secretstream/xchacha20poly1305/secretstream_xchacha20poly1305.c \
    $$PWD/crypto_shorthash/crypto_shorthash.c \
    $$PWD/crypto_shorthash/siphash24/ref/shorthash_siphash24_ref.c \
    $$PWD/crypto_shorthash/siphash24/ref/shorthash_siphashx24_ref.c \
    $$PWD/crypto_shorthash/siphash24/shorthash_siphash24.c \
    $$PWD/crypto_shorthash/siphash24/shorthash_siphashx24.c \
    $$PWD/crypto_sign/crypto_sign.c \
    $$PWD/crypto_sign/ed25519/ref10/keypair.c \
    $$PWD/crypto_sign/ed25519/ref10/obsolete.c \
    $$PWD/crypto_sign/ed25519/ref10/open.c \
    $$PWD/crypto_sign/ed25519/ref10/sign.c \
    $$PWD/crypto_sign/ed25519/sign_ed25519.c \
    $$PWD/crypto_stream/chacha20/dolbeau/chacha20_dolbeau-avx2.c \
    $$PWD/crypto_stream/chacha20/dolbeau/chacha20_dolbeau-ssse3.c \
    $$PWD/crypto_stream/chacha20/ref/chacha20_ref.c \
    $$PWD/crypto_stream/chacha20/stream_chacha20.c \
    $$PWD/crypto_stream/crypto_stream.c \
    $$PWD/crypto_stream/salsa20/ref/salsa20_ref.c \
    $$PWD/crypto_stream/salsa20/stream_salsa20.c \
    $$PWD/crypto_stream/salsa20/xmm6/salsa20_xmm6.c \
    $$PWD/crypto_stream/salsa20/xmm6int/salsa20_xmm6int-avx2.c \
    $$PWD/crypto_stream/salsa20/xmm6int/salsa20_xmm6int-sse2.c \
    $$PWD/crypto_stream/salsa2012/ref/stream_salsa2012_ref.c \
    $$PWD/crypto_stream/salsa2012/stream_salsa2012.c \
    $$PWD/crypto_stream/salsa208/ref/stream_salsa208_ref.c \
    $$PWD/crypto_stream/salsa208/stream_salsa208.c \
    $$PWD/crypto_stream/xchacha20/stream_xchacha20.c \
    $$PWD/crypto_stream/xsalsa20/stream_xsalsa20.c \
    $$PWD/crypto_verify/sodium/verify.c \
    $$PWD/randombytes/internal/randombytes_internal_random.c \
    $$PWD/randombytes/randombytes.c \
    $$PWD/randombytes/sysrandom/randombytes_sysrandom.c \
    $$PWD/sodium/codecs.c \
    $$PWD/sodium/core.c \
    $$PWD/sodium/runtime.c \
    $$PWD/sodium/sodium_version.c \
    $$PWD/sodium/utils.c
