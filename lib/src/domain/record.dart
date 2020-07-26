import 'package:qrtracing/src/domain/company.dart';
import 'package:qrtracing/src/domain/place.dart';
import 'package:qrtracing/src/domain/time.dart';

class Record {
  final String uid;
  Company company;
  Place place;
  Time checkIn;
  Time checkOut;

  Record({
    this.uid,
    this.company,
    this.place,
    this.checkIn,
    this.checkOut,
  });
}
