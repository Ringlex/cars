String validateText(String value) {
  if (!value.isNotEmpty) {
    return 'Please enter some text';
  }
  print(value);
  return null;
}

String validateRegistration(String value) {
  if (value.isEmpty) {
    return 'Please enter a description.';
  }
  if (value.length < 10) {
    return 'Should max 10 characters long.';
  }
  return null;
}

String validateYear(String value) {
  if (value.isEmpty) {
    return 'Please enter a year of production.';
  }
  if (double.tryParse(value) == null) {
    return 'Please enter a valid number.';
  }
  if (double.parse(value) <= 0) {
    return 'Please enter a char greater than zero .';
  }
  if (double.parse(value) > 4) {
    return 'Please enter a char in range 0-4';
  }
  return null;
}


