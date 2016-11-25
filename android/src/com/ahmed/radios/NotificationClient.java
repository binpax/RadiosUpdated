/****************************************************************************
**
** Copyright (C) 2016 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the QtAndroidExtras module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

package com.ahmed.radios;

import android.app.Activity;
import android.app.Notification;
import android.app.NotificationManager;
import android.content.Context;
import android.content.Intent;
import android.media.AudioManager;
import android.media.MediaMetadataRetriever;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.widget.Toast;

import com.ahmed.QAndroidResultReceiver.jniExport.jniExport;

import org.qtproject.qt5.android.bindings.QtApplication;

import java.util.HashMap;

import static android.content.ContentValues.TAG;

public class NotificationClient extends org.qtproject.qt5.android.bindings.QtActivity
{
    private static NotificationManager m_notificationManager;
    private static Notification.Builder m_builder;
    private static NotificationClient m_instance;
    private static jniExport m_jniExport;
    private BooVariable bv;
    private AudioManager mAudioManager;
    private AudioFocusChangeListenerImpl mAudioFocusChangeListener;
    private boolean mFocusGranted, mFocusChanged;
    private Activity mActivity;
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //m_jniExport.intMethod(12);
        mActivity = this;
        mAudioManager = (AudioManager) getSystemService(Context.AUDIO_SERVICE);
        mAudioFocusChangeListener = new AudioFocusChangeListenerImpl();
        int result = mAudioManager.requestAudioFocus(mAudioFocusChangeListener,
                AudioManager.STREAM_MUSIC, AudioManager.AUDIOFOCUS_GAIN);
        switch (result) {
            case AudioManager.AUDIOFOCUS_REQUEST_GRANTED:
                mFocusGranted = true;
                break;
            case AudioManager.AUDIOFOCUS_REQUEST_FAILED:
                mFocusGranted = false;
                break;
        }

        String message = "Focus request " + (mFocusGranted ? "granted" : "failed");
        Toast.makeText(this, message, Toast.LENGTH_LONG).show();
        Log.i(TAG, message);

        m_jniExport = new jniExport();

        bv = new BooVariable();
        bv.setListener(new BooVariable.ChangeListener() {
            @Override
            public void onChange() {
                Toast.makeText(NotificationClient.this,"blah", Toast.LENGTH_LONG).show();
            }
        });
        };

    public NotificationClient()
    {
        m_instance = this;

    }

    public static void notify(String s)
    {
        //new NotificationClient();
        //jniExport sendingData = new jniExport();
        //jniExport.intMethod(45);
        Log.i("HELOOOOOO FROM JAVA", "__________________________\n");

        if (m_notificationManager == null) {
            m_notificationManager = (NotificationManager)m_instance.getSystemService(Context.NOTIFICATION_SERVICE);
            m_builder = new Notification.Builder(m_instance);
            m_builder.setSmallIcon(android.R.drawable.ic_menu_compass);
            m_builder.setContentTitle("A message from Qt!");
        }

        m_builder.setContentText(s);
        m_notificationManager.notify(1, m_builder.build());
    }

    public static void getmetadata(String s)
    {
        //new NotificationClient();
        //jniExport sendingData = new jniExport();
        //jniExport.intMethod(45);
        Log.i("getmetadata", "__________((((((((((((((((((((((((())))))))))))))))))))_____AAAAA "+ s);
        MediaMetadataRetriever lMetaData = new MediaMetadataRetriever();
        lMetaData.setDataSource(s, new HashMap<String, String>());
        String mArtist = lMetaData.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ARTIST);
        String mTitle = lMetaData.extractMetadata(MediaMetadataRetriever.METADATA_KEY_TITLE);
        String mAlbum = lMetaData.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUM);
        String mAlbumArtist = lMetaData.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUMARTIST);
        String mGenre = lMetaData.extractMetadata(MediaMetadataRetriever.METADATA_KEY_GENRE);
        String mSongNumber = lMetaData.extractMetadata(MediaMetadataRetriever.METADATA_KEY_CD_TRACK_NUMBER);
        String mYear = lMetaData.extractMetadata(MediaMetadataRetriever.METADATA_KEY_YEAR);
        Log.i("getmetadata", "_______________AAAAA "+ mGenre + mArtist + mTitle + mAlbum+mAlbumArtist+mYear +mSongNumber);

        //m_jniExport.StringReceiver(metaD);
    }
    public static void exitapplication(int cmd)
    {
        //getActivity().finish();
        if(cmd == 1)System.exit(0);
        else if (cmd == 2){
            Log.i("getmetadata", "_______________AAAAA i.setAction(Intent.ACTION_MAIN); _____________________________" + cmd);

            Intent i = new Intent();
            i.setAction(Intent.ACTION_MAIN);
            i.addCategory(Intent.CATEGORY_HOME);
        }
        BooVariable bvs = new BooVariable();
        bvs.setBoo(true);
    }


    private class AudioFocusChangeListenerImpl implements AudioManager.OnAudioFocusChangeListener {

        @Override
        public void onAudioFocusChange(int focusChange) {
            m_jniExport.intMethod(focusChange);
        }
    }
    protected void onDestroy() {
        super.onDestroy();
        mAudioManager.abandonAudioFocus(mAudioFocusChangeListener);
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event)
    {
        if ( (keyCode == KeyEvent.KEYCODE_BACK) )
        {
            Log.i("getmetadata", "__________((((((((((((((((((((((((())))))))))))))))))))_____AAAAA ");
            m_jniExport.intMethod(2);
        }else if((keyCode == KeyEvent.KEYCODE_MENU)){
            m_jniExport.intMethod(3);

        }else{
            if (QtApplication.m_delegateObject != null && QtApplication.onKeyDown != null)
                return (Boolean) QtApplication.invokeDelegateMethod(QtApplication.onKeyDown, keyCode, event);
            else
                return super.onKeyDown(keyCode, event);
        }
        return true;
    }
    public boolean super_onKeyDown(int keyCode, KeyEvent event)
    {
        return super.onKeyDown(keyCode, event);
    }


}
class BooVariable {
    private static boolean boo = false;
    private static ChangeListener listener;

    public boolean isBoo() {
        return boo;
    }

    public void setBoo(boolean boo) {
        this.boo = boo;
        if (listener != null) listener.onChange();
    }

    public ChangeListener getListener() {
        return listener;
    }

    public void setListener(ChangeListener listener) {
        this.listener = listener;
    }

    public interface ChangeListener {
        void onChange();
    }
}