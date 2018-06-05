int page = 0;//ページ番号 
int a;//曜日判別用数字
int y = 0;//カレンダーをめくったとき、年をどれだけまたいだかを記録する
int m = 0;//カレンダーをめくったとき、月をどれだけまたいだかを記録する
int s = 6;//ToDoリスト登録画面の時、科目名用配列の何番目を表示するかを決める　6は「選択」
int l1 = 4;//ToDoリスト登録画面の時、年用配列の何番目を表示するかを決める　4は「選択」
int l2 = 1;//ToDoリスト登録画面の時、月用配列の何番目を表示するかを決める　1は「選択」
int l3 = 1;//ToDoリスト登録画面の時、日用配列の何番目を表示するかを決める　1は「選択」
int l21 = month();//ToDoリスト登録画面で月を入力する部分の初期値
int l31 = day();//ToDoリスト登録画面で日を入力する部分の初期値
int count;//ToDoリスト用配列のデータが入ってる位置を判別して保存するときに使う
int t_start = 0;//ストップウォッチのスタート時間を記録
int t_end = 0;//ストップウォッチのストップ時間を記録
int t_left = 0;//ストップウォッチで実際に測った時間
int timer = 0;
int timer_s = 0;
int timer_e = 0;

int x1 = int(random(80, 100));
int x2 = int(random(350, 400));
int x3 = int(random(-100, -90));
int x4 = int(random(270, 300));
int x5 = int(random(0, 250));
int x6 = int(random(-100, 100));
int x7 = int(random(-270, -30));
int y2 = 0;
int y3 = 50;
int y4 = 50;
int y5 = 0;
int y6 = 0;
float x = 50;//スケジュール画面の遷移（横長のページになっているのを、
//ホイールすることで切り替えて、次のページに行ったように見せる）
color fill1 = #e67e22;//それぞれの画面のメインカラーを入れる
String day[] = {"日", "月", "火", "水", "木", "金", "土"};//トップ画面の曜日表示用配列
String b_name[] = {"Click to Start", "Calendar", "Stopwatch", "Schedule", "ToDo", "Back", "OK"};
//メニュー画面や項目名用配列
String subject[] = {"Processing", "科学技術リテラシ", "解析学", "VEP", "サークル", "その他", 
  "          選択         "};//ToDoリスト登録時の科目表示用配列
String limit1[] = {str(year()), str(year()+1), str(year()+2), str(year()+3), " 選択  "};
//ToDoリスト登録時の年表示用配列
String limit2[] = {str(l21), "選択"};//ToDoリスト登録時の月表示用配列
String limit3[] = {str(l31), "選択"};//ToDoリスト登録時の日表示用配列
String list[];//ToDoリストの内容を保存するための配列
String week1[], week2[], week[];//スケジュールを保存するための配列
String week_r[] = new String[3];//登録するスケジュールを一時的に保存するための配列
color start[] = {color(26, 188, 156, 100), color(46, 204, 113, 100), color(52, 152, 219, 100), 
  color(241, 196, 15, 100), color(230, 126, 34, 100), color(231, 76, 60, 100)};
//トップ画面の背景の円の色をこの配列から選ぶ
PFont font1, font2;//フォント
PImage image2, image3, image4, image5, ame, yuki, kumo, hare, haikei, haikei2, 
  boy1, boy2, boy3, boy4;//画像

void setup() {
  size(480, 640);
  background(255);
  smooth();
  imageMode(CENTER);//イメージも中央の座標を指定
  font1 = loadFont("Harrington-25.vlw");//時計の文字盤用フォント
  font2 = loadFont("rounded-x-mplus-1c-regular-30.vlw");//メイン表示用フォント
  image2 = loadImage("calendar.png");//メニュー画面のアイコン　カレンダー
  image3 = loadImage("timer.png");//メニュー画面のアイコン　タイマー
  image4 = loadImage("schedule.png");//メニュー画面のアイコン　スケジュール
  image5 = loadImage("todo.png");//メニュー画面のアイコン　リスト
  ame = loadImage("ame.png");
  yuki = loadImage("yuki.png");
  kumo = loadImage("kumo.png");
  hare = loadImage("hare.png");
  haikei = loadImage("haikei.png");
  haikei2 = loadImage("haikei2.png");
  boy1 = loadImage("boy1.png");
  boy2 = loadImage("boy2.png");
  boy3 = loadImage("boy3.png");
  boy4 = loadImage("boy4.png");
  list = loadStrings("list.txt");//ToDoリストが保存されているテキストファイルを読み込む
  loadData("week1_1016000.txt", week1, unit_k1, unit_n1);//1週目のスケジュールを読み込む
  loadData("week2_1016000.txt", week2, unit_k2, unit_n2);//2週目のスケジュールを読み込む
  loadData("week_edit.txt", week, unit_k3, unit_n3);//保存したスケジュールを読み込む
  a = (year()+year()/4-year()/100+year()/400+(13*month()+8)/5+day())%7;//曜日の計算　ツェラーの公式
}

