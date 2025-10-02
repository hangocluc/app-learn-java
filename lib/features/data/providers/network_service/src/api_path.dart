// baseUrl comes from Env; keep only endpoint paths here.

class LessonApiPath {
  static const getAllLessons = '/api/get-all-in-lesson';
  static const updateProcess = '/api/update-process';
}

class ChatApiPath {
  static const getCommentsByQuestion = '/api/get-comment-by-question';
  static const updateComment = '/api/update-comment';
}

class ProfileApiPath {
  static const getProfileScore = '/api/get-score-profile';
  static const getProfileRank = '/api/get-profile-rank';
}

class AppApiPath {
  static const demo = '/api/demo';
  static const login = '/api/login';
  static const insertUser = '/api/insert-user';
  static const getUser = '/api/get-user';
}

// Keep backward-compat names used elsewhere
class DemoApiPath {
  static const demo = '/api/demo';
  static const login = '/api/login';
  static const insertUser = '/api/insert-user';
  static const getUser = '/api/get-user';
}

class ProgramApiPath {
  static const program = '/api/program';
  static const programDetail = '/api/program-detail';
}

// Unified path class to match service annotations
class ApiPath {
  static const demo = '/api/demo';
  static const login = '/api/login';
  static const insertUser = '/api/insert-user';
  static const getUser = '/api/get-user';
}
