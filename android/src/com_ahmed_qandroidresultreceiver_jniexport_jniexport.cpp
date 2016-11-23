#include "com_ahmed_QAndroidResultReceiver_jniExport_jniExport.h"
#include <QMessageBox>

JNIEXPORT jint JNICALL Java_com_ahmed_QAndroidResultReceiver_jniExport_jniExport_intMethod
  (JNIEnv *, jobject, jint focusChange){

    QMessageBox msgBox;
    msgBox.setText("JE suis de retour " + (QString)focusChange);
    msgBox.exec();

    return 1;
}

JNIEXPORT jint JNICALL Java_com_ahmed_QAndroidResultReceiver_jniExport_jniExport_StringReceiver
  (JNIEnv *env, jobject var2, jstring string){

    QString qstr(env->GetStringUTFChars(string, 0));
    delete var2;
    QMessageBox msgBox;
    msgBox.setText("JE suis de retour" + qstr);
    msgBox.exec();

    return 1;
}