void mouseClicked() {//クリックされたときにおこること
  if (page == 0) {//ページが0（トップ）の場合は
    page = 1;//どこをクリックしても1ページ（メニュー）に行きます
    background(255);
  } else if (page == 1) {//ページが1の場合は
    if (mouseY > 10 && mouseY < 50) {
      if (mouseX > 10 && mouseX < 110) {
        page = 0;//Backボタンでトップに戻る
      } else if (mouseX > 120 && mouseX < 360) {
        page = page+1;
      }
    } else if (mouseY > 60 && mouseY < 330) {
      if (mouseX > 20 && mouseX < 230) {
        page = 2;//カレンダーのページ
      } else if (mouseX > 250 && mouseX < 470) {
        x = 0;
        page = 3;//ストップウォッチのページ
      }
    } else if (mouseY > 350 && mouseY < 620) {
      if (mouseX > 10 && mouseX < 230) {
        x = 50;
        page = 4; //スケジュールのページ
      } else if (mouseX > 250 && mouseX <470) {
        page = 5;//ToDoリストのページ
      }
    }
  } else if (page == 2) {//カレンダー
    if (mouseY > 10 && mouseY < 50) {
      if (mouseX > 10 && mouseX < 110) {
        m = y = 0;
        page = 1;//Backボタンで戻る
      } else if (mouseX > 120 && mouseX < 360) {
        m = y = 0;
        x = 0;
        page = page+1;
      }
    }else if (mouseY > 110 && mouseY < 140) {
      if (mouseX > 160 && mouseX < 190) {
        if (month()+m >1) {//表示しているカレンダーが2月以降だと
          m--;//月が1減る
        } else if (month()+m == 1) {//1月だと
          m = 12 - month();//12月になって
          y--;//1年減る
        }
      } else if (mouseX > 290 && mouseX <320) {
        if (month()+m < 12) {//11月以前だと
          m++;//月が1増える
        } else if (month()+m == 12) {//12月だと
          m = 1 - month();//1月になる
          y++;//1年増える
        }
      }
    }
  } else if (page == 3) {//ストップウォッチ
    if (mouseY > 10 && mouseY < 50) {
      if (mouseX > 10 && mouseX < 110) {
        page = 1;//Backボタンでトップに戻る
      } else if (mouseX > 120 && mouseX < 360) {
        x = 50;
        page = page+1;
      }
    }else if (mouseY > 510 && mouseY < 560) {
      if (mouseX > 170 && mouseX < 220) {
        if (x == 0) {
          t_start = millis();
          t_left = 0;
        } else {
          timer_s = millis();
          timer_e = 0;
          timer = 0;
        }
      } else if (mouseX > 260 && mouseX < 310) {
        if (x == 0) {
          t_end = millis();
          t_left = t_end - t_start;
        } else {
          timer_e = millis();
          timer = timer_e - timer_s;
        }
      }
    }
  } else if (page == 4) {
    if (mouseY > 10 && mouseY < 50) {
      if (mouseX > 10 && mouseX < 110) {
        page = 1;//Backボタンでトップに戻る
      } else if (mouseX > 120 && mouseX < 360) {
        page = page+1;
      }
    }
  } else if (page == 5) {
    if (mouseY > 10 && mouseY < 50) {
      if (mouseX > 10 && mouseX < 110) {
        page = 1;//Backボタンでトップに戻る
      } else if (mouseX > 120 && mouseX < 360) {
        page = 2;
      }
    }else if (mouseY > 580 && mouseY < 630 && mouseX > 10 && mouseX < 60) {//左下のリスト追加ボタン

      for (int i = 0; int(list[24-i*4]) != 0 && int(list[0]) == 0; i++) {//listの24-i*4番目にデータが記録されているかを確認
        count = i+1;//リストの項目の何個目に保存するかを決める
      }
      if (int(list[0]) != 0) {
        if (int(list[24]) == 0) {
          count = 0;
        } else if (int(list[20]) == 0) {
          count = 1;
        } else if (int(list[16]) == 0) {
          count = 2;
        } else if (int(list[12]) == 0) {
          count = 3;
        } else if (int(list[8]) == 0) {
          count = 4;
        } else if (int(list[4]) == 0) {
          count = 5;
        } else if (int(list[8]) == 0) {
          count = 4;
        } else {
          count = 0;//リストの1番目に保存する
        }
      }
      disp_add5();//リスト作成画面を表示
    }
  } else if (page == 6) {//リスト作成画面
    if (mouseY > 10 && mouseY < 50 && mouseX > 10 && mouseX < 110) {
      page = 5;//Backでリスト表示画面に戻る
    } else if (mouseY > 450 && mouseY < 500 && mouseX > 100 && mouseX < 380) {
      saveStrings("list.txt", list);//OKボタンで保存
      page = 5;//リスト表示画面に戻る
    } else if (mouseX > 150 && mouseX < 430 && mouseY > 110 && mouseY <160) {
      page = 7;//科目名選択画面
    } else if (mouseX > 200 && mouseX < 430) {
      if (mouseY > 210 && mouseY <260) {
        page = 8;//年選択画面
      } else if (mouseY > 280 && mouseY < 330) {
        page = 9;//月選択画面
      } else if (mouseY > 350 && mouseY < 400) {
        page = 10;//日選択画面
      }
    }
  } else if (page == 7) {//科目名選択画面
    if (mouseY > 10 && mouseY < 50 && mouseX > 10 && mouseX < 110) {
      page = 5;//Backでリスト表示画面に戻る
    } else if (mouseY > 450 && mouseY < 500 && mouseX > 100 && mouseX < 380) {
      list[27-count*4] = str(s);
      saveStrings("list.txt", list);//OKボタンで保存
      page = 5;//リスト表示画面に戻る
    } else if (mouseX > 150 && mouseX < 430) {
      if (mouseY > 160 && mouseY < 210) {
        s = 0;//Processing
      } else if (mouseY > 210 && mouseY < 260) {
        s = 1;//科学技術リテラシ
      } else if (mouseY > 260 && mouseY < 310) {
        s = 2;//解析学
      } else if (mouseY > 310 && mouseY < 360) {
        s = 3;//VEP
      } else if (mouseY > 360 && mouseY < 410) {
        s = 4;//サークル
      } else if (mouseY > 410 && mouseY < 460) {
        s = 5;//その他
      }
      list[27-count*4] = str(s);//選択した科目名をlistに入れる
      disp_add5();//リスト作成画面を表示
    } else {
      s = 6;//選択▼
    }
  } else if (page == 8) {//年選択画面
    if (mouseY > 10 && mouseY < 50 && mouseX > 10 && mouseX < 110) {
      page = 5;//Backでリスト表示画面に戻る
    } else if (mouseY > 450 && mouseY < 500 && mouseX > 100 && mouseX < 380) {
      list[26-count*4] = limit1[l1];
      saveStrings("list.txt", list);//OKボタンで保存
      page = 5;//リスト表示画面に戻る
    } else if (mouseX > 150 && mouseX < 430 && mouseY > 110 && mouseY <160) {
      page = 7;//科目名選択画面
    } else if (mouseX > 200 && mouseX < 430) {
      if (mouseY > 260 && mouseY < 310) {
        l1 = 0;//今年
      } else if (mouseY > 310 && mouseY < 360) {
        l1 = 1;//来年
      } else if (mouseY > 360 && mouseY < 410) {
        l1 = 2;//再来年
      } else if (mouseY >410 && mouseY < 460) {
        l1 = 3;//明明後年
      }
      list[26-count*4] = limit1[l1];//選択した年をlistに入れる
      disp_add5();//リスト作成画面を表示
    } else {
      l1 = 4;//選択▼
    }
  } else if (page == 9) {//月選択
    l2 = 0;
    list[25-count*4] = limit2[l2];
    if (mouseY > 10 && mouseY < 50 && mouseX > 10 && mouseX < 110) {
      page = 5;//Backでリスト表示画面に戻る
    } else if (mouseY > 450 && mouseY < 500 && mouseX > 100 && mouseX < 380) {
      l2 = 0;//期限保存用配列のl2(0)番目が表示される
      list[25-count*4] = limit2[l2];//選択した月をlistに入れる
      saveStrings("list.txt", list);//OKボタンで保存
      page = 5;//リスト表示画面に戻る
    } else if (mouseX > 150 && mouseX < 430 && mouseY > 110 && mouseY <160) {
      list[25-count*4] = limit2[l2];
      page = 7;//科目名選択画面
    } else if (mouseX > 200 && mouseX < 430 && mouseY > 210 && mouseY <260) {
      list[25-count*4] = limit2[l2];
      page = 8;//年選択画面
    } else if (mouseX > 200 && mouseX < 430 && mouseY > 350 && mouseY < 400) {
      list[25-count*4] = limit2[l2];
      page = 10;//日選択画面
    } else if (mouseY > 280 && mouseY < 330) {
      if (mouseX > 200 && mouseX < 250) {
        if (l21 == 1) {//l21(期限の月）が1の時にマイナスが押されたら
          l21 = 12;//12月にする
          list[25-count*4] = limit2[l2];
        } else {
          l21 = l21 -1;//月を1減らす
          list[25-count*4] = limit2[l2];
        }
      } else if (mouseX > 380 && mouseX < 430) {
        if (l21 == 12) {//l21（期限の月）が12の時にプラスが押されたら
          l21 = 1;//1月にする
        } else {
          l21 = l21 + 1;//月を1増やす
        }
      }
      limit2[0] = str(l21);//期限保存用配列に保存
    } else {
      l2 = 0;//期限保存用配列のl2(0)番目が表示される
      list[25-count*4] = limit2[l2];//選択した月をlistに入れる
      disp_add5();//リスト作成画面を表示
    }
  } else if (page == 10) {
    if (mouseY > 10 && mouseY < 50 && mouseX > 10 && mouseX < 110) {
      page = 5;//Backでリスト表示画面に戻る
    } else if (mouseY > 450 && mouseY < 500 && mouseX > 100 && mouseX < 380) {
      l3 = 0;//期限保存用配列のl3(0)番目が表示される
      list[25-count*4] = limit2[l2];
      list[24-count*4] = limit3[l3];//選択した日をlistに保存
      saveStrings("list.txt", list);//OKボタンで保存
      page = 5;//リスト表示画面に戻る
    } else if (mouseX > 150 && mouseX < 430 && mouseY > 110 && mouseY <160) {
      page = 7;//科目名選択画面
    } else if (mouseX > 200 && mouseX < 430 && mouseY > 210 && mouseY <260) {
      page = 8;//年選択画面
    } else if (mouseX > 200 && mouseX < 430 && mouseY > 280 && mouseY < 330) {
      list[24-count*4] = limit3[l3];
      page = 9;//月選択画面
    } else if (mouseY > 350 && mouseY < 400) {
      if (mouseX > 200 && mouseX < 250) {
        if (l31 == 1) {//l31(期限の日)が1の状態で－が押されたら
          if (l21 == 2) {
            if (int(limit1[l1])%4 == 0 && (int(limit1[l1])%100 != 0 || int(limit1[l1])%400 == 0)) {
              l31 = 29;
            } else {
              l31 = 28;
            }
          } else if (l21 == 4 || l21 == 6 || l21 == 9 || l21 == 1) {
            l31 = 30;
          } else {
            l31 = 31;//31日にする
          }
        } else {
          l31 = l31 - 1;//日を1減らす
        }
        limit3[0] = str(l31);//期限保存用配列に保存
      } else if (mouseX > 380 && mouseX < 430) {
        if ((l21 == 2) && ((int(limit1[l1])%4 == 0 && (int(limit1[l1])%100 != 0 || int(limit1[l1])%400 == 0) && l31 >= 29)
          || (int(limit1[l1])%4 != 0 && (int(limit1[l1])%100 == 0 || int(limit1[l1])%400 != 0) && l31 >= 28))) {
          l31 = 1;
        } else if ((l21 == 4 || l21 == 6 || l21 == 9 || l21 == 1) && l31 >= 30) {
          l31 = 1;
        } else if ((l21 == 1 || l21 == 3 || l21 == 5 || l21 == 7 || l21 == 8 || l21 == 10 || l21 == 12) && l31 == 31) {
          l31 = 1;
        } else {
          l31 = l31 + 1;//日を1増やす
        }
        limit3[0] = str(l31);//期限保存用配列に保存
      } else {
        l3 = 0;//期限保存用配列のl3(0)番目が表示される
        list[24-count*4] = limit3[l3];//選択した日をlistに保存
        disp_add5();//リスト作成画面を表示
      }
    }
  }
}


