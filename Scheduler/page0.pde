void show_arm(float rat, float r, float x, float y, int n) {  //時計の針を表示するための関数
  translate(x, y);//回転の中心にしたい位置に原点を持ってくる
  rotate(TWO_PI * rat);//回転する
  strokeWeight(n);//針の太さを指定
  line(0, 0, 0, -r);//針を書く
  rotate(-TWO_PI * rat);//回転を戻す
  translate(-x, -y);//原点を0.0に戻す
}

void show_circle() {//背景の円を表示するための関数
  frameRate(10);//円が出てくる頻度を落とす
  noStroke();//枠線なし
  fill(start[int(random(start.length))]);//円の色を決める
  float R = random(3, 150);//円の直径をランダムに決める  
  ellipse(random(width), random(height), R, R);//円を描く
}

void disp0() {
  strokeCap(ROUND);
  show_circle();
  fill(255, 255, 255, 50);//半透明の白
  rect(0, 0, width, height);//円を次第に消すために上から毎回白で塗りつぶす

  float s = second();//秒
  float m = minute() + (s/60.0);//滑らかに針が動くように秒に合わせて分針も少し動く
  float h = hour()%12 + (m/60.0);//滑らかに針が動くように分に合わせて時針も少し動く

  stroke(80);
  strokeWeight(12);//時計の枠線
  fill(255);//時計の中は白
  ellipse(width/2, 200, 250, 250);//時計の円を描く

  stroke(90);
  strokeWeight(6);//計の枠線2　ちょっと立体感を出す
  noFill();//塗りつぶしなし
  ellipse(width/2, 200, 250, 250);//円を描く

  fill(0);
  stroke(50);

  for (int i = 1; i <= 12; i++) {//時計の文字盤用繰り返し
    float theta = PI* (i/6.0);//文字盤を配置する角度を決める
    text(i, width/2 + sin(theta) * 100, 211 - cos(theta) * 100);//数字を書く
  }

  show_arm(s/60.0, 100, width/2, 200, 2);//秒針
  show_arm(m/60.0, 85, width/2, 200, 4);//長針
  show_arm(h/12.0, 60, width/2, 200, 5);//短針

  ellipse(width/2, 200, 7, 7);//針を止めてるピンのイメージ

  textFont(font2, 30);//フォントを変える
  text(year() + "年 " + month() + "月 " +day()+ "日 " + day[a] + "曜日", width/2, 380);//今日の日付と曜日を表示
  text(nf(hour(), 2) + "時 " + nf(minute(), 2) + "分", width/2, 420);//今の時間を表示
  int hour_left = 23-hour();//1日の残り時間
  int minute_left = 59-minute();//1日の残り時間
  text("今日はあと "+hour_left+"時間"+minute_left+"分 です", width/2, 470);//残り時間を表示
  text(b_name[0], width/2, 580);//クリックして次の画面に行けるよ
}