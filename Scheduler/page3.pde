void disp3() {
  background(255);//背景塗りつぶし
  fill1 = #2ecc71;
  back();//戻るボタン
  textAlign(CENTER);//テキストを中央揃え
  text(b_name[2], x+width/2, 40);
  text("Timer", x + width + width/2, 40);
  textFont(font2);//フォントを指定

  fill(fill1);
  triangle(170, 510, 170, 560, 220, 535);//ストップウォッチのスタートボタン
  rect(260, 510, 50, 50);//ストップウォッチのストップボタン

  for (int i = 1; i <= 60; i++) {//1秒ごとの位置に表示する目盛りみたいなの
    float theta = PI* (i/30.0);
    ellipse(width/2 + sin(theta) * 110, 200 - cos(theta) * 110, 2, 2);
  }

  for (int i = 1; i <= 12; i++) {//5秒ごとの位置に表示する目盛りみたいなの
    float theta = PI* (i/6.0);
    ellipse(width/2 + sin(theta) * 110, 200 - cos(theta) * 110, 5, 5);
  }

  stroke(0);
  noFill();
  ellipse(width/2, 200, 240, 240);//ストップウォッチの時計みたいな部分の枠

  fill(0);
  if (t_start != 0 && t_left == 0) {//時間を図っている最中
    text((millis()-t_start)/3600000+"時間"+nf((millis()-t_start)/60000-(millis()-t_start)/3600000*60, 2)+"分"
      +nf((millis()-t_start)/1000-(millis()-t_start)/60000*60-(millis()-t_start)/3600000*3600, 2)+"秒"
      +nf((millis()-t_start)%1000, 3), x + width/2, 420);//測っている時間を表示
    show_arm((millis()-t_start)/60000.0, 100, x + width/2, 200, 2);//針を表示
  } else if (t_left != 0) {//ストップウォッチをストップした時
    text(t_left/3600000+"時間"+nf(t_left/60000-t_left/3600000*60, 2)+"分"+ 
      nf(t_left/1000-t_left/3600000*3600-t_left/60000*60, 2)+"秒"+nf(t_left%1000, 3), x + width/2, 420);
    //測った時間を表示
    show_arm(t_left/60000.0, 100, x + width/2, 200, 2);
  } else if (t_start == 0) {//スタート押す前
    text("0時間00分00秒000", x + width/2, 420);
    show_arm(0.0, 100, x + width/2, 200, 2);
  }
  if (3600 - (millis() - timer_s)/1000 > 0) {
    if (timer_s != 0 && timer_e == 0) {
      text((3600000 - millis() + timer_s)/3600000+"時間"+nf((3600000 - millis() + timer_s)/60000, 2)+"分"
        +nf((3600000 - millis() + timer_s)/1000 - (3600000 - millis() + timer_s)/60000*60, 2)+"秒", 
        x + width + width/2, 420);
      show_arm(-(millis()-timer_s)/3600000.0, 100, x + width + width/2, 200, 2);
    } else if ( timer_e != 0 ) {
      text((3600000- timer)/3600000+"時間"+nf((3600000 - timer)/60000, 2)+"分"+
        nf((3600000 - timer) / 1000 - (3600000 - timer) / 60000 * 60, 2) + "秒", x+ width + width/2, 420);
      show_arm((3600000 - timer)/3600000.0, 100, x + width + width/2, 200, 2);
    } else if (timer_s == 0) {
      text("1時間00分00秒", x + width + width/2, 420);
      show_arm(0.0, 100, x + width + width/2, 200, 2);
    }
  } else if ( 3600 - (millis() - timer_s)/1000 <= 0) {
    text("00時間00分00秒", x + width + width/2, 420, 2);
    show_arm(0.0, 100, x + width + width/2, 200, 2);
    timer_s = timer_e = timer = 0;
  }

  fill(fill1);
  ellipse(width/2, 200, 10, 10);//中央のピンみたいなやつ
}