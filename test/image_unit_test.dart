import 'package:flutter_test/flutter_test.dart';
import 'package:ilia_challenge/bloc/image_stream.dart';

void main() {
  ///backdrop
  test("getMovieUrlCover()", () async {
    String? coverUrl =
        await streamImage.getMovieUrlCover("bCXLsO2MJWzYYBJoavGOZN5iqGn.jpg");
    print(coverUrl);
    expect(coverUrl!.isEmpty, false);
  });

  ///poster
  test("getMovieUrlPoster()", () async {
    String? posterUrl =
        await streamImage.getMovieUrlPoster("ujWOI68vGkfLOgEDmcrjIS6il7B.jpg");
    print(posterUrl);
    expect(posterUrl!.isEmpty, false);
  });
}
