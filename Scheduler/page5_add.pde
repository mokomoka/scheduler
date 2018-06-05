void disp6() {
  back();//戻るボタン

  fill(#9b59b6);
  rect(100, 450, 280, 50, 5);//OKボタン
  fill(255);
  textAlign(CENTER);//テキストを中央揃え
  text(b_name[4], width/2, 40);
  text(b_name[6], width/2, 485);//OKを表示
}


void disp7() {
  textFont(font2, 30);
  textAlign(LEFT);//テキストを左端揃え
  stroke(0);
  for (int i = 0; i < 6; i = i + 1) {//科目名選択のプルダウンを表示
    fill(127, 140, 141);
    rect(150, i * 50 + 160, 280, 50);
    fill(0);
    text(subject[i], 170, i * 50 + 200);
  }
}


void disp8() {
  textFont(font2, 30);
  textAlign(CENTER);//テキストを中央揃え
  stroke(0);
  for (int i = 0; i < 4; i = i + 1) {//年選択のプルダウンを表示
    fill(127, 140, 141);
    rect(200, i * 50 + 260, 230, 50);
    fill(0);
    text(limit1[i], 315, i * 50 + 300);
  }
}


void disp9() {
  textFont(font2, 30);
  textAlign(LEFT);//テキストを左端揃え
  stroke(0);
  fill(127, 140, 141);
  rect(200, 280, 230, 50);
  fill(0);
  text("－                ＋", 220, 320);
  textAlign(CENTER);//テキストを中央揃え
  text(limit2[0], 315, 320);//月を表示
}


void disp10() {
  textFont(font2, 30);
  textAlign(LEFT);//テキストを左端揃え
  stroke(0);
  fill(127, 140, 141);
  rect(200, 350, 230, 50);
  fill(0);
  text("－                ＋", 220, 390);
  textAlign(CENTER);//テキストを中央揃え
  text(limit3[0], 315, 390);//日を表示
}


void disp_add5() {
  background(255);//背景塗りつぶし
  page = 6;
  fill(#bdc3c7);
  rect(150, 110, 280, 50);
  rect(200, 210, 230, 50);
  rect(200, 280, 230, 50);
  rect(200, 350, 230, 50);

  textAlign(LEFT);//テキストを左端揃え
  textFont(font2, 30);//フォントを指定
  fill(0);
  text("科目", 50, 150);
  text("期限", 50, 250);
  text("年", 150, 250);
  text("月", 150, 320);
  text("日", 150, 390);
  text(subject[s], 170, 145);//選択された科目を表示
  textAlign(CENTER);//テキストを左端揃え
  text(limit1[l1], 315, 245);//選択された年を表示
  text(limit2[l2], 315, 320);//選択された月を表示
  text(limit3[l3], 315, 390);//選択された日を表示
}