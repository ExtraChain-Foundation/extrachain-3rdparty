android {
    INCLUDEPATH += $$PWD/libs
      TODO: armv7

    android:contains(QT_ARCH, arm) {
        INCLUDEPATH += $$PWD/gmp/android/armeabi-v7a
        LIBS += -L$$PWD/gmp/android/armeabi-v7a
    }

    android:contains(QT_ARCH, arm64) {
        INCLUDEPATH += $$PWD/gmp/android/arm64-v8a
        LIBS += -L$$PWD/gmp/android/arm64-v8a
    }
}

linux {
    LIBS += -lgmp -lgmpxx
}

ios {
}

windows {
    !contains(QMAKE_TARGET.arch, x86_64) {
        message("x86 build")
        LIBS += -L$$PWD/gmp/windows/x32
        INCLUDEPATH += $$PWD/gmp/windows/x32
    } else {
        message("x86_64 build")
        LIBS += -L$$PWD/gmp/windows/x64
        INCLUDEPATH += $$PWD/gmp/windows/x64
    }

    LIBS += -lmpfr -lmpir
}
