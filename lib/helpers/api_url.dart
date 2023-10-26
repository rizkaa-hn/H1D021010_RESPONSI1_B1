class ApiUrl{
  static const String baseUrl = 'https://responsi1b.dalhaqq.xyz/manajemen_tugas';
  static const String registrasi = baseUrl + '/registrasi';
  static const String login = baseUrl + '/login';
  static const String listTugas = baseUrl + '/tugas';
  static const String createTugas = baseUrl + '/tugas';
  static String updateTugas(int id){
    return baseUrl + '/tugas/' + id.toString() + '/update';
  }
  static String showTugas(int id){
    return baseUrl + '/tugas/' + id.toString();
  }
  static String deleteTugas(int id) {
    return baseUrl + '/tugas/' + id.toString();
  }
}