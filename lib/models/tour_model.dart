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
  double rating;
  bool isFavorite;
  String time;

  Tour({
    required this.name,
    required this.imageUrl,
    required this.group,
    required this.groupSize,
    required this.groupSizeMax,
    required this.distance,
    required this.startingPoint,
    required this.endingPoint,
    required this.rating,
    required this.isFavorite,
    required this.time,
  });
}

List<Tour> tours = [
  Tour(
    name: 'Sea Of Peace',
    imageUrl: destinations[0].imageUrl,
    group: 'Partic Team',
    groupSize: 87,
    groupSizeMax: 200,
    distance: 83,
    startingPoint: 'Alabama',
    endingPoint: destinations[0].country,
    isFavorite: false,
    rating: destinations[0].rating,
    time: '01d : 32h : 45m',
  ),
  Tour(
    name: 'The Great Wall',
    imageUrl: destinations[1].imageUrl,
    group: 'Partic Team',
    groupSize: 54,
    groupSizeMax: 200,
    distance: 83,
    startingPoint: 'Jamaica',
    endingPoint: destinations[1].country,
    isFavorite: false,
    rating: destinations[1].rating,
    time: '0d : 12h : 45m',
  ),
  Tour(
    name: 'The Good Life',
    imageUrl: destinations[2].imageUrl,
    group: 'Partic Team',
    groupSize: 120,
    groupSizeMax: 200,
    distance: 83,
    startingPoint: 'Hawaii',
    endingPoint: destinations[2].country,
    isFavorite: true,
    rating: destinations[2].rating,
    time: '02d : 24h : 12m',
  ),
  Tour(
    name: 'The Good Life',
    group: 'Partic Team',
    imageUrl: destinations[3].imageUrl,
    groupSize: 200,
    groupSizeMax: 200,
    distance: 83,
    startingPoint: 'Hawaii',
    isFavorite: true,
    endingPoint: destinations[3].country,
    rating: destinations[3].rating,
    time: '05d : 18h : 32m',
  ),
];
