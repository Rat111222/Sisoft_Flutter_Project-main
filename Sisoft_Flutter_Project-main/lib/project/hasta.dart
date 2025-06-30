
import 'dart:io';

abstract class Person {
  String? name;
  String? surname;
}

class Hasta extends Person {
  //Data Members:
  bool? hastaMuayenedeMi;
  String? hastaID;
  int? siraNO;
  int yasi = 0;
  Hasta(String name, String surname, String hastaID, int yasi) {
    this.name = name;
    this.surname = surname;
    this.hastaID = hastaID;
    hastaMuayenedeMi = false;
    this.yasi = yasi;
  }
  void getInfo() {
    print("Name: $name, Surname: $surname");
  }
}

class HospitalSystem {
  static List<Hasta> bekleyenYaslilar = [];
  static int hastaSayisi = 0;
  static List<Hasta> bekleyenhastalar = bekleyenYaslilar + [];
  static List<Hasta> bakilanHastalar = [];
  static void muayeneEt(Hasta h) {
    bekleyenhastalar.remove(h);
    if (h.yasi >= 65) {
      bekleyenYaslilar.remove(h);
    }
    for (int i = 0; i < bekleyenhastalar.length; i++) {
      bekleyenhastalar[i].siraNO = i;
    }
    h.hastaMuayenedeMi = true;
    bakilanHastalar.add(h);
  }

  static void muayeneEtSirayaGore() {
    Hasta muayenedilen = bekleyenhastalar.removeAt(0);
    if (muayenedilen.yasi >= 65) {
      bekleyenYaslilar.removeAt(0);
    }
    bakilanHastalar.add(muayenedilen);
  }

  static void hastaSil(Hasta h) {
    if (h.yasi >= 65) {
      bekleyenYaslilar.remove(h);
    }
    bekleyenhastalar.remove(h);
    for (int i = 0; i < bekleyenhastalar.length; i++) {
      bekleyenhastalar[i].siraNO = i;
    }
  }

  static void hastaEkleKuyruga(Hasta h) {
    if (h.yasi >= 65) {
      for (int i = 0; i < bekleyenYaslilar.length; i++) {
        bekleyenhastalar.removeAt(i);
      }
      bekleyenYaslilar.add(h);
      bekleyenhastalar = bekleyenYaslilar + bekleyenhastalar;
    } else {
      bekleyenhastalar.add(h);
    }
  }

  static void hastaListesi(List<Hasta> ll) {
    for (int i = 0; i < ll.length; i++) {
      ll[i].getInfo();
    }
  }
}


void main() {
  testyap();
}

class Becktestcontent {
  List degerleri = [
    "Hiç",
    "Hafif Düzeyde Beni pek Etkilemedi",
    "Orta Düzeyde Hoş değildi ama Katlanabildim",
    "Ciddi Düzeyde Dayanmakta çok zorlandım"
  ];
  List olcutler = [
    "Bedeninizin herhangi bir yerinde uyuşma veya karıncalanma",
    "Sıcak/ateş basmaları",
    "Bacaklarda halsizlik, titreme",
    "Gevşeyememe",
    "Çok kötü şeyler olacak korkusu",
    "Baş dönmesi veya sersemlik",
    "Kalp çarpıntısı",
    "Dengeyi kaybetme duygusu",
    "Dehşete kapılma",
    "Sinirlilik",
    "Boğuluyormuş gibi olma duygusu",
    "Ellerde titreme",
    "Titreklik",
    "Kontrolü kaybetme korkuşu",
    "Nefes almada güçlük",
    "Ölüm korkuşu",
    "Korkuya kapılma",
    "Midede hazımsızlık ya da rahatsızlık hissi",
    "Baygınlık",
    "Yüzün kızarması",
    "Terleme (sıcaklığa bağlı olmayan)"
  ];
  var tableData = <String, int>{};
  Becktestcontent() {
    for (int i = 0; i < olcutler.length; i++) {
      olcutekle(olcutler[i]);
    }
  }
  void olcutekle(String s) {
    //Değeri otomatik 0 alınır...
    tableData[s] = 0;
  }
}

int testyap() {
  Becktestcontent test = Becktestcontent();
  for (int i = 0; i < test.olcutler.length; i++) {
    print("Soru : ${test.olcutler[i]} ${test.degerleri}");
    String? deger = stdin.readLineSync();
    if (deger != null && deger.isNotEmpty) {
      test.tableData[test.olcutler[i]] = int.parse(deger);
    }else{
      test.tableData[test.olcutler[i]] = 0;
    }
  }
  int sum = 0;
  for(int i= 0; i < test.tableData.length;i++){
    sum += test.tableData[test.olcutler[i]]?? 0;
  }
  return sum;
  
  
}
