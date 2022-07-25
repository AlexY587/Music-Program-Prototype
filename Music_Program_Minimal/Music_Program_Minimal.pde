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

//
void setup() {
  size(800, 500);
  minim = new Minim(this);//load from data directory, loadfile should also load from project folder, like loadImage
  song1 = minim.loadFile("Glass - Anno Domini Beats.mp3");//able to pass absolute path, file name and extnsion, and URL
  //song1.play();//paramater is milli seconds from the start of audio file to start playing
 // song1.loop(songPlay);//paramater is number of repeats
}//end setup
//
void draw() {
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
  if ( key=='1' || key=='9') {//loop function
    //note "9" is assumed to be massive ... simulates infinity
    if ( key == '1') println("looping once");
    if ( key == '9') println("looping 9 times");
    String keystr = String.valueOf(key);
    println("#number of repeats is ", keystr);
    int loopnum = int(keystr);
    song1.loop(loopnum);
  }//End loop functions
  
  
  
  //int loopNum1 = 2;//local variable plays once loops twice
  //if (key=='l' || key=='L') song1.loop(songPlay);
}//end keypressed
//
//end main program
