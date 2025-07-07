import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hasta Sorgu Ekranı',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        fontFamily: 'Roboto',
      ),
      home: HastaSorguEkrani(),
    );
  }
}

class HastaSorguEkrani extends StatefulWidget {
  @override
  _HastaSorguEkraniState createState() => _HastaSorguEkraniState();
}

class _HastaSorguEkraniState extends State<HastaSorguEkrani> {
  DateTime baslangicTarihi = DateTime.now();
  DateTime bitisTarihi = DateTime.now();
  
  // Örnek hasta verileri
  List<Hasta> tumHastalar = [
    Hasta(
      id: 18,
      ad: "LEMAN DEMİRHİSAR",
      kimlikNo: "19354957496",
      yas: 96,
      cinsiyet: "Kadın",
      protokolNo: "A-195114-2-001-A-030725-00012541",
      tarih: "03.07.2025 13:52",
      adres: "Atatürk Mah. Sevgi Cad. No: 88 K Foça / İzmir",
      isYabanci: false,
      isVatansiz: false,
      isKesinKayitli: true,
    ),
    Hasta(
      id: 17,
      ad: "SEVİM İLKİLIÇ",
      kimlikNo: "38413608472",
      yas: 71,
      cinsiyet: "Kadın",
      protokolNo: "A-195114-2-001-A-030725-00012540",
      tarih: "03.07.2025 11:49",
      adres: "ATATÜRK MAH. 101 SK NO: 13/2 FOÇA / İZMİR",
      isYabanci: false,
      isVatansiz: false,
      isKesinKayitli: true,
    ),
    Hasta(
      id: 16,
      ad: "FEHİM GÜNEŞ",
      kimlikNo: "47344168614",
      yas: 76,
      cinsiyet: "Erkek",
      protokolNo: "A-195114-2-001-A-030725-00012539",
      tarih: "03.07.2025 11:45",
      adres: "Atatürk Mah. Candede Cad. No: 21 İç Kapı No: 3 Foça / İzmir",
      isYabanci: false,
      isVatansiz: false,
      isKesinKayitli: false,
    ),
    Hasta(
      id: 15,
      ad: "MEHMET MERT SOBAYAPAN",
      kimlikNo: "23644581148",
      yas: 33,
      cinsiyet: "Erkek",
      protokolNo: "A-195114-2-001-A-030725-00012538",
      tarih: "03.07.2025 11:31",
      adres: "",
      isYabanci: true,
      isVatansiz: false,
      isKesinKayitli: false,
    ),
    Hasta(
      id: 14,
      ad: "RABİA KAÇAN",
      kimlikNo: "32638616570",
      yas: 73,
      cinsiyet: "Kadın",
      protokolNo: "A-195114-2-001-A-030725-00012537",
      tarih: "03.07.2025 11:34",
      adres: "İsmetpaşa Mah. Meryemaki Cad. No: 184 Foça / İzmir",
      isYabanci: false,
      isVatansiz: true,
      isKesinKayitli: false,
    ),
  ];

  List<Hasta> filtrelenenHastalar = [];
  String selectedFilter = "Tümü";

  @override
  void initState() {
    super.initState();
    filtrelenenHastalar = tumHastalar;
  }

  void sorgulaBebekHasta() {
    setState(() {
      filtrelenenHastalar = tumHastalar.where((hasta) => hasta.yas <= 1).toList();
      selectedFilter = "Bebek Hasta (0-1 yaş)";
    });
    _showFilterDialog("Bebek Hasta (0-1 yaş)", filtrelenenHastalar.length);
  }

  void sorgulacocukHasta() {
    setState(() {
      filtrelenenHastalar = tumHastalar.where((hasta) => hasta.yas >= 1 && hasta.yas <= 17).toList();
      selectedFilter = "Çocuk Hasta (1-17 yaş)";
    });
    _showFilterDialog("Çocuk Hasta (1-17 yaş)", filtrelenenHastalar.length);
  }

  void sorgulaKadinIzlem() {
    setState(() {
      filtrelenenHastalar = tumHastalar.where((hasta) => 
        hasta.cinsiyet == "Kadın" && hasta.yas >= 15 && hasta.yas <= 49).toList();
      selectedFilter = "Kadın İzlem (15-49 yaş)";
    });
    _showFilterDialog("Kadın İzlem (15-49 yaş)", filtrelenenHastalar.length);
  }

  void sorgulaYabanciHasta() {
    setState(() {
      filtrelenenHastalar = tumHastalar.where((hasta) => hasta.isYabanci).toList();
      selectedFilter = "Yabancı Hasta";
    });
    _showFilterDialog("Yabancı Hasta", filtrelenenHastalar.length);
  }

