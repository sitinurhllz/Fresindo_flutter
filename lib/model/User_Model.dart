class UserModel {
  String? nama_lengkap;
  String? nik;
  int? no_hp;
  String? password;
  String? jabatan;

  UserModel(
      {this.nama_lengkap,
      required this.nik,
      this.no_hp,
      this.jabatan,
      required this.password});
}
