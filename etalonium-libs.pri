contains(DEFINES, ETALONIUM_CLIENT) {
    include($$PWD/QZXing/QZXing.pri)
    include($$PWD/SortFilterProxyModel/SortFilterProxyModel.pri)
    include($$PWD/statusbar/statusbar.pri)
}

include($$PWD/OpenSSL/openssl.pri)
include($$PWD/asyncfuture/asyncfuture.pri)
INCLUDEPATH += $$PWD/boolinq
INCLUDEPATH += $$PWD/sqlite
HEADERS += $$PWD/sqlite/sqlite3.h
SOURCES += $$PWD/sqlite/sqlite3.c

message($$ANDROID_TARGET_ARCH)

android {
    INCLUDEPATH += $$PWD/libs

    contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
        INCLUDEPATH += $$PWD/gmp/android/armeabi-v7a
        LIBS += -L$$PWD/gmp/android/armeabi-v7a
        ANDROID_EXTRA_LIBS += \
            $$PWD/gmp/android/armeabi-v7a/libgmp.so \
            $$PWD/gmp/android/armeabi-v7a/libgmpxx.so
    }

    contains(ANDROID_TARGET_ARCH,arm64-v8a) {
        INCLUDEPATH += $$PWD/gmp/android/arm64-v8a
        LIBS += -L$$PWD/gmp/android/arm64-v8a
        ANDROID_EXTRA_LIBS += \
            $$PWD/gmp/android/arm64-v8a/libgmp.so \
            $$PWD/gmp/android/arm64-v8a/libgmpxx.so
    }

    contains(ANDROID_TARGET_ARCH,x86) {
        INCLUDEPATH += $$PWD/gmp/android/x86
        LIBS += -L$$PWD/gmp/android/x86
        ANDROID_EXTRA_LIBS += \
            $$PWD/gmp/android/x86/libgmp.so \
            $$PWD/gmp/android/x86/libgmpxx.so
    }

    contains(ANDROID_TARGET_ARCH,x86_64) {
        INCLUDEPATH += $$PWD/gmp/android/x86_64
        LIBS += -L$$PWD/gmp/android/x86_64
        ANDROID_EXTRA_LIBS += \
            $$PWD/gmp/android/x86_64/libgmp.so \
            $$PWD/gmp/android/x86_64/libgmpxx.so
    }
}

linux {
    LIBS += -lgmp -lgmpxx
    LIBS += -ldl # for sqlite
}

ios {
    LIBS += -L$$PWD/gmp/ios -lgmp -lgmpxx
    INCLUDEPATH += $$PWD/gmp/ios
}

macos {
    LIBS += -L$$PWD/gmp/macos -lgmp -lgmpxx
    INCLUDEPATH += $$PWD/gmp/macos
}

windows { # TODO: only x64
    LIBS += -L$$PWD/gmp/windows/x64
    INCLUDEPATH += $$PWD/gmp/windows/x64
    LIBS += -lmpfr -lmpir
}
