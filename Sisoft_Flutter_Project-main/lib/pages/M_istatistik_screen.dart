import 'package:flutter/material.dart';

void main() {
  runApp(MedicalRecordsApp());
}

class MedicalRecordsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medikal Kayıt Sistemi',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MedicalRecordsScreen(),
    );
  }
}

class MedicalRecordsScreen extends StatefulWidget {
  @override
  _MedicalRecordsScreenState createState() => _MedicalRecordsScreenState();
}

class _MedicalRecordsScreenState extends State<MedicalRecordsScreen> {
  // Form değişkenleri
  String selectedReportType = 'Teşhis';
  String selectedPatientType = 'Tümü';
  String selectedSgk = 'Tümü';
  String selectedGender = 'Tümü';
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  bool searchByPerson = false;
  bool guestsOnly = false;
  String searchText = '';
  String doctorText = '';

  // Örnek veriler
  final List<Map<String, dynamic>> diagnoses = [
    {'code': 'I25.0', 'name': 'Aterosklerotik kardiyovasküler hastalık', 'count': 4},
    {'code': 'H04.1', 'name': 'Lakrimal bezin diğer bozuklukları', 'count': 3},
    {'code': 'Z03.4', 'name': 'Ehliyet için muayene', 'count': 3},
    {'code': 'F32.9', 'name': 'Depresif nöbet, tanımlanmamış', 'count': 3},
    {'code': 'R52.9', 'name': 'Ağrı, tanımlanmamış', 'count': 2},
    {'code': 'I15.8', 'name': 'Sekonder hipertansiyon, diğer', 'count': 2},
    {'code': 'J00', 'name': 'Akut nazofarenjit [nezle]', 'count': 2},
    {'code': 'B48.8', 'name': 'Mikozlar diğer, tanımlanmış', 'count': 2},
    {'code': 'Z76', 'name': 'Sağlık servislerine diğer durumlarla gelen kişiler', 'count': 2},
    {'code': 'E55.9', 'name': 'Vitamin D eksikliği, tanımlanmamış', 'count': 2},
    {'code': 'M79.1', 'name': 'Miyalji', 'count': 1},
    {'code': 'B35.3', 'name': 'Tinea pedis', 'count': 1},
    {'code': 'L30.8', 'name': 'Dermatit diğer, tanımlanmış', 'count': 1},
    {'code': 'Z00.8', 'name': 'Genel muayeneler, diğer', 'count': 1},
  ];

