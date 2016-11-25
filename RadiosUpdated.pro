QT += quick quickcontrols2 multimedia qml androidextras

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
    RadioList.qml \
    ToolBarDelegate.qml \
    android/src/com/ahmed/QAndroidResultReceiver/jniExport/jniExport.java \
    android/src/com/ahmed/radios/NotificationClient.java \
    android/AndroidManifest.xml \
    android/AndroidManifest.xml \
    android/res/values/libs.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/res/drawable/icon.png

HEADERS += \
    radiostation.h \
    android/src/com_ahmed_QAndroidResultReceiver_jniExport_jniExport.h

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
