extension formattedString on List<String>{

  String  get toFormattedString {
    String formattedText;
      this.forEach((val) {
        formattedText = formattedText == null ? val + ';' : formattedText + val + ";";
      });
    return formattedText;
  }
}

