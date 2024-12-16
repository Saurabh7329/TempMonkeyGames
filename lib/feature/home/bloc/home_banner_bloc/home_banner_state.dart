abstract class HomeBannerState {
  const HomeBannerState();
}

class HomeBannerInitial extends HomeBannerState {
  const HomeBannerInitial();
}

class HomeBannerLoading extends HomeBannerState {
  const HomeBannerLoading();
}

class HomeBannerLoaded extends HomeBannerState {
  final String image;
  final String link;

  const HomeBannerLoaded(this.image, this.link);
}

class HomeBannerError extends HomeBannerState {
  final String message;

  const HomeBannerError(this.message);
}