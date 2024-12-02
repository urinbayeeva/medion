// import 'package:medion/domain/models/location_model.dart';
// import 'package:yandex_mapkit/yandex_mapkit.dart';

// BoundingBox calculateBounds(List<Location> locations) {
//   double minLat = double.infinity, maxLat = -double.infinity;
//   double minLng = double.infinity, maxLng = -double.infinity;

//   for (var location in locations) {
//     minLat = location.latitude < minLat ? location.latitude : minLat;
//     maxLat = location.latitude > maxLat ? location.latitude : maxLat;
//     minLng = location.longitude < minLng ? location.longitude : minLng;
//     maxLng = location.longitude > maxLng ? location.longitude : maxLng;
//   }

//   return BoundingBox(
//     southWest: Point(latitude: minLat, longitude: minLng),
//     northEast: Point(latitude: maxLat, longitude: maxLng),
//   );
// }
