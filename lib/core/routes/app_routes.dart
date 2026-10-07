abstract final class AppRoutes {
  // App Flow
  static const splash = '/splash';
  static const onboarding = '/onboarding';

  // Authentication
  static const login = '/login';
  static const register = '/register';
  static const forgotPassword = '/forgot-password';
  static const resetPassword = '/reset-password';
  static const verifyEmail = '/verify-email';

  // Main Navigation
  static const home = '/';
  static const courses = '/courses';
  static const meet = '/meet';
  static const learning = '/learning';
  static const profile = '/profile';

  // Courses
  static const courseDetails = '/courses/details';
  static const courseLessons = '/courses/lessons';
  static const courseLesson = '/courses/lesson';
  static const courseProgress = '/courses/progress';

  // Learning
  static const myLearning = '/learning/my-learning';
  static const continueLearning = '/learning/continue';
  static const completedCourses = '/learning/completed';
  static const certificates = '/learning/certificates';

  // Meet
  static const upcomingMeetings = '/meet/upcoming';
  static const liveMeeting = '/meet/live';
  static const meetingDetails = '/meet/details';

  // Profile
  static const profileDetails = '/profile/details';
  static const editProfile = '/profile/edit';
  static const settings = '/profile/settings';

  // Notifications
  static const notifications = '/notifications';
  static const notificationDetails = '/notifications/details';

  // Other
  static const search = '/search';
  static const help = '/help';
  static const about = '/about';
}