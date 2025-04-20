import 'package:flutter/material.dart';
import 'package:infinialabs_ai/model/explore_item.dart';

class DashboardConstants {
  const DashboardConstants._();

  static const List<ExploreItem> exploreItems = [
    ExploreItem("Lifestyle & Nutrition", Icons.restaurant_menu, Colors.teal),
    ExploreItem("Emotional Health", Icons.psychology, Colors.indigo),
    ExploreItem("Fertility Tests & Treatment", Icons.biotech, Colors.lightBlue),
    ExploreItem("Trying to Conceive", Icons.pregnant_woman, Colors.brown),
    ExploreItem("Pregnancy", Icons.pregnant_woman, Colors.pink),
    ExploreItem("General Health", Icons.health_and_safety, Colors.purple),
    ExploreItem("Menopause", Icons.female, Colors.orange),
    ExploreItem("Pediatrics", Icons.family_restroom, Colors.blueAccent),
  ];
}
