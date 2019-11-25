package com.mozta.storybook_fab;

import android.annotation.SuppressLint;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Bundle;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class StoryActivity extends AppCompatActivity {
    MediaPlayer mediaPlayer, mediaPlayer2, mediaPlayer3;
    TextView txt_tittle;
    TextView txt_story;
    ImageView image;
    int i;

    List<String> list_xolo = new ArrayList<String>();

    int[] images_xolo = {
            R.drawable.xolo0,
            R.drawable.xolo1,
            R.drawable.xolo2
    };

    int[] songs = {
            R.raw.xolo1,
            R.raw.xolo2,
            R.raw.xolo3
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_story);
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        i = 0;

        list_xolo.add("Many years ago in a different civilization Xoloitzcuintles Were considered sacred");
        list_xolo.add("Xolos are considered special Because they act as Guardians of our houses and health");
        list_xolo.add("And as we pass to the other side They help us cross the river Into the afterlife To get us safe With our loved ones");


        txt_tittle = findViewById(R.id.txt_tittle);
        txt_story = findViewById(R.id.txt_story);
        image = findViewById(R.id.image);

        loadInitial();


        FloatingActionButton fab = findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                mediaPlayer.start();
                /*for (i = 0; i< list_xolo.size()-1;i++){
                    mediaPlayer.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
                        @Override
                        public void onCompletion(MediaPlayer mediaPlayer) {
                            Log.i("TEST", String.valueOf(i));
                            changeSong();
                            txt_story.setText(list_xolo.get(i));
                            image.setImageResource(images_xolo[i]);
                        }
                    });
                }*/

            }
        });

        mediaPlayer.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
            @SuppressLint("ResourceType")
            @Override
            public void onCompletion(MediaPlayer mediaPlayer) {

                if (i < list_xolo.size()) {
                    Log.i("TEST", String.valueOf(1));
                    //managerOfSound(i);
                    txt_story.setText(list_xolo.get(1));
                    image.setImageResource(images_xolo[1]);
                    mediaPlayer2.start();
                }
            }
        });

        mediaPlayer2.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
            @SuppressLint("ResourceType")
            @Override
            public void onCompletion(MediaPlayer mediaPlayer) {

                if (i < list_xolo.size()) {
                    Log.i("TEST", String.valueOf(2));
                    //managerOfSound(i);
                    txt_story.setText(list_xolo.get(2));
                    image.setImageResource(images_xolo[2]);
                    mediaPlayer3.start();
                }
            }
        });

        mediaPlayer3.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
            @SuppressLint("ResourceType")
            @Override
            public void onCompletion(MediaPlayer mediaPlayer) {
                Toast.makeText(StoryActivity.this, "Finish...", Toast.LENGTH_SHORT).show();
                finish();
            }
        });


    }

    private void liberatudisco() {
        mediaPlayer.release();
    }

    private void loadInitial() {
        txt_tittle.setText("Xolo");
        txt_story.setText(list_xolo.get(i));
        image.setImageResource(images_xolo[i]);
        mediaPlayer = MediaPlayer.create(this, R.raw.xolo1);
        mediaPlayer2 = MediaPlayer.create(this, R.raw.xolo2);
        mediaPlayer3 = MediaPlayer.create(this, R.raw.xolo3);
        i++;
    }

    private void changeSong(int j) {
        switch (j) {
            case 0:
                mediaPlayer.reset();
                mediaPlayer = MediaPlayer.create(getBaseContext(), R.raw.xolo1);
                mediaPlayer.start();
                mediaPlayer.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
                    @Override
                    public void onCompletion(MediaPlayer mediaPlayer) {
                        Log.i("TEST", String.valueOf(j));
                        txt_story.setText(list_xolo.get(j));
                        image.setImageResource(images_xolo[j]);
                    }
                });
                break;
            case 1:
                mediaPlayer.reset();
                mediaPlayer = MediaPlayer.create(getBaseContext(), R.raw.xolo2);
                mediaPlayer.start();
                mediaPlayer.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
                    @Override
                    public void onCompletion(MediaPlayer mediaPlayer) {
                        Log.i("TEST", String.valueOf(j));

                        txt_story.setText(list_xolo.get(j));
                        image.setImageResource(images_xolo[j]);
                    }
                });
                break;
            case 2:
                mediaPlayer.reset();
                mediaPlayer = MediaPlayer.create(getBaseContext(), R.raw.xolo3);
                mediaPlayer.start();
                mediaPlayer.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
                    @Override
                    public void onCompletion(MediaPlayer mediaPlayer) {
                        Log.i("TEST", String.valueOf(j));

                        txt_story.setText(list_xolo.get(j));
                        image.setImageResource(images_xolo[j]);
                    }
                });
                break;
        }
    }

    /**
     * Manager of Sounds
     */
    protected void managerOfSound(int j) {
        if (mediaPlayer != null) {
            mediaPlayer.reset();
            mediaPlayer.release();
        }
        if (j == 0)
            mediaPlayer = MediaPlayer.create(this, R.raw.xolo1);
        else if (j == 1)
            mediaPlayer = MediaPlayer.create(this, R.raw.xolo2);
        else if (j == 2)
            mediaPlayer = MediaPlayer.create(this, R.raw.xolo3);
        mediaPlayer.start();
    }

}
