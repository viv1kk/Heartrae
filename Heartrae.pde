
import java.lang.*;
import java.util.concurrent.TimeUnit;
import processing.video.*;
monitor p = new monitor();
Capture cam;
int t, timerEnd,timerStart;

void setup()
{
  size(640, 480);
  //background(0);
  
  cam = new Capture(this, width, height, Capture.list()[2], 60);
  printArray(Capture.list());
  t = millis();
  cam.start();
  frameRate(30);
}

void captureEvent(Capture cam)
{
   cam.read();
   
}

void draw()
{
  background(0);
  loadPixels();
  cam.loadPixels();
  float avg = 0;
  for(int x = 0; x < cam.width; x++)
  {
    for(int y = 0; y < cam.height; y++)
    {
      int loc = x+y*cam.width;
      
      //float r = red(cam.pixels[loc]);
      //float g = blue(cam.pixels[loc]);
      //float b = green(cam.pixels[loc]);
      
      float br = brightness(cam.pixels[loc]);
      
      
      if(br > mouseX)
        pixels[loc] = color(br);
       else
        pixels[loc] = color(0);
      
      avg += brightness(pixels[loc]);
      //pixels[loc] = cam.pixels[loc];
    }
  }
  avg = avg/(cam.height *cam.width);
  //print(avg+"\n");
  p.pr(avg);
  p.calcRate();
  updatePixels();
}
