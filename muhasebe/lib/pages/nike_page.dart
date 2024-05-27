import 'package:flutter/material.dart';

class NikePage extends StatefulWidget {
  @override
  _NikePageState createState() => _NikePageState();
}

class _NikePageState extends State<NikePage> {
  final _formKey = GlobalKey<FormState>();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();
  String _result = '';

  void _evaluateOrder() {
    int quantity = int.parse(_quantityController.text);
    double price = double.parse(_priceController.text);
    double unitPrice = 500; // Nike birim fiyatı (₺)
    int maxCapacity = 10000; // Nike mevcut kapasitesi

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
        title: Text('Nike Analiz'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Ürün Görseli
            Container(
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/nike.png'),
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
                    'Nike',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Spor Ayakkabı',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '₺500',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Malzeme: Sentetik', style: TextStyle(fontSize: 18)),
                          Text('Taban: Kauçuk', style: TextStyle(fontSize: 18)),
                          Text('Renk: Beyaz', style: TextStyle(fontSize: 18)),
                          Text('Boyut: 42-46', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Kapasite: 10000 adet', style: TextStyle(fontSize: 18)),
                          Text('Birim Fiyat: ₺500', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Nike spor ayakkabılar, yüksek performans ve konfor sağlar. Gelişmiş malzemeler ile uzun süreli kullanım sunar.',
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
