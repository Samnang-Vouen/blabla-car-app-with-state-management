import 'package:blabla/data/dummy_data.dart';
import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';

class RideRepositoryMock implements RideRepository {
  @override
  Future<List<Ride>> getRides() async {
    // TODO: implement getRides
    return fakeRides;
  }

  @override
  Future<List<Ride>> getMatchRide(RidePreference ridePreference) async {
    // TODO: implement getMatchRide
    return fakeRides.where((ride) {
      final sameDay =
          ride.departureDate.day == ridePreference.departureDate.day &&
          ride.departureDate.month == ridePreference.departureDate.month &&
          ride.departureDate.year == ridePreference.departureDate.year;

      return ride.departureLocation == ridePreference.departure &&
          ride.arrivalLocation == ridePreference.arrival &&
          ride.availableSeats >= ridePreference.requestedSeats &&
          sameDay;
    }).toList();
  }
}
