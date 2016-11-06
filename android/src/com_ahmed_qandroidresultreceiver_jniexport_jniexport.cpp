#include "com_ahmed_QAndroidResultReceiver_jniExport_jniExport.h"
#include <QMessageBox>

JNIEXPORT jint JNICALL Java_com_ahmed_QAndroidResultReceiver_jniExport_jniExport_intMethod
  (JNIEnv *, jobject, jint){

    QMessageBox msgBox;
    msgBox.setText("JE suis de retour");
    msgBox.exec();

    return 1;
}
