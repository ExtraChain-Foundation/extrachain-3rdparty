INCLUDEPATH += $$PWD/boolinq
INCLUDEPATH += $$PWD/sqlite
HEADERS += $$PWD/sqlite/sqlite3.h
SOURCES += $$PWD/sqlite/sqlite3.c
message($$QT_ARCH)
android {
    INCLUDEPATH += $$PWD/libs

    android:contains(QT_ARCH, armeabi-v7a) {
        INCLUDEPATH += $$PWD/gmp/android/armeabi-v7a
        LIBS += -L$$PWD/gmp/android/armeabi-v7a
    }

    android:contains(QT_ARCH, arm64-v8a) {
        INCLUDEPATH += $$PWD/gmp/android/arm64-v8a
        LIBS += -L$$PWD/gmp/android/arm64-v8a
    }

    android:contains(QT_ARCH, x86) {
        INCLUDEPATH += $$PWD/gmp/android/x86
        LIBS += -L$$PWD/gmp/android/x86
    }

    android:contains(QT_ARCH, x86_64) {
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


windows { # TODO: only x64
    LIBS += -L$$PWD/gmp/windows/x64
    INCLUDEPATH += $$PWD/gmp/windows/x64
    LIBS += -lmpfr -lmpir
}
