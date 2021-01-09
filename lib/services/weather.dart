import 'package:clima/services/networking.dart';
import '../services/location.dart';

const apiKey = "Your API key"; // Add your api key
const apiWeatherDataURL = "http://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getCityData(String city) async {
    NetworkHelper networkHelper =
        NetworkHelper("$apiWeatherDataURL?q=$city&appid=$apiKey&units=metric");
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getWeatherData() async {
    GettingLocation loc = GettingLocation();
    await loc.gettingCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        "$apiWeatherDataURL?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey&units=metric");
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time in ';
    } else if (temp > 20) {
      return 'Time for shorts and 👕 in ';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤 in ';
    } else {
      return 'Bring a 🧥 just in case in ';
    }
  }
}
