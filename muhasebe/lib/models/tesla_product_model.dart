class TeslaProductModel {
  String name;
  String imagePath;
  int capacity;
  double pricePerUnit;

  TeslaProductModel({
    required this.name,
    required this.imagePath,
    required this.capacity,
    required this.pricePerUnit,
  });

  static List<TeslaProductModel> getProducts() {
    return [
      TeslaProductModel(
        name: 'Model S',
        imagePath: 'assets/images/model_s.jpg',
        capacity: 100,
        pricePerUnit: 75000,
      ),
      TeslaProductModel(
        name: 'Model 3',
        imagePath: 'assets/images/model_3.jpg',
        capacity: 150,
        pricePerUnit: 40000,
      ),
      TeslaProductModel(
        name: 'Model X',
        imagePath: 'assets/images/model_x.jpg',
        capacity: 50,
        pricePerUnit: 90000,
      ),
      TeslaProductModel(
        name: 'Model Y',
        imagePath: 'assets/images/model_y.jpg',
        capacity: 200,
        pricePerUnit: 50000,
      ),
    ];
  }
}
