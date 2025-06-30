import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({super.key});

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  final TextEditingController _noteController = TextEditingController();
  final List<String> _notes = [];

  void _addNote() {
    if (_noteController.text.isNotEmpty) {
      setState(() {
        _notes.add(_noteController.text);
        _noteController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Birey'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.person), text: 'BİREY'),
              Tab(icon: Icon(Icons.settings), text: 'İŞLEMLER'),
            ],
            labelColor: Colors.white, // Seçili tab ikon ve metin rengi
            unselectedLabelColor:
                Colors.grey, // Seçili olmayan tab ikon ve metin rengi
            indicatorColor: Colors.white, // Seçili tab altındaki çizgi rengi
            labelStyle: TextStyle(
              // Seçili tab yazı stili
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'Rubik',
            ),
            unselectedLabelStyle: TextStyle(
              // Seçili olmayan tab yazı stili
              fontSize: 14,
              fontFamily: 'Rubik',
            ),
          ),
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blue[200],
                      child: const Icon(Icons.person,
                          size: 25, color: Colors.white),
                    ),
                    const SizedBox(width: 20),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NAZLI ZEYNEP ESKİCİ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          SizedBox(height: 8),
                          Text(
                            '19739270288',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Hekim: Hakan ALTUĞLU',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Aile Hekimi: Demet YILDIRIM',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text('Birey Ajanda'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('Birey Bilgileri'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.history),
                title: const Text('Geçmiş Kayıtlar'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.file_copy),
                title: const Text('Belgeler'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Ayarlar'),
                onTap: () {},
              ),
              // Diğer drawer öğeleri burada yer alabilir.
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 6,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'NAZLI ZEYNEP ESKİCİ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '• NAZLI ZEYNEP ESKİCİ adlı bireyin size ilk gelişi:',
                              style: TextStyle(fontSize: 16)),
                          SizedBox(height: 5),
                          Text(
                              '• NAZLI ZEYNEP ESKİCİ isimli en son 11.05.2015 tarihinde işlem yapılmış',
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      color: Colors.grey[200],
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Notlar',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _notes
                                .map((note) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4.0),
                                      child: Text('• $note',
                                          style: const TextStyle(fontSize: 16)),
                                    ))
                                .toList(),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: _noteController,
                            maxLines: 1,
                            decoration: const InputDecoration(
                              hintText: 'Yeni not ekleyin',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: _addNote,
                            child: const Text('Not Ekle'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            child: const Text('Birey Bilgileri')),
                        ElevatedButton(
                            onPressed: () {},
                            child: const Text('Hastanın Geçmiş Özeti')),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.add_box),
                      title: const Text('Okul Çağı Çocuk/Genç Ara İzlem'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.woman),
                      title: const Text('Kadın İzlem'),
                      trailing: const Text('Henüz İzlem Yapılmamış',
                          style: TextStyle(color: Colors.green)),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.medical_services),
                      title: const Text('Muayene'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.science),
                      title: const Text('Tetkik'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TetkikPage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.healing),
                      title: const Text('Müdahale/Enjeksiyon'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.vaccines),
                      title: const Text('Aşı (İzlem Dışında)'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VaccinationPage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.copyright),
                      title: const Text('Kanser'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CancerTrackingPage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.description),
                      title: const Text('Reçete'),
                      trailing: const Text('Son Reçete 11.05.2015',
                          style: TextStyle(color: Colors.green)),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.report),
                      title: const Text('Rapor'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ReportPage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.group),
                      title: const Text('Ev Halkı Tes.Fişi'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.family_restroom),
                      title: const Text('Aile İçi Şiddet Formu'),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Tetkik {
  final String baslik;
  final List<String> tetkikler;

  Tetkik({required this.baslik, required this.tetkikler});
}

class TetkikPage extends StatefulWidget {
  const TetkikPage({super.key});

  @override
  _TetkikPageState createState() => _TetkikPageState();
}

