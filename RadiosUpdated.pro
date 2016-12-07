QT += quickcontrols2 multimedia
android {
    message("* Using settings for Android.")
    QT += androidextras
}
CONFIG += c++11

SOURCES += main.cpp \
    radiostation.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    *.qml \
    android/src/com/ahmed/QAndroidResultReceiver/jniExport/jniExport.java \
    android/src/com/ahmed/biladiradio/* \
    android/AndroidManifest.xml

HEADERS += \
    radiostation.h

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

