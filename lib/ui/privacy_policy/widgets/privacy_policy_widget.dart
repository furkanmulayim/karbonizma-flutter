part of '../view/privacy_policy_view.dart';

class _PrivacyScreen extends StatelessWidget {
  const _PrivacyScreen({super.key, required this.privacyData});

  final PrivacyModel privacyData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Card(
              elevation: AppDimens.cardElevation,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  AppDimens.borderLargeRadius,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(privacyData.devName),
                    SizedBox(height: 8),
                    Text(privacyData.devTitle),
                    SizedBox(height: 8),
                    Text(privacyData.devComm),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
