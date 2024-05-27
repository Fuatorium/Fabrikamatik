import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BudgetPage extends StatelessWidget {
  const BudgetPage({Key? key}) : super(key: key);

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Fabrikamatik',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/icons/Arrow - Left 2.svg',
            height: 20,
            width: 20,
          ),
          decoration: BoxDecoration(
            color: const Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              height: 5,
              width: 5,
            ),
            decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Lottie.asset('assets/animations/budget.json', height: 200),
              const SizedBox(height: 20),
              const Text(
                'Bütçe',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Bütçe, bir işletmenin belirli bir süre için planladığı gelir ve giderlerin bir özetidir. Bütçeleme, işletmelerin mali hedeflerini belirlemelerine ve performanslarını izlemelerine yardımcı olur.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Örnekler',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              _buildExampleCard('Tesla', 'assets/icons/tesla-svgrepo-com.svg', 'Tesla, yıllık bütçesini belirlerken araştırma ve geliştirme harcamalarına büyük önem verir.'),
              _buildExampleCard('Shell', 'assets/icons/shell-logo-svgrepo-com.svg', 'Shell, bütçesini petrol fiyatlarındaki dalgalanmalara göre ayarlar.'),
              _buildExampleCard('Nike', 'assets/icons/nike.svg', 'Nike, pazarlama bütçesini her yıl artırarak marka bilinirliğini artırmayı hedefler.'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExampleCard(String title, String imagePath, String description) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: SvgPicture.asset(imagePath, width: 50, height: 50),
        title: Text(title, style: const TextStyle(fontSize: 18)),
        subtitle: Text(description),
      ),
    );
  }
}
