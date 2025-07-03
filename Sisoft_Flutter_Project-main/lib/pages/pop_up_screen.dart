import 'package:flutter/material.dart';

class StatsPopupWidget extends StatefulWidget {
  @override
  _StatsPopupWidgetState createState() => _StatsPopupWidgetState();
}

class _StatsPopupWidgetState extends State<StatsPopupWidget> {
  bool _hasShownPopup = false;

  @override
  void initState() {
    super.initState();
    // Web için daha güvenilir timing
    _showPopupAfterBuild();
  }

  void _showPopupAfterBuild() {
    // Birden fazla method ile popup'ın açılmasını garanti ediyoruz
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && !_hasShownPopup) {
        _showStatsDialog();
      }
    });
    
    // Ek güvence için timer
    Future.delayed(Duration(milliseconds: 100), () {
      if (mounted && !_hasShownPopup) {
        _showStatsDialog();
      }
    });
  }

  void _showStatsDialog() {
    if (_hasShownPopup) return;
    _hasShownPopup = true;
    
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black54,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width > 800 ? 800 : MediaQuery.of(context).size.width * 0.95,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.9,
            ),
            padding: EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Başlık
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Genel İstatistikler',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Icons.close,
                              size: 20,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  
                  // Hasta İstatistikleri Başlığı
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border(
                        left: BorderSide(width: 4, color: Colors.blue),
                      ),
                    ),
                    child: Text(
                      'Hasta İstatistikleri',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  
                  // İstatistik Kartları
                  _buildStatsGrid(),
                  
                  SizedBox(height: 24),
                  
                  // Performans İstatistikleri Başlığı
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border(
                        left: BorderSide(width: 4, color: Colors.green),
                      ),
                    ),
                    child: Text(
                      'Performans İstatistikleri',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  
                  // Kapatma butonu
                  Center(
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[600],
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Kapat',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ).then((_) {
      // Dialog kapandığında state'i resetle
      if (mounted) {
        setState(() {
          _hasShownPopup = false;
        });
      }
    });
  }

  Widget _buildStatsGrid() {
    // Web için 3 sütunlu grid
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        _buildStatCard(
          icon: Icons.person_outline,
          title: 'Kesin Kayıtlı Hasta Sayısı',
          value: '3878',
          color: Colors.blue[600]!,
        ),
        _buildStatCard(
          icon: Icons.people_outline,
          title: 'Misafir Hasta Sayısı',
          value: '11711',
          color: Colors.orange[600]!,
        ),
        _buildStatCard(
          icon: Icons.child_care_outlined,
          title: 'Kesin Kayıtlı Bebek Sayısı',
          value: '24',
          color: Colors.purple[600]!,
        ),
        _buildStatCard(
          icon: Icons.child_friendly_outlined,
          title: 'Kesin Kayıtlı Çocuk Sayısı',
          value: '145',
          color: Colors.green[600]!,
        ),
        _buildStatCard(
          icon: Icons.woman_outlined,
          title: 'Kesin Kayıtlı 15-49 Kadın Hasta Sayısı',
          value: '941',
          color: Colors.pink[600]!,
        ),
        _buildStatCard(
          icon: Icons.assignment_late_outlined,
          title: 'Kadın İzlem Yapılmamış Hasta Sayısı',
          value: '939',
          color: Colors.red[600]!,
        ),
        _buildStatCard(
          icon: Icons.elderly_outlined,
          title: 'Kesin Kayıtlı 65 Yaş Üstü Hasta Sayısı',
          value: '648',
          color: Colors.indigo[600]!,
        ),
        _buildStatCard(
          icon: Icons.local_hospital_outlined,
          title: 'Ölü(Kapalı) Hasta Sayısı',
          value: '2',
          color: Colors.grey[600]!,
        ),
        _buildStatCard(
          icon: Icons.pregnant_woman_outlined,
          title: 'Gebe Hasta Sayısı',
          value: '13',
          color: Colors.teal[600]!,
        ),
        _buildStatCard(
          icon: Icons.warning_amber_outlined,
          title: 'Sonlanması Gereken Gebelik Sayısı',
          value: '0',
          color: Colors.amber[700]!,
        ),
        _buildStatCard(
          icon: Icons.assignment_outlined,
          title: 'Kapatılmamış Muayene Sayısı',
          value: '128',
          color: Colors.deepOrange[600]!,
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      child: Container(
        width: 240, // Web için sabit genişlik
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.2), width: 2),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
                SizedBox(width: 12),
              ],
            ),
            SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
                height: 1.3,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(); // Boş widget, sadece popup'ı göstermek için
  }
}

// Ana sayfa widget'ınızda bu şekilde kullanın:
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ana Sayfa'),
        backgroundColor: Colors.blue[600],
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          // Ana sayfa içeriğiniz
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ana Sayfa İçeriği',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Manuel popup açma
                    showDialog(
                      context: context,
                      builder: (context) => StatsPopupWidget(),
                    );
                  },
                  child: Text('İstatistikleri Göster'),
                ),
              ],
            ),
          ),
          // Popup widget'i - otomatik açılacak
          StatsPopupWidget(),
        ],
      ),
    );
  }
}