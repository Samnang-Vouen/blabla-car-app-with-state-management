import 'package:blabla/data/dummy_data.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';

class RidePrefRepositoryMock implements RidePrefRepository {
  @override
  Future<List<RidePreference>> getRidePreferences() async {
    // TODO: implement getRidePreferences
    return fakeRidePrefs;
  }

  @override
  Future<void> addRidePreference(RidePreference preference) async {
    // TODO: implement addRidePreference
    return fakeRidePrefs.add(preference);
  }

  @override
  Future<void> removeRidePreference(RidePreference preference) async{
    // TODO: implement removeRidePreference
    fakeRidePrefs.remove(preference);
  }
}
