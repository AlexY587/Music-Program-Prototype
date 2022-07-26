import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//global variables
Minim minim;//creates object to access all functions
AudioPlayer song1;//creates a playlist
AudioMetaData songMetaData1;
//
color black=#000000, purple=#2C08FF, reset=255;
float titleX, titleY, titleWidth, titleHeight;
PFont titlefont;

//
void setup() {
  size(800, 500);//landscape
  //be careful to include display oreination checker and display 
  minim = new Minim(this);//load from data directory, loadfile should also load from project folder, like loadImage
  song1 = minim.loadFile("Glass - Anno Domini Beats.mp3");//able to pass absolute path, file name and extnsion, and URL
  songMetaData1 = song1.getMetaData();
  //song1.play();//paramater is milli seconds from the start of audio file to start playing
  // song1.loop(songPlay);//paramater is number of repeats
  //
  //population
  titleX = width/4;
  titleY = height*0;
  titleWidth = width*1/2;
  titleHeight = height*1/10;
  //
  titlefont = createFont("Times New Roman", 55);
}//end setup
//
void draw() {
  if (song1.isLooping() && song1.loopCount() != -1) println("There are", song1.loopCount(), "loops left.");
  if (song1.isLooping() && song1.loopCount() == -1) println("Looping infinitly");
  if (song1.isPlaying() && !song1.isLooping()) println("Play Once");
  println("song position", song1.position(), "song length", song1.length());//ammount of time left is a calculatoin
  //
  background (black);
  rect(titleX, titleY, titleWidth, titleHeight);
  fill(purple);
  textAlign(CENTER, CENTER);
  textFont(titlefont, 30);
  text(songMetaData1.title(),titleX, titleY, titleWidth, titleHeight);
  fill(reset);
}//end draw
//
void mousePressed() {
}//end mousepressed
//
void keyPressed() {
  //first play button
  //if (key=='y' || key=='Y') song1.play();
  //
  //Alternate play button , as a finite loop() && infinite loop()
  //only press a number for this code below
  println(key);
  if ( key=='1') {//loop function
    //note "9" is assumed to be massive ... simulates infinity
    if ( key == '1') println("looping once");
    String keystr = String.valueOf(key);
    println("#number of repeats is ", keystr);
    int loopnum = int(keystr);
    song1.loop(loopnum);
  }//End loop functions
  if (key=='i' || key=='I') song1.loop(-1);//infinite loop, no paramater or -1 
  if (key >= '2' || key=='0') println("i do not loop that much, press i for infinite loop");
  //
  if (key == 'm' || key == 'M') {
    if (song1.isMuted()) {
      song1.unmute();
    } else {
      song1.mute();
    }
  }//End mute button
  if (key == 'f' || key == 'F') song1.skip(1000);//skip forward 1 second
  if (key == 'r' || key == 'R') song1.skip(-1000);//go backwards 1 second
  //
  if (key == 's' || key == 'S') {
    if (song1.isPlaying()) {
      song1.pause();
      song1.rewind();
    } else {//song is not playing
      song1.rewind();
    }
  }//end stop button
  //
  if (key == 'p' || key == 'P') {//pausse button
    if (song1.isPlaying()) {
      song1.pause();
    } else if (song1.position() >= song1.length() - song1.length() * 1/5) {
      song1.rewind();
      song1.rewind();
    } else {
      song1.play();
    }
  }//end pause button
  //int loopNum1 = 2;//local variable plays once loops twice
  //if (key=='l' || key=='L') song1.loop(songPlay);
}//end keypressed
//
//end main program
