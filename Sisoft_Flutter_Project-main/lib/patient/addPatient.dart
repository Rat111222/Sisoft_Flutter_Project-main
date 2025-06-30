import 'package:flutter/material.dart';

class HastaEklePage extends StatefulWidget {
  const HastaEklePage({super.key});

  @override
  _HastaEklePageState createState() => _HastaEklePageState();
}

class _HastaEklePageState extends State<HastaEklePage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for form fields
  final TextEditingController _kimlikNoController = TextEditingController();
  final TextEditingController _yupassNoController = TextEditingController();
  final TextEditingController _adiController = TextEditingController();
  final TextEditingController _soyadiController = TextEditingController();
  final TextEditingController _dogumYeriController = TextEditingController();
  final TextEditingController _mernisDogumController = TextEditingController();
  final TextEditingController _beyanDogumController = TextEditingController();
  final TextEditingController _anneAdiController = TextEditingController();
  final TextEditingController _babaAdiController = TextEditingController();
  final TextEditingController _sgkController = TextEditingController();
  final TextEditingController _medeniHaliController = TextEditingController();
  final TextEditingController _cinsiyetController = TextEditingController();
  final TextEditingController _kayitDurumuController = TextEditingController();
  final TextEditingController _oncelikDurumuController = TextEditingController();
  final TextEditingController _uyrukController = TextEditingController();
  final TextEditingController _kanGrubuController = TextEditingController();
  final TextEditingController _evTelController = TextEditingController();
  final TextEditingController _isTelController = TextEditingController();
  final TextEditingController _cepTelController = TextEditingController();
  final TextEditingController _faxNoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasta Ekle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Kimlik No
                TextFormField(
                  controller: _kimlikNoController,
                  decoration: const InputDecoration(
                    labelText: 'Kimlik No',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                // YUPASS No
                TextFormField(
                  controller: _yupassNoController,
                  decoration: const InputDecoration(
                    labelText: 'YUPASS No',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                // Adı
                TextFormField(
                  controller: _adiController,
                  decoration: const InputDecoration(
                    labelText: 'Adı',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                // Soyadı
                TextFormField(
                  controller: _soyadiController,
                  decoration: const InputDecoration(
                    labelText: 'Soyadı',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                // Doğum Yeri
                TextFormField(
                  controller: _dogumYeriController,
                  decoration: const InputDecoration(
                    labelText: 'Doğum Yeri',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                // Mernis Doğum
                TextFormField(
                  controller: _mernisDogumController,
                  decoration: const InputDecoration(
                    labelText: 'Mernis Doğum',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                // Beyan Doğum
                TextFormField(
                  controller: _beyanDogumController,
                  decoration: const InputDecoration(
                    labelText: 'Beyan Doğum',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                // Anne Adı
                TextFormField(
                  controller: _anneAdiController,
                  decoration: const InputDecoration(
                    labelText: 'Anne Adı',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                // Baba Adı
                TextFormField(
                  controller: _babaAdiController,
                  decoration: const InputDecoration(
                    labelText: 'Baba Adı',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                // SGK
                TextFormField(
                  controller: _sgkController,
                  decoration: const InputDecoration(
                    labelText: 'SGK',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                // Medeni Hali
                TextFormField(
                  controller: _medeniHaliController,
                  decoration: const InputDecoration(
                    labelText: 'Medeni Hali',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                // Cinsiyet
                TextFormField(
                  controller: _cinsiyetController,
                  decoration: const InputDecoration(
                    labelText: 'Cinsiyet',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                // Kayıt Durumu
                TextFormField(
                  controller: _kayitDurumuController,
                  decoration: const InputDecoration(
                    labelText: 'Kayıt Durumu',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                // Öncelik Durumu
                TextFormField(
                  controller: _oncelikDurumuController,
                  decoration: const InputDecoration(
                    labelText: 'Öncelik Durumu',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                // Uyruğu
                TextFormField(
                  controller: _uyrukController,
                  decoration: const InputDecoration(
                    labelText: 'Uyruğu',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                // Kan Grubu
                TextFormField(
                  controller: _kanGrubuController,
                  decoration: const InputDecoration(
                    labelText: 'Kan Grubu',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                // Ev Tel
                TextFormField(
                  controller: _evTelController,
                  decoration: const InputDecoration(
                    labelText: 'Ev Tel',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 10),
                // İş Tel
                TextFormField(
                  controller: _isTelController,
                  decoration: const InputDecoration(
                    labelText: 'İş Tel',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 10),
                // Cep Tel
                TextFormField(
                  controller: _cepTelController,
                  decoration: const InputDecoration(
                    labelText: 'Cep Tel',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 10),
                // Fax No
                TextFormField(
                  controller: _faxNoController,
                  decoration: const InputDecoration(
                    labelText: 'Fax No',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 10),
                // E-Mail
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'E-Mail',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                // Save Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Save data
                      print("Data saved successfully");
                    }
                  },
                  child: const Text('Kaydet'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasta Ekle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Kişisel Bilgiler Bölümü
              Text('Kişisel Bilgiler',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildRoundedTextField(_isimController, 'İsim',
                  validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bu alan boş bırakılamaz';
                }
                return null;
              }),
              SizedBox(height: 10),
              _buildRoundedTextField(_soyisimController, 'Soyisim',
                  validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bu alan boş bırakılamaz';
                }
                return null;
              }),
              SizedBox(height: 10),
              _buildRoundedTextField(_kimlikNoController, 'Kimlik No',
                  validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bu alan boş bırakılamaz';
                }
                if (value.length != 11) {
                  return 'Kimlik No 11 haneli olmalıdır';
                }
                return null;
              }),
              SizedBox(height: 10),
              _buildRoundedTextField(_yupassNoController, 'Yupass No',
                  validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bu alan boş bırakılamaz';
                }
                if (value.length < 6) {
                  return 'Yupass No en az 6 haneli olmalıdır';
                }
                return null;
              }),
              Divider(height: 30, thickness: 2),

              // Doğum Bilgileri Bölümü
              Text('Doğum Bilgileri',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildRoundedTextField(
                _mernisDogumTarihiController,
                'Mernis Doğum Tarihi',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bu alan boş bırakılamaz';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              _buildRoundedTextField(
                _beyanDogumTarihiController,
                'Beyan Doğum Tarihi',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bu alan boş bırakılamaz';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              _buildRoundedTextField(_dogumYeriController, 'Doğum Yeri',
                  validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bu alan boş bırakılamaz';
                }
                return null;
              }),
              SizedBox(height: 10),
              _buildRoundedDropdown(
                _selectedUyruk,
                uyrukOptions,
                'Uyruk',
                (newValue) {
                  setState(() {
                    _selectedUyruk = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bu alan boş bırakılamaz';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              _buildRoundedDropdown(
                _selectedDogumSirasiNo,
                dogumSirasiNoOptions,
                'Doğum Sırası No',
                (newValue) {
                  setState(() {
                    _selectedDogumSirasiNo = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bu alan boş bırakılamaz';
                  }
                  return null;
                },
              ),
              Divider(height: 30, thickness: 2),

              // Aile Bilgileri Bölümü
              Text('Aile Bilgileri',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildRoundedTextField(_anneAdiController, 'Anne Adı',
                  validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bu alan boş bırakılamaz';
                }
                return null;
              }),
              SizedBox(height: 10),
              _buildRoundedTextField(_babaAdiController, 'Baba Adı',
                  validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bu alan boş bırakılamaz';
                }
                return null;
              }),
              SizedBox(height: 10),
              _buildRoundedTextField(_anneKimlikNoController, 'Anne Kimlik No',
                  validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bu alan boş bırakılamaz';
                }
                return null;
              }),
              Divider(height: 30, thickness: 2),

              // İletişim Bilgileri Bölümü
              Text('İletişim Bilgileri',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildRoundedTextField(_evTelController, 'Ev Telefonu',
                  validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bu alan boş bırakılamaz';
                }
                return null;
              }),
              SizedBox(height: 10),
              _buildRoundedTextField(_isTelController, 'İş Telefonu',
                  validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bu alan boş bırakılamaz';
                }
                return null;
              }),
              SizedBox(height: 10),
              _buildRoundedTextField(_cepTelController, 'Cep Telefonu',
                  validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bu alan boş bırakılamaz';
                }
                return null;
              }),
              SizedBox(height: 10),
              _buildRoundedTextField(_faxNoController, 'Fax Numarası',
                  validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bu alan boş bırakılamaz';
                }
                return null;
              }),
              SizedBox(height: 10),
              _buildRoundedTextField(_emailController, 'E-posta',
                  validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bu alan boş bırakılamaz';
                }
                if (!RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+")
                    .hasMatch(value)) {
                  return 'Geçerli bir e-posta adresi girin';
                }
                return null;
              }),
              Divider(height: 30, thickness: 2),

              // Diğer Bilgiler Bölümü
              Text('Diğer Bilgiler',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildRoundedDropdown(
                _selectedSGK,
                sgkOptions,
                'SGK Durumu',
                (newValue) {
                  setState(() {
                    _selectedSGK = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bu alan boş bırakılamaz';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              _buildRoundedDropdown(
                _selectedMedeniHal,
                medeniHalOptions,
                'Medeni Hal',
                (newValue) {
                  setState(() {
                    _selectedMedeniHal = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bu alan boş bırakılamaz';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              _buildRoundedDropdown(
                _selectedCinsiyet,
                cinsiyetOptions,
                'Cinsiyet',
                (newValue) {
                  setState(() {
                    _selectedCinsiyet = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bu alan boş bırakılamaz';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              _buildRoundedDropdown(
                _selectedKayitDurumu,
                kayitDurumuOptions,
                'Kayıt Durumu',
                (newValue) {
                  setState(() {
                    _selectedKayitDurumu = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bu alan boş bırakılamaz';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              _buildRoundedDropdown(
                _selectedOncelikDurumu,
                oncelikDurumuOptions,
                'Öncelik Durumu',
                (newValue) {
                  setState(() {
                    _selectedOncelikDurumu = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bu alan boş bırakılamaz';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              _buildRoundedDropdown(
                _selectedKanGrubu,
                kanGrubuOptions,
                'Kan Grubu',
                (newValue) {
                  setState(() {
                    _selectedKanGrubu = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bu alan boş bırakılamaz';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Kaydet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
*/