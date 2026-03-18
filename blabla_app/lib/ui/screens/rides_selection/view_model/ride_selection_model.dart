import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:flutter/material.dart';
import '../../../../data/repositories/ride/ride_repository.dart';
import '../../../../model/ride/ride.dart';
import '../../../../model/ride_pref/ride_pref.dart';

class RidesSelectionModel extends ChangeNotifier {
  final RideRepository _rideRepository;
  final RidePreferenceState _ridePreferenceState;

  List<Ride> _matchingRides = [];

  RidesSelectionModel({
    required RideRepository rideRepository,
    required RidePreferenceState ridePreferenceState,
  })  : _rideRepository = rideRepository,
        _ridePreferenceState = ridePreferenceState {
    _ridePreferenceState.addListener(notifyListeners);
    _fetchMatchingRides();
  }

  RidePreference? get currentPreference => _ridePreferenceState.currentPreference;
  List<Ride> get matchingRides => _matchingRides;

  Future<void> _fetchMatchingRides() async {
  _matchingRides = await _rideRepository.getMatchRide(
    _ridePreferenceState.currentPreference!,
  );
  notifyListeners();
}

  Future<void> selectPreference(RidePreference preference) async {
    await _ridePreferenceState.selectPreference(preference);
    await _fetchMatchingRides();
  }

  @override
  void dispose() {
    _ridePreferenceState.removeListener(notifyListeners);
    super.dispose();
  }
}