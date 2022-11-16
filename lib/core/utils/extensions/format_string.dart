extension PhoneString on String {
  String formatToPhone() {
    return split("-").join("");
  }
}
