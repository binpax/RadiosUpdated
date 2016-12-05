package com.ahmed.biladiradio;
import android.app.Activity;
import android.app.Notification;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Intent;
import android.os.Binder;
import android.os.IBinder;
import android.util.Log;
import android.view.View;
import android.widget.RemoteViews;

public class NotificationService extends Service {
    Notification status;
    //NotificationCompat.Builder mBuilder;
    Callbacks activity;
    private final IBinder mBinder = new LocalBinder();
    @Override
    public void onDestroy() {
        this.stopForeground(false);
        super.onDestroy();
    }
    public RemoteViews views;

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        if (intent.getAction().equals(Constants.ACTION.STARTFOREGROUND_ACTION)) {
            showNotification();
        }else if (intent.getAction().equals(Constants.ACTION.PLAY_ACTION)) {
            //toggle the mediaplayer
            activity.sendPlayPressedButton();
            Log.i(LOG_TAG, "Clicked Play");
        } else if (intent.getAction().equals(
                Constants.ACTION.STOPFOREGROUND_ACTION)) {
            Log.i(LOG_TAG, "Received Stop Foreground Intent");
            stopForeground(true);
            stopSelf();
            activity.exitapplication(1);
        }

       // activity.updateClient(millis); //Update Activity (client) by the implementd callback

        return START_STICKY;
    }
    private final String LOG_TAG = "NotificationService";

    private void showNotification() {
        views = new RemoteViews(getPackageName(),R.layout.status_bar);
        views.setViewVisibility(R.id.status_bar_icon, View.VISIBLE);

        Intent notificationIntent = new Intent(this, NotificationClient.class);
        notificationIntent.setAction(Constants.ACTION.MAIN_ACTION);
        notificationIntent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
        PendingIntent pendingIntent = PendingIntent.getActivity(this, 0, notificationIntent, 0);

        Intent closeIntent = new Intent(this, NotificationService.class);
        closeIntent.setAction(Constants.ACTION.STOPFOREGROUND_ACTION);
        PendingIntent pcloseIntent = PendingIntent.getService(this, 0,closeIntent, 0);
        views.setOnClickPendingIntent(R.id.status_bar_collapse, pcloseIntent);

        Intent playIntent = new Intent(this, NotificationService.class);
        playIntent.setAction(Constants.ACTION.PLAY_ACTION);
        PendingIntent pplayIntent = PendingIntent.getService(this, 0,playIntent, 0);
        views.setOnClickPendingIntent(R.id.status_bar_next, pplayIntent);


        views.setTextViewText(R.id.status_bar_track_name, "Bonjour !");
        views.setTextViewText(R.id.status_bar_artist_name, "Artist Name");
        views.setImageViewResource(R.id.status_bar_next, android.R.drawable.ic_media_play);
        views.setImageViewResource(R.id.status_bar_collapse, R.drawable.ic_media_stop);

                status = new Notification.Builder(this).build();

        status.contentView = views;
        //status.bigContentView = bigViews;
        status.flags = Notification.FLAG_ONGOING_EVENT;
        status.icon = R.drawable.notiflogo;
        status.contentIntent = pendingIntent;
        startForeground(Constants.NOTIFICATION_ID.FOREGROUND_SERVICE, status);
    }
    public void registerClient(Activity activity){
        this.activity = (Callbacks)activity;
    }
    @Override
    public IBinder onBind(Intent intent) {
        return mBinder;
    }
    public class LocalBinder extends Binder {
        public NotificationService getServiceInstance(){
            return NotificationService.this;
        }
    }
    public void update(String station,String desc, int state){
        views.setTextViewText(R.id.status_bar_track_name, station);
        views.setTextViewText(R.id.status_bar_artist_name, desc);
        if(state !=0)views.setImageViewResource(R.id.status_bar_next, android.R.drawable.ic_media_play);
        else views.setImageViewResource(R.id.status_bar_next, android.R.drawable.ic_media_pause);
        status.contentView = views;
        stopForeground(true);
        startForeground(Constants.NOTIFICATION_ID.FOREGROUND_SERVICE, status);
        //activity.sendPressedButton(434);
    }
    public interface Callbacks{
        public int exitapplication(int cmd);
        public void sendPlayPressedButton();
    }

}
