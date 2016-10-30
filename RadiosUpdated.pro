QT += quick quickcontrols2 androidextras core widgets

CONFIG += debug
CONFIG += c++11

SOURCES += main.cpp \
    notificationclient.cpp \
    android/src/org_qtproject_example_QAndroidResultReceiver_jniExport.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/src/org/qtproject/example/notification/NotificationClient.java \
    android/src/org/qtproject/example/QAndroidResultReceiver/jniExport.java

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

HEADERS += \
    notificationclient.h \
    android/src/org_qtproject_example_QAndroidResultReceiver_jniExport.h