  void _showFilterDialog(String filterType, int count) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sorgu Sonucu'),
          content: Text('$filterType: $count hasta bulundu'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Tamam'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectDateRange() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDateRange: DateTimeRange(
        start: baslangicTarihi,
        end: bitisTarihi,
      ),
    );
    
    if (picked != null) {
      setState(() {
        baslangicTarihi = picked.start;
        bitisTarihi = picked.end;
      });
    }
  }

  String get formatliTarihAraligi {
    final baslangic = "${baslangicTarihi.day.toString().padLeft(2, '0')}.${baslangicTarihi.month.toString().padLeft(2, '0')}.${baslangicTarihi.year}";
    final bitis = "${bitisTarihi.day.toString().padLeft(2, '0')}.${bitisTarihi.month.toString().padLeft(2, '0')}.${bitisTarihi.year}";
    
    if (baslangic == bitis) {
      return baslangic;
    } else {
      return "$baslangic - $bitis";
    }
  }

  int get toplamIslem => tumHastalar.length;
  int get kesinKayitliHasta => tumHastalar.where((hasta) => hasta.isKesinKayitli).length;
  int get misafirHasta => tumHastalar.where((hasta) => !hasta.isKesinKayitli && !hasta.isYabanci && !hasta.isVatansiz).length;
  int get yabanciHasta => tumHastalar.where((hasta) => hasta.isYabanci).length;
  int get vatansizHasta => tumHastalar.where((hasta) => hasta.isVatansiz).length;
  int get baskaHekimeGiden => 0; // Örnek veri

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasta Sorgu Ekranı', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF8B4513),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Üst başlık bölümü
          Container(
            width: double.infinity,
            color: Color(0xFF8B4513),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Color(0xFF654321),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Yönetim',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Color(0xFF8B4513),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Karar Destek',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Color(0xFF654321),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Protokol Defteri',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Tarih ve arama bölümü
          Container(
            color: Color(0xFFE8E8E8),
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                // Tarih seçimi
                GestureDetector(
                  onTap: _selectDateRange,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          formatliTarihAraligi,
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16),
                
                // Arama butonları
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF4CAF50),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Icon(Icons.search, color: Colors.white, size: 16),
                            SizedBox(width: 4),
                            Text('Sorgula', style: TextStyle(color: Colors.white, fontSize: 14)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF4CAF50),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Icon(Icons.print, color: Colors.white, size: 16),
                            SizedBox(width: 4),
                            Text('Yazdır', style: TextStyle(color: Colors.white, fontSize: 14)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
                Spacer(),
                
                // Sağ üst sorgu ikonları
                Row(
                  children: [
                    _buildQueryIcon(Icons.child_care, "Bebek", sorgulaBebekHasta),
                    SizedBox(width: 8),
                    _buildQueryIcon(Icons.child_friendly, "Çocuk", sorgulacocukHasta),
                    SizedBox(width: 8),
                    _buildQueryIcon(Icons.pregnant_woman, "Kadın", sorgulaKadinIzlem),
                    SizedBox(width: 8),
                    _buildQueryIcon(Icons.public, "Yabancı", sorgulaYabanciHasta),
                    SizedBox(width: 8),
                    _buildQueryIcon(Icons.folder, "Dosya", () {}),
                    SizedBox(width: 8),
                    _buildQueryIcon(Icons.archive, "Arşiv", () {}),
                  ],
                ),
              ],
            ),
          ),
          
          // Hasta listesi
          Expanded(
            child: Container(
              color: Colors.grey[100],
              child: ListView.builder(
                itemCount: filtrelenenHastalar.length,
                itemBuilder: (context, index) {
                  final hasta = filtrelenenHastalar[index];
                  return _buildHastaCard(hasta);
                },
              ),
            ),
          ),
          
          // Alt istatistik bölümü
          Container(
            color: Color(0xFF654321),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatIcon(Icons.assignment, toplamIslem, "Toplam İşlem"),
                _buildStatIcon(Icons.person, kesinKayitliHasta, "Kesin Kayıtlı"),
                _buildStatIcon(Icons.person_outline, misafirHasta, "Misafir"),
                _buildStatIcon(Icons.public, yabanciHasta, "Yabancı"),
                _buildStatIcon(Icons.person_off, vatansizHasta, "Vatansız"),
                _buildStatIcon(Icons.transfer_within_a_station, baskaHekimeGiden, "Başka Hekim"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQueryIcon(IconData icon, String tooltip, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Tooltip(
        message: tooltip,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xFF4CAF50),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
      ),
    );
  }

  Widget _buildStatIcon(IconData icon, int count, String label) {
    return Column(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(icon, color: Colors.white, size: 18),
        ),
        SizedBox(height: 4),
        Text(
          count.toString(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  Widget _buildHastaCard(Hasta hasta) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sol taraf - Hasta bilgileri
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Color(0xFF4CAF50),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Text(
                            hasta.id.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          hasta.ad,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF2E7D32),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  _buildInfoRow("Kimlik No:", hasta.kimlikNo),
                  _buildInfoRow("Yaş:", "${hasta.yas} Cinsiyet: ${hasta.cinsiyet}"),
                  _buildInfoRow("Adres:", hasta.adres),
                ],
              ),
            ),
            
            // Orta - Protokol bilgileri
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(Icons.person, color: Colors.grey[600]),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hasta.tarih,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                            Text(
                              "Prot. No: ${hasta.protokolNo}",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Sağ taraf - Durum ikonları
            Column(
              children: [
                if (hasta.isKesinKayitli)
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.check, color: Colors.white, size: 14),
                  ),
                if (hasta.isYabanci)
                  Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.public, color: Colors.white, size: 14),
                  ),
                if (hasta.isVatansiz)
                  Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.person_off, color: Colors.white, size: 14),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Hasta {
  final int id;
  final String ad;
  final String kimlikNo;
  final int yas;
  final String cinsiyet;
  final String protokolNo;
  final String tarih;
  final String adres;
  final bool isYabanci;
  final bool isVatansiz;
  final bool isKesinKayitli;

  Hasta({
    required this.id,
    required this.ad,
    required this.kimlikNo,
    required this.yas,
    required this.cinsiyet,
    required this.protokolNo,
    required this.tarih,
    required this.adres,
    required this.isYabanci,
    required this.isVatansiz,
    required this.isKesinKayitli,
  });
}