QT += quick quickcontrols2 androidextras core widgets

CONFIG += debug
CONFIG += c++11

SOURCES += main.cpp \
    notificationclient.cpp \
    android/src/com_ahmed_qandroidresultreceiver_jniexport_jniexport.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    android/AndroidManifest.xml \
    android/src/com/ahmed/radios/NotificationClient.java \
    android/src/com/ahmed/QAndroidResultReceiver/jniExport/jniExport.java
ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

HEADERS += \
    notificationclient.h \
    android/src/com_ahmed_QAndroidResultReceiver_jniExport_jniExport.h
