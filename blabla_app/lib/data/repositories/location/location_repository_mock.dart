import 'package:blabla/data/dummy_data.dart';
import 'package:blabla/data/repositories/location/location_repository.dart';
import 'package:blabla/model/ride/locations.dart';

class LocationRepositoryMock implements LocationRepository {
  @override
  Future<List<Location>> getLocations() async {
    // TODO: implement getLocations
    return fakeLocations;
  }

  @override
  Future<List<Location>> searchLocations(String query) async{
    // TODO: implement searchLocations
    return fakeLocations
        .where((location) => location.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
