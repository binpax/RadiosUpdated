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

import android.app.Notification;
import android.app.NotificationManager;
import android.content.Context;
import android.media.AudioManager;
import android.media.MediaMetadataRetriever;
import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;

import com.ahmed.QAndroidResultReceiver.jniExport.jniExport;

import java.util.HashMap;

import static android.content.ContentValues.TAG;

public class NotificationClient extends org.qtproject.qt5.android.bindings.QtActivity
{
    private static NotificationManager m_notificationManager;
    private static Notification.Builder m_builder;
    private static NotificationClient m_instance;
    private static jniExport m_jniExport;

    private AudioManager mAudioManager;
    private AudioFocusChangeListenerImpl mAudioFocusChangeListener;
    private boolean mFocusGranted, mFocusChanged;

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //m_jniExport.intMethod(12);
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
}