import '../domain/company.dart';
import '../domain/place.dart';

class ScannedCode {
  ScannedCode(this._value);

  final String _value;

  final String _separator = ',';

  Place toPlace() {
    var items = _value.split(_separator);
    return Place(
      id: items[0],
      name: items[1],
      company: Company(id: items[2], name: items[3]),
    );
  }
}
