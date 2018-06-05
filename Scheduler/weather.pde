String URL = "http://weather.livedoor.com/forecast/webservice/json/v1?city=017010";
String tenki;
JSONArray forecasts;

void weather() {
  JSONObject f = forecasts.getJSONObject(0);
  //JSONObject t = f.getJSONObject("temperature");
  //String s = f.getString("dateLabel") + ":" + f.getString("telop");
  tenki = f.getString("telop");

  int rain = tenki.indexOf("雨");
  int snow = tenki.indexOf("雪");
  int cloud = tenki.indexOf("曇");

  if (rain != -1) {
    rain();
  } else {
    if (snow != -1) {
      snow();
    } else {
      if (cloud != -1) {
        cloud(2);
      } else {
        sun(1);
      }
    }
  }

  if (month() >= 6 && month() <= 9) {
    image(boy1, width/2, height/2);
  } else if (month() == 12 || month() <= 3) {
    image(boy3, width/2, height/2);
  } else {
    image(boy2, width/2, height/2);
  }
}

void rain() {
  if ( hour() >= 24 || hour() <= 4) {
    background(73, 90, 111);
  } else {
    background(186, 223, 255);
  }

  image(haikei, width/2, height/2);

  image(ame, width/2, y5);
  image(ame, width/2, height + y6);

  image(kumo, x1, height/6, 300, 300);
  image(kumo, x2, y2, 250, 250);
  image(kumo, x3, y3, 400, 400);
  image(kumo, x4, y4, 200, 200);
  image(kumo, x1+100, height/6, 300, 300);
  image(kumo, x5, height/6+30, 300, 300);
  image(kumo, x6, height/6-20, 200, 200);
  image(kumo, x7, height/6+50, 400, 400);

  x1 = x1 + 1;
  x2 = x2 + 1;
  x3 = x3 + 1;
  x4 = x4 + 1;
  x5 = x5 + 1;
  x6 = x6 + 1;
  x7 = x7 + 1;
  y5 = y5 + 5;
  y6 = y6 + 5;

  if (x1 >= width+150) {
    x1 = -150;
  }
  if (x2 >= width+125) {
    x2 = -125;
    y2 = int(random(0, -200));
  }
  if (x3 >= width+ 200) {
    x3 = -200;
    y3 = int(random(50, -100));
  }
  if (x4 >= width + 100) {
    x4 = -100;
    y4 = int(random(50, 100));
  }
  if (x5 >= width+150) {
    x5 = -300;
  }
  if (x6 >= width+100) {
    x6 = -200;
  }
  if (x7 >= width+200) {
    x7 = -400;
  }

  if (y5 > height+height/2) {
    y5 = -height/2;
  }
  if (y6 > height/2) {
    y6 = -height-height/2;
  }
}

void snow() {
  if ( hour() >= 19 || hour() <= 4) {
    background(46, 55, 96);
  } else {
    background(186, 223, 255);
  }

  image(haikei2, width/2, height/2);

  image(yuki, width/2, y5);
  image(yuki, width/2, height + y6);

  image(kumo, x1, height/6, 300, 300);
  image(kumo, x2, y2, 250, 250);
  image(kumo, x3, y3, 400, 400);
  image(kumo, x4, y4, 200, 200);
  image(kumo, x1+100, height/6, 300, 300);
  image(kumo, x5, height/6+30, 300, 300);
  image(kumo, x6, height/6-20, 200, 200);
  image(kumo, x7, height/6+50, 400, 400);

  x1 = x1 + 1;
  x2 = x2 + 1;
  x3 = x3 + 1;
  x4 = x4 + 1;
  x5 = x5 + 1;
  x6 = x6 + 1;
  x7 = x7 + 1;
  y5 = y5 + 5;
  y6 = y6 + 5;

  if (x1 >= width+150) {
    x1 = -150;
  }
  if (x2 >= width+125) {
    x2 = -125;
    y2 = int(random(0, -200));
  }
  if (x3 >= width+ 200) {
    x3 = -200;
    y3 = int(random(50, -100));
  }
  if (x4 >= width + 100) {
    x4 = -100;
    y4 = int(random(50, 100));
  }
  if (x5 >= width+150) {
    x5 = -300;
  }
  if (x6 >= width+100) {
    x6 = -200;
  }
  if (x7 >= width+200) {
    x7 = -400;
  }

  if (y5 > height+height/2) {
    y5 = -height/2;
  }
  if (y6 > height/2) {
    y6 = -height-height/2;
  }
}

void cloud(int n) {
  if ( hour() >= 19 || hour() <= 4) {
    background(46, 55, 96);
  } else {
    background(194, 206, 222);
  }

  image(haikei, width/2, height/2);

  if (n >= 0) {
    image(kumo, x1, height/6, 300, 300);
    image(kumo, x2, y2, 250, 250);
  }
  if ( n >= 1) {
    image(kumo, x3, y3, 400, 400);
    image(kumo, x4, y4, 200, 200);
  }
  if ( n >= 2) {
    //image(kumo, x1+100, height/6, 300, 300);
    image(kumo, x5, height/6+30, 300, 300);
    image(kumo, x6, height/6-20, 200, 200);
    image(kumo, x7, height/6+50, 400, 400);
  }

  x1 = x1 + 1;
  x2 = x2 + 1;
  x3 = x3 + 1;
  x4 = x4 + 1;
  x5 = x5 + 1;
  x6 = x6 + 1;
  x7 = x7 + 1;

  if (x1 >= width+150) {
    x1 = -150;
  }
  if (x2 >= width+125) {
    x2 = -125;
    y2 = int(random(0, -200));
  }
  if (x3 >= width+ 200) {
    x3 = -200;
    y3 = int(random(50, -100));
  }
  if (x4 >= width + 100) {
    x4 = -100;
    y4 = int(random(50, 100));
  }
  if (x5 >= width+150) {
    x5 = -300;
  }
  if (x6 >= width+100) {
    x6 = -200;
  }
  if (x7 >= width+200) {
    x7 = -400;
  }
}


void sun(int n) {
  if ( hour() >= 19 || hour() <= 4) {
    background(46, 55, 96);
    fill(230, 220, 0);
    ellipse(width-30, 30, 100, 100);
  } else {
    background(106, 166, 240);
    pushMatrix();
    rotate(frameCount / 500.0);
    image(hare, 0, 0, 250, 250);
    popMatrix();
  }

  image(haikei, width/2, height/2);

  if ( n >= 1) {
    image(kumo, x1, height/6, 300, 300);
    image(kumo, x2, y2, 250, 250);
  }

  x1 = x1 + 1;
  x2 = x2 + 1;

  if (x1 >= width+150) {
    x1 = -150;
  }
  if (x2 >= width+125) {
    x2 = -125;
    y2 = int(random(0, -200));
  }
}