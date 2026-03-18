import 'package:blabla/model/ride_pref/ride_pref.dart';

abstract class RidePrefRepository {
  Future<List<RidePreference>> getRidePreferences();
  Future<void> addRidePreference(RidePreference preference);
  Future<void> removeRidePreference(RidePreference preference);
}