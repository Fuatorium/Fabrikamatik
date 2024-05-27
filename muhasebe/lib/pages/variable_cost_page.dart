import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VariableCostPage extends StatelessWidget {
  const VariableCostPage({Key? key}) : super(key: key);

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
              Lottie.asset('assets/animations/variable_cost.json', height: 200),
              const SizedBox(height: 20),
              const Text(
                'Değişken Maliyetler',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Değişken maliyetler, üretim miktarına bağlı olarak değişen maliyetlerdir. Örnekler arasında hammadde maliyetleri, işçilik maliyetleri ve enerji maliyetleri yer alır.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Örnekler',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              _buildExampleCard('Hammadde Maliyetleri', 'assets/icons/raw_materials.png'),
              _buildExampleCard('İşçilik Maliyetleri', 'assets/icons/labor_costs.png'),
              _buildExampleCard('Enerji Maliyetleri', 'assets/icons/energy_costs.png'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExampleCard(String title, String imagePath) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Image.asset(imagePath, width: 50, height: 50),
        title: Text(title, style: const TextStyle(fontSize: 18)),
        subtitle: const Text('Bu, değişken maliyetlerin bir örneğidir.'),
      ),
    );
  }
}
