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

  TextEditingController ameliyatController = TextEditingController();
  TextEditingController ilacController = TextEditingController();
  TextEditingController aileOykusuController = TextEditingController();

  List<String> ameliyatlar = [];
  List<String> ilaclar = [];
  List<String> kotuAliskanliklar = [];

  Map<String, bool> aliskanliklar = {
    'Sigara': false,
    'Alkol': false,
    'Uyuşturucu': false,
    'Aşırı Kafein': false,
    'Fast Food': false,
    'Sedanter Yaşam': false,
  };

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
              child: Text('Birey Detay Kayıt',
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconButton(Icons.people, false),
                _buildIconButton(Icons.local_pharmacy, false),
                _buildIconButton(Icons.local_drink, false),
                _buildIconButton(Icons.medical_services, false),
                _buildIconButton(Icons.chair, false),
                _buildIconButton(Icons.home, false),
                _buildIconButton(Icons.groups, false),
                _buildIconButton(Icons.favorite, true),
              ],
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle('1. Geçirilen Ameliyatlar'),
                    _buildAddItemSection(
                        'Ameliyat Adı', ameliyatController, ameliyatlar, () => _addAmeliyat()),
                    _buildItemList(ameliyatlar, _removeAmeliyat),
                    SizedBox(height: 20),
                    _buildSectionTitle('2. Kötü Alışkanlıklar'),
                    _buildAliskanliklar(),
                    SizedBox(height: 20),
                    _buildSectionTitle('3. Kullanılan İlaçlar'),
                    _buildAddItemSection(
                        'İlaç Adı', ilacController, ilaclar, () => _addIlac()),
                    _buildItemList(ilaclar, _removeIlac),
                    SizedBox(height: 20),
                    _buildSectionTitle('4. Aile Öyküsü'),
                    TextField(
                      controller: aileOykusuController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText:
                            'Aile hastalık geçmişi, genetik özellikler vb. bilgileri giriniz...',
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Kaydet',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, bool isActive) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFF2E5EAA) : Color(0xFF87CEEB),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: Colors.white, size: 24),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF2E5EAA),
        ),
      ),
    );
  }

  Widget _buildAddItemSection(String hint, TextEditingController controller,
      List<String> items, VoidCallback onAdd) {
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
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                Text(item),
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

  void _addAmeliyat() {
    if (ameliyatController.text.isNotEmpty) {
      setState(() {
        ameliyatlar.add(ameliyatController.text);
        ameliyatController.clear();
      });
    }
  }

  void _addIlac() {
    if (ilacController.text.isNotEmpty) {
      setState(() {
        ilaclar.add(ilacController.text);
        ilacController.clear();
      });
    }
  }

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

  void _kaydet() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Birey detay bilgileri başarıyla kaydedildi!'),
        backgroundColor: Colors.green,
      ),
    );

    print('TC: $tcKimlikNo');
    print('Ad Soyad: $ad $soyad');
    print('Ameliyatlar: $ameliyatlar');
    print('Kötü Alışkanlıklar: $kotuAliskanliklar');
    print('İlaçlar: $ilaclar');
    print('Aile Öyküsü: ${aileOykusuController.text}');
  }

  @override
  void dispose() {
    ameliyatController.dispose();
    ilacController.dispose();
    aileOykusuController.dispose();
    super.dispose();
  }
}