class _TetkikPageState extends State<TetkikPage> {
  List<Tetkik> tetkikler = [
    Tetkik(
      baslik: 'Biyokimya',
      tetkikler: [
        'Magnezyum',
        'Fosfor (P)',
        'Sodyum (Na)',
        'Romatoid faktör (RF)',
        'C reaktif protein (CRP)',
        'Total Protein',
        'Demir(serum)',
        'Demir bağlama kapasitesi (TDBK)',
        'LDL kolesterol',
        'Kolesterol',
        'HDL kolesterol',
        'Trigliserid',
        'Alanin aminotransferaz (ALT)',
        'Aspartat transaminaz (AST)',
        'Bilirubin (direkt)',
        'Bilirubin (total',
        'Gamma glutamil transferaz (GGT)',
        'Laktat dehidrogenaz (LDH)',
        'Glukoz (Açlık Kan Şekeri',
        'Üre (Serum/Plazma)',
        'Kreatinin',
        'Ürik asit',
        'Albümin',
        'Alkalen fosfataz (ALP)',
        'Kalsiyum (Ca)',
        'Klor (Cl)',
        'Potasyum (K)',
      ],
    ),
    Tetkik(
      baslik: 'Elisa',
      tetkikler: [
        'HBsAg',
        'Anti HBs',
        'Anti HIV',
        'Anti HCV',
      ],
    ),
    Tetkik(
      baslik: 'Kart Testler',
      tetkikler: [
        'VDRL-RPR',
      ],
    ),
    Tetkik(
      baslik: 'Hormon',
      tetkikler: [
        'Beta-hCG',
        'PSA total (Prostat spesifik antijen)',
        'Folat',
        'TSH',
        'Ferritin',
        'Vitamin B12',
        'Serbest T4',
        'İnsülin',
      ],
    ),
    Tetkik(
      baslik: 'Hba1c',
      tetkikler: [
        'Glike hemoglobin (Hb A1c)',
      ],
    ),
    Tetkik(
      baslik: 'Tokluk Kan Şekeri',
      tetkikler: [
        'Glukoz(Postprandial 1 saat)',
      ],
    ),
    Tetkik(
      baslik: 'Sedimantasyon',
      tetkikler: [
        'Sedimentasyon',
      ],
    ),
    Tetkik(
      baslik: 'Hemogram',
      tetkikler: [
        'Tam Kan Sayımı (Hemogram)',
      ],
    ),
    Tetkik(
      baslik: 'Idrar',
      tetkikler: [
        'İdrar tetkiki ve mikroskopisi',
      ],
    ),
    Tetkik(
      baslik: 'Kardiyok',
      tetkikler: [
        'Troponin I',
      ],
    ),
    Tetkik(
      baslik: 'Kan Grubu',
      tetkikler: [
        'ABO+Rh tayini (Forward+Reverse)',
      ],
    ),
    Tetkik(
      baslik: 'Talasemi',
      tetkikler: [
        'Hemoglobin varyant analizi (HPLC)(T...',
      ],
    ),
    Tetkik(
      baslik: 'Glukoz (1 saat)',
      tetkikler: [
        'Glukoz-100g OGTT 60. dakika',
      ],
    ),
    Tetkik(
      baslik: 'Glukoz(2 saat)',
      tetkikler: [
        'Glukoz-100g OGTT 120. dakika',
      ],
    ),
    Tetkik(
      baslik: 'Glukoz(3.saat)',
      tetkikler: [
        'Glukoz-100g 180. dakika',
      ],
    ),
  ];
  final Map<String, bool> selectedTetkikler = {};