void mouseWheel(MouseEvent e) {//マウスホイールの時に起こること
  if (page == 2) {//2ページ目（カレンダー）のとき
    if (e.getAmount() < 0) {//上から下にホイール（Windows）すると
      if (month()+m >1) {//2月以降だと
        m--;//月の数字が1減る
      } else if (month()+m == 1) {//1月だと
        m = 12 - month();//12月になる
        y--;//年の数字が1減る
      }
    } else if (e.getAmount() > 0) {//下から上にホイールすると
      if (month()+m < 12) {//11月以前だと
        m++;//月の数字が1増える
      } else if (month()+m == 12) {//12月だと
        m = 1 - month();//1月になる
        y++;//年の数字が1増える
      }
    }
  }
  if ( page == 3) {
    if (e.getAmount() > 0 && x == 0) {
      x = -480;
    } else if (e.getAmount() < 0 && x == -480) {
      x = 0;
    }
  }
  if (page == 4) {//4ページ（スケジュール）のとき
    if (e.getAmount() > 0 && x == 50) {
      x = -430;
    } else if (e.getAmount() < 0 && x == -910) {
      x = -430;
    } else if (x == -430) {
      if (e.getAmount() < 0) {
        x = 50;
      } else if (e.getAmount() > 0) {
        x = -910;
      }
    }
  }
}


