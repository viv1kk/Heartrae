class monitor
{
  float avg;
  void pr(float a)
  {
    avg = a;
    //print(avg);
  }

  float highest = 0;
  float prev = 0;
  float current = 0;
  float lowest = 255;

  void calcRate()
  {
    prev = current;
    current = avg;


    if (current < prev)
    {
      timerStart();
    }
    if (current > prev)
    {
      timerEnd();
    }



    //timerEnd =System.nanoTime()-t;



    //print(timer+"\n");
  }
}
void timerStart()
{
  timerStart = millis()-t;
}
void timerEnd()
{
  timerEnd = millis()-t;
  int timer = timerEnd-timerStart;
  
  if(timer >= 250 && timer <= 1700)
  {
    //float rate = timer*2.5*6/100;
    print(timer+"\n");
  }
}