  @override
  void initState() {
    super.initState();
    // Başlangıçta tüm tetkikleri seçilmemiş olarak işaretle
    for (var tetkik in tetkikler) {
      for (var tetkikAdi in tetkik.tetkikler) {
        selectedTetkikler[tetkikAdi] = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tetkik Listesi'),
      ),
      body: ListView.builder(
        itemCount: tetkikler.length,
        itemBuilder: (context, index) {
          final kategori = tetkikler[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ExpansionTile(
              title: Text(kategori.baslik),
              children: kategori.tetkikler.map((tetkik) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 3,
                    child: CheckboxListTile(
                      title: Text(tetkik),
                      value: selectedTetkikler[tetkik],
                      onChanged: (value) {
                        setState(() {
                          selectedTetkikler[tetkik] = value!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final List<String> reportTypes = [
    'Akli Meleke Raporu',
    'Askere Alınma Muayene Raporu',
    'Balıkçı Gemilerinde Çalışanlar İçin Sağlık Raporu',
    'Bilgilendirme Raporu',
    'Çalışabilir Rapor Kağıdı(EK-2)',
    'Çalışabilir Rapor Kağıdı(Kamu Personeli)',
    'Durum Bildirir Tek Hekim Sağlık Raporu',
    'İstirahat Raporu(Öğrenci-Çalışan-Memur)',
  ];

  String selectedReport = '';
  List<String> filteredReports = [];

  @override
  void initState() {
    super.initState();
    filteredReports = reportTypes;
  }

  void _filterReports(String query) {
    setState(() {
      filteredReports = reportTypes
          .where((report) => report.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rapor Seçimi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Rapor Türü Ara',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (value) {
                _filterReports(value);
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredReports.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(filteredReports[index]),
                      onTap: () {
                        setState(() {
                          selectedReport = filteredReports[index];
                        });
                        if (selectedReport ==
                            'İstirahat Raporu(Öğrenci-Çalışan-Memur)') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RestReportPage(),
                            ),
                          );
                        } else if (selectedReport ==
                            'Durum Bildirir Tek Hekim Sağlık Raporu') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const SingleDoctorReportPage(),
                            ),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RestReportPage extends StatefulWidget {
  const RestReportPage({super.key});

  @override
  _RestReportPageState createState() => _RestReportPageState();
}

class _RestReportPageState extends State<RestReportPage> {
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = '${_selectedDate!.toLocal()}'
            .split(' ')[0]; // Format to show only date
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('İstirahat Raporu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(
                labelText: 'Tarih',
                hintText: 'Tarih Seçiniz',
              ),
              readOnly: true,
              onTap: () => _selectDate(context),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Süresi'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Sonuç'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Kurum Adı'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Açıklama'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save or print functionality
              },
              child: const Text('Yazdır'),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleDoctorReportPage extends StatelessWidget {
  const SingleDoctorReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Durum Bildirir Tek Hekim Sağlık Raporu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Verilme Nedeni'),
              items: const [
                DropdownMenuItem(
                    value: 'İş Sağlığı ve Güvenliği',
                    child: Text('İş Sağlığı ve Güvenliği')),
                DropdownMenuItem(
                    value: 'Yivsiz Av Tüfeği', child: Text('Yivsiz Av Tüfeği')),
                DropdownMenuItem(
                    value: 'Akli Meleke', child: Text('Akli Meleke')),
                DropdownMenuItem(
                    value: 'Genel Durum Değerlendirmesi Kararı',
                    child: Text('Genel Durum Değerlendirmesi Kararı')),
              ],
              onChanged: (value) {},
            ),
            // Diğer alanlar
          ],
        ),
      ),
    );
  }
}

class CancerTrackingPage extends StatefulWidget {
  const CancerTrackingPage({super.key});

  @override
  _CancerTrackingPageState createState() => _CancerTrackingPageState();
}

class _CancerTrackingPageState extends State<CancerTrackingPage> {
  String _selectedScreeningType = 'Kolorektal';
  final List<String> _familyHistory = [];
  bool _isAddingFamilyHistory = false;
  final TextEditingController _familyHistoryController =
      TextEditingController();

  DateTime? _screeningDate;
  DateTime? _resultDate;

  final List<String> _screeningTypes = ['Kolorektal', 'Meme', 'Serviks'];
  final List<String> _biopsyResults = [
    'Normal',
    'Kanser',
    'Polip',
    'Kolit',
    'Yetersiz Materyal',
    'Diğer Patolojiler'
  ];
  final List<String> _memeResults = [
    'Kendi Kendine Meme Muayenesi',
    'Klinik Meme Muayenesi',
    'Mamografi'
  ];
  final List<String> _hpvTypes = ['HPV Tip 16', 'HPV Tip 18', 'Diğer', '31'];
  final List<String> _cervicalCytologyResults = [
    'Normal',
    'Enfeksiyon',
    'ASC-US'
  ];
  final List<String> _cervicalBiopsyResults = [
    'Normal',
    'Kori-Nik',
    'CIN 1',
    'CIN 2'
  ];

  String? _selectedMemeKendiKendineOption;
  String? _selectedMemeKlinikOption;
  String? _selectedMemeMamografiOption;
  String? _selectedHpvTaramaTestiOption;
  String? _selectedPapSmearTestiOption;
  String? _selectedCytologyResult;
  String? _selectedBiopsyResultServiks;
  String? _selectedHpvType;
  String? _selectedBiopsyResultKolorektal;
  String? _selectedGaitadaTesti;

  // Tarih seçici için fonksiyon
  Future<void> _selectDate(BuildContext context, bool isScreeningDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        if (isScreeningDate) {
          _screeningDate = pickedDate;
        } else {
          _resultDate = pickedDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kanser Tarama'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tarama Tipleri Radio Button
              const Text('Tarama Tipleri',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _screeningTypes.map((type) {
                  return Expanded(
                    child: Column(
                      children: [
                        Radio<String>(
                          value: type,
                          groupValue: _selectedScreeningType,
                          onChanged: (value) {
                            setState(() {
                              _selectedScreeningType = value!;
                            });
                          },
                        ),
                        Text(type),
                      ],
                    ),
                  );
                }).toList(),
              ),
              const Divider(),

              // Tarama Tarihi ve Sonuçlanma Tarihi
              const Text('Tarama Tarihi ve Sonuçlanma Tarihi',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectDate(context, true),
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'Tarama Tarihi',
                        ),
                        child: Text(_screeningDate == null
                            ? 'Tarih Seçin'
                            : DateFormat('dd-MM-yyyy').format(_screeningDate!)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectDate(context, false),
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'Sonuçlanma Tarihi',
                        ),
                        child: Text(_resultDate == null
                            ? 'Tarih Seçin'
                            : DateFormat('dd-MM-yyyy').format(_resultDate!)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),

              // İşlem No ve İşlem Tarihi (Statik)
              const Text('İşlem Bilgileri',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8.0),
              const Text('İşlem No: 123456',
                  style: TextStyle(color: Colors.grey)),
              const Text('İşlem Tarihi: 01-01-2023',
                  style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 16.0),

              // Aile Öyküsü
              const Text('Aile Öyküsü',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              if (_familyHistory.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _familyHistory.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_familyHistory[index]),
                    );
                  },
                ),
              const SizedBox(height: 8.0),
              if (_isAddingFamilyHistory)
                TextField(
                  controller: _familyHistoryController,
                  decoration:
                      const InputDecoration(labelText: 'Aile Öyküsü Girin'),
                ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_isAddingFamilyHistory) {
                      if (_familyHistoryController.text.isNotEmpty) {
                        _familyHistory.add(_familyHistoryController.text);
                        _familyHistoryController.clear();
                      }
                    }
                    _isAddingFamilyHistory = !_isAddingFamilyHistory;
                  });
                },
                child: Text(
                    _isAddingFamilyHistory ? 'Kaydet' : 'Aile Öyküsü Ekle'),
              ),
              const Divider(),
              const SizedBox(height: 16.0),

              // Tarama Tipine Göre Dinamik İçerik
              if (_selectedScreeningType == 'Kolorektal') ...[
                const Text('Kolorektal Biyopsi Sonuçları',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                  value: _selectedBiopsyResultKolorektal,
                  items: _biopsyResults.map((result) {
                    return DropdownMenuItem<String>(
                      value: result,
                      child: Text(result),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedBiopsyResultKolorektal = value;
                    });
                  },
                  hint: const Text('Sonuç Seçin'),
                ),
                const Text('Gaitada Gizli Kan Testi',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                  value: _selectedGaitadaTesti,
                  items: ['Pozitif', 'Negatif'].map((result) {
                    return DropdownMenuItem<String>(
                      value: result,
                      child: Text(result),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedGaitadaTesti = value;
                    });
                  },
                  hint: const Text('Test Seçin'),
                ),
              ] else if (_selectedScreeningType == 'Meme') ...[
                const Text('Meme Sonuçları',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const Text('Kendi Kendine Meme Muayenesi',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                  value: _selectedMemeKendiKendineOption,
                  items: _memeResults.map((result) {
                    return DropdownMenuItem<String>(
                      value: result,
                      child: Text(result),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedMemeKendiKendineOption = value;
                    });
                  },
                  hint: const Text('Seçenek Seçin'),
                ),
                const Text('Klinik Meme Muayenesi',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                  value: _selectedMemeKlinikOption,
                  items: _memeResults.map((result) {
                    return DropdownMenuItem<String>(
                      value: result,
                      child: Text(result),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedMemeKlinikOption = value;
                    });
                  },
                  hint: const Text('Seçenek Seçin'),
                ),
                const Text('Mamografi',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                  value: _selectedMemeMamografiOption,
                  items: _memeResults.map((result) {
                    return DropdownMenuItem<String>(
                      value: result,
                      child: Text(result),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedMemeMamografiOption = value;
                    });
                  },
                  hint: const Text('Seçenek Seçin'),
                ),
              ] else if (_selectedScreeningType == 'Serviks') ...[
                const Text('HPV Tarama Testi',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                  value: _selectedHpvTaramaTestiOption,
                  items: ['Seçenek 1', 'Seçenek 2'].map((option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedHpvTaramaTestiOption = value;
                    });
                  },
                  hint: const Text('Test Seçin'),
                ),
                const Text('Pap Smear Testi',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                  value: _selectedPapSmearTestiOption,
                  items: ['Seçenek 1', 'Seçenek 2'].map((option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedPapSmearTestiOption = value;
                    });
                  },
                  hint: const Text('Test Seçin'),
                ),
                const Text('Servikal Sitoloji Sonuçları',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                  value: _selectedCytologyResult,
                  items: _cervicalCytologyResults.map((result) {
                    return DropdownMenuItem<String>(
                      value: result,
                      child: Text(result),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCytologyResult = value;
                    });
                  },
                  hint: const Text('Sonuç Seçin'),
                ),
                const Text('Servikal Biyopsi Sonuçları',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                  value: _selectedBiopsyResultServiks,
                  items: _cervicalBiopsyResults.map((result) {
                    return DropdownMenuItem<String>(
                      value: result,
                      child: Text(result),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedBiopsyResultServiks = value;
                    });
                  },
                  hint: const Text('Sonuç Seçin'),
                ),
                const Text('HPV Tipleri',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                  value: _selectedHpvType,
                  items: _hpvTypes.map((type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedHpvType = value;
                    });
                  },
                  hint: const Text('HPV Tipi Seçin'),
                ),
              ],
              const SizedBox(height: 16.0),

              // Kaydet ve Randevu Butonları
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Kaydetme işlemi
                    },
                    child: const Text('Kaydet'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Kanser randevusu alma işlemi
                    },
                    child: const Text('Kanser Randevusu'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VaccinationPage extends StatefulWidget {
  const VaccinationPage({super.key});

  @override
  _VaccinationPageState createState() => _VaccinationPageState();
}

class _VaccinationPageState extends State<VaccinationPage> {
  final TextEditingController _storyController = TextEditingController();
  final TextEditingController _complaintController = TextEditingController();
  final TextEditingController _vaccinationController = TextEditingController();

  final List<Map<String, String>> _stories = [];
  final List<Map<String, String>> _complaints = [];
  final List<Map<String, String>> _vaccinations = [];

  String _formatDateTime(DateTime dateTime) {
    return "${dateTime.day.toString().padLeft(2, '0')}.${dateTime.month.toString().padLeft(2, '0')}.${dateTime.year} – ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }

  void _addStory() {
    if (_storyController.text.isNotEmpty) {
      setState(() {
        _stories.add({
          'content': _storyController.text,
          'timestamp': _formatDateTime(DateTime.now()),
        });
        _storyController.clear();
      });
    }
  }

  void _addComplaint() {
    if (_complaintController.text.isNotEmpty) {
      setState(() {
        _complaints.add({
          'content': _complaintController.text,
          'timestamp': _formatDateTime(DateTime.now()),
        });
        _complaintController.clear();
      });
    }
  }

  void _addVaccination(String vaccination) {
    if (vaccination.isNotEmpty) {
      setState(() {
        _vaccinations.add({
          'content': vaccination,
          'timestamp': _formatDateTime(DateTime.now()),
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aşı (İzlem Dışında)'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hikayeler Bölümü
            _buildSection('Hikayeler', _stories, _storyController, _addStory),
            const SizedBox(height: 20),
            // Şikayetler Bölümü
            _buildSection(
                'Şikayetler', _complaints, _complaintController, _addComplaint),
            const SizedBox(height: 20),
            // Aşılar Bölümü
            const Text(
              'Aşılar',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: _vaccinations
                      .map(
                        (vaccination) => ListTile(
                          title: Text(vaccination['content']!),
                          trailing: Text(vaccination['timestamp']!),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double
                  .infinity, // Container genişliğini ekranın tamamına yayar
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                isExpanded: true, // Dropdown genişliğini ekranın tamamına yayar
                items: const [
                  DropdownMenuItem(
                      value: 'Bivalan OPA (Oral Polio Aşısı)',
                      child: Text('Bivalan OPA (Oral Polio Aşısı)')),
                  DropdownMenuItem(
                      value: 'Trivalan OPA (Oral Polio Aşısı)',
                      child: Text('Trivalan OPA (Oral Polio Aşısı)')),
                  DropdownMenuItem(
                      value: 'KKK (Kızamık, Kızamıkçık, Kabakulak Aşısı)',
                      child:
                          Text('KKK (Kızamık, Kızamıkçık, Kabakulak Aşısı)')),
                  DropdownMenuItem(
                      value: 'Hepatit B Aşısı', child: Text('Hepatit B Aşısı')),
                  DropdownMenuItem(
                      value: 'BCG (Verem Aşısı)',
                      child: Text('BCG (Verem Aşısı)')),
                  DropdownMenuItem(
                      value: 'Suçiçeği Aşısı', child: Text('Suçiçeği Aşısı')),
                  DropdownMenuItem(
                      value: 'Pnömokok Aşısı', child: Text('Pnömokok Aşısı')),
                  DropdownMenuItem(
                      value: 'Rotavirüs Aşısı', child: Text('Rotavirüs Aşısı')),
                  DropdownMenuItem(
                      value: 'Difteri, Tetanoz, Boğmaca Aşısı',
                      child: Text('Difteri, Tetanoz, Boğmaca Aşısı')),
                  // Diğer aşıları buraya ekleyebilirsiniz...
                ],
                onChanged: (value) {
                  if (value != null) {
                    _addVaccination(value);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Map<String, String>> items,
      TextEditingController controller, VoidCallback onAdd) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: items
                  .map(
                    (item) => ListTile(
                      title: Text(item['content']!),
                      trailing: Text(item['timestamp']!),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          maxLines: 1,
          decoration: InputDecoration(
            hintText: 'Yeni $title ekleyin',
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: onAdd,
          child: Text('$title Ekle'),
        ),
      ],
    );
  }
}

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajanda'),
      ),
      body: const Center(child: Text('Ajanda Page')),
    );
  }
}

class ManagementPage extends StatelessWidget {
  const ManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yönetim'),
      ),
      body: const Center(child: Text('Yönetim Page')),
    );
  }
}

class ResourceManagementPage extends StatelessWidget {
  const ResourceManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kaynak Yönetimi'),
      ),
      body: const Center(child: Text('Kaynak Yönetimi Page')),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doktor Bilgi Kayıt',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DoktorBilgiKayitFormu(),
    );
  }
}

class DoktorBilgiKayitFormu extends StatefulWidget {
  @override
  _DoktorBilgiKayitFormuState createState() => _DoktorBilgiKayitFormuState();
}

class _DoktorBilgiKayitFormuState extends State<DoktorBilgiKayitFormu> {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  String unvan = '';
  String adi = '';
  String soyadi = '';
  String tcKimlikNo = '';
  String dogumTarihi = '';
  String ahBirimNo = '';
  String cinsiyet = '';
  String kanGrubu = '';
  String mesaiSaatleri = '';
  String oglenSaatleri = '';
  String ckysKodu = '';
  String asmBilgi = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doktor Bilgi Kayıt Formu'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Card(
                    color: const Color.fromARGB(255, 205, 220, 228),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Text('Ünvanı',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Ünvanı giriniz',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  unvan = value;
                                });
                              },
                            ),
                            SizedBox(height: 16),
                            Text('Adı',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Adı giriniz',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  adi = value;
                                });
                              },
                            ),
                            SizedBox(height: 16),
                            Text('Soyadı',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Soyadı giriniz',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  soyadi = value;
                                });
                              },
                            ),
                            SizedBox(height: 16),
                            Text('TC Kimlik No',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'TC Kimlik No giriniz',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  tcKimlikNo = value;
                                });
                              },
                            ),
                            SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Card(
                      color: const Color.fromARGB(255, 205, 220, 228),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Text('Fotoğraf',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(height: 8),
                            Container(
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(Icons.camera_alt,
                                  size: 50, color: Colors.grey),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    onPressed: () {},
                                    child: Icon(Icons.camera_alt_outlined)),
                                SizedBox(
                                  width: 10,
                                ),
                                ElevatedButton(
                                    onPressed: () {},
                                    child: Icon(Icons.cases_outlined)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Card(
                    color: const Color.fromARGB(255, 205, 220, 228),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Form(
                        key: _formKey2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Text('Doğum Tarihi',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Doğum Tarihi giriniz',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  dogumTarihi = value;
                                });
                              },
                            ),
                            SizedBox(height: 16),
                            Text('A.H. Birim No',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'A.H. Birim No giriniz',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  ahBirimNo = value;
                                });
                              },
                            ),
                            SizedBox(height: 16),
                            Text('Cinsiyet',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Cinsiyet giriniz',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  cinsiyet = value;
                                });
                              },
                            ),
                            SizedBox(height: 16),
                            Text('Kan Grubu',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Kan Grubu giriniz',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  kanGrubu = value;
                                });
                              },
                            ),
                            SizedBox(height: 16),
                            Text('Mesai Saatleri',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Mesai Saatleri giriniz',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  mesaiSaatleri = value;
                                });
                              },
                            ),
                            SizedBox(height: 16),
                            Text('Öğlen Saatleri',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Öğlen Saatleri giriniz',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  oglenSaatleri = value;
                                });
                              },
                            ),
                            SizedBox(height: 16),
                            Text('ÇKYS Kodu',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'ÇKYS Kodu giriniz',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  ckysKodu = value;
                                });
                              },
                            ),
                            SizedBox(height: 16),
                            Text('ASM Bilgi',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'ASM Bilgi giriniz',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  asmBilgi = value;
                                });
                              },
                            ),
                            SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [DoktorSekmeliForm()],
            ),
          ],
        ),
      ),
    );
  }
}

class DoktorSekmeliForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Expanded(
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Hekim Bilgileri'),
                Tab(text: 'Sözleşme Bilgileri'),
                Tab(text: 'Öğrenim Bilgileri'),
                Tab(text: 'Kullanıcı Bilgileri'),
              ],
              labelColor: Colors.blue,
            ),
            Container(
              height: 505, // Sekme içeriği için sabit bir yükseklik
              child: TabBarView(
                children: [
                  Center(child: HekimBilgileriSekmesi()),
                  Center(child: SozlesmeBilgileriSekmesi()),
                  Center(child: OgrenimBilgileriSekmesi()),
                  Center(child: KullaniciBilgileriSekmesi()),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: Row(children: [
                        Icon(
                          Icons.find_in_page_sharp,
                        ),
                        Text('İzinler')
                      ])),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Row(children: [
                        Icon(
                          Icons.add,
                        ),
                        Text('Ekle')
                      ])),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Row(children: [
                        Icon(
                          Icons.check,
                        ),
                        Text('Kaydet')
                      ])),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class HekimBilgileriSekmesi extends StatefulWidget {
  @override
  _HekimBilgileriSekmesi createState() => _HekimBilgileriSekmesi();
}

class _HekimBilgileriSekmesi extends State<HekimBilgileriSekmesi> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String evAdresi = ' ';
    String evTelefonu = ' ';
    String evTelefonu2 = ' ';
    String GSM = ' ';
    String GPS = ' ';
    String webAdresi = ' ';
    String eMail = ' ';

    return Scaffold(
      body: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Card(
                color: const Color.fromARGB(255, 205, 220, 228),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Text('Ev Adresi',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Ev Adresi giriniz',
                          ),
                          onChanged: (value) {
                            setState(() {
                              evAdresi = value;
                            });
                          },
                        ),
                        SizedBox(height: 16),
                        Text('Ev Telefonu',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Ev Telefonu giriniz',
                          ),
                          onChanged: (value) {
                            setState(() {
                              evTelefonu = value;
                            });
                          },
                        ),
                        SizedBox(height: 16),
                        Text('Ev Telefonu 2',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Ev Telefonu 2 giriniz',
                          ),
                          onChanged: (value) {
                            setState(() {
                              evTelefonu2 = value;
                            });
                          },
                        ),
                        SizedBox(height: 16),
                        Text('GSM',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'GSM giriniz',
                          ),
                          onChanged: (value) {
                            setState(() {
                              GSM = value;
                            });
                          },
                        ),
                        SizedBox(height: 16),
                        Text('GPS',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'GPS giriniz',
                          ),
                          onChanged: (value) {
                            setState(() {
                              GPS = value;
                            });
                          },
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SozlesmeBilgileriSekmesi extends StatefulWidget {
  @override
  _SozlesmeBilgileriSekmesi createState() => _SozlesmeBilgileriSekmesi();
}

