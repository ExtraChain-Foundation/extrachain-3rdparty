contains(DEFINES, ECLIENT) {
    include($$PWD/QZXing/QZXing.pri)
    # include($$PWD/SortFilterProxyModel/SortFilterProxyModel.pri)
    include($$PWD/statusbar/statusbar.pri)
}

include($$PWD/libsodium/libsodium.pri)

include($$PWD/OpenSSL/openssl.pri)
# include($$PWD/asyncfuture/asyncfuture.pri)
INCLUDEPATH += $$PWD/boolinq
INCLUDEPATH += $$PWD/sqlite
HEADERS += $$PWD/sqlite/sqlite3.h
SOURCES += $$PWD/sqlite/sqlite3.c

android {
    INCLUDEPATH += $$PWD/libs
    ANDROID_EXTRA_LIBS += \
        $$PWD/gmp/android/armeabi-v7a/libgmp.so \
        $$PWD/gmp/android/armeabi-v7a/libgmpxx.so \
        $$PWD/gmp/android/arm64-v8a/libgmp.so \
        $$PWD/gmp/android/arm64-v8a/libgmpxx.so \
        $$PWD/gmp/android/x86/libgmp.so \
        $$PWD/gmp/android/x86/libgmpxx.so \
        $$PWD/gmp/android/x86_64/libgmp.so \
        $$PWD/gmp/android/x86_64/libgmpxx.so

    contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
        INCLUDEPATH += $$PWD/gmp/android/armeabi-v7a
        LIBS += -L$$PWD/gmp/android/armeabi-v7a
    }

    contains(ANDROID_TARGET_ARCH,arm64-v8a) {
        INCLUDEPATH += $$PWD/gmp/android/arm64-v8a
        LIBS += -L$$PWD/gmp/android/arm64-v8a
    }

    contains(ANDROID_TARGET_ARCH,x86) {
        INCLUDEPATH += $$PWD/gmp/android/x86
        LIBS += -L$$PWD/gmp/android/x86
    }

    contains(ANDROID_TARGET_ARCH,x86_64) {
        INCLUDEPATH += $$PWD/gmp/android/x86_64
        LIBS += -L$$PWD/gmp/android/x86_64
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

windows {
    contains(QT_ARCH,i386) {
        LIBS += -L$$PWD/gmp/windows/x32
        INCLUDEPATH += $$PWD/gmp/windows/x32
        LIBS += -lmpfr -lmpir
    }
    contains(QT_ARCH,x86_64) {
        LIBS += -L$$PWD/gmp/windows/x64
        INCLUDEPATH += $$PWD/gmp/windows/x64
        LIBS += -lmpfr -lmpir
    }
}

!android:linux: QMAKE_CXX=ccache $$QMAKE_CXX
QMAKE_SPEC_HOST = $$[QMAKE_SPEC]
contains(QMAKE_SPEC_HOST,.*win32.*): android: QMAKE_CXX=$$PWD/ccache/windows/ccache.exe $$QMAKE_CXX # 4.3
contains(QMAKE_SPEC_HOST,.*linux.*): android: QMAKE_CXX=ccache $$QMAKE_CXX
# contains(QMAKE_SPEC_HOST,.*macx.*):
