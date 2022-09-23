

class NoInternetException {
  String message;
  String animationAsset='assets/96655-no-internet.json';

  NoInternetException(this.message);
}

class NoServiceFoundException {
  String message;
  String animationAsset='assets/82559-error.json';
  NoServiceFoundException(this.message);
}

class InvalidFormatException {
  String message;
  String animationAsset='assets/no_connection.json';
  InvalidFormatException(this.message);
}

class UnknownException {
  String message;
  String animationAsset='assets/38067-questioning.json';

  UnknownException(this.message);
}
