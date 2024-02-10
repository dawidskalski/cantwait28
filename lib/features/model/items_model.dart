import 'package:intl/intl.dart';

class ItemsModel {
  final String id;
  final String title;
  final String imageURL;
  final DateTime releaseDate;

  ItemsModel({
    required this.id,
    required this.title,
    required this.imageURL,
    required this.releaseDate,
  });

  String daysLeft() {
    return releaseDate.difference(DateTime.now()).inDays.toString();
  }

  String releaseDateFormatted() {
    return DateFormat.MMMMEEEEd().format(releaseDate);
  }
}
