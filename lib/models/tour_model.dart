import 'package:travelling_app/models/destination_model.dart';

class Tour {
  String name;
  String imageUrl;
  String group;
  int groupSize;
  int groupSizeMax;
  int distance;
  String startingPoint;
  String endingPoint;

  Tour({
    required this.name,
    required this.imageUrl,
    required this.group,
    required this.groupSize,
    required this.groupSizeMax,
    required this.distance,
    required this.startingPoint,
    required this.endingPoint,
  });
}

List<Tour> tours = [
  Tour(
    name: 'Sea Of Peace',
    imageUrl: destinations[0].imageUrl,
    group: 'Partic Team',
    groupSize: 63,
    groupSizeMax: 100,
    distance: 83,
    startingPoint: 'Alabama',
    endingPoint: destinations[0].country,
  ),
  Tour(
    name: 'The Great Wall',
    imageUrl: destinations[1].imageUrl,
    group: 'Partic Team',
    groupSize: 54,
    groupSizeMax: 150,
    distance: 83,
    startingPoint: 'Jamaica',
    endingPoint: destinations[1].country,
  ),
  Tour(
    name: 'The Good Life',
    imageUrl: destinations[2].imageUrl,
    group: 'Partic Team',
    groupSize: 87,
    groupSizeMax: 120,
    distance: 83,
    startingPoint: 'Hawaii',
    endingPoint: destinations[2].country,
  ),
];
