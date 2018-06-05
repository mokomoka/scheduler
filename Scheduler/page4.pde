String dw[] = {"SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"};
int unit_n1[][] = new int[7][];
int unit_n2[][] = new int[7][];
int unit_n3[][] = new int[7][];
int unit_k1[][] = new int[7][];
int unit_k2[][] = new int[7][];
int unit_k3[][] = new int[7][];


void setColor(int i, int n) {//色を決めるための関数
  i = i%n;
  colorMode(HSB, n);
  fill(i, n-5, n);//塗りつぶしの色を返す
  colorMode(RGB, 255);
}

int getDayOfWeek(String s) {
  for (int i = 0; i < 7; i++) {
    if (s.equals(dw[i])) {
      return i;
    }
  }
  return -1;
}

boolean loadData(String fn, String []a, int [][]unit_k, int[][]unit_n) {
  String d[];
  String n[] = {"", "", "", "", "", "", ""};
  String k[] = {"", "", "", "", "", "", ""};
  int dow, sum, i, j;
  a= loadStrings(fn);

  for (i = 0; i < a.length; i++) {
    d = a[i].split(",");
    dow = getDayOfWeek(d[0]);
    k[dow] += (d[1]+",");
    n[dow] += (d[2]+",");
  }

  for (i = 0; i < 7; i++) {
    unit_k[i] = int(k[i].split(","));
    unit_n[i] = int(n[i].split(","));
  }

  for (i = 0; i < 7; i++) {
    sum = 0;
    for (j = 0; j < unit_n[i].length; j++) {
      sum += unit_n[i][j];
    }

    if (sum != 96) {
      return false;
    }
  }
  return true;
}

void showBandGraph(float x, float y, int k[], int n[]) {//帯グラフ表示用の関数
  float w;//グラフの連続した時間分の幅

  for (int i = 0; i < n.length; i++) {
    if (k[i] == 0) {//項目が睡眠の時
      strokeWeight(3);
      stroke(255, 0, 0);//赤で強調
    } else if (k[i] == 2) {//項目が自習の時
      strokeWeight(3);
      stroke(0, 255, 0);//緑で強調
    } else if (k[i] == 3) {//項目が余暇の時
      strokeWeight(3);
      stroke(0, 0, 255);//青で強調
    } else {
      strokeWeight(1);
      stroke(0);
    }

    w = n[i] * 400.0/96;//横幅が400になるよう調整
    setColor(k[i], 8);//色をセット
    rect(x, y, w, 30);//長方形を書く
    x = x+w;
  }
}

void disp4() {
  background(255);//背景塗りつぶし
  fill1 = #3498db;

  back();//戻るボタン
  textAlign(CENTER);//テキストを中央揃え
  strokeCap(SQUARE);//lineの端の処理を四角にしてみました
  text(b_name[3], width/2, 40);
  float y;

  textAlign(RIGHT);
  for (int i = 0; i < 7; i++) {//グラフとか表示用繰り返し
    fill(0);
    y = (i + 1)*80+10;
    textSize(15);
    text(day[i], 40, y+20);//曜日を1ページ目に表示
    textSize(20);
    text("一週目", x+240, 80);//1ページ目に一週目と表示
    text("二週目", x+480+240, 80);//2ページ目に二週目と表示
    text("今週", x+960+240, 80);//3ページ目に今週と表示
    showBandGraph(x, y, unit_k1[i], unit_n1[i]);//一週目のグラフ
    showBandGraph(x+480, y, unit_k2[i], unit_n2[i]);//二週目のグラフ
    showBandGraph(x+960, y, unit_k3[i], unit_n3[i]);//今週のグラフ
  }

  colorMode(RGB, 255);//カラーモードを戻す

  if (loadData("week_edit.txt", week, unit_k3, unit_n3) == false) {
    fill(0);
    text("授業で入力した形式で、", x+1290, height/2-40);
    text("week_edit.txtに入力してね!", x + 1300, height/2 - 20);
    text("（Excelを使うと便利）", x+1270, height/2+20);
  }
}