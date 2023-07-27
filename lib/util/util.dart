import 'dart:math';

import 'package:onemilegreen_front/util/images.dart';

enum EffectType { Tree, Plastic, PaperCup }

extension EffectTypeName on EffectType {
  String get name {
    switch (this) {
      case EffectType.Tree:
        return "나무";
      case EffectType.Plastic:
        return "플라스틱";
      case EffectType.PaperCup:
        return "종이컵";
      default:
        return "Unknown";
    }
  }
}

extension EffectTypeIconName on EffectType {
  String get iconName {
    switch (this) {
      case EffectType.Tree:
        return Images.mainMTree;
      case EffectType.Plastic:
        return Images.mainMCup;
      case EffectType.PaperCup:
        return Images.mainMCup;
      default:
        return "Unknown";
    }
  }
}

class CalculatedEffect {
  final EffectType effectType;
  final double calEffect;
  final String unit;
  final String iconName;

  CalculatedEffect({
    required this.effectType,
    required this.calEffect,
    required this.unit,
    required this.iconName,
  });
}

// TODO: remove or fix
List<CalculatedEffect> effectCalculator(int effect) {
  double tree = double.parse(
      (effect / 21.0).toStringAsFixed(1)); // 1그루 나무는 약 21kg CO2를 흡수
  double paperCup = double.parse(
      (effect / 0.110).toStringAsFixed(1)); // 1개의 종이컵은 대략 0.110g CO2
  double plastic = double.parse(
      (effect / 6.0).toStringAsFixed(1)); // 1kg의 플라스틱은 약 6kg CO2를 생산

  List<CalculatedEffect> calculatedEffects = [
    CalculatedEffect(
      effectType: EffectType.Tree,
      calEffect: tree,
      unit: "그루",
      iconName: EffectType.Tree.iconName,
    ),
    CalculatedEffect(
      effectType: EffectType.Plastic,
      calEffect: plastic,
      unit: "kg",
      iconName: EffectType.Plastic.iconName,
    ),
    CalculatedEffect(
      effectType: EffectType.PaperCup,
      calEffect: paperCup,
      unit: "개",
      iconName: EffectType.PaperCup.iconName,
    ),
  ];

  return calculatedEffects;
}

CalculatedEffect pickRandomResult(int effect) {
  List<CalculatedEffect> calculatedEffects = effectCalculator(effect);
  int randomIndex = Random().nextInt(calculatedEffects.length);
  return calculatedEffects[randomIndex];
}
