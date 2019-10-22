android {
    INCLUDEPATH += $$PWD/libs
    LIBS += -L$$PWD/android/libs/armeabi-v7a -lgmp -lgmpxx
}
linux:!android {
    LIBS += -lgmp -lgmpxx
} 
