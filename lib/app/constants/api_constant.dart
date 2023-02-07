// API Routes here

const String logoutEndPoint = '/api/moderator/v1/auth/logout';
const String userInfoEndPoint = '/api/moderator/v1/profile';

const String updateProfileEndPoint = '/api/moderator/v1/profile';
const String updateProfilePhotoEndPoint = '/api/citizen/v1/profile/photo';
const String getFilterOptionsEndPoint = '/api/moderator/v1/reports/filter-options';

const String loginEndPoint = '/api/moderator/v1/auth/login';
const String forgotPasswordEndPoint = '/api/moderator/v1/auth/forgot-password';

const String changePasswordEndPoint = '/api/moderator/v1/auth/change-password';
const String homePageDataEndPoint = '/api/moderator/v1/page/home';
const String listReportEndPoint = '/api/moderator/v1/reports';
const String mapQueryEndPoint = '/api/moderator/v1/reports/map';
const String reportDetailEndPoint = '/api/moderator/v1/reports/{id}';

const String listCommentsEndPoint = '/api/moderator/v1/reports/{id}/comments';
const String deleteCommentEndPoint = '/api/moderator/v1/comments/{id}';
const String deleteReportEndPoint = '/api/moderator/v1/reports/{id}';
const String createCommentEndPoint = '/api/moderator/v1/comments';

const String changeStatusEndPoint = '/api/moderator/v1/reports/{id}/moderate';
const String saveTokenEndPoint = '/api/moderator/v1/notification/save-token';

const String aboutPageEndPoint = '/api/moderator/v1/page/about';
const String termsPageEndPoint = '/api/moderator/v1/page/terms';
const String policyPageEndPoint = '/api/moderator/v1/page/policy';

const String listAssignmentOptionEndPoint = '/api/moderator/v1/assignment/options';
const String assignUserEndPoint = '/api/moderator/v1/assignment';
const String listAssignedReportEndPoint = '/api/moderator/v1/assignment/reports';
const String listModerationHistoryEndPoint = '/api/moderator/v1/moderation/history';
const String listNotificationPresetOptionsEndPoint = '/api/moderator/v1/notification/preset-options';