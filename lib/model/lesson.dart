class Lesson {
  final String ad;
  final double harfDegeri;
  final double krediDegeri;

  Lesson({required this.ad, required this.harfDegeri, required this.krediDegeri});

  @override
  String toString() {
  
    return "$ad $harfDegeri $krediDegeri";
  }
}
