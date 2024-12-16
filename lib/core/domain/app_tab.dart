class AppTab{
  final String title;
  final String image;
  final int? badgeCount; // New field for the badge count
  AppTab({
    required this.title,
    required this.image,
    this.badgeCount,
  });
}