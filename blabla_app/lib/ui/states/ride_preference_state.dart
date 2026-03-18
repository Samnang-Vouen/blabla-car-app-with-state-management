import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:flutter/material.dart';

class RidePreferenceState extends ChangeNotifier {
  final RidePrefRepository ridePrefRepository;

  RidePreference? _currentPreference;
  List<RidePreference> _history = [];

  RidePreferenceState({required this.ridePrefRepository});

  RidePreference? get currentPreference => _currentPreference;
  List<RidePreference> get history => _history;

  Future<void> init() async {
    _history = await ridePrefRepository.getRidePreferences();
    notifyListeners();
  }

  Future<void> selectPreference(RidePreference preference) async {
    if (preference != _currentPreference) {
      _currentPreference = preference;
      await ridePrefRepository.addRidePreference(preference);
      _history = await ridePrefRepository.getRidePreferences();
      notifyListeners();
    }
  }
}
