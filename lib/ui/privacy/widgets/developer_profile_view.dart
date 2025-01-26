part of '../view/privacy_view.dart';

class DeveloperProfileView extends StatelessWidget {
  const DeveloperProfileView({super.key, required this.privacyData});

  final PrivacyModel privacyData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingXXLarge),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // Profile Image
            Image.network(
              privacyData.devIco,
              width: AppDimens.iconXXXLarge,
              fit: BoxFit.cover,
            ),
            HeightBox(h: AppDimens.paddingXXLarge),

            // Developer Name and Email
            Text(
              privacyData.devName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.greyDark,
              ),
            ),
            Text(
              privacyData.devTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.greyDark2,
                fontWeight: FontWeight.w600,
              ),
            ),
            HeightBox(h: AppDimens.paddingXXLarge),
            Text(
              privacyData.devComm,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            HeightBox(h: AppDimens.paddingXXLarge),

            // Social Media Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _SocialButton(
                  icon: privacyData.devGithubIco,
                  label: 'furkanmulayim',
                  onTap: () {
                    _launchURL(privacyData.devGithub);
                  },
                ),
                WidthBox(w: AppDimens.paddingXSmall),
                _SocialButton(
                  icon: privacyData.devLinkedinIcon,
                  label: 'furkanmulayim',
                  onTap: () {
                    _launchURL(privacyData.devLinkedin);
                  },
                ),
              ],
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

class _SocialButton extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;

  const _SocialButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: AppDimens.paddingSmall,
            horizontal: AppDimens.paddingMedium),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(AppDimens.borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.network(
              icon,
              width: AppDimens.iconLarge,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.greyDark2,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
