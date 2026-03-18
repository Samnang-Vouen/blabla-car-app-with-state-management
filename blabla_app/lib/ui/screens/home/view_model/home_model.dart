import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:flutter/material.dart';

class HomeModel extends ChangeNotifier {
  final RidePreferenceState _ridePreferenceState;

  HomeModel({required RidePreferenceState ridePreferenceState})
    : _ridePreferenceState = ridePreferenceState {
    _ridePreferenceState.addListener(notifyListeners);
  }

  RidePreference? get currentPreference => _ridePreferenceState.currentPreference;
  List<RidePreference> get history => _ridePreferenceState.history;

  Future<void> selectPreference(RidePreference preference) async {
    await _ridePreferenceState.selectPreference(preference);
  }


  @override
  void dispose() {
    _ridePreferenceState.removeListener(notifyListeners);
    super.dispose();
  }
}
