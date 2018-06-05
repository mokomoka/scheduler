void disp1() {
  frameRate(60);
  try {
    JSONObject w = loadJSONObject(URL);
    forecasts = w.getJSONArray("forecasts");
    weather();
  }
  catch (Exception e) {
    if (frameCount%60 == 30) {
      strokeWeight(random(5, 50));
      stroke(start[int(random(start.length))]);
      line(0, random(height), width, random(height));
    }
  } 
  tint(255, 180);
  fill1 = #e67e22;
  back();//戻るボタンを表示
  textFont(font2);//フォントを再指定
  textAlign(CENTER);//テキストを中央揃え
  text("Menu", width/2, 40);
  strokeWeight(2);//線の太さを2にする
  stroke(0);//線の色黒
  fill(255, 255, 255, 150);//塗りつぶしの色を半透明の白
  rect(20, 60, 210, 270, 10);//メニューの区切り線
  rect(250, 60, 210, 270, 10);
  rect(20, 350, 210, 270, 10);
  rect(250, 350, 210, 270, 10);  
  image(image2, width/4+5, height/4+10, 160, 160);//メニューのアイコン
  image(image3, width*3/4, height/4+10, 160, 160);
  image(image4, width/4+5, height*3/4-10, 160, 160);
  image(image5, width*3/4, height*3/4-10, 160, 160);
  fill(0, 0, 0, 210);//塗りつぶしを黒
  text(b_name[1], 120, 300);//メニューの項目名
  text(b_name[2], 360, 300);
  text(b_name[3], 120, 590);
  text(b_name[4], 360, 590);
}