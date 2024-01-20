class DateConverter {
  String convertionDate(String movieReleasedDate) {
    DateTime originalDate = DateTime.parse(movieReleasedDate);
    String convertedDate =
        "${originalDate.day.toString().padLeft(2, '0')}/${originalDate.month.toString().padLeft(2, '0')}/${originalDate.year}";

    return convertedDate;
  }
}
