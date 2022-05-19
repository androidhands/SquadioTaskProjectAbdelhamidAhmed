class AppConstants{
  static String baseUrl ='https://api.themoviedb.org/3/person/popular?api_key=cd339a9f667acb20c5f6c6efd19c35f6&language=en-US&page=2';
  static String imageUrl = "https://image.tmdb.org/t/p/original";
  static String actorDetailUrl(String id) => 'https://api.themoviedb.org/3/person/$id?api_key=cd339a9f667acb20c5f6c6efd19c35f6&language=en-US';
  static String actorImagesUrl(String id) => 'https://api.themoviedb.org/3/person/$id/images?api_key=cd339a9f667acb20c5f6c6efd19c35f6';
//?api_key=cd339a9f667acb20c5f6c6efd19c35f6&language=en-US&page=2
static String language = "en_US";
}