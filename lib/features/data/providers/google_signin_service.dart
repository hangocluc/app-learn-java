import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'profile',
    ],
  );

  static GoogleSignIn get googleSignIn => _googleSignIn;

  // Đăng nhập với Google
  static Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      return account;
    } catch (error) {
      print('Lỗi đăng nhập Google: $error');
      return null;
    }
  }

  // Đăng xuất
  static Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
    } catch (error) {
      print('Lỗi đăng xuất: $error');
    }
  }

  // Kiểm tra trạng thái đăng nhập
  static Future<bool> isSignedIn() async {
    return await _googleSignIn.isSignedIn();
  }

  // Lấy thông tin người dùng hiện tại
  static Future<GoogleSignInAccount?> getCurrentUser() async {
    return await _googleSignIn.signInSilently();
  }

  // Lấy thông tin chi tiết người dùng
  static Future<Map<String, dynamic>?> getUserInfo() async {
    try {
      final GoogleSignInAccount? account = await getCurrentUser();
      if (account != null) {
        return {
          'id': account.id,
          'email': account.email,
          'displayName': account.displayName,
          'photoUrl': account.photoUrl,
        };
      }
      return null;
    } catch (error) {
      print('Lỗi lấy thông tin người dùng: $error');
      return null;
    }
  }
}
