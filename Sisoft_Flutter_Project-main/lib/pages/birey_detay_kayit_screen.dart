import 'package:flutter/material.dart';

class BireyDetayKayitScreen extends StatefulWidget {
  @override
  _BireyDetayKayitScreenState createState() => _BireyDetayKayitScreenState();
}

class _BireyDetayKayitScreenState extends State<BireyDetayKayitScreen> {
  String tcKimlikNo = '24743124502';
  String ad = 'NAZLI ZEYNEP ';
  String cinsiyet = 'Kadın';
  String soyad = 'ESKİCİ';

  // Controllers
  TextEditingController ameliyatController = TextEditingController();
  TextEditingController ilacController = TextEditingController();
  TextEditingController ilacDozController = TextEditingController();
  TextEditingController aileOykusuController = TextEditingController();
  TextEditingController fizikselAktiviteController = TextEditingController();
  TextEditingController beslenmeController = TextEditingController();
  TextEditingController uygulamaController = TextEditingController();
  TextEditingController sosyalController = TextEditingController();

  // İlaç tarihi için
  DateTime? selectedIlacTarihi;

  // Acil durumda aranacak
  bool acilDurumAranacak = false;

  // Lists
  List<String> ameliyatlar = [];
  List<Map<String, dynamic>> ilaclar = []; // İlaç bilgilerini map olarak saklayacağız
  List<String> kotuAliskanliklar = [];
  List<String> fizikselAktiviteler = [];
  List<String> beslenmeAliskanliklari = [];
  List<String> uygulamalar = [];
  List<String> sosyalEtkinlikler = [];

  // Active section index
  int activeSection = 0;

  Map<String, bool> aliskanliklar = {
    'Sigara': false,
    'Alkol': false,
    'Uyuşturucu': false,
    'Aşırı Kafein': false,
    'Fast Food': false,
    'Sedanter Yaşam': false,
  };

  Map<String, bool> fizikselDurumlar = {
    'Koşu': false,
    'Yürüyüş': false,
    'Spor Salonu': false,
    'Yoga': false,
    'Yüzme': false,
    'Bisiklet': false,
  };

  Map<String, bool> beslenmeAliskanliklariMap = {
    'Düzenli Öğün': false,
    'Sağlıklı Atıştırma': false,
    'Bol Su İçme': false,
    'Sebze Ağırlıklı': false,
    'Az Tuz': false,
    'Az Şeker': false,
  };

  List<String> sectionTitles = [
    'Genel Bilgiler',
    'Geçirilen Ameliyatlar', 
    'Kötü Alışkanlıklar',
    'Kullanılan İlaçlar',
    'Fiziksel Aktivite',
    'Beslenme Alışkanlıkları',
    'Sağlık Uygulamaları',
    'Sosyal Aktiviteler'
  ];