class _SozlesmeBilgileriSekmesi extends State<SozlesmeBilgileriSekmesi> {
  final _formKey = GlobalKey<FormState>();

  String baslangicTarihi = ' ';
  String bitisTarihi = ' ';
  String brutUcret = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Card(
                color: const Color.fromARGB(255, 205, 220, 228),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Text('Başlangıç Tarihi',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Başlangıç Tarihi giriniz',
                          ),
                          onChanged: (value) {
                            setState(() {
                              baslangicTarihi = value;
                            });
                          },
                        ),
                        SizedBox(height: 16),
                        Text('Bitiş Tarihi',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Bitiş Tarihi giriniz',
                          ),
                          onChanged: (value) {
                            setState(() {
                              bitisTarihi = value;
                            });
                          },
                        ),
                        SizedBox(height: 16),
                        Text('Brüt Ücret',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Brüt Ücret giriniz',
                          ),
                          onChanged: (value) {
                            setState(() {
                              brutUcret = value;
                            });
                          },
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: 180,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Row(children: [
                                Icon(
                                  Icons.pending_actions_outlined,
                                ),
                                Text('Sözleşme Metni')
                              ])),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OgrenimBilgileriSekmesi extends StatefulWidget {
  @override
  _OgrenimBilgileriSekmesi createState() => _OgrenimBilgileriSekmesi();
}

