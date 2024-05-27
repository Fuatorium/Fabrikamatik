import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool viewIsSelected;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxColor,
    required this.viewIsSelected
  });

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];

    diets.add(
        DietModel(
            name: 'TESLA',
            iconPath: 'assets/icons/tesla-svgrepo-com.svg',
            level: 'Akıllı',
            duration: 'Otomotiv',
            calorie: 'Musk',
            viewIsSelected: true,
            boxColor: Color(0xff9DCEFF)
        )
    );

    diets.add(
        DietModel(
            name: 'Red Bull',
            iconPath: 'assets/icons/redbull-logo-svgrepo-com.svg',
            level: 'Akıllı',
            duration: 'Hizmet',
            calorie: 'Mateschitz',
            viewIsSelected: false,
            boxColor: Color(0xffEEA4CE)
        )
    );

    diets.add(
        DietModel(
            name: 'SHELL',
            iconPath: 'assets/icons/shell-logo-svgrepo-com.svg',
            level: 'Enerji',
            duration: 'Hizmet',
            calorie: 'Sawan',
            viewIsSelected: true,
            boxColor: Color(0xff9DCEFF)
        )
    );

    diets.add(
        DietModel(
            name: 'Nike',
            iconPath: 'assets/icons/nike.svg',
            level: 'Akıllı',
            duration: 'Giyim',
            calorie: 'Donahoe',
            viewIsSelected: true,
            boxColor: Color(0xffEEA4CE)
        )
    );

    diets.add(
        DietModel(
            name: 'Nvidia',
            iconPath: 'assets/icons/niv.svg',
            level: 'Akıllı',
            duration: 'Elektronik',
            calorie: 'Huang',
            viewIsSelected: true,
            boxColor: Color(0xff9DCEFF)
        )
    );

    return diets;
  }
}
