part of 'api_client.dart';

const config = {
  'baseUrl': String.fromEnvironment('API_URL'),
  'imageUrl': String.fromEnvironment('IMAGES_URL'),
  'videoUrl': String.fromEnvironment('VIDEOS_URL')
};

const environment = config;

class ApiResponseKeys {
  static const String message = 'message';
}
