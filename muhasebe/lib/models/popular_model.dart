class PopularDietsModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool boxIsSelected;

  PopularDietsModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxIsSelected
  });

  static List<PopularDietsModel> getPopularDiets() {
    List<PopularDietsModel> popularDiets = [];

    popularDiets.add(
        PopularDietsModel(
          name: 'Sabit Maliyet',
          iconPath: 'assets/icons/industry.svg',
          level: 'Bağımsız',
          duration: 'Sürekli',
          calorie: 'Değişmeyen',
          boxIsSelected: true,
        )
    );

    popularDiets.add(
        PopularDietsModel(
          name: 'Değişken Maliyet',
          iconPath: 'assets/icons/wallet.svg',
          level: 'Üretim',
          duration: 'Şart',
          calorie: 'Bağlı',
          boxIsSelected: false,
        )
    );

    popularDiets.add(
        PopularDietsModel(
          name: 'Kapasite',
          iconPath: 'assets/icons/graf.svg',
          level: 'Maksimum',
          duration: 'Üretim',
          calorie: 'Potansiyel',
          boxIsSelected: true,
        )
    );

    return popularDiets;
  }
}
