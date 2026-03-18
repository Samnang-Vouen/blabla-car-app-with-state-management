import 'package:blabla/ui/screens/rides_selection/view_model/ride_selection_model.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/ride_preference_modal.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/rides_selection_header.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/rides_selection_tile.dart';
import 'package:flutter/material.dart';
import '../../../../model/ride/ride.dart';
import '../../../../utils/animations_util.dart';
import '../../../theme/theme.dart';

class RidesSelectionContent extends StatelessWidget {
  final RidesSelectionModel model;

  const RidesSelectionContent({super.key, required this.model});

  void onBackTap(BuildContext context) {
    Navigator.pop(context);
  }

  void onFilterPressed() {
    // TODO
  }

  void onRideSelected(Ride ride) {
    // Later
  }

  void onPreferencePressed(BuildContext context) async {
    // 1 - Navigate to the ride preference picker
    final newPreference = await Navigator.of(context).push(
      AnimationUtils.createRightToLeftRoute(
        RidePreferenceModal(initialPreference: model.currentPreference),
      ),
    );

    // 2 - Ask the model to update the current preference
    if (newPreference != null) {
      await model.selectPreference(newPreference);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          children: [
            RideSelectionHeader(
              ridePreference: model.currentPreference!,
              onBackPressed: () => onBackTap(context),
              onFilterPressed: onFilterPressed,
              onPreferencePressed: () => onPreferencePressed(context),
            ),

            SizedBox(height: 100),

            Expanded(
              child: ListView.builder(
                itemCount: model.matchingRides.length,
                itemBuilder: (ctx, index) => RideSelectionTile(
                  ride: model.matchingRides[index],
                  onPressed: () => onRideSelected(model.matchingRides[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}