class _OgrenimBilgileriSekmesi extends State<OgrenimBilgileriSekmesi> {
  final _formKey = GlobalKey<FormState>();

  String dipTescilNo = ' ';
  String mezOldTarih = ' ';
  String mezOldOkul = ' ';
  String sertifikaNo = ' ';
  String ihtisasNo = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Card(
                color: const Color.fromARGB(255, 205, 220, 228),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Text('Diploma Tescil No',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Diploma Tescil No giriniz',
                          ),
                          onChanged: (value) {
                            setState(() {
                              dipTescilNo = value;
                            });
                          },
                        ),
                        SizedBox(height: 16),
                        Text('Mezun Olduğu Okul',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Mezun Olduğu Okulu giriniz',
                          ),
                          onChanged: (value) {
                            setState(() {
                              mezOldOkul = value;
                            });
                          },
                        ),
                        SizedBox(height: 16),
                        Text('Mezun Olduğu Tarih',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Mezun Olduğu Tarihi giriniz',
                          ),
                          onChanged: (value) {
                            setState(() {
                              mezOldTarih = value;
                            });
                          },
                        ),
                        SizedBox(height: 16),
                        Text('Sertifika No',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Sertifika No giriniz',
                          ),
                          onChanged: (value) {
                            setState(() {
                              sertifikaNo = value;
                            });
                          },
                        ),
                        SizedBox(height: 16),
                        Text('İhtisas No',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'İhtisas No giriniz',
                          ),
                          onChanged: (value) {
                            setState(() {
                              ihtisasNo = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KullaniciBilgileriSekmesi extends StatefulWidget {
  @override
  _KullaniciBilgileriSekmesi createState() => _KullaniciBilgileriSekmesi();
}

class _KullaniciBilgileriSekmesi extends State<KullaniciBilgileriSekmesi> {
  final _formKey = GlobalKey<FormState>();

  String kullaniciAdi = ' ';
  String kullaniciKodu = ' ';
  String eskiSifre = ' ';
  String yeniSifre = ' ';
  String yeniSifreTekrar = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Card(
                color: const Color.fromARGB(255, 205, 220, 228),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Text('Kullanıcı Adı',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Kullanıcı Adı giriniz',
                          ),
                          onChanged: (value) {
                            setState(() {
                              kullaniciAdi = value;
                            });
                          },
                        ),
                        SizedBox(height: 16),
                        Text('Kullanıcı Kodu',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Kullanıcı Kodu giriniz',
                          ),
                          onChanged: (value) {
                            setState(() {
                              kullaniciKodu = value;
                            });
                          },
                        ),
                        SizedBox(height: 16),
                        Text('Eski Şifre',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Eski Şifreyi giriniz',
                          ),
                          onChanged: (value) {
                            setState(() {
                              eskiSifre = value;
                            });
                          },
                        ),
                        SizedBox(height: 16),
                        Text('Yeni Şifre',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Yeni Şifreyi giriniz',
                          ),
                          onChanged: (value) {
                            setState(() {
                              yeniSifre = value;
                            });
                          },
                        ),
                        SizedBox(height: 16),
                        Text('Yeni Şifre Tekrar',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Yeni Şifreyi Tekrar giriniz',
                          ),
                          onChanged: (value) {
                            setState(() {
                              yeniSifreTekrar = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HekimCalismaPlaniPage extends StatelessWidget {
  const HekimCalismaPlaniPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hekim Çalışma Planı'),
      ),
      body: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 650,
              child: Card(
                color: const Color.fromARGB(255, 205, 220, 228),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SfCalendar(
                  view: CalendarView.week,
                  firstDayOfWeek: 1,
                  timeSlotViewSettings: TimeSlotViewSettings(
                    startHour: 7,
                    endHour: 20,
                    timeInterval: Duration(hours: 1),
                  ),
                ),
              ),
            ),
            Container(
              height: 150,
              child: Card(
                color: const Color.fromARGB(255, 205, 220, 228),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AksiyonTipiDropDownBox(),
                      SizedBox(
                        height: 10,
                      ),
                      CetvelTipiDropDownBox(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AksiyonTipiDropDownBox extends StatefulWidget {
  @override
  _AksiyonTipiDropDownBox createState() => _AksiyonTipiDropDownBox();
}

class _AksiyonTipiDropDownBox extends State<AksiyonTipiDropDownBox> {
  String? selectedValue;
  List<String> items = [
    'Check-Up',
    'Dini Bayram',
    'Doğum Öncesi/Doğum Sonrası',
    'Eğitim veya Kongre',
    'Evde Sağlık Hizmetleri',
    'Evlilik İzni',
    'Filyasyonda Görevli',
    'Gezici Sağlık Hizmetleri',
    'Hafta Sonu Tatili',
    'İdari İzin',
    'İş Yeri Hekimliği',
    'Koruyucu Sağlık Hizmetleri',
    'Mobil Sağlık Hizmetleri',
    'Nöbet',
    'Ölüm İzni',
    'Raporlu',
    'Refakat İzni',
    'Saha Çalışması',
    'SAHU Eğitim',
    'SAHU Rotasyon',
    'Süt İzni'
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text(
        "Aksiyon Tipi",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      value: selectedValue,
      isExpanded: true,
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue;
        });
      },
    );
  }
}

class CetvelTipiDropDownBox extends StatefulWidget {
  @override
  _CetvelTipiDropDownBox createState() => _CetvelTipiDropDownBox();
}

class _CetvelTipiDropDownBox extends State<CetvelTipiDropDownBox> {
  String? selectedValue;
  List<String> items = [
    'Taslak Cetveller',
    'Gönderilmiş Cetveller',
    'Kesinleştirilmiş Cetveller',
    'İstisna Cetveller',
    'Cetvel Güncelle'
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text(
        "Cetvel Tipi",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      value: selectedValue,
      isExpanded: true,
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue;
        });
      },
    );
  }
}

