import 'package:flutter/material.dart';

class NvidiaPage extends StatefulWidget {
  @override
  _NvidiaPageState createState() => _NvidiaPageState();
}

class _NvidiaPageState extends State<NvidiaPage> {
  final _formKey = GlobalKey<FormState>();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();
  String _result = '';

  void _evaluateOrder() {
    int quantity = int.parse(_quantityController.text);
    double price = double.parse(_priceController.text);
    double unitPrice = 5000; // Nvidia ekran kartı birim fiyatı (₺)
    int maxCapacity = 500; // Nvidia mevcut kapasitesi

    // Sipariş değerlendirme mantığı
    if (quantity <= maxCapacity && price >= unitPrice * quantity) {
      setState(() {
        _result = 'Sipariş kabul edilebilir';
      });
    } else {
      setState(() {
        _result = 'Sipariş kabul edilemez';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nvidia Analiz'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Ürün Görseli
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/niv.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Ürün Bilgileri
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nvidia GeForce RTX 3090',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Ekran Kartı',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '₺5,000',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Ürün Detayları',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Bellek: 24 GB GDDR6X', style: TextStyle(fontSize: 18)),
                            Text('CUDA Çekirdek: 10496', style: TextStyle(fontSize: 18)),
                            Text('Boost Saat Hızı: 1.70 GHz', style: TextStyle(fontSize: 18)),
                            Text('TDP: 350W', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                        SizedBox(width: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Kapasite: 500 adet', style: TextStyle(fontSize: 18)),
                            Text('Birim Fiyat: ₺5,000', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Nvidia GeForce RTX 3090, oyun ve yaratıcı işler için üst düzey performans sunar. Gelişmiş teknolojiler ve yüksek bellek kapasitesi ile en zorlu görevlerin üstesinden gelir.',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),
                  // Sipariş Formu
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _quantityController,
                          decoration: InputDecoration(
                            labelText: 'Miktar',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Lütfen miktarı girin';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _priceController,
                          decoration: InputDecoration(
                            labelText: 'Fiyat (₺)',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Lütfen fiyatı girin';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _evaluateOrder();
                            }
                          },
                          child: Text('Değerlendir'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                            textStyle: TextStyle(fontSize: 18),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          _result,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
