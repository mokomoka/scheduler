void list(String [] a) {//ToDoリスト表示用の関数
  int [] d = int(a);//int型に変換し、dに入れる

  for (int i = 0; i < a.length/4; i++) {
    if ((d[27-i*4-3] - day() >= 3 && d[27-i*4-3] - day() <= 7) && (d[27-i*4-2] == month())
      && (d[27-i*4-1] == year())) {//締め切りとして設定した日が3日以上7日以下に迫っていたら
      fill(#2980b9);//青で塗りつぶす
    } else if ((d[27-i*4-3] - day() == 2) && (d[27-i*4-2] == month())
      && (d[27-i*4-1] == year())) {//締め切りとして設定した日まであと2日だったら
      fill(#d35400);//オレンジで塗りつぶす
    } else if ((d[27-i*4-3] - day() <= 1) && (d[27-i*4-2] == month())
      && (d[27-i*4-1] == year())) {//締め切りとして設定した日まであと1日か0日だったら
      fill(#c0392b);//赤で塗りつぶす
    } else {
      fill(#bdc3c7);//それ以外はグレー
    }

    stroke(0);
    if (d[27-i*4-3] != 0) {//リスト用の長方形
      rect(0, (i+1)*70-10, width, 70);
    }

    fill(255);
    textAlign(LEFT);//テキストを左端揃え
    textSize(28);
    if (d[27-i*4] == 0) {//科目名が0なら
      text(subject[0], 20, 110+70*i);//Processingと表示
    } else if (d[27-i*4] == 1) {//1なら
      text(subject[1], 20, 110+70*i);//科学技術リテラシと表示
    } else if (d[27-i*4] == 2) {//2なら
      text(subject[2], 20, 110+70*i);//解析学と表示
    } else if (d[27-i*4] == 3) {//3なら
      text(subject[3], 20, 110+70*i);//VEPと表示
    } else if (d[27-i*4] == 4) {//4なら
      text(subject[4], 20, 110+70*i);//サークルと表示
    } else if (d[27-i*4] == 5) {//5なら
      text(subject[5], 20, 110+70*i);//その他と表示
    }

    textAlign(RIGHT);//テキストを右端揃え
    textSize(20);
    text(d[27-i*4-1]+"年", 326, 110+70*i);//締め切りの年
    textSize(22);
    text(d[27-i*4-2]+"月"+d[27-i*4-3]+"日まで", 470, 110+70*i);//締め切りの月日
  }
}


void disp5() {
  background(255);//背景塗りつぶし
  fill1 = #9b59b6;
  back();//戻るボタン
  textAlign(CENTER);
  text(b_name[4], width/2, 40);

  fill(#9b59b6);
  rect(10, 580, 50, 50, 10);//左下のリスト追加ボタン
  fill(255);
  rect(20, 600, 30, 10);
  rect(30, 590, 10, 30);

  list(list);//リストを表示

  fill(0);
  textSize(20);
  text("上限は7個", width-180, height-40);
  text("（超えると1番上のリストから消えるよ！）", width-10, height-15);

  s = 6;//初期化
  l1 = 4;
  l2 = 1;
  l3 = 1;
}