  List<IconData> sectionIcons = [
    Icons.people,
    Icons.local_pharmacy,
    Icons.local_drink,
    Icons.medical_services,
    Icons.directions_run,
    Icons.restaurant,
    Icons.apps,
    Icons.groups
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Color(0xFF8B4513),
        title: Row(
          children: [
            Text('Birey', style: TextStyle(color: Colors.white, fontSize: 16)),
            SizedBox(width: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Color(0xFF654321),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(sectionTitles[activeSection],
                  style: TextStyle(color: Colors.white, fontSize: 14)),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Color(0xFF87CEEB),
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('TC Kimlik No : $tcKimlikNo',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    Text('Cinsiyet : $cinsiyet',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Ad : $ad',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    Text('Soyad : $soyad',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(sectionIcons.length, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: _buildIconButton(sectionIcons[index], activeSection == index, index),
                  );
                }),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: _buildActiveSection(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, bool isActive, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          activeSection = index;
        });
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isActive ? Color(0xFF2E5EAA) : Color(0xFF87CEEB),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }

  Widget _buildActiveSection() {
    switch (activeSection) {
      case 0:
        return _buildGenelBilgiler();
      case 1:
        return _buildAmeliyatlarSection();
      case 2:
        return _buildKotuAliskanliklarSection();
      case 3:
        return _buildIlaclarSection();
      case 4:
        return _buildFizikselAktiviteSection();
      case 5:
        return _buildBeslenmeSection();
      case 6:
        return _buildUygulamalarSection();
      case 7:
        return _buildSosyalSection();
      default:
        return _buildGenelBilgiler();
    }
  }

  Widget _buildGenelBilgiler() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Kişisel Bilgiler'),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildInfoRow('TC Kimlik No', tcKimlikNo),
                  _buildInfoRow('Ad', ad),
                  _buildInfoRow('Soyad', soyad),
                  _buildInfoRow('Cinsiyet', cinsiyet),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          // Acil durumda aranacak checkbox
          CheckboxListTile(
            title: Text(
              'Acil durumda aranacak',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2E5EAA),
              ),
            ),
            value: acilDurumAranacak,
            onChanged: (bool? value) {
              setState(() {
                acilDurumAranacak = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
            activeColor: Color(0xFF2E5EAA),
          ),
          SizedBox(height: 20),
          _buildSectionTitle('Aile Öyküsü'),
          TextField(
            controller: aileOykusuController,
            maxLines: 6,
            decoration: InputDecoration(
              hintText: 'Aile hastalık geçmişi, genetik özellikler vb. bilgileri giriniz...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: Colors.grey[50],
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: ElevatedButton(
              onPressed: _kaydet,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2E5EAA),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Kaydet', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmeliyatlarSection() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Geçirilen Ameliyatlar'),
          _buildAddItemSection('Ameliyat Adı', ameliyatController, ameliyatlar, () => _addAmeliyat()),
          _buildItemList(ameliyatlar, _removeAmeliyat),
        ],
      ),
    );
  }

  Widget _buildKotuAliskanliklarSection() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Kötü Alışkanlıklar'),
          _buildAliskanliklar(),
        ],
      ),
    );
  }

  Widget _buildIlaclarSection() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Kullanılan İlaçlar'),
          _buildIlacEklemeSection(),
          _buildIlacList(),
        ],
      ),
    );
  }

  Widget _buildIlacEklemeSection() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Yeni İlaç Ekle',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E5EAA),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: ilacController,
              decoration: InputDecoration(
                labelText: 'İlaç Adı',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.grey[50],
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: ilacDozController,
              decoration: InputDecoration(
                labelText: 'Doz (örn: 2x1, 3x1)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.grey[50],
              ),
            ),
            SizedBox(height: 12),
            InkWell(
              onTap: () => _selectIlacTarihi(context),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[50],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedIlacTarihi == null
                          ? 'Başlangıç Tarihi Seçin'
                          : '${selectedIlacTarihi!.day}/${selectedIlacTarihi!.month}/${selectedIlacTarihi!.year}',
                      style: TextStyle(
                        color: selectedIlacTarihi == null ? Colors.grey[600] : Colors.black,
                      ),
                    ),
                    Icon(Icons.calendar_today, color: Colors.grey[600]),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _addIlac,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('İlaç Ekle', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIlacList() {
    if (ilaclar.isEmpty) return SizedBox.shrink();
    
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Eklenen İlaçlar',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E5EAA),
            ),
          ),
          SizedBox(height: 8),
          ...ilaclar.asMap().entries.map((entry) {
            int index = entry.key;
            Map<String, dynamic> ilac = entry.value;
            return Container(
              margin: EdgeInsets.only(bottom: 8),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue[200]!),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ilac['ad'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Doz: ${ilac['doz']}',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Başlangıç: ${ilac['tarih']}',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => _removeIlac(index),
                    icon: Icon(Icons.delete, color: Colors.red, size: 20),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildFizikselAktiviteSection() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Fiziksel Aktiviteler'),
          _buildFizikselDurumlar(),
          SizedBox(height: 20),
          _buildAddItemSection('Diğer Aktiviteler', fizikselAktiviteController, fizikselAktiviteler, () => _addFizikselAktivite()),
          _buildItemList(fizikselAktiviteler, _removeFizikselAktivite),
        ],
      ),
    );
  }

  Widget _buildBeslenmeSection() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Beslenme Alışkanlıkları'),
          _buildBeslenmeAliskanliklari(),
          SizedBox(height: 20),
          _buildAddItemSection('Diğer Beslenme Alışkanlıkları', beslenmeController, beslenmeAliskanliklari, () => _addBeslenme()),
          _buildItemList(beslenmeAliskanliklari, _removeBeslenme),
        ],
      ),
    );
  }

  Widget _buildUygulamalarSection() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Sağlık Uygulamaları'),
          _buildAddItemSection('Uygulama Adı', uygulamaController, uygulamalar, () => _addUygulama()),
          _buildItemList(uygulamalar, _removeUygulama),
        ],
      ),
    );
  }

  Widget _buildSosyalSection() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Sosyal Aktiviteler'),
          _buildAddItemSection('Sosyal Etkinlik', sosyalController, sosyalEtkinlikler, () => _addSosyal()),
          _buildItemList(sosyalEtkinlikler, _removeSosyal),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF2E5EAA),
        ),
      ),
    );
  }

  Widget _buildAddItemSection(String hint, TextEditingController controller, List<String> items, VoidCallback onAdd) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: Colors.grey[50],
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          ),
        ),
        SizedBox(width: 8),
        ElevatedButton(
          onPressed: onAdd,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          child: Text('Ekle'),
        ),
      ],
    );
  }

  Widget _buildItemList(List<String> items, Function(int) onRemove) {
    if (items.isEmpty) return SizedBox.shrink();
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Column(
        children: items.asMap().entries.map((entry) {
          int index = entry.key;
          String item = entry.value;
          return Container(
            margin: EdgeInsets.only(bottom: 4),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.blue[200]!),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(item)),
                IconButton(
                  onPressed: () => onRemove(index),
                  icon: Icon(Icons.delete, color: Colors.red, size: 20),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildAliskanliklar() {
    return Column(
      children: aliskanliklar.entries.map((entry) {
        return CheckboxListTile(
          title: Text(entry.key),
          value: entry.value,
          onChanged: (bool? value) {
            setState(() {
              aliskanliklar[entry.key] = value ?? false;
              if (value == true) {
                if (!kotuAliskanliklar.contains(entry.key)) {
                  kotuAliskanliklar.add(entry.key);
                }
              } else {
                kotuAliskanliklar.remove(entry.key);
              }
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
          dense: true,
          contentPadding: EdgeInsets.zero,
        );
      }).toList(),
    );
  }

  Widget _buildFizikselDurumlar() {
    return Column(
      children: fizikselDurumlar.entries.map((entry) {
        return CheckboxListTile(
          title: Text(entry.key),
          value: entry.value,
          onChanged: (bool? value) {
            setState(() {
              fizikselDurumlar[entry.key] = value ?? false;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
          dense: true,
          contentPadding: EdgeInsets.zero,
        );
      }).toList(),
    );
  }

  Widget _buildBeslenmeAliskanliklari() {
    return Column(
      children: beslenmeAliskanliklariMap.entries.map((entry) {
        return CheckboxListTile(
          title: Text(entry.key),
          value: entry.value,
          onChanged: (bool? value) {
            setState(() {
              beslenmeAliskanliklariMap[entry.key] = value ?? false;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
          dense: true,
          contentPadding: EdgeInsets.zero,
        );
      }).toList(),
    );
  }

  // Tarih seçme fonksiyonu
  Future<void> _selectIlacTarihi(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedIlacTarihi ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xFF2E5EAA),
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Color(0xFF2E5EAA),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedIlacTarihi) {
      setState(() {
        selectedIlacTarihi = picked;
      });
    }
  }

  // Add methods
  void _addAmeliyat() {
    if (ameliyatController.text.isNotEmpty) {
      setState(() {
        ameliyatlar.add(ameliyatController.text);
        ameliyatController.clear();
      });
    }
  }

  void _addIlac() {
    if (ilacController.text.isNotEmpty && 
        ilacDozController.text.isNotEmpty && 
        selectedIlacTarihi != null) {
      setState(() {
        ilaclar.add({
          'ad': ilacController.text,
          'doz': ilacDozController.text,
          'tarih': '${selectedIlacTarihi!.day}/${selectedIlacTarihi!.month}/${selectedIlacTarihi!.year}',
        });
        ilacController.clear();
        ilacDozController.clear();
        selectedIlacTarihi = null;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lütfen tüm alanları doldurunuz!'),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }

  void _addFizikselAktivite() {
    if (fizikselAktiviteController.text.isNotEmpty) {
      setState(() {
        fizikselAktiviteler.add(fizikselAktiviteController.text);
        fizikselAktiviteController.clear();
      });
    }
  }

  void _addBeslenme() {
    if (beslenmeController.text.isNotEmpty) {
      setState(() {
        beslenmeAliskanliklari.add(beslenmeController.text);
        beslenmeController.clear();
      });
    }
  }

  void _addUygulama() {
    if (uygulamaController.text.isNotEmpty) {
      setState(() {
        uygulamalar.add(uygulamaController.text);
        uygulamaController.clear();
      });
    }
  }

  void _addSosyal() {
    if (sosyalController.text.isNotEmpty) {
      setState(() {
        sosyalEtkinlikler.add(sosyalController.text);
        sosyalController.clear();
      });
    }
  }

  // Remove methods
  void _removeAmeliyat(int index) {
    setState(() {
      ameliyatlar.removeAt(index);
    });
  }

  void _removeIlac(int index) {
    setState(() {
      ilaclar.removeAt(index);
    });
  }

  void _removeFizikselAktivite(int index) {
    setState(() {
      fizikselAktiviteler.removeAt(index);
    });
  }

  void _removeBeslenme(int index) {
    setState(() {
      beslenmeAliskanliklari.removeAt(index);
    });
  }

  void _removeUygulama(int index) {
    setState(() {
      uygulamalar.removeAt(index);
    });
  }

  void _removeSosyal(int index) {
    setState(() {
      sosyalEtkinlikler.removeAt(index);
    });
  }

  void _kaydet() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Birey detay bilgileri başarıyla kaydedildi!'),
        backgroundColor: Colors.green,
      ),
    );

    print('TC: $tcKimlikNo');
    print('Ad Soyad: $ad $soyad');
    print('Acil Durumda Aranacak: $acilDurumAranacak');
    print('Ameliyatlar: $ameliyatlar');
    print('Kötü Alışkanlıklar: $kotuAliskanliklar');
    print('İlaçlar: $ilaclar');
    print('Fiziksel Aktiviteler: $fizikselAktiviteler');
    print('Beslenme Alışkanlıkları: $beslenmeAliskanliklari');
    print('Uygulamalar: $uygulamalar');
    print('Sosyal Etkinlikler: $sosyalEtkinlikler');
    print('Aile Öyküsü: ${aileOykusuController.text}');
  }

  @override
  void dispose() {
    ameliyatController.dispose();
    ilacController.dispose();
    ilacDozController.dispose();
    aileOykusuController.dispose();
    fizikselAktiviteController.dispose();
    beslenmeController.dispose();
    uygulamaController.dispose();
    sosyalController.dispose();
    super.dispose();
  }
}