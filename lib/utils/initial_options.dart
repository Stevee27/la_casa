import 'package:la_casa/models/MenuType.dart';
import 'package:la_casa/models/Option.dart';

List<Option> initialOptionsList = [
  Option(name: 'Lettuce', menuType: MenuType.SANDWICH, sortOrder: 1),
  Option(name: 'Tomato', menuType: MenuType.SANDWICH, sortOrder: 2),
  Option(name: 'Oil', menuType: MenuType.SANDWICH, sortOrder: 3),
  Option(name: 'Vinegar', menuType: MenuType.SANDWICH, sortOrder: 4),
  Option(name: 'Arugula', menuType: MenuType.SANDWICH, sortOrder: 5),
  Option(name: 'Roasted Pepper', menuType: MenuType.SANDWICH, sortOrder: 6),
  Option(name: 'Extra Mozzarella', menuType: MenuType.SANDWICH, sortOrder: 10, price: '2.75'),
  Option(name: 'Fruitcup', menuType: MenuType.SANDWICH, sortOrder: 11, price: '4.95'),
  Option(name: 'Avocado', menuType: MenuType.SANDWICH, sortOrder: 12, price: '2.25'),
  Option(name: 'Heated', menuType: MenuType.SANDWICH, sortOrder: 22),
];
