String formatNumber(int number) {
  if (number >= 1000000) {
    // Convert the number to millions and append "milj"
    double millions = number / 1000000;
    return '${millions.toStringAsFixed(2)} milj.';
  } else {
    // Format the number with spaces between each thousand
    String formattedNumber = number.toString();
    final RegExp regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    formattedNumber = formattedNumber.replaceAllMapped(regex, (Match match) => '${match[1]} ');
    return formattedNumber;
  }
}
