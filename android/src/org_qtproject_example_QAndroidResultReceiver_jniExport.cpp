#include "org_qtproject_example_QAndroidResultReceiver_jniExport.h"
#include <QMessageBox>

JNIEXPORT jint JNICALL Java_org_qtproject_example_QAndroidResultReceiver_jniExport_intMethod
  (JNIEnv *  var1, jobject var2, jint var3){
    QMessageBox msgBox;
    msgBox.setText("JE suis de retour");
    msgBox.exec();
return 17;

}