//-------------------------------------------

class DecisionSupportPage extends StatelessWidget {
  const DecisionSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Karar Destek'),
      ),
      body: const Center(child: Text('Karar Destek Page')),
    );
  }
}

class SMSNotificationPage extends StatelessWidget {
  const SMSNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Otomatik Bildirimler'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 370,
              child: Card(
                color: const Color.fromARGB(255, 205, 220, 228),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Kullanıcı Adı',
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Kullanıcı Şifresi',
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Admin Telefonu',
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Mesaj Başlığı',
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'SMS Sağlayıcı',
                        ),
                      ),
                      const SizedBox(
                          height:
                              50), // Butonlar ile TextField'lar arasında boşluk
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Gönderme işlemi
                            },
                            child: const Text('Kaydet'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Temizleme işlemi
                            },
                            child: const Text('Kapat'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SMSSendingPage extends StatelessWidget {
  const SMSSendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMS Gönder'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                //En sol sütun
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 190,
                        child: Card(
                          color: Color.fromARGB(255, 205, 220, 228),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                'Bireye Göre Ara',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Ad-Soyad"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Kimlik No"),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Telefon"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Tümü"),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 190,
                        child: Card(
                          color: Color.fromARGB(255, 205, 220, 228),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                'Cinsiyete Göre Ara',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Tümü"),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Erkek"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Kadın"),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 250,
                        child: Card(
                          color: Color.fromARGB(255, 205, 220, 228),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                'Yaşa Göre Ara',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Tümü"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text("0-1 Yaş"),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text("1-5 Yaş"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text("5-15 Yaş"),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text("15-49 Yaş"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text("+65 Yaş"),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //Orta sütun
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      border: Border.all(
                        color: Colors.black, // Çerçeve rengi
                        width: 0.5, // Çerçeve kalınlığı
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ListView(
                      children: [
                        Container(
                          width: double.infinity,
                          color: Colors.indigoAccent,
                          child: Text(
                            "Arama Sonuçları",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //En sağdaki sütun
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      border: Border.all(
                        color: Colors.black, // Çerçeve rengi
                        width: 0.5, // Çerçeve kalınlığı
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ListView(
                      children: [
                        Container(
                          width: double.infinity,
                          color: Colors.indigoAccent,
                          child: Text(
                            "SMS Gönderilecekler",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //En alt satır
          SizedBox(
            height: 10,
          ),
          Container(
            width: 830,
            padding: const EdgeInsets.all(16),
            color: const Color.fromARGB(255, 205, 220, 228),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: TextField(
                    maxLength: 500,
                    minLines: 5,
                    maxLines: 20,
                    decoration: InputDecoration(
                        hintText:
                            "Mesaj Sadece Telefon Numarası Kayıtlı Hastalara Gönderilecektir !",
                        labelText: "Mesaj Metni",
                        border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                    onPressed: () {
                      print("Mesaj Gönderildi.");
                    },
                    child: Text('Mesaj Gönder'))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

class MergeInpatientCardPage extends StatefulWidget {
  @override
  _MergeInpatientCardPage createState() => _MergeInpatientCardPage();
}

class _MergeInpatientCardPage extends State<MergeInpatientCardPage> {
  //const _MergeInpatientCardPage({super.key});
  Map<String, String> birlestilenHastalar = {};
  String anneKimlikNo = "----";
  String cocukKimlikNo = "----";
  String metin = "....";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasta Kartı Birleştirme'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        child: Text(
                          'Orjinal Hasta',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        color: Colors.indigoAccent,
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16.0),
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Birey Ara",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.check_circle,
                                color: Colors.blueAccent),
                            onPressed: () {
                              // Onay butonunun işlevi
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16.0),
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Row(
                        children: [
                          Text('Hasta Dosya No : '),
                          Expanded(
                            child: TextField(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16.0),
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Row(
                        children: [
                          Text('Kimlik No : '),
                          Expanded(
                            child: TextField(
                              onChanged: (value) {
                                anneKimlikNo = value;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16.0),
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Row(
                        children: [
                          Text('Hasta Adı : '),
                          Expanded(
                            child: TextField(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16.0),
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Row(
                        children: [
                          Text('Hasta Soyadı : '),
                          Expanded(
                            child: TextField(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16.0),
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Row(
                        children: [
                          Text('Anne Adı : '),
                          Expanded(
                            child: TextField(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16.0),
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Row(
                        children: [
                          Text('Doğum Tarihi : '),
                          Expanded(
                            child: TextField(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              VerticalDivider(
                color: Colors.indigo,
                thickness: 3, // Çizgi kalınlığı
                width: 0,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        child: Text(
                          'Birleştirilecek Hasta',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        color: Colors.indigoAccent,
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16.0),
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Birey Ara",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.check_circle,
                                color: Colors.blueAccent),
                            onPressed: () {
                              // Onay butonunun işlevi
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16.0),
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Row(
                        children: [
                          Text('Hasta Dosya No : '),
                          Expanded(
                            child: TextField(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16.0),
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Row(
                        children: [
                          Text('Kimlik No : '),
                          Expanded(
                            child: TextField(
                              onChanged: (value) {
                                cocukKimlikNo = value;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16.0),
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Row(
                        children: [
                          Text('Hasta Adı : '),
                          Expanded(
                            child: TextField(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16.0),
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Row(
                        children: [
                          Text('Hasta Soyadı : '),
                          Expanded(
                            child: TextField(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16.0),
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Row(
                        children: [
                          Text('Anne Adı : '),
                          Expanded(
                            child: TextField(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16.0),
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Row(
                        children: [
                          Text('Doğum Tarihi : '),
                          Expanded(
                            child: TextField(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Card(
                color: Colors.blueAccent,
                child: TextButton.icon(
                  onPressed: () {
                    birlestilenHastalar[anneKimlikNo] = cocukKimlikNo;
                    setState(() {
                      metin = anneKimlikNo +
                          " kimlik nolu hasta ile " +
                          cocukKimlikNo +
                          " kimlik nolu hasta birleştirildi. ";
                      birlestilenHastalar.forEach((anahtar, deger) {
                        print("$anahtar : $deger");
                      });
                      print("-----------");
                    });
                  },
                  icon: Icon(
                    Icons.add,
                    size: 24,
                    color: Colors.white,
                  ), // İkon
                  label: Text("Birleştir",
                      style: TextStyle(
                          fontSize: 20, color: Colors.white)), // Buton metni
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Card(
                elevation: 4,
                margin: EdgeInsets.all(8),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    metin,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayarlar'),
      ),
      body: const Center(child: Text('Ayarlar Page')),
    );
  }
}

class InspectionProcessesPage extends StatelessWidget {
  const InspectionProcessesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TETKİK İşlemleri'),
      ),
      body: const Center(child: Text('TETKİK İşlemleri Page')),
    );
  }
}

class DataTransferPage extends StatelessWidget {
  const DataTransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Veri Aktarımı'),
      ),
      body: const Center(child: Text('Veri Aktarımı Page')),
    );
  }
}

class IslemlerPage extends StatelessWidget {
  const IslemlerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('İşlemler Sayfası'),
      ),
      body: const Center(child: Text('İşlemler Sayfası')),
    );
  }
}

class USSDecisionSupportPage extends StatelessWidget {
  const USSDecisionSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('USS Karar Destek'),
      ),
      body: const Center(child: Text('USS Karar Destek Page')),
    );
  }
}

class EndExaminationPage extends StatelessWidget {
  const EndExaminationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Muayene Bitir'),
      ),
      body: const Center(child: Text('Muayene Bitir Page')),
    );
  }
}
