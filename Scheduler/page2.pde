void calendar(int a, int b, int c) {//カレンダーを表示するための関数
  int wd;//曜日を判別するための数字
  int dm;//ひと月の日数を保存
  int x1;//日付を書く位置の座標
  int y1 = 220;//日付を書く位置の座標
  int j, k;//曜日計算用の変数

  switch(b%12) {//月を12で割った余りによって切り替え
  case 2://2月のとき
    if (a%4 == 0 && (a%100 != 0 || a%400 == 0)) {//うるう年だったら
      dm = 29;//29日
    } else {
      dm = 28;
    }
    break;
  case 4://4月、6月、9月、11月のとき
  case 6:
  case 9:
  case 11:
    dm = 30;//30日
    break;
  default://それ以外
    dm = 31;//31日
    break;
  }

  if (b <= 2) {//1月と2月は前年の13月、14月として曜日を計算する
    a = year()+(y-1);
    b = 12 + b;
  }

  j = a / 100;//jは年の前2桁
  k = a % 100;//kは年の下2桁

  wd = (1 + (b+1)*26/10 + k + k/4 + j/4 + 5*j - 1 )%7;//その月のついたちの曜日を計算　ツェラーの公式

  x1 = -15 + wd*60;//最初の曜日によって、ついたちの書き始めの座標を調整

  textSize(25);//テキストサイズを25

  for ( int i = 1; i <= 7; i++) {//上部の曜日表示
    if (i == 1) {//日曜日
      fill(255, 0, 0);
    } else if (i == 7) {//土曜日
      fill(0, 0, 255);
    } else {//平日
      fill(0);
    }
    text(day[i-1], 60*i-13, y1-30);//曜日を表示
  }

  for (int i = 1; i <= dm; i++) {//日付表示用繰り返し
    if ((wd == 0 && i%7 == 1) || (wd == 1 && i%7 == 0) || 
      (wd >= 2 && wd <= 6 && i%7 == 8-wd)) {//日曜日のとき
      x1 = 45;
      if (wd == 0 && i == 1) {//ついたちが日曜日の時は1行目が空かないように調整
        y1 = 220;
      } else {//それ以外は日曜日で改行
        y1 = y1 + 60;
      }
      if ( i == c && b == month() && a == year()) {//今日の日付と一致したら
        fill(0, 172, 0);//緑で塗る
      } else {
        fill(255, 0, 0);//赤で塗る
      }
    } else if ((wd == 0 && i%7 == 0) || (wd == 1 && i%7 == 6) ||
      (wd >= 2 && wd <= 6 && i%7 == 7-wd)) {//土曜日の時
      if ( i == c && b == month() && a == year()) {//今日の日付と一致したら
        fill(0, 172, 0);//緑で塗る
      } else {
        fill(0, 0, 255);//青で塗る
      }
      x1 = x1 + 60;
    } else {//それ以外の平日
      x1 = x1 + 60;
      if ( i == c && b == month() && a == year()) {//今日の日付と一致したら
        fill(0, 172, 0);//緑で塗る
      } else {
        fill(0);
      }
    }    
    if (i >=1 && i <= 9) {//日付が一桁のとき
      textSize(25);
      text(" "+i, x1, y1);//調節のために空白を入れる
    } else {
      textSize(25);
      text(i, x1, y1);//それ以外の日付を表示
    }
    for (int n = 0; n < list.length/4; n++) {
      if (i == int(list[24-n*4]) && b == int(list[25-n*4]) && a == int(list[26-n*4])) {
        textSize(15);
        switch(int(list[27-n*4])) {
        case 0:
          fill(255, 10, 0);
          ellipse(x1+2, y1 + 10, 7, 7);
          ellipse(40, 580, 15, 15);
          text(subject[0], 60, 587);
          break;
        case 1:
          fill(255, 165, 0);
          ellipse(x1+12, y1 + 10, 7, 7);
          ellipse(180, 580, 15, 15);
          text(subject[1], 200, 587);
          break;
        case 2:
          fill(255, 200, 0);
          ellipse(x1+22, y1 + 10, 7, 7);
          ellipse(360, 580, 15, 15);
          text(subject[2], 380, 587);
          break;
        case 3:
          fill(0, 188, 0);
          ellipse(x1+7, y1 + 20, 7, 7);
          ellipse(40, 610, 15, 15);
          text(subject[3], 60, 617);
          break;
        case 4:
          fill(0, 225, 225);
          ellipse(x1+17, y1 + 20, 7, 7);
          ellipse(180, 610, 15, 15);
          text(subject[4], 200, 617);
          break;
        case 5:
          fill(0, 0, 235);
          ellipse(x1+27, y1 + 20, 7, 7);
          ellipse(360, 610, 15, 15);
          text(subject[5], 380, 617);
          break;
        }
      }
    }
  }


  fill(0);//黒で塗りつぶし
  textAlign(CENTER);//テキストを中央揃え

  if (b == 13) {//13月のとき
    textSize(40);
    text("1月", width/2, 140);//1月と表示
    textSize(25);
    text((a+1)+"年", width/2, 90);//年を表示
  } else if (b == 14) {//14月の時
    textSize(40);
    text("2月", width/2, 140);//2月と表示
    textSize(25);
    text((a+1)+"年", width/2, 90);//年を表示
  } else {//それ以外
    textSize(40);
    text(b+"月", width/2, 140);//月を表示
    textSize(25);
    text(a+"年", width/2, 90);//年を表示
  }

  strokeWeight(1.3);//カレンダーの枠線
  stroke(0);
  noFill();
  line(30, 165, 450, 165);
  for (int i = 0; i < 7; i++) {//枠線用繰り返し
    rect( 30+i*60, 165, 60, 30);
    for (int l = 0; l < 6; l++) {
      rect(30+i*60, 195+l*60, 60, 60);
    }
  }
}

void disp2() {
  background(255);
  fill1 = #1abc9c;
  back();
  textAlign(CENTER);
  text(b_name[1], width/2, 40);

  fill(fill1);
  triangle(190, 110, 190, 140, 160, 125);//前の月に戻る
  triangle(290, 110, 290, 140, 320, 125);//次の月に進む

  textAlign(LEFT);//テキストを左揃え
  calendar(year()+y, month()+m, day());//カレンダーを表示
}