  final List<Map<String, dynamic>> patients = [
    {'name': 'Ahmet Yıldız', 'age': 45, 'gender': 'E', 'diagnosis': 'Aterosklerotik kardiyovasküler hastalık', 'sgk': 'SSK'},
    {'name': 'Fatma Çetinceviz', 'age': 32, 'gender': 'K', 'diagnosis': 'Depresif nöbet, tanımlanmamış', 'sgk': 'Bağ-Kur'},
    {'name': 'Mehmet Reşit', 'age': 56, 'gender': 'E', 'diagnosis': 'Sekonder hipertansiyon, diğer', 'sgk': 'SSK'},
    {'name': 'Ayşe Dem', 'age': 28, 'gender': 'K', 'diagnosis': 'Akut nazofarenjit [nezle]', 'sgk': 'Emekli Sandığı'},
    {'name': 'Ali Kaya', 'age': 41, 'gender': 'E', 'diagnosis': 'Vitamin D eksikliği, tanımlanmamış', 'sgk': 'SSK'},
    {'name': 'Zeynep Yılan', 'age': 35, 'gender': 'K', 'diagnosis': 'Miyalji', 'sgk': 'Yeşil kart'},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[700],
        title: _buildAppBarTitle(screenWidth),
        toolbarHeight: screenWidth < 600 ? 56 : 70,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Üst kontrol paneli
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(screenWidth * 0.02),
              width: double.infinity,
              child: _buildControlPanel(screenWidth),
            ),
            // Sonuçlar alanı
            Container(
              margin: EdgeInsets.all(screenWidth * 0.02),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(screenWidth * 0.02),
                    child: Text(
                      'Bulunan Kayıt Sayısı: ${_getFilteredData().length}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.02,
                        color: Colors.brown[700],
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.5,
                    child: _buildResultsTable(screenWidth),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBarTitle(double screenWidth) {
    double fontSize = screenWidth < 600 ? 12 : 14;
    double padding = screenWidth < 600 ? 8 : 16;
    
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: padding, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.brown[800],
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text('Yönetim', style: TextStyle(color: Colors.white, fontSize: fontSize)),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: padding, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.brown[600],
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text('Karar Destek', style: TextStyle(color: Colors.white, fontSize: fontSize)),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: padding, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.brown[500],
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text('M. İstatistik', style: TextStyle(color: Colors.white, fontSize: fontSize)),
        ),
      ],
    );
  }

  Widget _buildControlPanel(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Butonlar
        _buildActionButtons(screenWidth),
        SizedBox(height: screenWidth * 0.02),
        
        // Radio butonları
        _buildRadioButtons(screenWidth),
        SizedBox(height: screenWidth * 0.02),
        
        // Checkbox'lar
        _buildCheckboxes(screenWidth),
        SizedBox(height: screenWidth * 0.02),
        
        // Filtreler
        _buildFilters(screenWidth),
      ],
    );
  }

  Widget _buildActionButtons(double screenWidth) {
    double buttonHeight = screenWidth < 600 ? 40 : 50;
    double fontSize = screenWidth < 600 ? 12 : 14;
    
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        SizedBox(
          height: buttonHeight,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.search, size: fontSize),
            label: Text('Bul', style: TextStyle(fontSize: fontSize)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[300],
              foregroundColor: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            ),
          ),
        ),
        SizedBox(
          height: buttonHeight,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.file_download, size: fontSize),
            label: Text('Excel\'e Aktar', style: TextStyle(fontSize: fontSize)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[300],
              foregroundColor: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            ),
          ),
        ),
        SizedBox(
          height: buttonHeight,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.close, size: fontSize),
            label: Text('Kapat', style: TextStyle(fontSize: fontSize)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[300],
              foregroundColor: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRadioButtons(double screenWidth) {
    double fontSize = screenWidth < 600 ? 10 : 12;
    int crossAxisCount = screenWidth < 600 ? 2 : screenWidth < 900 ? 3 : 6;
    
    List<String> options = [
      'Teşhis', 'İlaç', 'Aşı', 'Rapor', 'Sevk', 'Hizmet',
      'Demir Desteği', 'D Vitamini Desteği', 'Aile Planlaması(AP) Yöntemi'
    ];
    
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: crossAxisCount,
      childAspectRatio: screenWidth < 600 ? 3 : 4,
      children: options.map((option) => _buildRadioOption(option, fontSize)).toList(),
    );
  }

  Widget _buildRadioOption(String value, double fontSize) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<String>(
          value: value,
          groupValue: selectedReportType,
          onChanged: (newValue) {
            setState(() {
              selectedReportType = newValue!;
            });
          },
        ),
        Expanded(
          child: Text(
            value, 
            style: TextStyle(fontSize: fontSize),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildCheckboxes(double screenWidth) {
    double fontSize = screenWidth < 600 ? 10 : 12;
    
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Checkbox(
                    value: searchByPerson,
                    onChanged: (value) {
                      setState(() {
                        searchByPerson = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: Text('Bireye Göre Arama Yap', style: TextStyle(fontSize: fontSize)),
                  ),
                ],
              ),
            ),
            if (screenWidth > 600) SizedBox(width: 16),
            Expanded(
              child: Row(
                children: [
                  Checkbox(
                    value: guestsOnly,
                    onChanged: (value) {
                      setState(() {
                        guestsOnly = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: Text('Sadece Misafirler', style: TextStyle(fontSize: fontSize)),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (value) {},
            ),
            Expanded(
              child: Text('Sadece benim yaptığım işlemler', style: TextStyle(fontSize: fontSize)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFilters(double screenWidth) {
    double fontSize = screenWidth < 600 ? 10 : 12;
    double fieldHeight = screenWidth < 600 ? 35 : 40;
    
    return Column(
      children: [
        // Tarih aralığı ve teşhis
        screenWidth < 600 ? 
          Column(
            children: [
              _buildDateRangeRow(fontSize, fieldHeight),
              SizedBox(height: 12),
              _buildDiagnosisRow(fontSize, fieldHeight),
            ],
          ) :
          Row(
            children: [
              Expanded(flex: 3, child: _buildDateRangeRow(fontSize, fieldHeight)),
              SizedBox(width: 16),
              Expanded(flex: 2, child: _buildDiagnosisRow(fontSize, fieldHeight)),
            ],
          ),
        SizedBox(height: 12),
        
        // Hasta türü ve cinsiyet
        screenWidth < 600 ?
          Column(
            children: [
              _buildPatientTypeRow(fontSize, fieldHeight),
              SizedBox(height: 12),
              _buildGenderRow(fontSize, fieldHeight),
            ],
          ) :
          Row(
            children: [
              Expanded(child: _buildPatientTypeRow(fontSize, fieldHeight)),
              SizedBox(width: 16),
              Expanded(child: _buildGenderRow(fontSize, fieldHeight)),
            ],
          ),
        SizedBox(height: 12),
        
        // SGK ve Hekim
        screenWidth < 600 ?
          Column(
            children: [
              _buildSgkRow(fontSize, fieldHeight),
              SizedBox(height: 12),
              _buildDoctorRow(fontSize, fieldHeight),
            ],
          ) :
          Row(
            children: [
              Expanded(child: _buildSgkRow(fontSize, fieldHeight)),
              SizedBox(width: 16),
              Expanded(child: _buildDoctorRow(fontSize, fieldHeight)),
            ],
          ),
      ],
    );
  }

  Widget _buildDateRangeRow(double fontSize, double fieldHeight) {
    return Row(
      children: [
        Text('Tarih Aralığı:', style: TextStyle(fontSize: fontSize)),
        SizedBox(width: 8),
        Expanded(
          child: SizedBox(
            height: fieldHeight,
            child: TextFormField(
              initialValue: '${startDate.day.toString().padLeft(2, '0')}.${startDate.month.toString().padLeft(2, '0')}.${startDate.year}',
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                suffixIcon: Icon(Icons.calendar_today, size: fontSize),
              ),
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: SizedBox(
            height: fieldHeight,
            child: TextFormField(
              initialValue: '${endDate.day.toString().padLeft(2, '0')}.${endDate.month.toString().padLeft(2, '0')}.${endDate.year}',
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                suffixIcon: Icon(Icons.calendar_today, size: fontSize),
              ),
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDiagnosisRow(double fontSize, double fieldHeight) {
    return Row(
      children: [
        Text('Teşhis:', style: TextStyle(fontSize: fontSize)),
        SizedBox(width: 8),
        Expanded(
          child: SizedBox(
            height: fieldHeight,
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.search, size: fontSize),
                    SizedBox(width: 4),
                    Icon(Icons.clear, size: fontSize),
                  ],
                ),
              ),
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPatientTypeRow(double fontSize, double fieldHeight) {
    return Row(
      children: [
        Text('Hasta Türü:', style: TextStyle(fontSize: fontSize)),
        SizedBox(width: 8),
        Expanded(
          child: SizedBox(
            height: fieldHeight,
            child: DropdownButtonFormField<String>(
              value: selectedPatientType,
              items: ['Tümü', 'Yatan', 'Ayaktan'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(fontSize: fontSize)),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedPatientType = value!;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGenderRow(double fontSize, double fieldHeight) {
    return Row(
      children: [
        Text('Cinsiyet:', style: TextStyle(fontSize: fontSize)),
        SizedBox(width: 8),
        Expanded(
          child: SizedBox(
            height: fieldHeight,
            child: DropdownButtonFormField<String>(
              value: selectedGender,
              items: ['Tümü', 'Erkek', 'Kadın'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(fontSize: fontSize)),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedGender = value!;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSgkRow(double fontSize, double fieldHeight) {
    return Row(
      children: [
        Text('SGK:', style: TextStyle(fontSize: fontSize)),
        SizedBox(width: 8),
        Expanded(
          child: SizedBox(
            height: fieldHeight,
            child: DropdownButtonFormField<String>(
              value: selectedSgk,
              items: ['Tümü', 'SGK', 'Bağ-Kur', 'Emekli Sandığı', 'Yeşil kart', 'Diğer', 'Yok'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(fontSize: fontSize)),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedSgk = value!;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDoctorRow(double fontSize, double fieldHeight) {
    return Row(
      children: [
        Text('Hekim:', style: TextStyle(fontSize: fontSize)),
        SizedBox(width: 8),
        Expanded(
          child: SizedBox(
            height: fieldHeight,
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  doctorText = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.search, size: fontSize),
                    SizedBox(width: 4),
                    Icon(Icons.clear, size: fontSize),
                  ],
                ),
              ),
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResultsTable(double screenWidth) {
    if (selectedReportType == 'Teşhis' && !searchByPerson) {
      return _buildDiagnosisTable(screenWidth);
    } else if (selectedReportType == 'Teşhis' && searchByPerson) {
      return _buildPatientTable(screenWidth);
    } else {
      return Center(
        child: Text(
          'Seçilen rapor türü için veri bulunamadı.',
          style: TextStyle(fontSize: screenWidth * 0.02, color: Colors.grey[600]),
        ),
      );
    }
  }

  Widget _buildDiagnosisTable(double screenWidth) {
    double fontSize = screenWidth < 600 ? 10 : 12;
    
    return SingleChildScrollView(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
          columnSpacing: screenWidth * 0.02,
          dataRowHeight: screenWidth < 600 ? 40 : 50,
          columns: [
            DataColumn(
              label: SizedBox(
                width: screenWidth * 0.15,
                child: Text('Kodu', style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize)),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: screenWidth * 0.5,
                child: Text('Teşhis Adı', style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize)),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: screenWidth * 0.1,
                child: Text('Miktar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize)),
              ),
              numeric: true,
            ),
          ],
          rows: _getFilteredData().map((diagnosis) {
            return DataRow(
              cells: [
                DataCell(SizedBox(
                  width: screenWidth * 0.15,
                  child: Text(diagnosis['code'], style: TextStyle(fontSize: fontSize)),
                )),
                DataCell(SizedBox(
                  width: screenWidth * 0.5,
                  child: Text(diagnosis['name'], style: TextStyle(fontSize: fontSize)),
                )),
                DataCell(SizedBox(
                  width: screenWidth * 0.1,
                  child: Text(diagnosis['count'].toString(), style: TextStyle(fontSize: fontSize)),
                )),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildPatientTable(double screenWidth) {
    double fontSize = screenWidth < 600 ? 10 : 12;
    
    return SingleChildScrollView(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
          columnSpacing: screenWidth * 0.02,
          dataRowHeight: screenWidth < 600 ? 40 : 50,
          columns: [
            DataColumn(
              label: SizedBox(
                width: screenWidth * 0.2,
                child: Text('Adı Soyadı', style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize)),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: screenWidth * 0.08,
                child: Text('Yaş', style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize)),
              ),
              numeric: true,
            ),
            DataColumn(
              label: SizedBox(
                width: screenWidth * 0.1,
                child: Text('Cinsiyet', style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize)),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: screenWidth * 0.15,
                child: Text('SGK', style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize)),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: screenWidth * 0.4,
                child: Text('Teşhis', style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize)),
              ),
            ),
          ],
          rows: _getFilteredPatients().map((patient) {
            return DataRow(
              cells: [
                DataCell(SizedBox(
                  width: screenWidth * 0.2,
                  child: Text(patient['name'], style: TextStyle(fontSize: fontSize)),
                )),
                DataCell(SizedBox(
                  width: screenWidth * 0.08,
                  child: Text(patient['age'].toString(), style: TextStyle(fontSize: fontSize)),
                )),
                DataCell(SizedBox(
                  width: screenWidth * 0.1,
                  child: Text(patient['gender'], style: TextStyle(fontSize: fontSize)),
                )),
                DataCell(SizedBox(
                  width: screenWidth * 0.15,
                  child: Text(patient['sgk'], style: TextStyle(fontSize: fontSize)),
                )),
                DataCell(SizedBox(
                  width: screenWidth * 0.4,
                  child: Text(patient['diagnosis'], style: TextStyle(fontSize: fontSize)),
                )),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> _getFilteredData() {
    if (selectedReportType == 'Teşhis' && !searchByPerson) {
      return diagnoses.where((diagnosis) {
        if (searchText.isNotEmpty) {
          return diagnosis['name'].toLowerCase().contains(searchText.toLowerCase()) ||
                 diagnosis['code'].toLowerCase().contains(searchText.toLowerCase());
        }
        return true;
      }).toList();
    } else if (selectedReportType == 'Teşhis' && searchByPerson) {
      return _getFilteredPatients();
    }
    return [];
  }

  List<Map<String, dynamic>> _getFilteredPatients() {
    return patients.where((patient) {
      bool matches = true;
      
      if (selectedSgk != 'Tümü' && patient['sgk'] != selectedSgk) {
        matches = false;
      }
      
      if (selectedGender != 'Tümü') {
        String genderFilter = selectedGender == 'Erkek' ? 'E' : 'K';
        if (patient['gender'] != genderFilter) {
          matches = false;
        }
      }
      
      if (searchText.isNotEmpty) {
        if (!patient['name'].toLowerCase().contains(searchText.toLowerCase()) &&
            !patient['diagnosis'].toLowerCase().contains(searchText.toLowerCase())) {
          matches = false;
        }
      }
      
      return matches;
    }).toList();
  }
}