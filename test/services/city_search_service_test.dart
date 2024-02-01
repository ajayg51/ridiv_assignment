import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:ridiv_assignment/models/place_weather_response.dart';
import 'package:ridiv_assignment/services/city_search_service.dart';

void main() {
  late CitySearchService citySearchService;
  late final double lat, longtd;

  setUp(() {
    citySearchService = CitySearchService();
    lat = -33.8688;
    longtd = 151.2093;
  });

  group('City search service : ', () {
    group('Get location weather basis latitude and longitude : ', () {
      // arrange, as to what should happen

      when(
        () => citySearchService.getPlaceWeatherBasisLatAndLong(
          lat: lat,
          lon: longtd,
        ),
      ).thenAnswer(
        (invocation) async {
          return PlaceWeatherResponse.empty();
        },
      );

      // act, actual call
      final data = citySearchService.getPlaceWeatherBasisLatAndLong(
        lat: lat,
        lon: longtd,
      );

      // assert, result
      expect(data, isA<PlaceWeatherResponse>());
    });
  });

  // testWidgets('city search service ...', (tester) async {

  // });
}
