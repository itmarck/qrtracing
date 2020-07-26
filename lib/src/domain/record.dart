import 'company.dart';
import 'place.dart';
import 'time.dart';

class Record {
  Place place;
  Time checkIn;
  Time checkOut;

  Record({
    this.place,
    this.checkIn,
    this.checkOut,
  });

  Record.fromJson(Map<String, dynamic> json)
      : place = Place(
          id: json['placeId'],
          name: json['place'],
          company: Company(id: json['companyId'], name: json['company']),
        ),
        checkIn = Time(DateTime.fromMillisecondsSinceEpoch(
            json['checkIn'].millisecondsSinceEpoch)),
        checkOut = json['checkOut'] != null
            ? Time(DateTime.fromMillisecondsSinceEpoch(
                json['checkOut']?.millisecondsSinceEpoch))
            : null;
}
