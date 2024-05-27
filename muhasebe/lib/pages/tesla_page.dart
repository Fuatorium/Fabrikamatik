import 'package:flutter/material.dart';

class TeslaPage extends StatefulWidget {
  @override
  _TeslaPageState createState() => _TeslaPageState();
}

class _TeslaPageState extends State<TeslaPage> {
  final _formKey = GlobalKey<FormState>();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();
  String _result = '';

  void _evaluateOrder() {
    int quantity = int.parse(_quantityController.text);
    double price = double.parse(_priceController.text);
    double unitPrice = 1250000; // Model Y Performance birim fiyatı (₺)
    int maxCapacity = 300; // Model Y Performance mevcut kapasitesi

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
        title: Text('Tesla Model Y'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Araç Görseli
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/model_y.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Araç Bilgileri
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tesla Model Y',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Performans',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '₺1,250,000',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Araç Detayları',
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
                            Text('Menzil: 480 km', style: TextStyle(fontSize: 18)),
                            Text('Çekiş: AWD', style: TextStyle(fontSize: 18)),
                            Text('Hızlanma: 0-100 km/s 3.5s', style: TextStyle(fontSize: 18)),
                            Text('Maksimum Hız: 240 km/s', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                        SizedBox(width: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Kapasite: 300 adet', style: TextStyle(fontSize: 18)),
                            Text('Birim Fiyat: ₺1,250,000', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Tesla All-Wheel Drive, iki bağımsız motora sahiptir. Geleneksel dört tekerlekten çekiş sistemlerinin aksine, bu iki motor torku ön ve arka tekerleklere dijital olarak kontrol eder—çok daha iyi yol tutuş ve çekiş kontrolü sağlar.',
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
