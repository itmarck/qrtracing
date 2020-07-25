import 'package:qrtracing/src/domain/company.dart';
import 'package:qrtracing/src/domain/place.dart';

class Record {
  final String uid;
  Company company;
  Place place;
  DateTime checkIn;
  DateTime checkOut;

  Record({
    this.uid,
    this.company,
    this.place,
    this.checkIn,
    this.checkOut,
  });
}