void mouseDragged(MouseEvent e) {//ドラッグのときにおこること
  if (page == 5) {//5ページ（リスト）のとき
    for (int i = 0; i < list.length/4; i++) {
      if (mouseY > (i+1)*70-10 && mouseY < (i+1)*70+60) {//ドラッグされたマウス位置と一致したところにあるリストを
        list[27-i*4] = list[26-i*4] = list[25-i*4] = list[24-i*4] = "0";//0に書き換える（消す）
        saveStrings("list.txt", list);//テキストに上書き保存
      }
    }
  }
}


void draw() {
  textAlign(CENTER);//テキストは基本的に中央揃え
  textFont(font1, 25);//最初は時計用のフォント

  switch(page) {//ページの値によって呼び出す関数を変える
  case 0://0ページ目の時
    disp0();
    break;
  case 1://1ページ目の時
    disp1();
    break;
  case 2://2ページ目の時
    disp2();
    break;
  case 3://3ページ目の時
    disp3();
    break;
  case 4://4ページ目の時
    disp4();
    break;
  case 5://5ページ目の時
    disp5();
    list = loadStrings("list.txt");//リストを念のため読み込みしなおす
    break;
  case 6://6ページ目の時
    disp6();
    break;
  case 7://7ページ目の時
    disp7();
    break;
  case 8://8ページ目の時
    disp8();
    break;
  case 9://9ページ目の時
    disp9();
    break;
  case 10://10ページ目の時
    disp10();
    break;
  }
}

void back() {//戻るボタン
  textFont(font2, 30);
  textAlign(RIGHT);
  fill(fill1);
  noStroke();//枠線なし
  rect(10, 10, 100, 40, 5);//ボタンの形　ちょっと角を丸める
  rect(120, 10, 240, 40, 5);
  fill(255);
  text(b_name[5], 100, 40);//Backの表示
  triangle(15, 30, 25, 20, 25, 40);//戻るっぽい三角
}