/*
 Navicat Premium Dump SQL

 Source Server         : mysqlcms
 Source Server Type    : MySQL
 Source Server Version : 50711 (5.7.11)
 Source Host           : localhost:3306
 Source Schema         : collegemanagementsystem;

 Target Server Type    : MySQL
 Target Server Version : 50711 (5.7.11)
 File Encoding         : 65001

 Date: 10/04/2025 21:17:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for access_control_logs
-- ----------------------------
DROP TABLE IF EXISTS `access_control_logs`;
CREATE TABLE `access_control_logs`  (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `access_point` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `access_time` datetime NULL DEFAULT NULL,
  `access_granted` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `fk_accesslog_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_accesslog_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of access_control_logs
-- ----------------------------
INSERT INTO `access_control_logs` VALUES (1, 101, 'Faculty Portal Login', '2024-07-16 08:55:00', 1);
INSERT INTO `access_control_logs` VALUES (2, 11001, 'Student App Login', '2024-07-16 09:02:10', 1);
INSERT INTO `access_control_logs` VALUES (3, 101, 'Lab EL-1 Door', '2024-07-16 09:30:05', 1);
INSERT INTO `access_control_logs` VALUES (4, 99999, 'Server Room Door', '2024-07-16 10:15:20', 0);

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts`  (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_code` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `account_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `account_type` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `parent_account_id` int(11) NULL DEFAULT NULL,
  `balance` decimal(15, 2) NULL DEFAULT 0.00,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `created_date` date NULL DEFAULT NULL,
  `is_active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`account_id`) USING BTREE,
  UNIQUE INDEX `account_code`(`account_code`) USING BTREE,
  INDEX `fk_account_parent`(`parent_account_id`) USING BTREE,
  CONSTRAINT `fk_account_parent` FOREIGN KEY (`parent_account_id`) REFERENCES `accounts` (`account_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5501 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES (1000, '1000', 'Assets', 'Asset', NULL, 0.00, 'Main Asset Account', '2005-08-01', 1);
INSERT INTO `accounts` VALUES (1100, '1100', 'Current Assets', 'Asset', 1000, 0.00, 'Assets convertible to cash within a year', '2005-08-01', 1);
INSERT INTO `accounts` VALUES (1110, '1110', 'Cash and Bank', 'Asset', 1100, 1560000.00, 'Cash and balances with banks', '2005-08-01', 1);
INSERT INTO `accounts` VALUES (1120, '1120', 'Accounts Receivable - Fees', 'Asset', 1100, 104000.00, 'Fees due from students', '2005-08-01', 1);
INSERT INTO `accounts` VALUES (1130, '1130', 'Petty Cash', 'Asset', 1100, 10000.00, 'Cash for small expenses', '2007-01-01', 1);
INSERT INTO `accounts` VALUES (1200, '1200', 'Fixed Assets', 'Asset', 1000, 0.00, 'Long-term assets like building, equipment', '2005-08-01', 1);
INSERT INTO `accounts` VALUES (1210, '1210', 'Land and Building', 'Asset', 1200, 50000000.00, 'College land and buildings', '2005-08-01', 1);
INSERT INTO `accounts` VALUES (1220, '1220', 'Lab Equipment', 'Asset', 1200, 10365000.00, 'Equipment in various labs', '2006-01-01', 1);
INSERT INTO `accounts` VALUES (1230, '1230', 'Furniture and Fixtures', 'Asset', 1200, 2000000.00, 'Classroom and office furniture', '2005-09-01', 1);
INSERT INTO `accounts` VALUES (1240, '1240', 'Vehicles', 'Asset', 1200, 2000000.00, 'College buses', '2008-05-01', 1);
INSERT INTO `accounts` VALUES (2000, '2000', 'Liabilities', 'Liability', NULL, 0.00, 'Main Liability Account', '2005-08-01', 1);
INSERT INTO `accounts` VALUES (2100, '2100', 'Current Liabilities', 'Liability', 2000, 0.00, 'Obligations due within a year', '2005-08-01', 1);
INSERT INTO `accounts` VALUES (2110, '2110', 'Accounts Payable - Suppliers', 'Liability', 2100, 50000.00, 'Amount owed to suppliers', '2005-08-01', 1);
INSERT INTO `accounts` VALUES (2120, '2120', 'Salaries Payable', 'Liability', 2100, 0.00, 'Salaries due to staff/faculty', '2005-09-01', 1);
INSERT INTO `accounts` VALUES (2200, '2200', 'Long-Term Liabilities', 'Liability', 2000, 0.00, 'Obligations due after a year', '2005-08-01', 1);
INSERT INTO `accounts` VALUES (2210, '2210', 'Bank Loans', 'Liability', 2200, 20000000.00, 'Loans taken for construction/operations', '2006-06-01', 1);
INSERT INTO `accounts` VALUES (3000, '3000', 'Equity', 'Equity', NULL, 0.00, 'Net Worth Account', '2005-08-01', 1);
INSERT INTO `accounts` VALUES (3100, '3100', 'College Corpus Fund', 'Equity', 3000, 45990000.00, 'Initial capital and retained earnings', '2005-08-01', 1);
INSERT INTO `accounts` VALUES (4000, '4000', 'Revenue', 'Revenue', NULL, 0.00, 'Main Revenue Account', '2005-08-01', 1);
INSERT INTO `accounts` VALUES (4100, '4100', 'Tuition Fee Revenue', 'Revenue', 4000, 1029000.00, 'Income from tuition fees', '2005-08-01', 1);
INSERT INTO `accounts` VALUES (4150, '4150', 'Hostel Fee Revenue', 'Revenue', 4000, 140000.00, 'Income from hostel fees', '2006-09-01', 1);
INSERT INTO `accounts` VALUES (4160, '4160', 'Transport Fee Revenue', 'Revenue', 4000, 25000.00, 'Income from transport fees', '2008-05-01', 1);
INSERT INTO `accounts` VALUES (4400, '4400', 'Other Income', 'Revenue', 4000, 20000.00, 'Miscellaneous income', '2005-08-01', 1);
INSERT INTO `accounts` VALUES (5000, '5000', 'Expenses', 'Expense', NULL, 0.00, 'Main Expense Account', '2005-08-01', 1);
INSERT INTO `accounts` VALUES (5100, '5100', 'Salaries and Wages', 'Expense', 5000, 500000.00, 'Staff and Faculty salaries', '2005-09-01', 1);
INSERT INTO `accounts` VALUES (5200, '5200', 'Utilities', 'Expense', 5000, 40000.00, 'Electricity, Water etc.', '2005-09-01', 1);
INSERT INTO `accounts` VALUES (5300, '5300', 'Maintenance', 'Expense', 5000, 35000.00, 'Building and equipment maintenance', '2005-09-01', 1);
INSERT INTO `accounts` VALUES (5400, '5400', 'Library Expenses', 'Expense', 5000, 15000.00, 'New book purchases, subscriptions', '2005-09-01', 1);
INSERT INTO `accounts` VALUES (5500, '5500', 'Administrative Expenses', 'Expense', 5000, 25000.00, 'Office supplies, travel, etc.', '2005-09-01', 1);

-- ----------------------------
-- Table structure for accreditation_bodies
-- ----------------------------
DROP TABLE IF EXISTS `accreditation_bodies`;
CREATE TABLE `accreditation_bodies`  (
  `body_id` int(11) NOT NULL AUTO_INCREMENT,
  `body_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `contact_person` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`body_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of accreditation_bodies
-- ----------------------------
INSERT INTO `accreditation_bodies` VALUES (1, 'National Board of Accreditation (NBA)', 'Member Secretary', 'ms@nba.gov.in', '01124360620');
INSERT INTO `accreditation_bodies` VALUES (2, 'National Assessment and Accreditation Council (NAAC)', 'Director', 'director.naac@gov.in', '08023005111');

-- ----------------------------
-- Table structure for accreditation_standards
-- ----------------------------
DROP TABLE IF EXISTS `accreditation_standards`;
CREATE TABLE `accreditation_standards`  (
  `standard_id` int(11) NOT NULL AUTO_INCREMENT,
  `body_id` int(11) NULL DEFAULT NULL,
  `standard_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `category` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`standard_id`) USING BTREE,
  INDEX `fk_accstd_body`(`body_id`) USING BTREE,
  CONSTRAINT `fk_accstd_body` FOREIGN KEY (`body_id`) REFERENCES `accreditation_bodies` (`body_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of accreditation_standards
-- ----------------------------
INSERT INTO `accreditation_standards` VALUES (1, 1, 'NBA-SAR-UG-TierI-Crit1', 'Vision, Mission and Program Educational Objectives (PEOs)', 'Institutional');
INSERT INTO `accreditation_standards` VALUES (2, 1, 'NBA-SAR-UG-TierI-Crit2', 'Program Curriculum and Teaching-Learning Processes', 'Program Level');
INSERT INTO `accreditation_standards` VALUES (3, 1, 'NBA-SAR-UG-TierI-Crit3', 'Course Outcomes and Program Outcomes (COs & POs)', 'Program Level');
INSERT INTO `accreditation_standards` VALUES (4, 2, 'NAAC-SSR-Crit1', 'Curricular Aspects', 'Institutional');
INSERT INTO `accreditation_standards` VALUES (5, 2, 'NAAC-SSR-Crit2', 'Teaching-Learning and Evaluation', 'Institutional');
INSERT INTO `accreditation_standards` VALUES (6, 2, 'NAAC-SSR-Crit3', 'Research, Innovations and Extension', 'Institutional');

-- ----------------------------
-- Table structure for administrative_duties
-- ----------------------------
DROP TABLE IF EXISTS `administrative_duties`;
CREATE TABLE `administrative_duties`  (
  `duty_id` int(11) NOT NULL AUTO_INCREMENT,
  `faculty_id` int(11) NULL DEFAULT NULL,
  `role` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `time_commitment` decimal(5, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`duty_id`) USING BTREE,
  INDEX `fk_adminduty_faculty`(`faculty_id`) USING BTREE,
  CONSTRAINT `fk_adminduty_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of administrative_duties
-- ----------------------------
INSERT INTO `administrative_duties` VALUES (1, 24, 'Department Curriculum Committee Lead', '2023-08-01', '2024-07-31', 4.00);
INSERT INTO `administrative_duties` VALUES (2, 25, 'Lab Development Coordinator', '2023-09-01', NULL, 3.00);
INSERT INTO `administrative_duties` VALUES (3, 101, 'Faculty Advisor - Year 1 CSE', '2023-08-15', '2024-05-31', 2.00);
INSERT INTO `administrative_duties` VALUES (4, 102, 'Anti-Ragging Committee Member', '2023-07-01', '2025-06-30', 1.00);
INSERT INTO `administrative_duties` VALUES (5, 22, 'Chief Warden - Boys Hostel', '2022-06-01', NULL, 8.00);

-- ----------------------------
-- Table structure for admission_appeals
-- ----------------------------
DROP TABLE IF EXISTS `admission_appeals`;
CREATE TABLE `admission_appeals`  (
  `appeal_id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NULL DEFAULT NULL,
  `appeal_date` date NULL DEFAULT NULL,
  `reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `status` enum('Pending','Reviewed','Approved','Denied') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `reviewed_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`appeal_id`) USING BTREE,
  INDEX `fk_appeal_app`(`application_id`) USING BTREE,
  INDEX `fk_appeal_user`(`reviewed_by`) USING BTREE,
  CONSTRAINT `fk_appeal_app` FOREIGN KEY (`application_id`) REFERENCES `applications` (`application_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_appeal_user` FOREIGN KEY (`reviewed_by`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admission_appeals
-- ----------------------------
INSERT INTO `admission_appeals` VALUES (1, 3, '2024-06-28', 'Request re-evaluation of Entrance Test score based on potential calculation error. 12th marks were high.', 'Reviewed', 1);
INSERT INTO `admission_appeals` VALUES (2, 4, '2024-07-01', 'Strong interest in IT, excellent extracurriculars. Appealing for reconsideration from waitlist.', 'Pending', NULL);

-- ----------------------------
-- Table structure for admission_interviews
-- ----------------------------
DROP TABLE IF EXISTS `admission_interviews`;
CREATE TABLE `admission_interviews`  (
  `interview_id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NULL DEFAULT NULL,
  `interviewer_id` int(11) NULL DEFAULT NULL,
  `interview_date` date NULL DEFAULT NULL,
  `interview_time` time NULL DEFAULT NULL,
  `feedback` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `score` int(11) NULL DEFAULT NULL,
  `platform` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`interview_id`) USING BTREE,
  INDEX `fk_interview_app`(`application_id`) USING BTREE,
  INDEX `fk_interview_interviewer`(`interviewer_id`) USING BTREE,
  CONSTRAINT `fk_interview_app` FOREIGN KEY (`application_id`) REFERENCES `applications` (`application_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_interview_interviewer` FOREIGN KEY (`interviewer_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admission_interviews
-- ----------------------------
INSERT INTO `admission_interviews` VALUES (1, 5, 30, '2024-05-05', '10:00:00', 'Confident candidate, good domain knowledge in marketing. Strong communication skills.', 85, 'Google Meet');
INSERT INTO `admission_interviews` VALUES (2, 1, 24, '2024-06-28', '11:00:00', 'Good fundamentals, clear thought process. Needs more exposure to advanced topics.', 75, 'Zoom');

-- ----------------------------
-- Table structure for admission_waitlists
-- ----------------------------
DROP TABLE IF EXISTS `admission_waitlists`;
CREATE TABLE `admission_waitlists`  (
  `waitlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NULL DEFAULT NULL,
  `waitlist_rank` int(11) NULL DEFAULT NULL,
  `notification_date` date NULL DEFAULT NULL,
  `status` enum('Waiting','Offered','Declined') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`waitlist_id`) USING BTREE,
  INDEX `fk_waitlist_app`(`application_id`) USING BTREE,
  CONSTRAINT `fk_waitlist_app` FOREIGN KEY (`application_id`) REFERENCES `applications` (`application_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admission_waitlists
-- ----------------------------
INSERT INTO `admission_waitlists` VALUES (1, 4, 12, NULL, 'Waiting');

-- ----------------------------
-- Table structure for alumni
-- ----------------------------
DROP TABLE IF EXISTS `alumni`;
CREATE TABLE `alumni`  (
  `alumni_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `graduation_year` int(11) NULL DEFAULT NULL,
  `current_employer` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `job_title` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `contact_email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `contact_phone` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`alumni_id`) USING BTREE,
  INDEX `fk_alumni_student`(`student_id`) USING BTREE,
  CONSTRAINT `fk_alumni_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of alumni
-- ----------------------------
INSERT INTO `alumni` VALUES (1, 11008, 2024, 'Infosys Limited', 'System Engineer Trainee', 'isha.singh.alumni@email.com', '9810000008');

-- ----------------------------
-- Table structure for alumni_chapters
-- ----------------------------
DROP TABLE IF EXISTS `alumni_chapters`;
CREATE TABLE `alumni_chapters`  (
  `chapter_id` int(11) NOT NULL AUTO_INCREMENT,
  `chapter_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `location` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `president_id` int(11) NULL DEFAULT NULL,
  `established_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`chapter_id`) USING BTREE,
  INDEX `fk_aluchap_alumni`(`president_id`) USING BTREE,
  CONSTRAINT `fk_aluchap_alumni` FOREIGN KEY (`president_id`) REFERENCES `alumni` (`alumni_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of alumni_chapters
-- ----------------------------
INSERT INTO `alumni_chapters` VALUES (1, 'Bangalore Chapter', 'Bangalore', 1, '2015-10-20');
INSERT INTO `alumni_chapters` VALUES (2, 'Delhi NCR Chapter', 'Delhi', NULL, '2018-04-15');
INSERT INTO `alumni_chapters` VALUES (3, 'Mumbai Chapter', 'Mumbai', NULL, '2019-11-01');

-- ----------------------------
-- Table structure for alumni_events
-- ----------------------------
DROP TABLE IF EXISTS `alumni_events`;
CREATE TABLE `alumni_events`  (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `event_date` date NULL DEFAULT NULL,
  `location` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `organizer_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`event_id`) USING BTREE,
  INDEX `fk_aluevent_alumni`(`organizer_id`) USING BTREE,
  CONSTRAINT `fk_aluevent_alumni` FOREIGN KEY (`organizer_id`) REFERENCES `alumni` (`alumni_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of alumni_events
-- ----------------------------
INSERT INTO `alumni_events` VALUES (1, 'Annual Bangalore Alumni Dinner 2024', '2024-11-16', 'Taj West End, Bangalore', 'Networking dinner for Bangalore based alumni.', 1);
INSERT INTO `alumni_events` VALUES (2, 'Webinar: Career Trends in AI/ML', '2024-09-10', 'Online - Zoom', 'Insights from industry experts for alumni.', 1);

-- ----------------------------
-- Table structure for alumni_job_postings
-- ----------------------------
DROP TABLE IF EXISTS `alumni_job_postings`;
CREATE TABLE `alumni_job_postings`  (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `alumni_id` int(11) NULL DEFAULT NULL,
  `job_title` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `company_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `posted_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`job_id`) USING BTREE,
  INDEX `fk_alujob_alumni`(`alumni_id`) USING BTREE,
  CONSTRAINT `fk_alujob_alumni` FOREIGN KEY (`alumni_id`) REFERENCES `alumni` (`alumni_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of alumni_job_postings
-- ----------------------------
INSERT INTO `alumni_job_postings` VALUES (1, 1, 'Software Engineer - Backend', 'StartupX Solutions', 'Looking for 2-3 years experienced Java developers.', '2024-07-10');
INSERT INTO `alumni_job_postings` VALUES (2, 1, 'Data Analyst', 'FinTech Corp', 'Requires SQL, Python, and data visualization skills.', '2024-07-15');

-- ----------------------------
-- Table structure for alumni_mentorship
-- ----------------------------
DROP TABLE IF EXISTS `alumni_mentorship`;
CREATE TABLE `alumni_mentorship`  (
  `mentorship_id` int(11) NOT NULL AUTO_INCREMENT,
  `alumni_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `focus_area` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`mentorship_id`) USING BTREE,
  INDEX `fk_alummentor_alum`(`alumni_id`) USING BTREE,
  INDEX `fk_alummentor_student`(`student_id`) USING BTREE,
  CONSTRAINT `fk_alummentor_alum` FOREIGN KEY (`alumni_id`) REFERENCES `alumni` (`alumni_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_alummentor_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of alumni_mentorship
-- ----------------------------
INSERT INTO `alumni_mentorship` VALUES (1, 1, 11016, '2024-07-01', '2024-12-31', 'Career guidance, Interview Preparation');

-- ----------------------------
-- Table structure for alumni_surveys
-- ----------------------------
DROP TABLE IF EXISTS `alumni_surveys`;
CREATE TABLE `alumni_surveys`  (
  `survey_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` date NULL DEFAULT NULL,
  `target_year` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`survey_id`) USING BTREE,
  INDEX `fk_alusurv_user`(`created_by`) USING BTREE,
  CONSTRAINT `fk_alusurv_user` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of alumni_surveys
-- ----------------------------
INSERT INTO `alumni_surveys` VALUES (1, 'Graduate Outcome Survey 2024', 23, '2024-06-01', 2024);
INSERT INTO `alumni_surveys` VALUES (2, 'Alumni Satisfaction Survey 2024', 1, '2024-07-10', NULL);

-- ----------------------------
-- Table structure for anonymous_feedback_reports
-- ----------------------------
DROP TABLE IF EXISTS `anonymous_feedback_reports`;
CREATE TABLE `anonymous_feedback_reports`  (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NULL DEFAULT NULL,
  `report_date` date NULL DEFAULT NULL,
  `total_responses` int(11) NULL DEFAULT NULL,
  `summary` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`report_id`) USING BTREE,
  INDEX `fk_anonreport_form`(`form_id`) USING BTREE,
  CONSTRAINT `fk_anonreport_form` FOREIGN KEY (`form_id`) REFERENCES `feedback_forms` (`form_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of anonymous_feedback_reports
-- ----------------------------
INSERT INTO `anonymous_feedback_reports` VALUES (1, 3, '2024-07-01', 150, 'Generated report for anonymous faculty feedback. See detailed analysis attached.');

-- ----------------------------
-- Table structure for app_analytics
-- ----------------------------
DROP TABLE IF EXISTS `app_analytics`;
CREATE TABLE `app_analytics`  (
  `analytic_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_user_id` int(11) NULL DEFAULT NULL,
  `feature_id` int(11) NULL DEFAULT NULL,
  `usage_date` datetime NULL DEFAULT NULL,
  `duration` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`analytic_id`) USING BTREE,
  INDEX `fk_appanal_appuser`(`app_user_id`) USING BTREE,
  INDEX `fk_appanal_feat`(`feature_id`) USING BTREE,
  CONSTRAINT `fk_appanal_appuser` FOREIGN KEY (`app_user_id`) REFERENCES `app_users` (`app_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_appanal_feat` FOREIGN KEY (`feature_id`) REFERENCES `app_features` (`feature_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_analytics
-- ----------------------------
INSERT INTO `app_analytics` VALUES (1, 1, 1, '2024-07-15 10:31:00', 120);
INSERT INTO `app_analytics` VALUES (2, 1, 4, '2024-07-15 10:33:00', 60);
INSERT INTO `app_analytics` VALUES (3, 2, 1, '2024-07-14 16:01:00', 300);
INSERT INTO `app_analytics` VALUES (4, 3, 2, '2024-07-15 08:01:00', 180);

-- ----------------------------
-- Table structure for app_features
-- ----------------------------
DROP TABLE IF EXISTS `app_features`;
CREATE TABLE `app_features`  (
  `feature_id` int(11) NOT NULL AUTO_INCREMENT,
  `feature_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `access_level` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `release_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`feature_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_features
-- ----------------------------
INSERT INTO `app_features` VALUES (1, 'View Attendance', 'Allows users to view their attendance records.', 'Student,Faculty,Admin', '2023-01-15');
INSERT INTO `app_features` VALUES (2, 'View Marks', 'Allows users to view their exam marks.', 'Student,Faculty,Admin', '2023-01-15');
INSERT INTO `app_features` VALUES (3, 'Fee Payment', 'Allows online payment of fees.', 'Student', '2023-06-01');
INSERT INTO `app_features` VALUES (4, 'Timetable', 'Displays personal/course timetable.', 'Student,Faculty', '2023-01-15');
INSERT INTO `app_features` VALUES (5, 'Notifications', 'Push notifications for announcements.', 'All', '2023-03-01');

-- ----------------------------
-- Table structure for app_feedback
-- ----------------------------
DROP TABLE IF EXISTS `app_feedback`;
CREATE TABLE `app_feedback`  (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_user_id` int(11) NULL DEFAULT NULL,
  `feedback_text` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `rating` int(11) NULL DEFAULT NULL,
  `feedback_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`feedback_id`) USING BTREE,
  INDEX `fk_appfeed_appuser`(`app_user_id`) USING BTREE,
  CONSTRAINT `fk_appfeed_appuser` FOREIGN KEY (`app_user_id`) REFERENCES `app_users` (`app_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_feedback
-- ----------------------------
INSERT INTO `app_feedback` VALUES (1, 1, 'The attendance view is very helpful!', 5, '2024-06-10');
INSERT INTO `app_feedback` VALUES (2, 3, 'App is slow sometimes when loading marks.', 3, '2024-07-01');
INSERT INTO `app_feedback` VALUES (3, 2, 'Wish I could see the consolidated timetable for my department.', 4, '2024-07-12');

-- ----------------------------
-- Table structure for app_users
-- ----------------------------
DROP TABLE IF EXISTS `app_users`;
CREATE TABLE `app_users`  (
  `app_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `device_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `app_version` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `last_login` datetime NULL DEFAULT NULL,
  `push_token` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`app_user_id`) USING BTREE,
  INDEX `fk_appuser_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_appuser_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_users
-- ----------------------------
INSERT INTO `app_users` VALUES (1, 11001, 'device_xyz123abc', '2.1.0', '2024-07-15 10:30:00', 'push_token_student1');
INSERT INTO `app_users` VALUES (2, 101, 'device_pqr456def', '2.1.0', '2024-07-14 16:00:00', 'push_token_faculty1');
INSERT INTO `app_users` VALUES (3, 11002, 'device_mno789ghi', '2.0.5', '2024-07-15 08:00:00', 'push_token_student2');
INSERT INTO `app_users` VALUES (4, 1, 'device_adm123jkl', '2.1.0', '2024-07-15 11:00:00', 'push_token_admin');

-- ----------------------------
-- Table structure for applications
-- ----------------------------
DROP TABLE IF EXISTS `applications`;
CREATE TABLE `applications`  (
  `application_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `date_of_birth` date NULL DEFAULT NULL,
  `gender` enum('Male','Female','Other') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `program_id` int(11) NULL DEFAULT NULL,
  `application_date` date NULL DEFAULT NULL,
  `status` enum('Pending','Verified','Accepted','Rejected','Waitlisted') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`application_id`) USING BTREE,
  INDEX `fk_app_program`(`program_id`) USING BTREE,
  CONSTRAINT `fk_app_program` FOREIGN KEY (`program_id`) REFERENCES `programs` (`program_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of applications
-- ----------------------------
INSERT INTO `applications` VALUES (1, 'Amitabh', 'Bachchan', '2006-01-15', 'Male', 'amit.b@example.com', '9012345678', 1, '2024-05-10', 'Accepted');
INSERT INTO `applications` VALUES (2, 'Deepika', 'Padukone', '2006-03-20', 'Female', 'deepika.p@example.com', '9023456789', 2, '2024-05-12', 'Accepted');
INSERT INTO `applications` VALUES (3, 'Ranbir', 'Kapoor', '2005-11-01', 'Male', 'ranbir.k@example.com', '9034567890', 1, '2024-05-15', 'Rejected');
INSERT INTO `applications` VALUES (4, 'Alia', 'Bhatt', '2006-07-08', 'Female', 'alia.b@example.com', '9045678901', 6, '2024-05-18', 'Waitlisted');
INSERT INTO `applications` VALUES (5, 'Shahrukh', 'Khan', '2001-02-25', 'Male', 'srk@example.com', '9056789012', 7, '2024-04-20', 'Accepted');

-- ----------------------------
-- Table structure for asset_audits
-- ----------------------------
DROP TABLE IF EXISTS `asset_audits`;
CREATE TABLE `asset_audits`  (
  `audit_id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NULL DEFAULT NULL,
  `audit_date` date NULL DEFAULT NULL,
  `auditor_id` int(11) NULL DEFAULT NULL,
  `findings` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `status` enum('Pass','Fail','Pending') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`audit_id`) USING BTREE,
  INDEX `fk_assetaudit_asset`(`asset_id`) USING BTREE,
  INDEX `fk_assetaudit_user`(`auditor_id`) USING BTREE,
  CONSTRAINT `fk_assetaudit_asset` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`asset_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_assetaudit_user` FOREIGN KEY (`auditor_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_audits
-- ----------------------------
INSERT INTO `asset_audits` VALUES (1, 1, '2024-06-20', 1, 'Asset found in designated location CL-1. Condition good.', 'Pass');
INSERT INTO `asset_audits` VALUES (2, 6, '2024-06-20', 1, 'Bus requires minor bodywork repair. Log book updated.', 'Pending');

-- ----------------------------
-- Table structure for asset_depreciation
-- ----------------------------
DROP TABLE IF EXISTS `asset_depreciation`;
CREATE TABLE `asset_depreciation`  (
  `depreciation_id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NULL DEFAULT NULL,
  `depreciation_date` date NULL DEFAULT NULL,
  `depreciation_amount` decimal(10, 2) NULL DEFAULT NULL,
  `current_value` decimal(10, 2) NULL DEFAULT NULL,
  `method` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`depreciation_id`) USING BTREE,
  INDEX `fk_assetdepr_asset`(`asset_id`) USING BTREE,
  CONSTRAINT `fk_assetdepr_asset` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`asset_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_depreciation
-- ----------------------------
INSERT INTO `asset_depreciation` VALUES (1, 1, '2023-03-31', 9750.00, 55250.00, 'Straight Line (15%)');
INSERT INTO `asset_depreciation` VALUES (2, 6, '2023-03-31', 200000.00, 1800000.00, 'Straight Line (10%)');

-- ----------------------------
-- Table structure for asset_loans
-- ----------------------------
DROP TABLE IF EXISTS `asset_loans`;
CREATE TABLE `asset_loans`  (
  `loan_id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `loan_date` date NULL DEFAULT NULL,
  `return_date` date NULL DEFAULT NULL,
  `status` enum('Loaned','Returned') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `condition_returned` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`loan_id`) USING BTREE,
  INDEX `fk_assetloan_asset`(`asset_id`) USING BTREE,
  INDEX `fk_assetloan_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_assetloan_asset` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`asset_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_assetloan_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_loans
-- ----------------------------
INSERT INTO `asset_loans` VALUES (1, 3, 102, '2024-07-10', '2024-07-11', 'Returned', 'Good');
INSERT INTO `asset_loans` VALUES (2, 4, 113, '2024-07-15', NULL, 'Loaned', NULL);

-- ----------------------------
-- Table structure for asset_maintenance
-- ----------------------------
DROP TABLE IF EXISTS `asset_maintenance`;
CREATE TABLE `asset_maintenance`  (
  `maintenance_id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NULL DEFAULT NULL,
  `maintenance_date` date NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `cost` decimal(10, 2) NULL DEFAULT NULL,
  `technician_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`maintenance_id`) USING BTREE,
  INDEX `fk_assetmaint_asset`(`asset_id`) USING BTREE,
  INDEX `fk_assetmaint_staff`(`technician_id`) USING BTREE,
  CONSTRAINT `fk_assetmaint_asset` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`asset_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_assetmaint_staff` FOREIGN KEY (`technician_id`) REFERENCES `staff` (`staff_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_maintenance
-- ----------------------------
INSERT INTO `asset_maintenance` VALUES (1, 1, '2024-01-15', 'Routine Cleaning and RAM upgrade check.', 500.00, 9);
INSERT INTO `asset_maintenance` VALUES (2, 3, '2023-12-10', 'Projector Lamp Replacement', 4500.00, 9);
INSERT INTO `asset_maintenance` VALUES (3, 5, '2024-05-20', 'Lubrication and belt tightening for Lathe Machine', 2000.00, 15);

-- ----------------------------
-- Table structure for assets
-- ----------------------------
DROP TABLE IF EXISTS `assets`;
CREATE TABLE `assets`  (
  `asset_id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `category` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `purchase_date` date NULL DEFAULT NULL,
  `cost` decimal(10, 2) NULL DEFAULT NULL,
  `location` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `serial_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`asset_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of assets
-- ----------------------------
INSERT INTO `assets` VALUES (1, 'Dell OptiPlex 7070 Desktop', 'IT Equipment', '2022-05-10', 65000.00, 'Computer Lab CL-1', 'SN7070XYZ001');
INSERT INTO `assets` VALUES (2, 'HP LaserJet Pro M404dn Printer', 'IT Equipment', '2022-05-10', 25000.00, 'Faculty Room A-210', 'SNM404ABC002');
INSERT INTO `assets` VALUES (3, 'Classroom Projector - Epson EB-S41', 'AV Equipment', '2021-08-15', 45000.00, 'Room A-101', 'SNEBS41PQR003');
INSERT INTO `assets` VALUES (4, 'Oscilloscope Tektronix TBS1052B', 'Lab Equipment', '2020-11-20', 80000.00, 'ECE Lab EL-1', 'SNOSCTBSDEF004');
INSERT INTO `assets` VALUES (5, 'Lathe Machine - HMT', 'Lab Equipment', '2019-06-01', 250000.00, 'Mechanical Workshop ML-1', 'SNHMTLATHEGHI005');
INSERT INTO `assets` VALUES (6, 'College Bus - Tata Marcopolo', 'Vehicle', '2018-04-12', 2000000.00, 'Transport Yard', 'KA05MP1234');
INSERT INTO `assets` VALUES (7, 'Server - Dell PowerEdge R740', 'IT Equipment', '2023-01-20', 450000.00, 'Server Room', 'SNR740JKL007');

-- ----------------------------
-- Table structure for assignment_submissions
-- ----------------------------
DROP TABLE IF EXISTS `assignment_submissions`;
CREATE TABLE `assignment_submissions`  (
  `submission_id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `submission_date` date NULL DEFAULT NULL,
  `score` int(11) NULL DEFAULT NULL,
  `feedback` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `file_path` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`submission_id`) USING BTREE,
  INDEX `fk_assignsub_assign`(`assignment_id`) USING BTREE,
  INDEX `fk_assignsub_student`(`student_id`) USING BTREE,
  CONSTRAINT `fk_assignsub_assign` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`assignment_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_assignsub_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of assignment_submissions
-- ----------------------------
INSERT INTO `assignment_submissions` VALUES (1, 1, 11001, '2023-09-14', 18, 'Good effort. Minor logical error in loop condition.', '/submissions/cs101/assign1/11001.zip');
INSERT INTO `assignment_submissions` VALUES (2, 1, 11016, '2023-09-15', 20, 'Excellent work.', '/submissions/cs101/assign1/11016.zip');
INSERT INTO `assignment_submissions` VALUES (3, 1, 11011, '2023-09-16', 15, 'Late submission. Code needs better commenting.', '/submissions/cs101/assign1/11011.zip');
INSERT INTO `assignment_submissions` VALUES (4, 4, 11001, '2023-09-09', 14, 'Correct solutions. Presentation can be neater.', '/submissions/ma101/pset1/11001.pdf');
INSERT INTO `assignment_submissions` VALUES (5, 4, 11002, '2023-09-10', 15, 'Well done.', '/submissions/ma101/pset1/11002.pdf');
INSERT INTO `assignment_submissions` VALUES (6, 2, 11001, '2023-10-19', 22, 'Implementation is correct. Report lacks detailed explanation.', '/submissions/cs102/assign1/11001_report.pdf');
INSERT INTO `assignment_submissions` VALUES (7, 2, 11016, '2023-10-20', 24, 'Very good implementation and report.', '/submissions/cs102/assign1/11016_report.pdf');
INSERT INTO `assignment_submissions` VALUES (8, 5, 11001, '2024-03-08', 28, 'Efficient implementation of Merge Sort. Good analysis.', '/submissions/cs201/assign1/11001_code_report.zip');
INSERT INTO `assignment_submissions` VALUES (9, 5, 11009, '2024-03-10', 25, 'Code works, but complexity analysis could be more thorough.', '/submissions/cs201/assign1/11009_code_report.zip');
INSERT INTO `assignment_submissions` VALUES (10, 6, 11002, '2024-03-14', 23, 'Circuit design is correct. Analysis needs more detail on stability.', '/submissions/ec203/assign1/11002_report.pdf');
INSERT INTO `assignment_submissions` VALUES (11, 10, 11007, '2023-09-30', 18, 'Good analysis of the 4Ps. Presentation clear.', '/submissions/mba104/casestudy1/11007.pptx');
INSERT INTO `assignment_submissions` VALUES (12, 11, 11004, '2023-09-25', 27, 'Accurate field work and well-documented report.', '/submissions/ce101/field1/11004.zip');

-- ----------------------------
-- Table structure for assignments
-- ----------------------------
DROP TABLE IF EXISTS `assignments`;
CREATE TABLE `assignments`  (
  `assignment_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `due_date` date NULL DEFAULT NULL,
  `max_score` int(11) NULL DEFAULT NULL,
  `submission_format` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`assignment_id`) USING BTREE,
  INDEX `fk_assign_course`(`course_id`) USING BTREE,
  CONSTRAINT `fk_assign_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of assignments
-- ----------------------------
INSERT INTO `assignments` VALUES (1, 101, 'Assignment 1: Basic C Programs', 'Write simple C programs for arithmetic operations, loops, and conditionals.', '2023-09-15', 20, 'Zip file with .c source files');
INSERT INTO `assignments` VALUES (2, 102, 'Assignment 1: Linked Lists', 'Implement single and double linked lists with insert, delete, search operations.', '2023-10-20', 25, 'PDF report + Code files');
INSERT INTO `assignments` VALUES (3, 201, 'Assignment 1: Diode Circuits', 'Analyze and simulate basic diode circuits (rectifiers, clippers).', '2023-09-20', 20, 'PDF report with simulation results');
INSERT INTO `assignments` VALUES (4, 901, 'Problem Set 1: Calculus', 'Solve problems related to limits, continuity, and differentiation.', '2023-09-10', 15, 'Handwritten PDF scan');
INSERT INTO `assignments` VALUES (5, 103, 'Assignment 1: Sorting Algorithms', 'Implement and compare Bubble Sort, Insertion Sort, Merge Sort.', '2024-03-10', 30, 'Code + Performance Analysis Report (PDF)');
INSERT INTO `assignments` VALUES (6, 203, 'Assignment 1: BJT Biasing Circuits', 'Design and analyze various BJT biasing circuits.', '2024-03-15', 25, 'PDF report');
INSERT INTO `assignments` VALUES (7, 303, 'Tutorial Sheet 1: Fluid Properties', 'Solve problems related to viscosity, surface tension, etc.', '2024-02-28', 10, 'Handwritten PDF scan');
INSERT INTO `assignments` VALUES (8, 105, 'Assignment 1: ER Modeling', 'Design an ER Diagram for a Library Management System.', '2024-09-15', 20, 'PDF/Image file');
INSERT INTO `assignments` VALUES (9, 106, 'Assignment 1: Subnetting', 'Solve IP subnetting problems for given scenarios.', '2024-10-10', 15, 'PDF document');
INSERT INTO `assignments` VALUES (10, 704, 'Case Study 1: Marketing Mix', 'Analyze the marketing mix of a popular Indian FMCG product.', '2023-10-01', 20, 'PPT presentation');
INSERT INTO `assignments` VALUES (11, 401, 'Field Assignment: Levelling Exercise', 'Conduct a differential levelling exercise on campus.', '2023-09-25', 30, 'Field Book Scan + Report');

-- ----------------------------
-- Table structure for attendance
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance`  (
  `attendance_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_session_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `status` enum('Present','Absent','Late','Excused') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `absence_reason` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `recorded_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`attendance_id`) USING BTREE,
  INDEX `fk_att_classession`(`class_session_id`) USING BTREE,
  INDEX `fk_att_student`(`student_id`) USING BTREE,
  INDEX `fk_att_user`(`recorded_by`) USING BTREE,
  CONSTRAINT `fk_att_classession` FOREIGN KEY (`class_session_id`) REFERENCES `classes` (`class_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_att_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_att_user` FOREIGN KEY (`recorded_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of attendance
-- ----------------------------
INSERT INTO `attendance` VALUES (1, 1, 11001, '2023-08-07', 'Present', NULL, 101);
INSERT INTO `attendance` VALUES (2, 1, 11016, '2023-08-07', 'Present', NULL, 101);
INSERT INTO `attendance` VALUES (3, 1, 11011, '2023-08-07', 'Absent', 'Medical Leave', 101);
INSERT INTO `attendance` VALUES (4, 4, 11001, '2023-08-08', 'Present', NULL, 108);
INSERT INTO `attendance` VALUES (5, 4, 11016, '2023-08-08', 'Late', 'Traffic delay', 108);
INSERT INTO `attendance` VALUES (6, 4, 11011, '2023-08-08', 'Present', NULL, 108);
INSERT INTO `attendance` VALUES (7, 11, 11002, '2023-08-07', 'Present', NULL, 102);
INSERT INTO `attendance` VALUES (8, 11, 11010, '2023-08-07', 'Present', NULL, 102);
INSERT INTO `attendance` VALUES (9, 11, 11017, '2023-08-07', 'Excused', 'Participating in Event', 102);
INSERT INTO `attendance` VALUES (10, 1, 11001, '2023-08-14', 'Present', NULL, 101);
INSERT INTO `attendance` VALUES (11, 1, 11016, '2023-08-14', 'Present', NULL, 101);
INSERT INTO `attendance` VALUES (12, 1, 11011, '2023-08-14', 'Present', NULL, 101);
INSERT INTO `attendance` VALUES (13, 4, 11001, '2023-08-15', 'Absent', 'Independence Day', 108);
INSERT INTO `attendance` VALUES (14, 4, 11016, '2023-08-15', 'Absent', 'Independence Day', 108);
INSERT INTO `attendance` VALUES (15, 4, 11011, '2023-08-15', 'Absent', 'Independence Day', 108);
INSERT INTO `attendance` VALUES (16, 20, 11001, '2024-02-05', 'Present', NULL, 24);
INSERT INTO `attendance` VALUES (17, 20, 11009, '2024-02-05', 'Present', NULL, 24);
INSERT INTO `attendance` VALUES (18, 20, 11011, '2024-02-05', 'Present', NULL, 24);
INSERT INTO `attendance` VALUES (19, 20, 11016, '2024-02-05', 'Present', NULL, 24);
INSERT INTO `attendance` VALUES (20, 22, 11002, '2024-02-06', 'Present', NULL, 25);
INSERT INTO `attendance` VALUES (21, 22, 11010, '2024-02-06', 'Late', NULL, 25);
INSERT INTO `attendance` VALUES (22, 22, 11017, '2024-02-06', 'Present', NULL, 25);
INSERT INTO `attendance` VALUES (23, 3, 11001, '2023-08-11', 'Present', NULL, 12);
INSERT INTO `attendance` VALUES (24, 3, 11016, '2023-08-11', 'Absent', NULL, 12);
INSERT INTO `attendance` VALUES (25, 3, 11011, '2023-08-11', 'Present', NULL, 12);
INSERT INTO `attendance` VALUES (26, 12, 11002, '2023-08-09', 'Present', NULL, 13);
INSERT INTO `attendance` VALUES (27, 12, 11010, '2023-08-09', 'Present', NULL, 13);
INSERT INTO `attendance` VALUES (28, 12, 11017, '2023-08-09', 'Excused', 'Minor Medical Issue', 13);

-- ----------------------------
-- Table structure for attendance_appeals
-- ----------------------------
DROP TABLE IF EXISTS `attendance_appeals`;
CREATE TABLE `attendance_appeals`  (
  `appeal_id` int(11) NOT NULL AUTO_INCREMENT,
  `attendance_record_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `appeal_date` date NULL DEFAULT NULL,
  `reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `status` enum('Pending','Approved','Rejected') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `reviewed_by` int(11) NULL DEFAULT NULL,
  `supporting_document` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`appeal_id`) USING BTREE,
  INDEX `fk_attappeal_att`(`attendance_record_id`) USING BTREE,
  INDEX `fk_attappeal_student`(`student_id`) USING BTREE,
  INDEX `fk_attappeal_user`(`reviewed_by`) USING BTREE,
  CONSTRAINT `fk_attappeal_att` FOREIGN KEY (`attendance_record_id`) REFERENCES `attendance` (`attendance_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_attappeal_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_attappeal_user` FOREIGN KEY (`reviewed_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of attendance_appeals
-- ----------------------------
INSERT INTO `attendance_appeals` VALUES (1, 3, 11011, '2023-08-09', 'Attended online due to medical reasons. Submitted doctor note.', 'Approved', 101, '/docs/appeals/11011_medical_note_0807.pdf');

-- ----------------------------
-- Table structure for audit_logs
-- ----------------------------
DROP TABLE IF EXISTS `audit_logs`;
CREATE TABLE `audit_logs`  (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `action` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `timestamp` datetime NULL DEFAULT NULL,
  `details` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `affected_table` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `fk_audit_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_audit_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of audit_logs
-- ----------------------------
INSERT INTO `audit_logs` VALUES (1, 1, 'UPDATE_USER_ROLE', '2024-07-10 11:00:00', 'Changed role_id for user_id 202 from 4 to 1', 'users');
INSERT INTO `audit_logs` VALUES (2, 201, 'CREATE_INVOICE', '2024-07-15 10:00:00', 'Generated fee invoice #12 for student 11004', 'fee_invoices');
INSERT INTO `audit_logs` VALUES (3, 101, 'UPDATE_MARKS', '2024-04-15 15:05:00', 'Updated marks for student 11009 in exam 8', 'marks');

-- ----------------------------
-- Table structure for biometric_logs
-- ----------------------------
DROP TABLE IF EXISTS `biometric_logs`;
CREATE TABLE `biometric_logs`  (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `timestamp` datetime NULL DEFAULT NULL,
  `device_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `location` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `fk_bio_student`(`student_id`) USING BTREE,
  CONSTRAINT `fk_bio_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of biometric_logs
-- ----------------------------
INSERT INTO `biometric_logs` VALUES (1, 11001, '2024-07-16 08:58:10', 'BIO-LIB-01', 'Library Entry');
INSERT INTO `biometric_logs` VALUES (2, 11002, '2024-07-16 09:01:05', 'BIO-HOS-G01', 'Hostel Gate Entry');

-- ----------------------------
-- Table structure for blockchain_verifications
-- ----------------------------
DROP TABLE IF EXISTS `blockchain_verifications`;
CREATE TABLE `blockchain_verifications`  (
  `blockchain_id` int(11) NOT NULL AUTO_INCREMENT,
  `certificate_id` int(11) NULL DEFAULT NULL,
  `blockchain_hash` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `verification_url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `recorded_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`blockchain_id`) USING BTREE,
  INDEX `fk_bcverify_issue`(`certificate_id`) USING BTREE,
  CONSTRAINT `fk_bcverify_issue` FOREIGN KEY (`certificate_id`) REFERENCES `certificate_issues` (`issue_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blockchain_verifications
-- ----------------------------
INSERT INTO `blockchain_verifications` VALUES (1, 1, '0xabc123def456...', 'https://blockchainverifier.example/verify?hash=0xabc123', '2024-06-23');
INSERT INTO `blockchain_verifications` VALUES (2, 2, '0xdef789abc123...', 'https://blockchainverifier.example/verify?hash=0xdef789', '2024-06-06');

-- ----------------------------
-- Table structure for book_issues
-- ----------------------------
DROP TABLE IF EXISTS `book_issues`;
CREATE TABLE `book_issues`  (
  `issue_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NULL DEFAULT NULL,
  `book_id` int(11) NULL DEFAULT NULL,
  `issue_date` date NULL DEFAULT NULL,
  `due_date` date NULL DEFAULT NULL,
  `return_date` date NULL DEFAULT NULL,
  `fine_amount` decimal(5, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`issue_id`) USING BTREE,
  INDEX `fk_bookissue_member`(`member_id`) USING BTREE,
  INDEX `fk_bookissue_book`(`book_id`) USING BTREE,
  CONSTRAINT `fk_bookissue_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_bookissue_member` FOREIGN KEY (`member_id`) REFERENCES `library_members` (`member_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of book_issues
-- ----------------------------
INSERT INTO `book_issues` VALUES (1, 1, 1, '2024-06-10', '2024-06-24', '2024-06-22', 0.00);
INSERT INTO `book_issues` VALUES (2, 1, 2, '2024-06-10', '2024-06-24', NULL, 0.00);
INSERT INTO `book_issues` VALUES (3, 2, 8, '2024-06-15', '2024-06-29', '2024-07-02', 3.00);
INSERT INTO `book_issues` VALUES (4, 11, 3, '2024-07-01', '2024-07-31', NULL, 0.00);
INSERT INTO `book_issues` VALUES (5, 16, 5, '2024-07-05', '2024-07-19', NULL, 0.00);
INSERT INTO `book_issues` VALUES (6, 3, 10, '2024-06-20', '2024-07-04', NULL, 0.00);
INSERT INTO `book_issues` VALUES (7, 1, 1, '2024-07-10', '2024-07-24', NULL, 0.00);
INSERT INTO `book_issues` VALUES (8, 1, 6, '2024-07-10', '2024-07-24', NULL, 0.00);
INSERT INTO `book_issues` VALUES (9, 5, 18, '2024-06-25', '2024-07-09', '2024-07-08', 0.00);
INSERT INTO `book_issues` VALUES (10, 12, 17, '2024-07-01', '2024-07-31', NULL, 0.00);

-- ----------------------------
-- Table structure for book_reservations
-- ----------------------------
DROP TABLE IF EXISTS `book_reservations`;
CREATE TABLE `book_reservations`  (
  `reservation_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NULL DEFAULT NULL,
  `book_id` int(11) NULL DEFAULT NULL,
  `reservation_date` date NULL DEFAULT NULL,
  `status` enum('Pending','Fulfilled','Cancelled') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `notification_sent` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`reservation_id`) USING BTREE,
  INDEX `fk_bookres_member`(`member_id`) USING BTREE,
  INDEX `fk_bookres_book`(`book_id`) USING BTREE,
  CONSTRAINT `fk_bookres_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_bookres_member` FOREIGN KEY (`member_id`) REFERENCES `library_members` (`member_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of book_reservations
-- ----------------------------
INSERT INTO `book_reservations` VALUES (1, 3, 3, '2024-07-12', 'Pending', 0);

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `author` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `publisher` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `isbn` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `category` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `copies_available` int(11) NULL DEFAULT NULL,
  `publication_year` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (1, 'Let Us C', 'Yashavant Kanetkar', 'BPB Publications', '978-8183331630', 'Programming', 13, 2016);
INSERT INTO `books` VALUES (2, 'Data Structures Through C in Depth', 'S.K. Srivastava', 'BPB Publications', '978-8183330664', 'Data Structures', 11, 2011);
INSERT INTO `books` VALUES (3, 'Introduction to Algorithms', 'Thomas H. Cormen', 'MIT Press', '978-0262033848', 'Algorithms', 7, 2009);
INSERT INTO `books` VALUES (4, 'Operating System Concepts', 'Abraham Silberschatz', 'Wiley', '978-1118063330', 'Operating Systems', 10, 2012);
INSERT INTO `books` VALUES (5, 'Database System Concepts', 'Abraham Silberschatz', 'McGraw Hill', '978-0073523323', 'Databases', 8, 2010);
INSERT INTO `books` VALUES (6, 'Computer Networking: A Top-Down Approach', 'James F. Kurose', 'Pearson', '978-0133594140', 'Networking', 10, 2016);
INSERT INTO `books` VALUES (7, 'Artificial Intelligence: A Modern Approach', 'Stuart Russell', 'Pearson', '978-0136042594', 'Artificial Intelligence', 7, 2009);
INSERT INTO `books` VALUES (8, 'Electronic Devices and Circuit Theory', 'Robert L. Boylestad', 'Pearson', '978-0132622264', 'Electronics', 13, 2012);
INSERT INTO `books` VALUES (9, 'Digital Design', 'M. Morris Mano', 'Pearson', '978-0131374530', 'Digital Logic', 13, 2006);
INSERT INTO `books` VALUES (10, 'Fundamentals of Thermodynamics', 'Claus Borgnakke', 'Wiley', '978-1118131991', 'Thermodynamics', 9, 2012);
INSERT INTO `books` VALUES (11, 'Fluid Mechanics', 'Frank M. White', 'McGraw Hill', '978-0073398273', 'Fluid Mechanics', 9, 2010);
INSERT INTO `books` VALUES (12, 'Theory of Machines', 'R.S. Khurmi', 'S. Chand Publishing', '978-8121925242', 'Mechanical Design', 16, 2005);
INSERT INTO `books` VALUES (13, 'Surveying Vol. 1', 'B.C. Punmia', 'Laxmi Publications', '978-8170088530', 'Surveying', 18, 2016);
INSERT INTO `books` VALUES (14, 'Building Construction', 'B.C. Punmia', 'Laxmi Publications', '978-8131802408', 'Civil Construction', 15, 2008);
INSERT INTO `books` VALUES (15, 'Basic Electrical Engineering', 'V.K. Mehta', 'S. Chand Publishing', '978-8121926607', 'Electrical', 20, 2008);
INSERT INTO `books` VALUES (16, 'Power System Engineering', 'D Kothari', 'McGraw Hill', '978-1259082115', 'Power Systems', 8, 2017);
INSERT INTO `books` VALUES (17, 'Object-Oriented Programming with C++', 'E Balagurusamy', 'McGraw Hill', '978-9352607990', 'Programming', 16, 2017);
INSERT INTO `books` VALUES (18, 'Software Engineering: A Practitioners Approach', 'Roger Pressman', 'McGraw Hill', '978-0078022128', 'Software Engineering', 9, 2014);
INSERT INTO `books` VALUES (19, 'Principles of Marketing', 'Philip Kotler', 'Pearson', '978-0134422665', 'Marketing', 12, 2017);
INSERT INTO `books` VALUES (20, 'Human Resource Management', 'Gary Dessler', 'Pearson', '978-0134235455', 'Human Resources', 11, 2016);

-- ----------------------------
-- Table structure for budgets
-- ----------------------------
DROP TABLE IF EXISTS `budgets`;
CREATE TABLE `budgets`  (
  `budget_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NULL DEFAULT NULL,
  `fiscal_year` year NULL DEFAULT NULL,
  `budget_amount` decimal(15, 2) NULL DEFAULT NULL,
  `allocated_amount` decimal(15, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`budget_id`) USING BTREE,
  INDEX `fk_budget_dept`(`department_id`) USING BTREE,
  CONSTRAINT `fk_budget_dept` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of budgets
-- ----------------------------
INSERT INTO `budgets` VALUES (1, 1, 2024, 5000000.00, 4800000.00);
INSERT INTO `budgets` VALUES (2, 12, 2024, 1000000.00, 950000.00);
INSERT INTO `budgets` VALUES (3, 3, 2024, 3500000.00, 3450000.00);
INSERT INTO `budgets` VALUES (4, 7, 2024, 2000000.00, 1900000.00);

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'General Merit');
INSERT INTO `categories` VALUES (2, 'Management Quota');
INSERT INTO `categories` VALUES (3, 'SC/ST');
INSERT INTO `categories` VALUES (4, 'OBC');
INSERT INTO `categories` VALUES (5, 'NRI/Foreign National');
INSERT INTO `categories` VALUES (6, 'Staff Ward');
INSERT INTO `categories` VALUES (7, 'EWS (Economically Weaker Section)');

-- ----------------------------
-- Table structure for cctv_cameras
-- ----------------------------
DROP TABLE IF EXISTS `cctv_cameras`;
CREATE TABLE `cctv_cameras`  (
  `camera_id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` enum('Active','Inactive','Maintenance') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `last_maintenance` date NULL DEFAULT NULL,
  `camera_ip` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`camera_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cctv_cameras
-- ----------------------------
INSERT INTO `cctv_cameras` VALUES (1, 'Main Gate Entry', 'Active', '2024-06-01', '192.168.1.101');
INSERT INTO `cctv_cameras` VALUES (2, 'Main Gate Exit', 'Active', '2024-06-01', '192.168.1.102');
INSERT INTO `cctv_cameras` VALUES (3, 'Library Entrance', 'Active', '2024-07-10', '192.168.2.101');
INSERT INTO `cctv_cameras` VALUES (4, 'Hostel Block H1 Corridor 1F', 'Active', '2024-05-15', '192.168.3.101');
INSERT INTO `cctv_cameras` VALUES (5, 'Academic Block A Corridor GF', 'Maintenance', '2024-04-01', '192.168.4.101');

-- ----------------------------
-- Table structure for certificate_issues
-- ----------------------------
DROP TABLE IF EXISTS `certificate_issues`;
CREATE TABLE `certificate_issues`  (
  `issue_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `issue_date` date NULL DEFAULT NULL,
  `certificate_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `purpose` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`issue_id`) USING BTREE,
  INDEX `fk_certissue_temp`(`template_id`) USING BTREE,
  INDEX `fk_certissue_student`(`student_id`) USING BTREE,
  CONSTRAINT `fk_certissue_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_certissue_temp` FOREIGN KEY (`template_id`) REFERENCES `certificate_templates` (`template_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of certificate_issues
-- ----------------------------
INSERT INTO `certificate_issues` VALUES (1, 1, 11002, '2024-06-22', 'BONA/2024/101', 'Bank Account Opening');
INSERT INTO `certificate_issues` VALUES (2, 3, 11008, '2024-06-05', 'TC/2024/055', 'Joining new company');

-- ----------------------------
-- Table structure for certificate_qr_codes
-- ----------------------------
DROP TABLE IF EXISTS `certificate_qr_codes`;
CREATE TABLE `certificate_qr_codes`  (
  `qr_id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) NULL DEFAULT NULL,
  `qr_code_data` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `generated_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`qr_id`) USING BTREE,
  INDEX `fk_certqr_issue`(`issue_id`) USING BTREE,
  CONSTRAINT `fk_certqr_issue` FOREIGN KEY (`issue_id`) REFERENCES `certificate_issues` (`issue_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of certificate_qr_codes
-- ----------------------------
INSERT INTO `certificate_qr_codes` VALUES (1, 1, 'https://college.edu.in/verify?cert=BONA/2024/101', '2024-06-22');
INSERT INTO `certificate_qr_codes` VALUES (2, 2, 'https://college.edu.in/verify?cert=TC/2024/055', '2024-06-05');

-- ----------------------------
-- Table structure for certificate_requests
-- ----------------------------
DROP TABLE IF EXISTS `certificate_requests`;
CREATE TABLE `certificate_requests`  (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `template_id` int(11) NULL DEFAULT NULL,
  `request_date` date NULL DEFAULT NULL,
  `purpose` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `status` enum('Pending','Approved','Rejected') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `approved_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`request_id`) USING BTREE,
  INDEX `fk_certreq_student`(`student_id`) USING BTREE,
  INDEX `fk_certreq_temp`(`template_id`) USING BTREE,
  INDEX `fk_certreq_user`(`approved_by`) USING BTREE,
  CONSTRAINT `fk_certreq_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_certreq_temp` FOREIGN KEY (`template_id`) REFERENCES `certificate_templates` (`template_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_certreq_user` FOREIGN KEY (`approved_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of certificate_requests
-- ----------------------------
INSERT INTO `certificate_requests` VALUES (1, 11001, 1, '2024-07-10', 'Passport Application', 'Pending', NULL);
INSERT INTO `certificate_requests` VALUES (2, 11002, 1, '2024-06-20', 'Bank Account Opening', 'Approved', 202);
INSERT INTO `certificate_requests` VALUES (3, 11008, 3, '2024-06-01', 'Joining new company', 'Approved', 2);

-- ----------------------------
-- Table structure for certificate_templates
-- ----------------------------
DROP TABLE IF EXISTS `certificate_templates`;
CREATE TABLE `certificate_templates`  (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `template_content` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`template_id`) USING BTREE,
  INDEX `fk_certtemp_user`(`created_by`) USING BTREE,
  CONSTRAINT `fk_certtemp_user` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of certificate_templates
-- ----------------------------
INSERT INTO `certificate_templates` VALUES (1, 'Bonafide Certificate', 'This is to certify that Mr./Ms. {STUDENT_NAME}, Roll No: {STUDENT_ID} is a bonafide student of {PROGRAM_NAME} program during the academic year {ACADEMIC_YEAR}.', 2, '2022-01-10');
INSERT INTO `certificate_templates` VALUES (2, 'Course Completion Certificate', 'This certifies that {STUDENT_NAME} has successfully completed the course {COURSE_NAME} ({COURSE_CODE}) in {SEMESTER}, {YEAR}.', 1, '2023-05-15');
INSERT INTO `certificate_templates` VALUES (3, 'Transfer Certificate', 'Details of student {STUDENT_NAME} for transfer purpose...', 2, '2022-02-01');

-- ----------------------------
-- Table structure for certificate_verification
-- ----------------------------
DROP TABLE IF EXISTS `certificate_verification`;
CREATE TABLE `certificate_verification`  (
  `verification_id` int(11) NOT NULL AUTO_INCREMENT,
  `certificate_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `verification_date` date NULL DEFAULT NULL,
  `status` enum('Valid','Invalid','Pending') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `verified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`verification_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of certificate_verification
-- ----------------------------
INSERT INTO `certificate_verification` VALUES (1, 'BONA/2024/101', '2024-06-25', 'Valid', 'HDFC Bank Verifier Tool');

-- ----------------------------
-- Table structure for chapter_members
-- ----------------------------
DROP TABLE IF EXISTS `chapter_members`;
CREATE TABLE `chapter_members`  (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `chapter_id` int(11) NULL DEFAULT NULL,
  `alumni_id` int(11) NULL DEFAULT NULL,
  `join_date` date NULL DEFAULT NULL,
  `role` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`member_id`) USING BTREE,
  INDEX `fk_chapmem_chap`(`chapter_id`) USING BTREE,
  INDEX `fk_chapmem_alumni`(`alumni_id`) USING BTREE,
  CONSTRAINT `fk_chapmem_alumni` FOREIGN KEY (`alumni_id`) REFERENCES `alumni` (`alumni_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_chapmem_chap` FOREIGN KEY (`chapter_id`) REFERENCES `alumni_chapters` (`chapter_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of chapter_members
-- ----------------------------
INSERT INTO `chapter_members` VALUES (1, 1, 1, '2015-10-20', 'President');

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes`  (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NULL DEFAULT NULL,
  `faculty_id` int(11) NULL DEFAULT NULL,
  `room_id` int(11) NULL DEFAULT NULL,
  `day_of_week` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `start_time` time NULL DEFAULT NULL,
  `end_time` time NULL DEFAULT NULL,
  `semester` int(11) NULL DEFAULT NULL,
  `year` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`class_id`) USING BTREE,
  INDEX `fk_class_course`(`course_id`) USING BTREE,
  INDEX `fk_class_faculty`(`faculty_id`) USING BTREE,
  INDEX `fk_class_room`(`room_id`) USING BTREE,
  CONSTRAINT `fk_class_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_class_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_class_room` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES (1, 101, 1, 1, 'Monday', '09:00:00', '10:00:00', 1, 2023);
INSERT INTO `classes` VALUES (2, 101, 1, 1, 'Wednesday', '10:00:00', '11:00:00', 1, 2023);
INSERT INTO `classes` VALUES (3, 101, 12, 11, 'Friday', '09:00:00', '11:00:00', 1, 2023);
INSERT INTO `classes` VALUES (4, 901, 8, 2, 'Tuesday', '09:00:00', '10:00:00', 1, 2023);
INSERT INTO `classes` VALUES (5, 901, 8, 2, 'Thursday', '11:00:00', '12:00:00', 1, 2023);
INSERT INTO `classes` VALUES (6, 902, 9, 3, 'Monday', '11:00:00', '12:00:00', 1, 2023);
INSERT INTO `classes` VALUES (7, 902, 9, 3, 'Wednesday', '12:00:00', '13:00:00', 1, 2023);
INSERT INTO `classes` VALUES (8, 903, 10, 4, 'Tuesday', '10:00:00', '11:00:00', 1, 2023);
INSERT INTO `classes` VALUES (9, 903, 10, 20, 'Friday', '11:00:00', '13:00:00', 1, 2023);
INSERT INTO `classes` VALUES (10, 904, 11, 5, 'Thursday', '14:00:00', '15:00:00', 1, 2023);
INSERT INTO `classes` VALUES (11, 201, 2, 7, 'Monday', '10:00:00', '11:00:00', 1, 2023);
INSERT INTO `classes` VALUES (12, 201, 13, 14, 'Wednesday', '09:00:00', '11:00:00', 1, 2023);
INSERT INTO `classes` VALUES (13, 901, 19, 8, 'Tuesday', '09:00:00', '10:00:00', 1, 2023);
INSERT INTO `classes` VALUES (14, 901, 19, 8, 'Thursday', '11:00:00', '12:00:00', 1, 2023);
INSERT INTO `classes` VALUES (15, 902, 20, 9, 'Monday', '11:00:00', '12:00:00', 1, 2023);
INSERT INTO `classes` VALUES (16, 902, 20, 21, 'Wednesday', '14:00:00', '16:00:00', 1, 2023);
INSERT INTO `classes` VALUES (17, 903, 33, 10, 'Tuesday', '10:00:00', '11:00:00', 1, 2023);
INSERT INTO `classes` VALUES (18, 903, 33, 10, 'Friday', '11:00:00', '12:00:00', 1, 2023);
INSERT INTO `classes` VALUES (19, 904, 34, 5, 'Thursday', '15:00:00', '16:00:00', 1, 2023);
INSERT INTO `classes` VALUES (20, 103, 24, 1, 'Monday', '14:00:00', '15:00:00', 3, 2024);
INSERT INTO `classes` VALUES (21, 103, 24, 1, 'Wednesday', '11:00:00', '12:00:00', 3, 2024);
INSERT INTO `classes` VALUES (22, 203, 25, 7, 'Tuesday', '14:00:00', '15:00:00', 3, 2024);
INSERT INTO `classes` VALUES (23, 203, 25, 14, 'Thursday', '14:00:00', '16:00:00', 3, 2024);
INSERT INTO `classes` VALUES (24, 303, 26, 3, 'Monday', '10:00:00', '11:00:00', 3, 2024);
INSERT INTO `classes` VALUES (25, 303, 14, 16, 'Friday', '14:00:00', '16:00:00', 3, 2024);

-- ----------------------------
-- Table structure for community_impact
-- ----------------------------
DROP TABLE IF EXISTS `community_impact`;
CREATE TABLE `community_impact`  (
  `impact_id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NULL DEFAULT NULL,
  `impact_date` date NULL DEFAULT NULL,
  `beneficiaries` int(11) NULL DEFAULT NULL,
  `impact_description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `metrics` json NULL,
  PRIMARY KEY (`impact_id`) USING BTREE,
  INDEX `fk_commimpact_prog`(`program_id`) USING BTREE,
  CONSTRAINT `fk_commimpact_prog` FOREIGN KEY (`program_id`) REFERENCES `outreach_programs` (`program_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of community_impact
-- ----------------------------
INSERT INTO `community_impact` VALUES (1, 1, '2024-01-15', 50, 'Successfully trained 50 village youth in basic computer operations (Word, Excel, Internet).', '{\"avg_satisfaction\": 4.2, \"participants_certified\": 45}');

-- ----------------------------
-- Table structure for community_partnerships
-- ----------------------------
DROP TABLE IF EXISTS `community_partnerships`;
CREATE TABLE `community_partnerships`  (
  `partnership_id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `contact_person` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `partnership_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `agreement_date` date NULL DEFAULT NULL,
  `terms` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`partnership_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of community_partnerships
-- ----------------------------
INSERT INTO `community_partnerships` VALUES (1, 'Rural Skill Development Trust', 'Mr. Ravi Prakash', 'ravi.p@rsdtrust.org', '8765432109', 'Skill Training', '2023-05-10', 'College provides space, Trust provides trainers for rural youth.');

-- ----------------------------
-- Table structure for companies
-- ----------------------------
DROP TABLE IF EXISTS `companies`;
CREATE TABLE `companies`  (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `contact_person` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `industry` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of companies
-- ----------------------------
INSERT INTO `companies` VALUES (1, 'Infosys Limited', 'Priya Singh', 'priya.singh@infosys.com', '9880011223', 'IT Services');
INSERT INTO `companies` VALUES (2, 'Tata Consultancy Services', 'Rahul Sharma', 'rahul.sharma@tcs.com', '9770022334', 'IT Services');
INSERT INTO `companies` VALUES (3, 'Wipro Limited', 'Anita Desai', 'anita.desai@wipro.com', '9660033445', 'IT Services');
INSERT INTO `companies` VALUES (4, 'Larsen & Toubro Construction', 'Vijay Kumar', 'vijay.kumar@lntecc.com', '9550044556', 'Construction');
INSERT INTO `companies` VALUES (5, 'Mahindra & Mahindra Ltd.', 'Sunil Gupta', 'sunil.gupta@mahindra.com', '9440055667', 'Automotive');
INSERT INTO `companies` VALUES (6, 'HDFC Bank', 'Meena Krishnan', 'meena.krishnan@hdfcbank.com', '9330066778', 'Banking');
INSERT INTO `companies` VALUES (7, 'Reliance Industries Limited', 'Amit Patel', 'amit.patel@ril.com', '9220077889', 'Conglomerate');
INSERT INTO `companies` VALUES (8, 'Apollo Hospitals Enterprise Ltd.', 'Deepa Nair', 'deepa.nair@apollohospitals.com', '9110088990', 'Healthcare');
INSERT INTO `companies` VALUES (9, 'Accenture Solutions Pvt Ltd', 'Geetha Murthy', 'geetha.murthy@accenture.com', '9845012345', 'IT Consulting');
INSERT INTO `companies` VALUES (10, 'Cognizant Technology Solutions', 'Rajiv Mehta', 'rajiv.mehta@cognizant.com', '9840054321', 'IT Services');

-- ----------------------------
-- Table structure for company_feedback
-- ----------------------------
DROP TABLE IF EXISTS `company_feedback`;
CREATE TABLE `company_feedback`  (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `feedback_text` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `rating` int(11) NULL DEFAULT NULL,
  `feedback_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`feedback_id`) USING BTREE,
  INDEX `fk_compfeed_job`(`job_id`) USING BTREE,
  INDEX `fk_compfeed_student`(`student_id`) USING BTREE,
  CONSTRAINT `fk_compfeed_job` FOREIGN KEY (`job_id`) REFERENCES `job_postings` (`job_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_compfeed_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of company_feedback
-- ----------------------------
INSERT INTO `company_feedback` VALUES (1, 1, 11008, 'Isha Singh was selected as Systems Engineer Trainee. Good performance during training.', 4, '2024-12-15');

-- ----------------------------
-- Table structure for compliance_records
-- ----------------------------
DROP TABLE IF EXISTS `compliance_records`;
CREATE TABLE `compliance_records`  (
  `compliance_id` int(11) NOT NULL AUTO_INCREMENT,
  `standard_id` int(11) NULL DEFAULT NULL,
  `department_id` int(11) NULL DEFAULT NULL,
  `compliance_status` enum('Compliant','Non-Compliant','In Progress') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `evidence` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `last_reviewed` date NULL DEFAULT NULL,
  PRIMARY KEY (`compliance_id`) USING BTREE,
  INDEX `fk_comp_std`(`standard_id`) USING BTREE,
  INDEX `fk_comp_dept`(`department_id`) USING BTREE,
  CONSTRAINT `fk_comp_dept` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_comp_std` FOREIGN KEY (`standard_id`) REFERENCES `accreditation_standards` (`standard_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of compliance_records
-- ----------------------------
INSERT INTO `compliance_records` VALUES (1, 1, 1, 'Compliant', 'Vision/Mission statements published on website and dept notice boards. PEOs defined.', '2024-01-15');
INSERT INTO `compliance_records` VALUES (2, 2, 1, 'Compliant', 'Curriculum structure, syllabus copies, teaching plans available. CO-PO mapping done.', '2024-02-20');
INSERT INTO `compliance_records` VALUES (3, 4, NULL, 'In Progress', 'Preparing IQAC report data collection.', '2024-07-01');
INSERT INTO `compliance_records` VALUES (4, 5, NULL, 'Compliant', 'IQAC reports, Feedback analysis, Research metrics submitted.', '2024-06-15');

-- ----------------------------
-- Table structure for concessions
-- ----------------------------
DROP TABLE IF EXISTS `concessions`;
CREATE TABLE `concessions`  (
  `concession_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `invoice_id` int(11) NULL DEFAULT NULL,
  `concession_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `concession_amount` decimal(10, 2) NULL DEFAULT NULL,
  `approved_by` int(11) NULL DEFAULT NULL,
  `approval_date` date NULL DEFAULT NULL,
  `reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `is_adjusted_in_fees` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`concession_id`) USING BTREE,
  INDEX `fk_concession_student`(`student_id`) USING BTREE,
  INDEX `fk_concession_user`(`approved_by`) USING BTREE,
  INDEX `fk_concession_invoice`(`invoice_id`) USING BTREE,
  CONSTRAINT `fk_concession_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `fee_invoices` (`invoice_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_concession_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_concession_user` FOREIGN KEY (`approved_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of concessions
-- ----------------------------
INSERT INTO `concessions` VALUES (1, 11011, 5, 'Sibling Concession', 10000.00, 1, '2024-01-15', 'Sibling also studying in college.', 1);

-- ----------------------------
-- Table structure for counseling_sessions
-- ----------------------------
DROP TABLE IF EXISTS `counseling_sessions`;
CREATE TABLE `counseling_sessions`  (
  `session_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `counselor_id` int(11) NULL DEFAULT NULL,
  `session_date` date NULL DEFAULT NULL,
  `notes` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `follow_up_date` date NULL DEFAULT NULL,
  `session_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`session_id`) USING BTREE,
  INDEX `fk_counsel_student`(`student_id`) USING BTREE,
  INDEX `fk_counsel_staff`(`counselor_id`) USING BTREE,
  CONSTRAINT `fk_counsel_staff` FOREIGN KEY (`counselor_id`) REFERENCES `staff` (`staff_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_counsel_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of counseling_sessions
-- ----------------------------
INSERT INTO `counseling_sessions` VALUES (1, 11013, 8, '2024-03-01', 'Discussed academic pressure and time management. Student seems stressed. Suggested relaxation techniques.', '2024-03-15', 'Academic');
INSERT INTO `counseling_sessions` VALUES (2, 11005, 8, '2024-02-20', 'Homesickness and adjustment issues. Talked about joining clubs and activities.', '2024-03-05', 'Personal');
INSERT INTO `counseling_sessions` VALUES (3, 11010, 20, '2024-05-10', 'Career guidance session, explored options in VLSI field.', NULL, 'Career');

-- ----------------------------
-- Table structure for course_faculty
-- ----------------------------
DROP TABLE IF EXISTS `course_faculty`;
CREATE TABLE `course_faculty`  (
  `course_id` int(11) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`course_id`, `faculty_id`, `semester`, `year`) USING BTREE,
  INDEX `fk_coursefac_faculty`(`faculty_id`) USING BTREE,
  CONSTRAINT `fk_coursefac_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_coursefac_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course_faculty
-- ----------------------------
INSERT INTO `course_faculty` VALUES (101, 1, 1, 2023);
INSERT INTO `course_faculty` VALUES (201, 2, 1, 2023);
INSERT INTO `course_faculty` VALUES (901, 8, 1, 2023);
INSERT INTO `course_faculty` VALUES (101, 12, 1, 2023);
INSERT INTO `course_faculty` VALUES (201, 13, 1, 2023);
INSERT INTO `course_faculty` VALUES (901, 19, 1, 2023);
INSERT INTO `course_faculty` VALUES (103, 24, 3, 2024);
INSERT INTO `course_faculty` VALUES (203, 25, 3, 2024);

-- ----------------------------
-- Table structure for course_materials
-- ----------------------------
DROP TABLE IF EXISTS `course_materials`;
CREATE TABLE `course_materials`  (
  `material_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `file_path` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `upload_date` date NULL DEFAULT NULL,
  `uploaded_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`material_id`) USING BTREE,
  INDEX `fk_coursemat_course`(`course_id`) USING BTREE,
  INDEX `fk_coursemat_faculty`(`uploaded_by`) USING BTREE,
  CONSTRAINT `fk_coursemat_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_coursemat_faculty` FOREIGN KEY (`uploaded_by`) REFERENCES `faculty` (`faculty_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course_materials
-- ----------------------------
INSERT INTO `course_materials` VALUES (1, 101, 'Module 1 Notes - Introduction to C', 'PDF notes covering basic syntax, variables, data types.', '/materials/cs101/mod1_notes.pdf', '2023-08-10', 101);
INSERT INTO `course_materials` VALUES (2, 101, 'Lecture Slides - Week 1', 'PPT slides for the first week.', '/materials/cs101/week1_slides.ppt', '2023-08-08', 101);
INSERT INTO `course_materials` VALUES (3, 103, 'Complexity Analysis Examples', 'Solved problems on Big-O notation.', '/materials/cs201/complexity_examples.pdf', '2024-02-15', 24);

-- ----------------------------
-- Table structure for course_prerequisites
-- ----------------------------
DROP TABLE IF EXISTS `course_prerequisites`;
CREATE TABLE `course_prerequisites`  (
  `prerequisite_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NULL DEFAULT NULL,
  `prerequisite_course_id` int(11) NULL DEFAULT NULL,
  `minimum_grade` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`prerequisite_id`) USING BTREE,
  INDEX `fk_prereq_course`(`course_id`) USING BTREE,
  INDEX `fk_prereq_prereqcourse`(`prerequisite_course_id`) USING BTREE,
  CONSTRAINT `fk_prereq_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_prereq_prereqcourse` FOREIGN KEY (`prerequisite_course_id`) REFERENCES `courses` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course_prerequisites
-- ----------------------------
INSERT INTO `course_prerequisites` VALUES (1, 102, 101, 'P');
INSERT INTO `course_prerequisites` VALUES (2, 103, 102, 'C');
INSERT INTO `course_prerequisites` VALUES (3, 203, 201, 'P');
INSERT INTO `course_prerequisites` VALUES (4, 105, 102, 'C');

-- ----------------------------
-- Table structure for courses
-- ----------------------------
DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses`  (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_code` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `course_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `credits` int(11) NULL DEFAULT NULL,
  `program_id` int(11) NULL DEFAULT NULL,
  `semester` int(11) NULL DEFAULT NULL,
  `course_level` enum('Beginner','Intermediate','Advanced') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`course_id`) USING BTREE,
  INDEX `fk_course_program`(`program_id`) USING BTREE,
  CONSTRAINT `fk_course_program` FOREIGN KEY (`program_id`) REFERENCES `programs` (`program_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 909 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of courses
-- ----------------------------
INSERT INTO `courses` VALUES (101, 'CS101', 'Introduction to Programming', 4, 1, 1, 'Beginner');
INSERT INTO `courses` VALUES (102, 'CS102', 'Data Structures', 4, 1, 2, 'Beginner');
INSERT INTO `courses` VALUES (103, 'CS201', 'Algorithms', 4, 1, 3, 'Intermediate');
INSERT INTO `courses` VALUES (104, 'CS202', 'Operating Systems', 4, 1, 4, 'Intermediate');
INSERT INTO `courses` VALUES (105, 'CS301', 'Database Management Systems', 4, 1, 5, 'Intermediate');
INSERT INTO `courses` VALUES (106, 'CS302', 'Computer Networks', 4, 1, 6, 'Intermediate');
INSERT INTO `courses` VALUES (107, 'CS401', 'Artificial Intelligence', 3, 1, 7, 'Advanced');
INSERT INTO `courses` VALUES (108, 'CS411', 'Machine Learning (Elective)', 3, 1, 7, 'Advanced');
INSERT INTO `courses` VALUES (109, 'CS451', 'Project Work - I', 2, 1, 7, 'Advanced');
INSERT INTO `courses` VALUES (110, 'CS452', 'Project Work - II', 6, 1, 8, 'Advanced');
INSERT INTO `courses` VALUES (201, 'EC101', 'Basic Electronics', 4, 2, 1, 'Beginner');
INSERT INTO `courses` VALUES (202, 'EC102', 'Digital Logic Design', 4, 2, 2, 'Beginner');
INSERT INTO `courses` VALUES (203, 'EC201', 'Analog Circuits', 4, 2, 3, 'Intermediate');
INSERT INTO `courses` VALUES (204, 'EC202', 'Signals and Systems', 4, 2, 4, 'Intermediate');
INSERT INTO `courses` VALUES (205, 'EC301', 'Communication Systems', 4, 2, 5, 'Intermediate');
INSERT INTO `courses` VALUES (206, 'EC302', 'Microprocessors & Microcontrollers', 4, 2, 6, 'Intermediate');
INSERT INTO `courses` VALUES (207, 'EC401', 'VLSI Design', 3, 2, 7, 'Advanced');
INSERT INTO `courses` VALUES (208, 'EC415', 'Embedded Systems (Elective)', 3, 2, 7, 'Advanced');
INSERT INTO `courses` VALUES (209, 'EC451', 'Project Work - I', 2, 2, 7, 'Advanced');
INSERT INTO `courses` VALUES (210, 'EC452', 'Project Work - II', 6, 2, 8, 'Advanced');
INSERT INTO `courses` VALUES (301, 'ME101', 'Engineering Mechanics', 4, 3, 1, 'Beginner');
INSERT INTO `courses` VALUES (302, 'ME102', 'Thermodynamics', 4, 3, 2, 'Beginner');
INSERT INTO `courses` VALUES (303, 'ME201', 'Fluid Mechanics', 4, 3, 3, 'Intermediate');
INSERT INTO `courses` VALUES (304, 'ME202', 'Manufacturing Processes', 4, 3, 4, 'Intermediate');
INSERT INTO `courses` VALUES (305, 'ME301', 'Heat Transfer', 4, 3, 5, 'Intermediate');
INSERT INTO `courses` VALUES (306, 'ME302', 'Machine Design', 4, 3, 6, 'Intermediate');
INSERT INTO `courses` VALUES (307, 'ME401', 'Finite Element Analysis', 3, 3, 7, 'Advanced');
INSERT INTO `courses` VALUES (308, 'ME418', 'Robotics (Elective)', 3, 3, 7, 'Advanced');
INSERT INTO `courses` VALUES (309, 'ME451', 'Project Work - I', 2, 3, 7, 'Advanced');
INSERT INTO `courses` VALUES (310, 'ME452', 'Project Work - II', 6, 3, 8, 'Advanced');
INSERT INTO `courses` VALUES (401, 'CE101', 'Surveying', 4, 4, 1, 'Beginner');
INSERT INTO `courses` VALUES (402, 'CE102', 'Building Materials', 4, 4, 2, 'Beginner');
INSERT INTO `courses` VALUES (403, 'CE201', 'Structural Analysis I', 4, 4, 3, 'Intermediate');
INSERT INTO `courses` VALUES (404, 'CE202', 'Geotechnical Engineering I', 4, 4, 4, 'Intermediate');
INSERT INTO `courses` VALUES (405, 'CE301', 'Transportation Engineering', 4, 4, 5, 'Intermediate');
INSERT INTO `courses` VALUES (406, 'CE302', 'Environmental Engineering', 4, 4, 6, 'Intermediate');
INSERT INTO `courses` VALUES (407, 'CE401', 'Construction Management', 3, 4, 7, 'Advanced');
INSERT INTO `courses` VALUES (408, 'CE420', 'Advanced Structural Design (Elective)', 3, 4, 7, 'Advanced');
INSERT INTO `courses` VALUES (409, 'CE451', 'Project Work - I', 2, 4, 7, 'Advanced');
INSERT INTO `courses` VALUES (410, 'CE452', 'Project Work - II', 6, 4, 8, 'Advanced');
INSERT INTO `courses` VALUES (501, 'EE101', 'Basic Electrical Engineering', 4, 5, 1, 'Beginner');
INSERT INTO `courses` VALUES (502, 'EE102', 'Network Theory', 4, 5, 2, 'Beginner');
INSERT INTO `courses` VALUES (503, 'EE201', 'Electrical Machines I', 4, 5, 3, 'Intermediate');
INSERT INTO `courses` VALUES (504, 'EE202', 'Power Systems I', 4, 5, 4, 'Intermediate');
INSERT INTO `courses` VALUES (505, 'EE301', 'Control Systems', 4, 5, 5, 'Intermediate');
INSERT INTO `courses` VALUES (506, 'EE302', 'Power Electronics', 4, 5, 6, 'Intermediate');
INSERT INTO `courses` VALUES (507, 'EE401', 'High Voltage Engineering', 3, 5, 7, 'Advanced');
INSERT INTO `courses` VALUES (508, 'EE422', 'Renewable Energy Systems (Elective)', 3, 5, 7, 'Advanced');
INSERT INTO `courses` VALUES (509, 'EE451', 'Project Work - I', 2, 5, 7, 'Advanced');
INSERT INTO `courses` VALUES (510, 'EE452', 'Project Work - II', 6, 5, 8, 'Advanced');
INSERT INTO `courses` VALUES (601, 'IT101', 'Web Technologies I', 4, 6, 1, 'Beginner');
INSERT INTO `courses` VALUES (602, 'IT102', 'Object Oriented Programming', 4, 6, 2, 'Beginner');
INSERT INTO `courses` VALUES (603, 'IT201', 'Software Engineering', 4, 6, 3, 'Intermediate');
INSERT INTO `courses` VALUES (604, 'IT202', 'Data Mining', 4, 6, 4, 'Intermediate');
INSERT INTO `courses` VALUES (605, 'IT301', 'Cloud Computing', 4, 6, 5, 'Intermediate');
INSERT INTO `courses` VALUES (606, 'IT302', 'Cyber Security', 4, 6, 6, 'Intermediate');
INSERT INTO `courses` VALUES (607, 'IT401', 'Big Data Analytics', 3, 6, 7, 'Advanced');
INSERT INTO `courses` VALUES (608, 'IT425', 'Mobile Application Development (Elective)', 3, 6, 7, 'Advanced');
INSERT INTO `courses` VALUES (609, 'IT451', 'Project Work - I', 2, 6, 7, 'Advanced');
INSERT INTO `courses` VALUES (610, 'IT452', 'Project Work - II', 6, 6, 8, 'Advanced');
INSERT INTO `courses` VALUES (701, 'MBA101', 'Principles of Management', 3, 7, 1, 'Beginner');
INSERT INTO `courses` VALUES (702, 'MBA102', 'Managerial Economics', 3, 7, 1, 'Beginner');
INSERT INTO `courses` VALUES (703, 'MBA103', 'Accounting for Managers', 3, 7, 1, 'Beginner');
INSERT INTO `courses` VALUES (704, 'MBA104', 'Marketing Management', 3, 7, 1, 'Beginner');
INSERT INTO `courses` VALUES (705, 'MBA201', 'Financial Management', 3, 7, 2, 'Intermediate');
INSERT INTO `courses` VALUES (706, 'MBA202', 'Human Resource Management', 3, 7, 2, 'Intermediate');
INSERT INTO `courses` VALUES (707, 'MBA203', 'Operations Management', 3, 7, 2, 'Intermediate');
INSERT INTO `courses` VALUES (708, 'MBA204', 'Business Research Methods', 3, 7, 2, 'Intermediate');
INSERT INTO `courses` VALUES (709, 'MBA301', 'Strategic Management', 3, 7, 3, 'Advanced');
INSERT INTO `courses` VALUES (710, 'MBA311', 'Investment Analysis (Finance Elective)', 3, 7, 3, 'Advanced');
INSERT INTO `courses` VALUES (711, 'MBA321', 'Digital Marketing (Marketing Elective)', 3, 7, 3, 'Advanced');
INSERT INTO `courses` VALUES (712, 'MBA451', 'Project Work', 6, 7, 4, 'Advanced');
INSERT INTO `courses` VALUES (901, 'MA101', 'Engineering Mathematics I', 4, NULL, 1, 'Beginner');
INSERT INTO `courses` VALUES (902, 'PH101', 'Engineering Physics', 4, NULL, 1, 'Beginner');
INSERT INTO `courses` VALUES (903, 'CY101', 'Engineering Chemistry', 4, NULL, 1, 'Beginner');
INSERT INTO `courses` VALUES (904, 'HS101', 'Communication Skills', 3, NULL, 1, 'Beginner');
INSERT INTO `courses` VALUES (905, 'MA102', 'Engineering Mathematics II', 4, NULL, 2, 'Beginner');
INSERT INTO `courses` VALUES (906, 'PH102', 'Physics Lab', 1, NULL, 2, 'Beginner');
INSERT INTO `courses` VALUES (907, 'CY102', 'Chemistry Lab', 1, NULL, 2, 'Beginner');
INSERT INTO `courses` VALUES (908, 'HS102', 'Environmental Science', 3, NULL, 2, 'Beginner');

-- ----------------------------
-- Table structure for credit_transfers
-- ----------------------------
DROP TABLE IF EXISTS `credit_transfers`;
CREATE TABLE `credit_transfers`  (
  `transfer_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `exchange_course_id` int(11) NULL DEFAULT NULL,
  `home_course_id` int(11) NULL DEFAULT NULL,
  `transfer_status` enum('Pending','Approved','Rejected') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `transfer_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`transfer_id`) USING BTREE,
  INDEX `fk_credtrans_student`(`student_id`) USING BTREE,
  INDEX `fk_credtrans_exchcourse`(`exchange_course_id`) USING BTREE,
  INDEX `fk_credtrans_homecourse`(`home_course_id`) USING BTREE,
  CONSTRAINT `fk_credtrans_exchcourse` FOREIGN KEY (`exchange_course_id`) REFERENCES `exchange_courses` (`exchange_course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_credtrans_homecourse` FOREIGN KEY (`home_course_id`) REFERENCES `courses` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_credtrans_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of credit_transfers
-- ----------------------------
INSERT INTO `credit_transfers` VALUES (1, 11001, 1, 603, 'Approved', '2025-01-15');
INSERT INTO `credit_transfers` VALUES (2, 11001, 2, 103, 'Approved', '2025-01-15');

-- ----------------------------
-- Table structure for cultural_exchange_programs
-- ----------------------------
DROP TABLE IF EXISTS `cultural_exchange_programs`;
CREATE TABLE `cultural_exchange_programs`  (
  `program_id` int(11) NOT NULL AUTO_INCREMENT,
  `agreement_id` int(11) NULL DEFAULT NULL,
  `program_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`program_id`) USING BTREE,
  INDEX `fk_cultex_agree`(`agreement_id`) USING BTREE,
  CONSTRAINT `fk_cultex_agree` FOREIGN KEY (`agreement_id`) REFERENCES `exchange_agreements` (`agreement_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cultural_exchange_programs
-- ----------------------------
INSERT INTO `cultural_exchange_programs` VALUES (1, 2, 'Indo-German Summer School on Renewables', '2024-06-10', '2024-06-24', 'Joint summer school program held at TUM, Germany focused on renewable energy tech.');

-- ----------------------------
-- Table structure for cultural_program_participants
-- ----------------------------
DROP TABLE IF EXISTS `cultural_program_participants`;
CREATE TABLE `cultural_program_participants`  (
  `participant_id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `participation_date` date NULL DEFAULT NULL,
  `feedback` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`participant_id`) USING BTREE,
  INDEX `fk_cultpart_prog`(`program_id`) USING BTREE,
  INDEX `fk_cultpart_student`(`student_id`) USING BTREE,
  CONSTRAINT `fk_cultpart_prog` FOREIGN KEY (`program_id`) REFERENCES `cultural_exchange_programs` (`program_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cultpart_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cultural_program_participants
-- ----------------------------
INSERT INTO `cultural_program_participants` VALUES (1, 1, 11005, '2024-06-25', 'Excellent program, learned a lot about German culture and technology.');

-- ----------------------------
-- Table structure for curriculum_revisions
-- ----------------------------
DROP TABLE IF EXISTS `curriculum_revisions`;
CREATE TABLE `curriculum_revisions`  (
  `revision_id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NULL DEFAULT NULL,
  `revision_date` date NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `proposed_by` int(11) NULL DEFAULT NULL,
  `status` enum('Proposed','Approved','Implemented') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`revision_id`) USING BTREE,
  INDEX `fk_currrev_program`(`program_id`) USING BTREE,
  INDEX `fk_currrev_faculty`(`proposed_by`) USING BTREE,
  CONSTRAINT `fk_currrev_faculty` FOREIGN KEY (`proposed_by`) REFERENCES `faculty` (`faculty_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_currrev_program` FOREIGN KEY (`program_id`) REFERENCES `programs` (`program_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of curriculum_revisions
-- ----------------------------
INSERT INTO `curriculum_revisions` VALUES (1, 1, '2024-05-10', 'Introduced new elective CS411 Machine Learning for AY 2024-25. Minor changes to CS302 syllabus.', 24, 'Approved');

-- ----------------------------
-- Table structure for custom_reports
-- ----------------------------
DROP TABLE IF EXISTS `custom_reports`;
CREATE TABLE `custom_reports`  (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `query_text` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `created_date` date NULL DEFAULT NULL,
  `schedule` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`report_id`) USING BTREE,
  INDEX `fk_report_user`(`created_by`) USING BTREE,
  CONSTRAINT `fk_report_user` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of custom_reports
-- ----------------------------
INSERT INTO `custom_reports` VALUES (1, 'CSE 1st Year Attendance Defaulters', 24, 'SELECT s.student_id, s.first_name, s.last_name, COUNT(*) as absent_count FROM attendance a JOIN students s ON a.student_id = s.student_id WHERE a.status=\'Absent\' AND s.program_id=1 AND [semester/year criteria] GROUP BY a.student_id HAVING absent_count > 10;', '2024-04-01', 'Monthly');
INSERT INTO `custom_reports` VALUES (2, 'Library Fine Collection Report', 203, 'SELECT SUM(fine_amount) FROM library_fines WHERE payment_status=\'Paid\' AND payment_date BETWEEN \'start_date\' AND \'end_date\';', '2024-01-15', 'Quarterly');

-- ----------------------------
-- Table structure for dashboard_widgets
-- ----------------------------
DROP TABLE IF EXISTS `dashboard_widgets`;
CREATE TABLE `dashboard_widgets`  (
  `widget_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `widget_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `widget_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `data_source` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `position` int(11) NULL DEFAULT NULL,
  `customization` json NULL,
  PRIMARY KEY (`widget_id`) USING BTREE,
  INDEX `fk_widget_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_widget_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dashboard_widgets
-- ----------------------------
INSERT INTO `dashboard_widgets` VALUES (1, 101, 'My Upcoming Classes', 'Timetable Snippet', 'classes', 1, '{\"days\": 1}');
INSERT INTO `dashboard_widgets` VALUES (2, 101, 'Pending Assignment Gradings', 'Count', 'assignment_submissions', 2, '{\"status\": \"Submitted\"}');
INSERT INTO `dashboard_widgets` VALUES (3, 11001, 'My Attendance %', 'Gauge', 'attendance', 1, '{\"course_id\": \"current\"}');

-- ----------------------------
-- Table structure for data_exports
-- ----------------------------
DROP TABLE IF EXISTS `data_exports`;
CREATE TABLE `data_exports`  (
  `export_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `export_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `table_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `export_date` datetime NULL DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`export_id`) USING BTREE,
  INDEX `fk_export_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_export_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of data_exports
-- ----------------------------
INSERT INTO `data_exports` VALUES (1, 1, 'CSV', 'students', '2024-07-15 10:00:00', '/exports/students_20240715.csv');
INSERT INTO `data_exports` VALUES (2, 201, 'Excel', 'fee_payments', '2024-06-30 17:00:00', '/exports/payments_jun2024.xlsx');

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments`  (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `head_of_department` int(11) NULL DEFAULT NULL,
  `establishment_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`department_id`) USING BTREE,
  INDEX `fk_dept_hod`(`head_of_department`) USING BTREE,
  CONSTRAINT `fk_dept_hod` FOREIGN KEY (`head_of_department`) REFERENCES `faculty` (`faculty_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES (1, 'Computer Science & Engineering', 24, '2005-08-15');
INSERT INTO `departments` VALUES (2, 'Electronics & Communication Engineering', 25, '2005-08-15');
INSERT INTO `departments` VALUES (3, 'Mechanical Engineering', 26, '2006-07-01');
INSERT INTO `departments` VALUES (4, 'Civil Engineering', 27, '2007-07-10');
INSERT INTO `departments` VALUES (5, 'Electrical & Electronics Engineering', 28, '2008-06-20');
INSERT INTO `departments` VALUES (6, 'Information Technology', 29, '2010-08-01');
INSERT INTO `departments` VALUES (7, 'Business Administration', 30, '2012-07-15');
INSERT INTO `departments` VALUES (8, 'Mathematics', 31, '2005-08-15');
INSERT INTO `departments` VALUES (9, 'Physics', 32, '2005-08-15');
INSERT INTO `departments` VALUES (10, 'Chemistry', 33, '2005-08-15');
INSERT INTO `departments` VALUES (11, 'Humanities & Social Sciences', 34, '2007-08-20');
INSERT INTO `departments` VALUES (12, 'Library', 3, '2005-08-01');
INSERT INTO `departments` VALUES (13, 'Administration', 21, '2005-08-01');
INSERT INTO `departments` VALUES (14, 'Accounts', 1, '2005-08-01');
INSERT INTO `departments` VALUES (15, 'Student Welfare', 8, '2010-01-10');
INSERT INTO `departments` VALUES (16, 'Transport', 7, '2008-05-01');
INSERT INTO `departments` VALUES (17, 'Hostel Administration', 22, '2006-09-01');
INSERT INTO `departments` VALUES (18, 'Placement Cell', 23, '2009-04-01');
INSERT INTO `departments` VALUES (19, 'Security', 6, '2005-08-01');

-- ----------------------------
-- Table structure for digital_signatures
-- ----------------------------
DROP TABLE IF EXISTS `digital_signatures`;
CREATE TABLE `digital_signatures`  (
  `signature_id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) NULL DEFAULT NULL,
  `signer_id` int(11) NULL DEFAULT NULL,
  `signature_data` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `signed_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`signature_id`) USING BTREE,
  INDEX `fk_digsig_issue`(`issue_id`) USING BTREE,
  INDEX `fk_digsig_user`(`signer_id`) USING BTREE,
  CONSTRAINT `fk_digsig_issue` FOREIGN KEY (`issue_id`) REFERENCES `certificate_issues` (`issue_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_digsig_user` FOREIGN KEY (`signer_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of digital_signatures
-- ----------------------------
INSERT INTO `digital_signatures` VALUES (1, 1, 202, '[ENCRYPTED SIGNATURE DATA FOR BONA/2024/101 BY STAFF 202]', '2024-06-22');
INSERT INTO `digital_signatures` VALUES (2, 2, 2, '[ENCRYPTED SIGNATURE DATA FOR TC/2024/055 BY PRINCIPAL USER 2]', '2024-06-05');

-- ----------------------------
-- Table structure for disciplinary_records
-- ----------------------------
DROP TABLE IF EXISTS `disciplinary_records`;
CREATE TABLE `disciplinary_records`  (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `incident_date` date NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `action_taken` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `reported_by` int(11) NULL DEFAULT NULL,
  `resolution_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE,
  INDEX `fk_discipline_student`(`student_id`) USING BTREE,
  INDEX `fk_discipline_user`(`reported_by`) USING BTREE,
  CONSTRAINT `fk_discipline_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_discipline_user` FOREIGN KEY (`reported_by`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of disciplinary_records
-- ----------------------------
INSERT INTO `disciplinary_records` VALUES (1, 11013, '2024-02-15', 'Involved in ragging incident in hostel.', 'Suspended for 1 semester.', 22, '2024-02-20');
INSERT INTO `disciplinary_records` VALUES (2, 11009, '2023-11-10', 'Caught attempting malpractice during Midterm exam.', 'Zero marks awarded for the exam. Warning issued.', 103, '2023-11-12');

-- ----------------------------
-- Table structure for discussion_posts
-- ----------------------------
DROP TABLE IF EXISTS `discussion_posts`;
CREATE TABLE `discussion_posts`  (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `thread_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `post_text` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `post_date` datetime NULL DEFAULT NULL,
  `likes` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`post_id`) USING BTREE,
  INDEX `fk_post_thread`(`thread_id`) USING BTREE,
  INDEX `fk_post_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_post_thread` FOREIGN KEY (`thread_id`) REFERENCES `discussion_threads` (`thread_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_post_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of discussion_posts
-- ----------------------------
INSERT INTO `discussion_posts` VALUES (1, 1, 101, 'Please refer to the lecture notes section 5.2. Pointers store memory addresses.', '2023-09-11 09:30:00', 2);
INSERT INTO `discussion_posts` VALUES (2, 1, 11016, 'Make sure you handle the null pointer case carefully.', '2023-09-11 10:15:00', 1);
INSERT INTO `discussion_posts` VALUES (3, 2, 24, 'Good question. Recursive complexity often involves solving recurrence relations. Check the examples provided.', '2024-03-02 11:00:00', 3);

-- ----------------------------
-- Table structure for discussion_threads
-- ----------------------------
DROP TABLE IF EXISTS `discussion_threads`;
CREATE TABLE `discussion_threads`  (
  `thread_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`thread_id`) USING BTREE,
  INDEX `fk_thread_course`(`course_id`) USING BTREE,
  INDEX `fk_thread_user`(`created_by`) USING BTREE,
  CONSTRAINT `fk_thread_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_thread_user` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of discussion_threads
-- ----------------------------
INSERT INTO `discussion_threads` VALUES (1, 101, 'Doubt regarding pointers in Assignment 1', 11001, '2023-09-10');
INSERT INTO `discussion_threads` VALUES (2, 103, 'Complexity of recursive algorithms - clarification', 11009, '2024-03-01');

-- ----------------------------
-- Table structure for donations
-- ----------------------------
DROP TABLE IF EXISTS `donations`;
CREATE TABLE `donations`  (
  `donation_id` int(11) NOT NULL AUTO_INCREMENT,
  `alumni_id` int(11) NULL DEFAULT NULL,
  `donation_amount` decimal(15, 2) NULL DEFAULT NULL,
  `donation_date` date NULL DEFAULT NULL,
  `purpose` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `payment_method` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`donation_id`) USING BTREE,
  INDEX `fk_donation_alumni`(`alumni_id`) USING BTREE,
  CONSTRAINT `fk_donation_alumni` FOREIGN KEY (`alumni_id`) REFERENCES `alumni` (`alumni_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of donations
-- ----------------------------
INSERT INTO `donations` VALUES (1, 1, 5000.00, '2024-07-10', 'Contribution towards Student Welfare Fund.', 'UPI');

-- ----------------------------
-- Table structure for donor_contributions
-- ----------------------------
DROP TABLE IF EXISTS `donor_contributions`;
CREATE TABLE `donor_contributions`  (
  `contribution_id` int(11) NOT NULL AUTO_INCREMENT,
  `sponsor_link_id` int(11) NULL DEFAULT NULL,
  `donor_name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `amount` decimal(15, 2) NULL DEFAULT NULL,
  `contribution_date` date NULL DEFAULT NULL,
  `purpose` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `acknowledgment_sent` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`contribution_id`) USING BTREE,
  INDEX `fk_donor_sponsor`(`sponsor_link_id`) USING BTREE,
  CONSTRAINT `fk_donor_sponsor` FOREIGN KEY (`sponsor_link_id`) REFERENCES `sponsors` (`sponsor_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of donor_contributions
-- ----------------------------
INSERT INTO `donor_contributions` VALUES (1, 1, 'Infosys Foundation Trust', 50000.00, '2023-08-10', 'Support for Merit Scholarships', 1);
INSERT INTO `donor_contributions` VALUES (2, 2, 'Anonymous Donor (via Tata Trusts)', 100000.00, '2024-01-15', 'Library Infrastructure Development', 1);

-- ----------------------------
-- Table structure for e_resources
-- ----------------------------
DROP TABLE IF EXISTS `e_resources`;
CREATE TABLE `e_resources`  (
  `resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `resource_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `access_level` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `upload_date` date NULL DEFAULT NULL,
  `license_expiry` date NULL DEFAULT NULL,
  PRIMARY KEY (`resource_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of e_resources
-- ----------------------------
INSERT INTO `e_resources` VALUES (1, 'IEEE Xplore Digital Library', 'Database Subscription', 'https://ieeexplore.ieee.org', 'Faculty,Student', '2023-01-01', '2024-12-31');
INSERT INTO `e_resources` VALUES (2, 'Springer E-Books Collection (Engineering)', 'E-Book Collection', 'https://link.springer.com/search?facet-content-type=%22Book%22', 'All', '2022-08-01', NULL);
INSERT INTO `e_resources` VALUES (3, 'NPTEL Video Lectures - Computer Science', 'Video Lecture Series', 'https://nptel.ac.in/courses/106/', 'All', NULL, NULL);

-- ----------------------------
-- Table structure for email_campaigns
-- ----------------------------
DROP TABLE IF EXISTS `email_campaigns`;
CREATE TABLE `email_campaigns`  (
  `campaign_id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `subject` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `body` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `sent_date` date NULL DEFAULT NULL,
  `target_group` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `open_rate` decimal(5, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`campaign_id`) USING BTREE,
  INDEX `fk_emailcamp_role`(`target_group`) USING BTREE,
  CONSTRAINT `fk_emailcamp_role` FOREIGN KEY (`target_group`) REFERENCES `roles` (`role_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of email_campaigns
-- ----------------------------
INSERT INTO `email_campaigns` VALUES (1, 'Placement Drive Reminder July 2024', 'Upcoming Placement Drives - July/August', 'Dear Students, Please check the placement portal for upcoming drive schedules...', '2024-07-18', 'Student', NULL);
INSERT INTO `email_campaigns` VALUES (2, 'Alumni Meet 2024 Invitation', 'Invitation: Grand Alumni Meet 2024', 'Dear Alumni, You are cordially invited to the Annual Alumni Meet...', '2024-11-01', 'Alumni', NULL);

-- ----------------------------
-- Table structure for emergency_drills
-- ----------------------------
DROP TABLE IF EXISTS `emergency_drills`;
CREATE TABLE `emergency_drills`  (
  `drill_id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) NULL DEFAULT NULL,
  `drill_date` date NULL DEFAULT NULL,
  `outcome` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `participants` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`drill_id`) USING BTREE,
  INDEX `fk_emerdrill_plan`(`plan_id`) USING BTREE,
  CONSTRAINT `fk_emerdrill_plan` FOREIGN KEY (`plan_id`) REFERENCES `emergency_response_plans` (`plan_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of emergency_drills
-- ----------------------------
INSERT INTO `emergency_drills` VALUES (1, 1, '2024-04-25', 'Successful evacuation of Block A completed in 7 minutes. Some confusion noted on Floor 2 assembly point.', 450);

-- ----------------------------
-- Table structure for emergency_response_plans
-- ----------------------------
DROP TABLE IF EXISTS `emergency_response_plans`;
CREATE TABLE `emergency_response_plans`  (
  `plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `last_updated` date NULL DEFAULT NULL,
  `responsible_person` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`plan_id`) USING BTREE,
  INDEX `fk_emerplan_staff`(`responsible_person`) USING BTREE,
  CONSTRAINT `fk_emerplan_staff` FOREIGN KEY (`responsible_person`) REFERENCES `staff` (`staff_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of emergency_response_plans
-- ----------------------------
INSERT INTO `emergency_response_plans` VALUES (1, 'Fire Evacuation Plan - Academic Block A', 'Detailed plan for evacuation in case of fire in Block A.', '2023-11-15', 6);
INSERT INTO `emergency_response_plans` VALUES (2, 'Medical Emergency Response Plan', 'Procedure for handling medical emergencies on campus.', '2024-01-20', 8);

-- ----------------------------
-- Table structure for employer_feedback
-- ----------------------------
DROP TABLE IF EXISTS `employer_feedback`;
CREATE TABLE `employer_feedback`  (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `internship_id` int(11) NULL DEFAULT NULL,
  `feedback_text` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `rating` int(11) NULL DEFAULT NULL,
  `feedback_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`feedback_id`) USING BTREE,
  INDEX `fk_empfeed_intern`(`internship_id`) USING BTREE,
  CONSTRAINT `fk_empfeed_intern` FOREIGN KEY (`internship_id`) REFERENCES `internships` (`internship_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of employer_feedback
-- ----------------------------
INSERT INTO `employer_feedback` VALUES (1, 1, 'Isha was a quick learner and valuable contributor to the team project. Good technical skills.', 4, '2023-12-05');

-- ----------------------------
-- Table structure for energy_usage
-- ----------------------------
DROP TABLE IF EXISTS `energy_usage`;
CREATE TABLE `energy_usage`  (
  `usage_id` int(11) NOT NULL AUTO_INCREMENT,
  `building` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `usage_date` date NULL DEFAULT NULL,
  `electricity_kwh` decimal(10, 2) NULL DEFAULT NULL,
  `water_m3` decimal(10, 2) NULL DEFAULT NULL,
  `cost` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`usage_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of energy_usage
-- ----------------------------
INSERT INTO `energy_usage` VALUES (1, 'Academic Block A', '2024-06-30', 5500.50, 120.00, 45000.00);
INSERT INTO `energy_usage` VALUES (2, 'Hostel Block H1', '2024-06-30', 8200.00, 250.00, 68000.00);
INSERT INTO `energy_usage` VALUES (3, 'Library', '2024-06-30', 1500.75, 30.00, 12000.00);

-- ----------------------------
-- Table structure for entrance_exam_results
-- ----------------------------
DROP TABLE IF EXISTS `entrance_exam_results`;
CREATE TABLE `entrance_exam_results`  (
  `result_id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NULL DEFAULT NULL,
  `exam_id` int(11) NULL DEFAULT NULL,
  `score` int(11) NULL DEFAULT NULL,
  `result_date` date NULL DEFAULT NULL,
  `rank` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`result_id`) USING BTREE,
  INDEX `fk_examres_app`(`application_id`) USING BTREE,
  INDEX `fk_examres_exam`(`exam_id`) USING BTREE,
  CONSTRAINT `fk_examres_app` FOREIGN KEY (`application_id`) REFERENCES `applications` (`application_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_examres_exam` FOREIGN KEY (`exam_id`) REFERENCES `entrance_exams` (`exam_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of entrance_exam_results
-- ----------------------------
INSERT INTO `entrance_exam_results` VALUES (1, 1, 1, 145, '2024-06-25', 150);
INSERT INTO `entrance_exam_results` VALUES (2, 2, 1, 160, '2024-06-25', 80);
INSERT INTO `entrance_exam_results` VALUES (3, 3, 1, 75, '2024-06-25', 1205);
INSERT INTO `entrance_exam_results` VALUES (4, 4, 1, 130, '2024-06-25', 310);
INSERT INTO `entrance_exam_results` VALUES (5, 5, 2, 110, '2024-06-05', 45);

-- ----------------------------
-- Table structure for entrance_exams
-- ----------------------------
DROP TABLE IF EXISTS `entrance_exams`;
CREATE TABLE `entrance_exams`  (
  `exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `exam_date` date NULL DEFAULT NULL,
  `max_score` int(11) NULL DEFAULT NULL,
  `passing_score` int(11) NULL DEFAULT NULL,
  `registration_deadline` date NULL DEFAULT NULL,
  PRIMARY KEY (`exam_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of entrance_exams
-- ----------------------------
INSERT INTO `entrance_exams` VALUES (1, 'College Common Entrance Test (CET) 2024', '2024-06-15', 200, 80, '2024-05-31');
INSERT INTO `entrance_exams` VALUES (2, 'MBA Entrance Test 2024', '2024-05-25', 150, 75, '2024-05-01');

-- ----------------------------
-- Table structure for event_budgets
-- ----------------------------
DROP TABLE IF EXISTS `event_budgets`;
CREATE TABLE `event_budgets`  (
  `budget_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NULL DEFAULT NULL,
  `total_budget` decimal(15, 2) NULL DEFAULT NULL,
  `allocated_amount` decimal(15, 2) NULL DEFAULT NULL,
  `spent_amount` decimal(15, 2) NULL DEFAULT NULL,
  `budget_approved_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`budget_id`) USING BTREE,
  INDEX `fk_eventbudg_event`(`event_id`) USING BTREE,
  INDEX `fk_eventbudg_user`(`budget_approved_by`) USING BTREE,
  CONSTRAINT `fk_eventbudg_event` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_eventbudg_user` FOREIGN KEY (`budget_approved_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of event_budgets
-- ----------------------------
INSERT INTO `event_budgets` VALUES (1, 1, 300000.00, 280000.00, 275000.00, 2);
INSERT INTO `event_budgets` VALUES (2, 3, 15000.00, 15000.00, 12000.00, 24);

-- ----------------------------
-- Table structure for event_live_streams
-- ----------------------------
DROP TABLE IF EXISTS `event_live_streams`;
CREATE TABLE `event_live_streams`  (
  `stream_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NULL DEFAULT NULL,
  `stream_url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `start_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `recorded_url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`stream_id`) USING BTREE,
  INDEX `fk_eventls_event`(`event_id`) USING BTREE,
  CONSTRAINT `fk_eventls_event` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of event_live_streams
-- ----------------------------
INSERT INTO `event_live_streams` VALUES (1, 1, 'https://youtube.com/live/stream_techfest24?abc=123', '2024-03-15 09:30:00', '2024-03-15 17:00:00', 'https://youtube.com/watch?v=rec_techfest24');
INSERT INTO `event_live_streams` VALUES (2, 6, 'https://teams.microsoft.com/live/aitrendslecture', '2024-10-15 11:00:00', '2024-10-15 13:00:00', NULL);

-- ----------------------------
-- Table structure for event_registrations
-- ----------------------------
DROP TABLE IF EXISTS `event_registrations`;
CREATE TABLE `event_registrations`  (
  `registration_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `registration_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`registration_id`) USING BTREE,
  INDEX `fk_eventreg_event`(`event_id`) USING BTREE,
  INDEX `fk_eventreg_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_eventreg_event` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_eventreg_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of event_registrations
-- ----------------------------
INSERT INTO `event_registrations` VALUES (1, 3, 11001, '2024-09-01');
INSERT INTO `event_registrations` VALUES (2, 3, 11005, '2024-09-02');
INSERT INTO `event_registrations` VALUES (3, 1, 11017, '2024-03-01');
INSERT INTO `event_registrations` VALUES (4, 9, 102, '2024-07-22');

-- ----------------------------
-- Table structure for event_resources
-- ----------------------------
DROP TABLE IF EXISTS `event_resources`;
CREATE TABLE `event_resources`  (
  `resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NULL DEFAULT NULL,
  `resource_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `cost` decimal(10, 2) NULL DEFAULT NULL,
  `supplier_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`resource_id`) USING BTREE,
  INDEX `fk_eventres_event`(`event_id`) USING BTREE,
  INDEX `fk_eventres_supp`(`supplier_id`) USING BTREE,
  CONSTRAINT `fk_eventres_event` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_eventres_supp` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of event_resources
-- ----------------------------
INSERT INTO `event_resources` VALUES (1, 1, 'Stage Backdrop Printing', 1, 15000.00, 4);
INSERT INTO `event_resources` VALUES (2, 1, 'Sound System Rental', 1, 25000.00, 4);
INSERT INTO `event_resources` VALUES (3, 3, 'Workshop Handout Printing', 50, 2000.00, 2);

-- ----------------------------
-- Table structure for event_tickets
-- ----------------------------
DROP TABLE IF EXISTS `event_tickets`;
CREATE TABLE `event_tickets`  (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `ticket_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `purchase_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`ticket_id`) USING BTREE,
  INDEX `fk_eventtick_event`(`event_id`) USING BTREE,
  INDEX `fk_eventtick_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_eventtick_event` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_eventtick_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of event_tickets
-- ----------------------------
INSERT INTO `event_tickets` VALUES (1, 4, 11008, 'ALUMNI24/001', 500.00, '2024-12-01');

-- ----------------------------
-- Table structure for event_vendors
-- ----------------------------
DROP TABLE IF EXISTS `event_vendors`;
CREATE TABLE `event_vendors`  (
  `vendor_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NULL DEFAULT NULL,
  `supplier_id` int(11) NULL DEFAULT NULL,
  `service_type` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `contract_amount` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`vendor_id`) USING BTREE,
  INDEX `fk_eventvend_event`(`event_id`) USING BTREE,
  INDEX `fk_eventvend_supp`(`supplier_id`) USING BTREE,
  CONSTRAINT `fk_eventvend_event` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_eventvend_supp` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of event_vendors
-- ----------------------------
INSERT INTO `event_vendors` VALUES (1, 1, 4, 'Event Management & Logistics', 150000.00);
INSERT INTO `event_vendors` VALUES (2, 1, 3, 'Cleaning Services Post-Event', 10000.00);
INSERT INTO `event_vendors` VALUES (3, 4, 4, 'Catering Services (Dinner)', 80000.00);

-- ----------------------------
-- Table structure for events
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events`  (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `event_date` date NULL DEFAULT NULL,
  `start_time` time NULL DEFAULT NULL,
  `end_time` time NULL DEFAULT NULL,
  `venue` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `organizer_id` int(11) NULL DEFAULT NULL,
  `event_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`event_id`) USING BTREE,
  INDEX `fk_event_user`(`organizer_id`) USING BTREE,
  CONSTRAINT `fk_event_user` FOREIGN KEY (`organizer_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of events
-- ----------------------------
INSERT INTO `events` VALUES (1, 'Annual Tech Fest - TechVistara 2024', '2024-03-15', '09:00:00', '17:00:00', 'College Auditorium & Grounds', 1, 'Tech Fest');
INSERT INTO `events` VALUES (2, 'Inter-Departmental Cricket Tournament', '2024-04-10', '08:00:00', '18:00:00', 'College Sports Ground', 2, 'Sports');
INSERT INTO `events` VALUES (3, 'Workshop on Ethical Hacking', '2024-09-20', '10:00:00', '16:00:00', 'Seminar Hall SH-1', 24, 'Workshop');
INSERT INTO `events` VALUES (4, 'Alumni Meet 2024', '2024-12-21', '18:00:00', '22:00:00', 'College Main Hall', 23, 'Alumni Event');
INSERT INTO `events` VALUES (5, 'Freshers Day Celebration 2023', '2023-09-01', '14:00:00', '17:00:00', 'Auditorium Complex', 208, 'Cultural');
INSERT INTO `events` VALUES (6, 'Guest Lecture on AI Trends', '2024-10-15', '11:00:00', '13:00:00', 'Seminar Hall SH-2', 1, 'Guest Lecture');
INSERT INTO `events` VALUES (7, 'Independence Day Flag Hoisting', '2024-08-15', '08:30:00', '10:00:00', 'Main Quadrangle', 2, 'National Event');
INSERT INTO `events` VALUES (8, 'Diwali Celebration', '2024-11-01', '17:00:00', '20:00:00', 'Hostel Grounds', 208, 'Cultural');
INSERT INTO `events` VALUES (9, 'Blood Donation Camp', '2024-07-25', '09:00:00', '15:00:00', 'Student Activity Center', 208, 'Social Service');

-- ----------------------------
-- Table structure for exam_malpractice
-- ----------------------------
DROP TABLE IF EXISTS `exam_malpractice`;
CREATE TABLE `exam_malpractice`  (
  `malpractice_id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `reported_by` int(11) NULL DEFAULT NULL,
  `report_date` date NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `evidence_path` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` enum('Reported','Under Review','Resolved') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penalty` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `resolution_details` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`malpractice_id`) USING BTREE,
  INDEX `fk_malp_exam`(`exam_id`) USING BTREE,
  INDEX `fk_malp_student`(`student_id`) USING BTREE,
  INDEX `fk_malp_faculty`(`reported_by`) USING BTREE,
  CONSTRAINT `fk_malp_exam` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_malp_faculty` FOREIGN KEY (`reported_by`) REFERENCES `faculty` (`faculty_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_malp_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_malpractice
-- ----------------------------
INSERT INTO `exam_malpractice` VALUES (1, 2, 11009, 103, '2023-11-10', 'Student 11009 found copying from notes during MA101 Midterm.', '/evidence/malp/11009_midterm.jpg', 'Resolved', 'Zero marks awarded.', 'Student admitted to the offense. Awarded zero for the exam.');
INSERT INTO `exam_malpractice` VALUES (2, 8, 11015, 24, '2024-04-05', 'Suspicious activity during online CS103 Midterm. Used mobile phone.', NULL, 'Under Review', NULL, NULL);

-- ----------------------------
-- Table structure for exam_moderation
-- ----------------------------
DROP TABLE IF EXISTS `exam_moderation`;
CREATE TABLE `exam_moderation`  (
  `moderation_id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NULL DEFAULT NULL,
  `moderator_id` int(11) NULL DEFAULT NULL,
  `moderation_date` date NULL DEFAULT NULL,
  `comments` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `status` enum('Pending','Completed') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`moderation_id`) USING BTREE,
  INDEX `fk_mod_exam`(`exam_id`) USING BTREE,
  INDEX `fk_mod_faculty`(`moderator_id`) USING BTREE,
  CONSTRAINT `fk_mod_exam` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_mod_faculty` FOREIGN KEY (`moderator_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_moderation
-- ----------------------------
INSERT INTO `exam_moderation` VALUES (1, 4, 25, '2023-11-30', 'Question paper seems balanced. Q5 ambiguity needs clarification in instructions.', 'Completed');
INSERT INTO `exam_moderation` VALUES (2, 5, 31, '2023-12-01', 'Difficulty level appropriate for final exam. Ensure sufficient time allocation.', 'Completed');

-- ----------------------------
-- Table structure for exam_papers
-- ----------------------------
DROP TABLE IF EXISTS `exam_papers`;
CREATE TABLE `exam_papers`  (
  `paper_id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NULL DEFAULT NULL,
  `question_id` int(11) NULL DEFAULT NULL,
  `marks` decimal(5, 2) NULL DEFAULT NULL,
  `section` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`paper_id`) USING BTREE,
  INDEX `fk_exampaper_exam`(`exam_id`) USING BTREE,
  INDEX `fk_exampaper_q`(`question_id`) USING BTREE,
  CONSTRAINT `fk_exampaper_exam` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_exampaper_q` FOREIGN KEY (`question_id`) REFERENCES `question_banks` (`question_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_papers
-- ----------------------------
INSERT INTO `exam_papers` VALUES (1, 1, 1, 2.00, 'A');
INSERT INTO `exam_papers` VALUES (2, 1, 2, 5.00, 'B');

-- ----------------------------
-- Table structure for exam_registrations
-- ----------------------------
DROP TABLE IF EXISTS `exam_registrations`;
CREATE TABLE `exam_registrations`  (
  `registration_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `exam_id` int(11) NULL DEFAULT NULL,
  `registration_date` datetime NULL DEFAULT NULL,
  `hall_ticket_number` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `seat_number` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`registration_id`) USING BTREE,
  INDEX `fk_examreg_student`(`student_id`) USING BTREE,
  INDEX `fk_examreg_exam`(`exam_id`) USING BTREE,
  CONSTRAINT `fk_examreg_exam` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_examreg_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_registrations
-- ----------------------------
INSERT INTO `exam_registrations` VALUES (1, 11001, 4, '2023-11-15 10:00:00', 'F23CS101001', 'A101');
INSERT INTO `exam_registrations` VALUES (2, 11016, 4, '2023-11-15 10:05:00', 'F23CS101016', 'A102');
INSERT INTO `exam_registrations` VALUES (3, 11002, 6, '2023-11-16 11:00:00', 'F23EC101002', 'B101');
INSERT INTO `exam_registrations` VALUES (4, 11001, 8, '2024-03-25 09:30:00', 'M24CS201001', 'A201');

-- ----------------------------
-- Table structure for exams
-- ----------------------------
DROP TABLE IF EXISTS `exams`;
CREATE TABLE `exams`  (
  `exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NULL DEFAULT NULL,
  `exam_date` date NULL DEFAULT NULL,
  `start_time` time NULL DEFAULT NULL,
  `end_time` time NULL DEFAULT NULL,
  `room_id` int(11) NULL DEFAULT NULL,
  `exam_type` enum('Midterm','Final','Quiz','Practical','Other') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `max_marks` decimal(6, 2) NULL DEFAULT NULL,
  `instructions` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`exam_id`) USING BTREE,
  INDEX `fk_exam_course`(`course_id`) USING BTREE,
  INDEX `fk_exam_room`(`room_id`) USING BTREE,
  CONSTRAINT `fk_exam_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_exam_room` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exams
-- ----------------------------
INSERT INTO `exams` VALUES (1, 101, '2023-10-05', '10:00:00', '12:00:00', 1, 'Midterm', 50.00, 'Answer all questions. Calculators not allowed.');
INSERT INTO `exams` VALUES (2, 901, '2023-10-06', '14:00:00', '16:00:00', 2, 'Midterm', 50.00, 'Answer any 5 questions.');
INSERT INTO `exams` VALUES (3, 201, '2023-10-07', '10:00:00', '12:00:00', 7, 'Midterm', 50.00, 'Standard calculators allowed.');
INSERT INTO `exams` VALUES (4, 101, '2023-12-10', '09:00:00', '12:00:00', 1, 'Final', 100.00, 'Comprehensive exam. Answer all sections.');
INSERT INTO `exams` VALUES (5, 901, '2023-12-11', '14:00:00', '17:00:00', 2, 'Final', 100.00, 'Refer formula sheet provided.');
INSERT INTO `exams` VALUES (6, 201, '2023-12-12', '09:00:00', '12:00:00', 7, 'Final', 100.00, 'Answer any 8 questions.');
INSERT INTO `exams` VALUES (7, 902, '2023-12-13', '14:00:00', '17:00:00', 3, 'Final', 100.00, 'All questions are compulsory.');
INSERT INTO `exams` VALUES (8, 103, '2024-04-05', '10:00:00', '12:00:00', 1, 'Midterm', 50.00, 'Focus on asymptotic analysis and sorting.');
INSERT INTO `exams` VALUES (9, 203, '2024-04-06', '14:00:00', '16:00:00', 7, 'Midterm', 50.00, 'Design and analysis questions.');
INSERT INTO `exams` VALUES (10, 303, '2024-04-07', '10:00:00', '12:00:00', 3, 'Midterm', 50.00, 'Problems on fluid statics and kinematics.');
INSERT INTO `exams` VALUES (11, 103, '2024-03-20', '14:00:00', '14:30:00', 11, 'Quiz', 10.00, 'Online quiz on Complexity Classes.');
INSERT INTO `exams` VALUES (12, 203, '2024-05-10', '09:00:00', '12:00:00', 14, 'Practical', 30.00, 'Perform experiments on BJT Amplifier.');

-- ----------------------------
-- Table structure for exchange_agreements
-- ----------------------------
DROP TABLE IF EXISTS `exchange_agreements`;
CREATE TABLE `exchange_agreements`  (
  `agreement_id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `terms` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `max_students` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`agreement_id`) USING BTREE,
  INDEX `fk_exchagree_partner`(`partner_id`) USING BTREE,
  CONSTRAINT `fk_exchagree_partner` FOREIGN KEY (`partner_id`) REFERENCES `partner_institutions` (`partner_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exchange_agreements
-- ----------------------------
INSERT INTO `exchange_agreements` VALUES (1, 1, '2022-01-01', '2026-12-31', 'Student exchange agreement for B.Tech programs. Max 5 students per year each way. Tuition fee waiver at host uni.', 5);
INSERT INTO `exchange_agreements` VALUES (2, 2, '2023-03-01', '2027-02-28', 'Faculty and Student exchange for Engineering and Management.', 3);

-- ----------------------------
-- Table structure for exchange_courses
-- ----------------------------
DROP TABLE IF EXISTS `exchange_courses`;
CREATE TABLE `exchange_courses`  (
  `exchange_course_id` int(11) NOT NULL AUTO_INCREMENT,
  `placement_id` int(11) NULL DEFAULT NULL,
  `course_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `credits` int(11) NULL DEFAULT NULL,
  `grade` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `syllabus_path` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`exchange_course_id`) USING BTREE,
  INDEX `fk_exchcourse_place`(`placement_id`) USING BTREE,
  CONSTRAINT `fk_exchcourse_place` FOREIGN KEY (`placement_id`) REFERENCES `exchange_placements` (`placement_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exchange_courses
-- ----------------------------
INSERT INTO `exchange_courses` VALUES (1, 1, 'CS2103T Software Engineering (NUS)', 4, NULL, '/exchange/nus/cs2103t.pdf');
INSERT INTO `exchange_courses` VALUES (2, 1, 'CS3230 Design and Analysis of Algorithms (NUS)', 4, NULL, '/exchange/nus/cs3230.pdf');

-- ----------------------------
-- Table structure for exchange_placements
-- ----------------------------
DROP TABLE IF EXISTS `exchange_placements`;
CREATE TABLE `exchange_placements`  (
  `placement_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `agreement_id` int(11) NULL DEFAULT NULL,
  `placement_start` date NULL DEFAULT NULL,
  `placement_end` date NULL DEFAULT NULL,
  `status` enum('Applied','Accepted','Completed') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `visa_status` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`placement_id`) USING BTREE,
  INDEX `fk_exchplace_student`(`student_id`) USING BTREE,
  INDEX `fk_exchplace_agree`(`agreement_id`) USING BTREE,
  CONSTRAINT `fk_exchplace_agree` FOREIGN KEY (`agreement_id`) REFERENCES `exchange_agreements` (`agreement_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_exchplace_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exchange_placements
-- ----------------------------
INSERT INTO `exchange_placements` VALUES (1, 11001, 1, '2024-08-01', '2024-12-20', 'Accepted', 'Approved (Singapore EP)');
INSERT INTO `exchange_placements` VALUES (2, 11017, 1, '2024-08-01', '2024-12-20', 'Applied', 'Pending');

-- ----------------------------
-- Table structure for faculty
-- ----------------------------
DROP TABLE IF EXISTS `faculty`;
CREATE TABLE `faculty`  (
  `faculty_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `department_id` int(11) NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hire_date` date NULL DEFAULT NULL,
  `faculty_type` enum('Full-Time','Part-Time','Visiting') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`faculty_id`) USING BTREE,
  INDEX `fk_faculty_dept`(`department_id`) USING BTREE,
  CONSTRAINT `fk_faculty_dept` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of faculty
-- ----------------------------
INSERT INTO `faculty` VALUES (1, 'Rajesh', 'Kumar', 1, 'rajesh.kumar.cse@college.edu.in', '9876543210', '2008-07-15', 'Full-Time');
INSERT INTO `faculty` VALUES (2, 'Priya', 'Sharma', 2, 'priya.sharma.ece@college.edu.in', '9123456789', '2009-06-01', 'Full-Time');
INSERT INTO `faculty` VALUES (3, 'Amit', 'Singh', 3, 'amit.singh.mech@college.edu.in', '9988776655', '2010-08-20', 'Full-Time');
INSERT INTO `faculty` VALUES (4, 'Sneha', 'Verma', 4, 'sneha.verma.civil@college.edu.in', '9000011111', '2011-07-05', 'Full-Time');
INSERT INTO `faculty` VALUES (5, 'Manoj', 'Gupta', 5, 'manoj.gupta.eee@college.edu.in', '9888877776', '2012-06-10', 'Full-Time');
INSERT INTO `faculty` VALUES (6, 'Anjali', 'Patel', 6, 'anjali.patel.it@college.edu.in', '9777766665', '2013-08-01', 'Full-Time');
INSERT INTO `faculty` VALUES (7, 'Suresh', 'Reddy', 7, 'suresh.reddy.mba@college.edu.in', '9666655554', '2014-07-15', 'Full-Time');
INSERT INTO `faculty` VALUES (8, 'Deepika', 'Nair', 8, 'deepika.nair.math@college.edu.in', '9555544443', '2009-07-20', 'Full-Time');
INSERT INTO `faculty` VALUES (9, 'Vikram', 'Chauhan', 9, 'vikram.chauhan.phy@college.edu.in', '9444433332', '2010-06-05', 'Full-Time');
INSERT INTO `faculty` VALUES (10, 'Meera', 'Iyer', 10, 'meera.iyer.chem@college.edu.in', '9333322221', '2011-08-10', 'Full-Time');
INSERT INTO `faculty` VALUES (11, 'Ravi', 'Shankar', 11, 'ravi.shankar.hss@college.edu.in', '9222211110', '2012-07-01', 'Full-Time');
INSERT INTO `faculty` VALUES (12, 'Sunita', 'Jain', 1, 'sunita.jain.cse@college.edu.in', '9876501234', '2015-07-20', 'Full-Time');
INSERT INTO `faculty` VALUES (13, 'Arun', 'Menon', 2, 'arun.menon.ece@college.edu.in', '9123498765', '2016-06-15', 'Full-Time');
INSERT INTO `faculty` VALUES (14, 'Vivek', 'Agarwal', 3, 'vivek.agarwal.mech@college.edu.in', '9988712345', '2017-08-05', 'Part-Time');
INSERT INTO `faculty` VALUES (15, 'Nisha', 'Dave', 4, 'nisha.dave.civil@college.edu.in', '9000054321', '2018-07-12', 'Full-Time');
INSERT INTO `faculty` VALUES (16, 'Karthik', 'Subramanian', 5, 'karthik.s.eee@college.edu.in', '9888898765', '2019-06-25', 'Full-Time');
INSERT INTO `faculty` VALUES (17, 'Pooja', 'Malhotra', 6, 'pooja.malhotra.it@college.edu.in', '9777787654', '2020-08-18', 'Visiting');
INSERT INTO `faculty` VALUES (18, 'Sameer', 'Khan', 7, 'sameer.khan.mba@college.edu.in', '9666676543', '2021-07-22', 'Full-Time');
INSERT INTO `faculty` VALUES (19, 'Geeta', 'Rao', 8, 'geeta.rao.math@college.edu.in', '9555565432', '2016-07-11', 'Full-Time');
INSERT INTO `faculty` VALUES (20, 'Harish', 'Pandey', 9, 'harish.pandey.phy@college.edu.in', '9444454321', '2017-06-19', 'Full-Time');
INSERT INTO `faculty` VALUES (21, 'Mohan', 'Krishnan', 13, 'mohan.krishnan@college.edu.in', '9111122220', '2006-01-10', 'Full-Time');
INSERT INTO `faculty` VALUES (22, 'Leela', 'Raman', 17, 'leela.raman.warden@college.edu.in', '9212121212', '2007-09-15', 'Full-Time');
INSERT INTO `faculty` VALUES (23, 'Asha', 'Verma', 18, 'asha.verma.po@college.edu.in', '9313131313', '2009-10-01', 'Full-Time');
INSERT INTO `faculty` VALUES (24, 'Siddharth', 'Mehta', 1, 'siddharth.mehta.cse@college.edu.in', '9414141414', '2010-01-05', 'Full-Time');
INSERT INTO `faculty` VALUES (25, 'Revathi', 'Pillai', 2, 'revathi.pillai.ece@college.edu.in', '9515151515', '2011-02-10', 'Full-Time');
INSERT INTO `faculty` VALUES (26, 'Ganesh', 'Moorthy', 3, 'ganesh.moorthy.mech@college.edu.in', '9616161616', '2012-03-15', 'Full-Time');
INSERT INTO `faculty` VALUES (27, 'Farida', 'Ahmed', 4, 'farida.ahmed.civil@college.edu.in', '9717171717', '2013-04-20', 'Full-Time');
INSERT INTO `faculty` VALUES (28, 'Pradeep', 'Saxena', 5, 'pradeep.saxena.eee@college.edu.in', '9818181818', '2014-05-25', 'Full-Time');
INSERT INTO `faculty` VALUES (29, 'Imran', 'Hassan', 6, 'imran.hassan.it@college.edu.in', '9919191919', '2015-06-30', 'Full-Time');
INSERT INTO `faculty` VALUES (30, 'Malini', 'Desai', 7, 'malini.desai.mba@college.edu.in', '9020202020', '2016-07-05', 'Full-Time');
INSERT INTO `faculty` VALUES (31, 'Venkat', 'Ramana', 8, 'venkat.ramana.math@college.edu.in', '9121212121', '2010-08-10', 'Full-Time');
INSERT INTO `faculty` VALUES (32, 'Sarita', 'Joshi', 9, 'sarita.joshi.phy@college.edu.in', '9222233333', '2011-09-15', 'Full-Time');
INSERT INTO `faculty` VALUES (33, 'Arvind', 'Mishra', 10, 'arvind.mishra.chem@college.edu.in', '9333344444', '2012-10-20', 'Full-Time');
INSERT INTO `faculty` VALUES (34, 'Rekha', 'Gupta', 11, 'rekha.gupta.hss@college.edu.in', '9444455555', '2013-11-25', 'Full-Time');

-- ----------------------------
-- Table structure for faculty_appraisals
-- ----------------------------
DROP TABLE IF EXISTS `faculty_appraisals`;
CREATE TABLE `faculty_appraisals`  (
  `appraisal_id` int(11) NOT NULL AUTO_INCREMENT,
  `faculty_id` int(11) NULL DEFAULT NULL,
  `appraisal_date` date NULL DEFAULT NULL,
  `reviewer_id` int(11) NULL DEFAULT NULL,
  `rating` int(11) NULL DEFAULT NULL,
  `comments` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `goals` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`appraisal_id`) USING BTREE,
  INDEX `fk_appraisal_faculty`(`faculty_id`) USING BTREE,
  INDEX `fk_appraisal_reviewer`(`reviewer_id`) USING BTREE,
  CONSTRAINT `fk_appraisal_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_appraisal_reviewer` FOREIGN KEY (`reviewer_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of faculty_appraisals
-- ----------------------------
INSERT INTO `faculty_appraisals` VALUES (1, 101, '2024-06-10', 24, 4, 'Consistently good teaching feedback. Research output needs improvement.', 'Publish one conference paper in the next year.');
INSERT INTO `faculty_appraisals` VALUES (2, 108, '2024-06-12', 31, 5, 'Excellent contribution to teaching and departmental activities.', 'Mentor junior faculty.');

-- ----------------------------
-- Table structure for faculty_awards
-- ----------------------------
DROP TABLE IF EXISTS `faculty_awards`;
CREATE TABLE `faculty_awards`  (
  `award_id` int(11) NOT NULL AUTO_INCREMENT,
  `faculty_id` int(11) NULL DEFAULT NULL,
  `award_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `awarding_body` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `award_date` date NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`award_id`) USING BTREE,
  INDEX `fk_facaward_faculty`(`faculty_id`) USING BTREE,
  CONSTRAINT `fk_facaward_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of faculty_awards
-- ----------------------------
INSERT INTO `faculty_awards` VALUES (1, 102, 'Best Teacher Award - ECE Dept', 'College Internal Awards Committee', '2023-03-05', 'Awarded for excellent student feedback and innovative teaching methods.');

-- ----------------------------
-- Table structure for faculty_sabbaticals
-- ----------------------------
DROP TABLE IF EXISTS `faculty_sabbaticals`;
CREATE TABLE `faculty_sabbaticals`  (
  `sabbatical_id` int(11) NOT NULL AUTO_INCREMENT,
  `faculty_id` int(11) NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `purpose` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `status` enum('Requested','Approved','Rejected') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `approved_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`sabbatical_id`) USING BTREE,
  INDEX `fk_sabbatical_faculty`(`faculty_id`) USING BTREE,
  INDEX `fk_sabbatical_user`(`approved_by`) USING BTREE,
  CONSTRAINT `fk_sabbatical_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sabbatical_user` FOREIGN KEY (`approved_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of faculty_sabbaticals
-- ----------------------------
INSERT INTO `faculty_sabbaticals` VALUES (1, 105, '2025-01-01', '2025-06-30', 'Post-doctoral research fellowship at MIT, USA.', 'Approved', 2);
INSERT INTO `faculty_sabbaticals` VALUES (2, 111, '2024-09-01', '2024-11-30', 'Book writing project on Indian Social History.', 'Requested', NULL);

-- ----------------------------
-- Table structure for fee_invoices
-- ----------------------------
DROP TABLE IF EXISTS `fee_invoices`;
CREATE TABLE `fee_invoices`  (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `invoice_date` date NULL DEFAULT NULL,
  `due_date` date NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `total_amount` decimal(10, 2) NULL DEFAULT NULL,
  `amount_paid` decimal(10, 2) NULL DEFAULT 0.00,
  `status` enum('Draft','Pending','Paid','Overdue','Cancelled') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `academic_year` int(11) NULL DEFAULT NULL,
  `semester` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`invoice_id`) USING BTREE,
  INDEX `fk_feeinv_student`(`student_id`) USING BTREE,
  CONSTRAINT `fk_feeinv_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fee_invoices
-- ----------------------------
INSERT INTO `fee_invoices` VALUES (1, 11001, '2023-07-15', '2023-08-10', 'Semester 1 Fees (2023-24)', 168500.00, 168500.00, 'Paid', 2023, 1);
INSERT INTO `fee_invoices` VALUES (2, 11002, '2023-07-15', '2023-08-10', 'Semester 1 Fees (2023-24)', 17000.00, 17000.00, 'Paid', 2023, 1);
INSERT INTO `fee_invoices` VALUES (3, 11005, '2023-07-15', '2023-08-10', 'Semester 1 Fees (2023-24)', 272000.00, 250000.00, 'Pending', 2023, 1);
INSERT INTO `fee_invoices` VALUES (4, 11007, '2023-07-01', '2023-07-25', 'Semester 1 Fees MBA (2023-24)', 329500.00, 329500.00, 'Paid', 2023, 1);
INSERT INTO `fee_invoices` VALUES (5, 11001, '2024-01-10', '2024-01-30', 'Semester 2 Fees (2023-24)', 163000.00, 163000.00, 'Paid', 2023, 2);
INSERT INTO `fee_invoices` VALUES (6, 11002, '2024-01-10', '2024-01-30', 'Semester 2 Fees (2023-24)', 12000.00, 12000.00, 'Paid', 2023, 2);
INSERT INTO `fee_invoices` VALUES (7, 11005, '2024-01-10', '2024-01-30', 'Semester 2 Fees (2023-24)', 267000.00, 0.00, 'Overdue', 2023, 2);
INSERT INTO `fee_invoices` VALUES (8, 11008, '2023-07-15', '2023-08-10', 'Semester 7 Fees (2023-24)', 163000.00, 163000.00, 'Paid', 2023, 7);
INSERT INTO `fee_invoices` VALUES (9, 11013, '2023-07-15', '2023-08-10', 'Semester 3 Fees (2023-24)', 163000.00, 80000.00, 'Pending', 2023, 3);
INSERT INTO `fee_invoices` VALUES (10, 11001, '2023-07-15', '2023-08-10', 'Hostel Fee - Sem 1 (2023-24)', 60000.00, 60000.00, 'Paid', 2023, 1);
INSERT INTO `fee_invoices` VALUES (11, 11002, '2023-07-15', '2023-08-10', 'Hostel Fee - Sem 1 (2023-24)', 80000.00, 80000.00, 'Paid', 2023, 1);
INSERT INTO `fee_invoices` VALUES (12, 11004, '2023-07-15', '2023-08-10', 'Transport Fee - Sem 1 (2023-24) Route B', 25000.00, 25000.00, 'Paid', 2023, 1);

-- ----------------------------
-- Table structure for fee_payments
-- ----------------------------
DROP TABLE IF EXISTS `fee_payments`;
CREATE TABLE `fee_payments`  (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NULL DEFAULT NULL,
  `payment_date` date NULL DEFAULT NULL,
  `amount_paid` decimal(10, 2) NULL DEFAULT NULL,
  `payment_method` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `transaction_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `notes` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `recorded_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`payment_id`) USING BTREE,
  INDEX `fk_feepay_invoice`(`invoice_id`) USING BTREE,
  INDEX `fk_feepay_user`(`recorded_by`) USING BTREE,
  CONSTRAINT `fk_feepay_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `fee_invoices` (`invoice_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_feepay_user` FOREIGN KEY (`recorded_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fee_payments
-- ----------------------------
INSERT INTO `fee_payments` VALUES (1, 1, '2023-08-05', 168500.00, 'Online Banking', 'TRX12345678', 'Full payment Sem 1', 201);
INSERT INTO `fee_payments` VALUES (2, 2, '2023-08-08', 17000.00, 'Demand Draft', 'DD987654', 'SC/ST Full Payment Sem 1', 201);
INSERT INTO `fee_payments` VALUES (3, 3, '2023-08-10', 250000.00, 'NEFT', 'NEFTXYZ123', 'Partial Payment Sem 1', 210);
INSERT INTO `fee_payments` VALUES (4, 4, '2023-07-24', 329500.00, 'Online Banking', 'TRX09876543', 'MBA Sem 1 Full Payment', 201);
INSERT INTO `fee_payments` VALUES (5, 5, '2024-01-25', 163000.00, 'UPI', 'UPIABCDEFG', 'Full payment Sem 2', 201);
INSERT INTO `fee_payments` VALUES (6, 6, '2024-01-28', 12000.00, 'Cash', 'CASHRECEIPT001', 'SC/ST Full Payment Sem 2', 210);
INSERT INTO `fee_payments` VALUES (7, 9, '2023-08-09', 80000.00, 'Cheque', 'CHQ112233', 'Partial Payment Sem 3', 201);
INSERT INTO `fee_payments` VALUES (8, 10, '2023-08-05', 60000.00, 'Online Banking', 'TRX12345678', 'Hostel Fee Sem 1', 201);
INSERT INTO `fee_payments` VALUES (9, 11, '2023-08-08', 80000.00, 'Demand Draft', 'DD987655', 'Hostel Fee Sem 1', 201);
INSERT INTO `fee_payments` VALUES (10, 12, '2023-08-09', 25000.00, 'UPI', 'UPIXYZ987', 'Transport Fee Sem 1', 210);

-- ----------------------------
-- Table structure for fee_refunds
-- ----------------------------
DROP TABLE IF EXISTS `fee_refunds`;
CREATE TABLE `fee_refunds`  (
  `refund_id` int(11) NOT NULL AUTO_INCREMENT,
  `original_payment_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `refund_amount` decimal(10, 2) NULL DEFAULT NULL,
  `refund_date` date NULL DEFAULT NULL,
  `refund_method` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `transaction_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `approved_by` int(11) NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`refund_id`) USING BTREE,
  INDEX `fk_refund_payment`(`original_payment_id`) USING BTREE,
  INDEX `fk_refund_user`(`approved_by`) USING BTREE,
  INDEX `fk_refund_student`(`student_id`) USING BTREE,
  CONSTRAINT `fk_refund_payment` FOREIGN KEY (`original_payment_id`) REFERENCES `fee_payments` (`payment_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_refund_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_refund_user` FOREIGN KEY (`approved_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fee_refunds
-- ----------------------------
INSERT INTO `fee_refunds` VALUES (1, 1, 11001, 5000.00, '2025-06-15', 'NEFT', 'REFUNDNEFT001', 'Caution Deposit Refund after course completion.', 201, 'Approved');

-- ----------------------------
-- Table structure for fee_structures
-- ----------------------------
DROP TABLE IF EXISTS `fee_structures`;
CREATE TABLE `fee_structures`  (
  `fee_structure_id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NULL DEFAULT NULL,
  `category_id` int(11) NULL DEFAULT NULL,
  `fee_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `amount` decimal(10, 2) NULL DEFAULT NULL,
  `academic_year` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`fee_structure_id`) USING BTREE,
  INDEX `fk_feestruct_program`(`program_id`) USING BTREE,
  INDEX `fk_feestruct_category`(`category_id`) USING BTREE,
  CONSTRAINT `fk_feestruct_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_feestruct_program` FOREIGN KEY (`program_id`) REFERENCES `programs` (`program_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fee_structures
-- ----------------------------
INSERT INTO `fee_structures` VALUES (1, 1, 1, 'Tuition Fee', 150000.00, 2023);
INSERT INTO `fee_structures` VALUES (2, 1, 1, 'Development Fee', 10000.00, 2023);
INSERT INTO `fee_structures` VALUES (3, 1, 1, 'Exam Fee', 2000.00, 2023);
INSERT INTO `fee_structures` VALUES (4, 1, 2, 'Tuition Fee', 250000.00, 2023);
INSERT INTO `fee_structures` VALUES (5, 1, 2, 'Development Fee', 15000.00, 2023);
INSERT INTO `fee_structures` VALUES (6, 1, 2, 'Exam Fee', 2000.00, 2023);
INSERT INTO `fee_structures` VALUES (7, 1, 3, 'Tuition Fee', 10000.00, 2023);
INSERT INTO `fee_structures` VALUES (8, 1, 3, 'Development Fee', 5000.00, 2023);
INSERT INTO `fee_structures` VALUES (9, 1, 3, 'Exam Fee', 1000.00, 2023);
INSERT INTO `fee_structures` VALUES (10, 7, 1, 'Tuition Fee', 300000.00, 2023);
INSERT INTO `fee_structures` VALUES (11, 7, 1, 'Development Fee', 20000.00, 2023);
INSERT INTO `fee_structures` VALUES (12, 7, 1, 'Exam Fee', 3000.00, 2023);
INSERT INTO `fee_structures` VALUES (13, 1, 1, 'Library Fee', 1000.00, 2023);
INSERT INTO `fee_structures` VALUES (14, 1, 1, 'Sports Fee', 500.00, 2023);
INSERT INTO `fee_structures` VALUES (15, 1, 1, 'Caution Deposit (Refundable)', 5000.00, 2023);
INSERT INTO `fee_structures` VALUES (16, 1, 1, 'Tuition Fee', 160000.00, 2024);
INSERT INTO `fee_structures` VALUES (17, 1, 1, 'Development Fee', 11000.00, 2024);
INSERT INTO `fee_structures` VALUES (18, 7, 1, 'Tuition Fee', 320000.00, 2024);
INSERT INTO `fee_structures` VALUES (19, 1, 1, 'Hostel Fee (Triple Sharing)', 60000.00, 2023);
INSERT INTO `fee_structures` VALUES (20, 1, 1, 'Hostel Fee (Double Sharing)', 75000.00, 2023);
INSERT INTO `fee_structures` VALUES (21, 1, 1, 'Hostel Fee (Triple AC)', 80000.00, 2023);
INSERT INTO `fee_structures` VALUES (22, 1, 1, 'Transport Fee (Route A)', 20000.00, 2023);
INSERT INTO `fee_structures` VALUES (23, 1, 1, 'Transport Fee (Route B)', 25000.00, 2023);

-- ----------------------------
-- Table structure for feedback_actions
-- ----------------------------
DROP TABLE IF EXISTS `feedback_actions`;
CREATE TABLE `feedback_actions`  (
  `action_id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback_id` int(11) NULL DEFAULT NULL,
  `action_description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `assigned_to` int(11) NULL DEFAULT NULL,
  `due_date` date NULL DEFAULT NULL,
  `status` enum('Open','In Progress','Closed') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `completion_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`action_id`) USING BTREE,
  INDEX `fk_feedbackaction_resp`(`feedback_id`) USING BTREE,
  INDEX `fk_feedbackaction_user`(`assigned_to`) USING BTREE,
  CONSTRAINT `fk_feedbackaction_resp` FOREIGN KEY (`feedback_id`) REFERENCES `feedback_responses` (`response_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_feedbackaction_user` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of feedback_actions
-- ----------------------------
INSERT INTO `feedback_actions` VALUES (1, 5, 'Review canteen menu and pricing based on feedback.', 2, '2024-07-31', 'Open', NULL);

-- ----------------------------
-- Table structure for feedback_analysis
-- ----------------------------
DROP TABLE IF EXISTS `feedback_analysis`;
CREATE TABLE `feedback_analysis`  (
  `analysis_id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NULL DEFAULT NULL,
  `analysis_date` date NULL DEFAULT NULL,
  `summary` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `average_rating` decimal(3, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`analysis_id`) USING BTREE,
  INDEX `fk_feedbackanal_form`(`form_id`) USING BTREE,
  CONSTRAINT `fk_feedbackanal_form` FOREIGN KEY (`form_id`) REFERENCES `feedback_forms` (`form_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of feedback_analysis
-- ----------------------------
INSERT INTO `feedback_analysis` VALUES (1, 1, '2024-01-10', 'Overall positive feedback for Sem 1 courses. Average rating 4.1. Some requests for more practical examples.', 4.10);
INSERT INTO `feedback_analysis` VALUES (2, 2, '2024-06-01', 'Campus cleanliness rated highly. Canteen services have mixed reviews, average rating 3.5.', 3.50);

-- ----------------------------
-- Table structure for feedback_forms
-- ----------------------------
DROP TABLE IF EXISTS `feedback_forms`;
CREATE TABLE `feedback_forms`  (
  `form_id` int(11) NOT NULL AUTO_INCREMENT,
  `form_title` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `form_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` date NULL DEFAULT NULL,
  `target_audience` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`form_id`) USING BTREE,
  INDEX `fk_feedbackform_user`(`created_by`) USING BTREE,
  CONSTRAINT `fk_feedbackform_user` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of feedback_forms
-- ----------------------------
INSERT INTO `feedback_forms` VALUES (1, 'Course Feedback - Sem 1 2023', 'Course Evaluation', 1, '2023-12-01', 'Students');
INSERT INTO `feedback_forms` VALUES (2, 'General Campus Facilities Feedback', 'Facility Survey', 1, '2024-05-01', 'All');
INSERT INTO `feedback_forms` VALUES (3, 'Faculty Performance Feedback (Anonymous)', 'Faculty Appraisal', 1, '2024-06-01', 'Students');

-- ----------------------------
-- Table structure for feedback_questions
-- ----------------------------
DROP TABLE IF EXISTS `feedback_questions`;
CREATE TABLE `feedback_questions`  (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NULL DEFAULT NULL,
  `question_text` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `question_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `is_required` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`question_id`) USING BTREE,
  INDEX `fk_feedbackq_form`(`form_id`) USING BTREE,
  CONSTRAINT `fk_feedbackq_form` FOREIGN KEY (`form_id`) REFERENCES `feedback_forms` (`form_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of feedback_questions
-- ----------------------------
INSERT INTO `feedback_questions` VALUES (1, 1, 'Rate the clarity of the instructor\'s explanations.', 'Rating (1-5)', 1);
INSERT INTO `feedback_questions` VALUES (2, 1, 'Was the course material relevant and useful?', 'Yes/No', 1);
INSERT INTO `feedback_questions` VALUES (3, 1, 'Any suggestions for improvement?', 'Text', 0);
INSERT INTO `feedback_questions` VALUES (4, 2, 'Rate the cleanliness of the campus.', 'Rating (1-5)', 1);
INSERT INTO `feedback_questions` VALUES (5, 2, 'How satisfied are you with the canteen services?', 'Rating (1-5)', 1);
INSERT INTO `feedback_questions` VALUES (6, 3, 'Rate the instructor\'s punctuality.', 'Rating (1-5)', 1);
INSERT INTO `feedback_questions` VALUES (7, 3, 'Rate the instructor\'s helpfulness outside class.', 'Rating (1-5)', 1);

-- ----------------------------
-- Table structure for feedback_responses
-- ----------------------------
DROP TABLE IF EXISTS `feedback_responses`;
CREATE TABLE `feedback_responses`  (
  `response_id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `question_id` int(11) NULL DEFAULT NULL,
  `response_text` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `response_date` date NULL DEFAULT NULL,
  `is_anonymous` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`response_id`) USING BTREE,
  INDEX `fk_feedbackres_form`(`form_id`) USING BTREE,
  INDEX `fk_feedbackres_user`(`user_id`) USING BTREE,
  INDEX `fk_feedbackres_q`(`question_id`) USING BTREE,
  CONSTRAINT `fk_feedbackres_form` FOREIGN KEY (`form_id`) REFERENCES `feedback_forms` (`form_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_feedbackres_q` FOREIGN KEY (`question_id`) REFERENCES `feedback_questions` (`question_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_feedbackres_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of feedback_responses
-- ----------------------------
INSERT INTO `feedback_responses` VALUES (1, 1, 11001, 1, '4', '2023-12-15', 0);
INSERT INTO `feedback_responses` VALUES (2, 1, 11001, 2, 'Yes', '2023-12-15', 0);
INSERT INTO `feedback_responses` VALUES (3, 1, 11001, 3, 'More real-world examples would be good.', '2023-12-15', 0);
INSERT INTO `feedback_responses` VALUES (4, 2, 101, 4, '5', '2024-05-10', 0);
INSERT INTO `feedback_responses` VALUES (5, 2, 101, 5, '3', '2024-05-10', 0);
INSERT INTO `feedback_responses` VALUES (6, 3, 11002, 6, '5', '2024-06-10', 1);
INSERT INTO `feedback_responses` VALUES (7, 3, 11002, 7, '4', '2024-06-10', 1);
INSERT INTO `feedback_responses` VALUES (8, 3, 11003, 6, '4', '2024-06-11', 1);
INSERT INTO `feedback_responses` VALUES (9, 3, 11003, 7, '3', '2024-06-11', 1);

-- ----------------------------
-- Table structure for financial_aid_applications
-- ----------------------------
DROP TABLE IF EXISTS `financial_aid_applications`;
CREATE TABLE `financial_aid_applications`  (
  `application_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `aid_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `application_date` date NULL DEFAULT NULL,
  `status` enum('Applied','Under Review','Approved','Rejected') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `amount_requested` decimal(15, 2) NULL DEFAULT NULL,
  `supporting_documents_info` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`application_id`) USING BTREE,
  INDEX `fk_fiapp_student`(`student_id`) USING BTREE,
  CONSTRAINT `fk_fiapp_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of financial_aid_applications
-- ----------------------------
INSERT INTO `financial_aid_applications` VALUES (1, 11011, 'Merit Scholarship', '2023-08-20', 'Approved', 50000.00, 'Previous Sem Marksheet, Income Certificate');
INSERT INTO `financial_aid_applications` VALUES (2, 11018, 'Fee Concession', '2024-01-15', 'Under Review', 30000.00, 'Income Certificate, SC Certificate');
INSERT INTO `financial_aid_applications` VALUES (3, 11001, 'Sports Scholarship', '2023-09-01', 'Rejected', 20000.00, 'National Level Participation Certificate (Not eligible criteria)');

-- ----------------------------
-- Table structure for financial_aid_awards
-- ----------------------------
DROP TABLE IF EXISTS `financial_aid_awards`;
CREATE TABLE `financial_aid_awards`  (
  `award_id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NULL DEFAULT NULL,
  `award_amount` decimal(15, 2) NULL DEFAULT NULL,
  `award_date` date NULL DEFAULT NULL,
  `disbursement_schedule` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `is_adjusted_in_fees` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`award_id`) USING BTREE,
  INDEX `fk_fiaward_app`(`application_id`) USING BTREE,
  CONSTRAINT `fk_fiaward_app` FOREIGN KEY (`application_id`) REFERENCES `financial_aid_applications` (`application_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of financial_aid_awards
-- ----------------------------
INSERT INTO `financial_aid_awards` VALUES (1, 1, 40000.00, '2023-09-15', 'Adjusted against Semester 2 fees.', 1);

-- ----------------------------
-- Table structure for financial_audits
-- ----------------------------
DROP TABLE IF EXISTS `financial_audits`;
CREATE TABLE `financial_audits`  (
  `audit_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NULL DEFAULT NULL,
  `audit_date` date NULL DEFAULT NULL,
  `auditor_id` int(11) NULL DEFAULT NULL,
  `findings` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `status` enum('Open','Closed') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`audit_id`) USING BTREE,
  INDEX `fk_finaudit_gl`(`transaction_id`) USING BTREE,
  INDEX `fk_finaudit_user`(`auditor_id`) USING BTREE,
  CONSTRAINT `fk_finaudit_gl` FOREIGN KEY (`transaction_id`) REFERENCES `general_ledger` (`transaction_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_finaudit_user` FOREIGN KEY (`auditor_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of financial_audits
-- ----------------------------
INSERT INTO `financial_audits` VALUES (1, 4, '2024-03-15', 1, 'Salary payment for Jan 2024 verified against payroll records. Compliant.', 'Closed');

-- ----------------------------
-- Table structure for financial_statements
-- ----------------------------
DROP TABLE IF EXISTS `financial_statements`;
CREATE TABLE `financial_statements`  (
  `statement_id` int(11) NOT NULL AUTO_INCREMENT,
  `statement_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `period_start` date NULL DEFAULT NULL,
  `period_end` date NULL DEFAULT NULL,
  `generated_date` date NULL DEFAULT NULL,
  `statement_data` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`statement_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of financial_statements
-- ----------------------------
INSERT INTO `financial_statements` VALUES (1, 'Balance Sheet', '2023-04-01', '2024-03-31', '2024-04-15', '[Summary: Total Assets: 66.04M, Total Liabilities: 20.05M, Total Equity: 45.99M. See detailed attached file.]');
INSERT INTO `financial_statements` VALUES (2, 'Income Statement', '2023-04-01', '2024-03-31', '2024-04-15', '[Summary: Total Revenue: (Need Full Year), Total Expenses: (Need Full Year), Net Income/Loss: XYZ. See detailed attached file.]');

-- ----------------------------
-- Table structure for fuel_logs
-- ----------------------------
DROP TABLE IF EXISTS `fuel_logs`;
CREATE TABLE `fuel_logs`  (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) NULL DEFAULT NULL,
  `fuel_date` date NULL DEFAULT NULL,
  `quantity` decimal(5, 2) NULL DEFAULT NULL,
  `cost` decimal(10, 2) NULL DEFAULT NULL,
  `fuel_station` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `fk_fuel_vehicle`(`vehicle_id`) USING BTREE,
  CONSTRAINT `fk_fuel_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fuel_logs
-- ----------------------------
INSERT INTO `fuel_logs` VALUES (1, 1, '2024-07-15', 80.50, 7500.00, 'Indian Oil Petrol Bunk, Highway');
INSERT INTO `fuel_logs` VALUES (2, 2, '2024-07-16', 65.00, 6100.00, 'HP Petrol Bunk, Near Campus');

-- ----------------------------
-- Table structure for general_ledger
-- ----------------------------
DROP TABLE IF EXISTS `general_ledger`;
CREATE TABLE `general_ledger`  (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_date` date NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`transaction_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of general_ledger
-- ----------------------------
INSERT INTO `general_ledger` VALUES (1, '2023-08-05', 'Received Tuition Fee Pymt - Inv #1 (Stu 11001)', 201);
INSERT INTO `general_ledger` VALUES (2, '2023-08-08', 'Received Tuition Fee Pymt - Inv #2 (Stu 11002)', 201);
INSERT INTO `general_ledger` VALUES (3, '2023-08-10', 'Received Tuition Fee Pymt - Inv #3 (Partial, Stu 11005)', 210);
INSERT INTO `general_ledger` VALUES (4, '2024-01-31', 'Paid Salaries for January 2024', 201);
INSERT INTO `general_ledger` VALUES (5, '2024-02-05', 'Purchased Lab Consumables for Chemistry Dept', 210);
INSERT INTO `general_ledger` VALUES (6, '2023-07-24', 'Received Tuition Fee Pymt - Inv #4 (Stu 11007)', 201);
INSERT INTO `general_ledger` VALUES (7, '2024-01-25', 'Received Tuition Fee Pymt - Inv #5 (Stu 11001)', 201);
INSERT INTO `general_ledger` VALUES (8, '2024-01-28', 'Received Tuition Fee Pymt - Inv #6 (Stu 11002)', 210);
INSERT INTO `general_ledger` VALUES (9, '2023-08-09', 'Received Tuition Fee Pymt - Inv #9 (Partial, Stu 11013)', 201);
INSERT INTO `general_ledger` VALUES (10, '2023-08-05', 'Received Hostel Fee Pymt - Inv #10 (Stu 11001)', 201);
INSERT INTO `general_ledger` VALUES (11, '2023-08-08', 'Received Hostel Fee Pymt - Inv #11 (Stu 11002)', 201);
INSERT INTO `general_ledger` VALUES (12, '2023-08-09', 'Received Transport Fee Pymt - Inv #12 (Stu 11004)', 210);

-- ----------------------------
-- Table structure for grant_applications
-- ----------------------------
DROP TABLE IF EXISTS `grant_applications`;
CREATE TABLE `grant_applications`  (
  `application_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NULL DEFAULT NULL,
  `funding_agency` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `application_date` date NULL DEFAULT NULL,
  `status` enum('Submitted','Under Review','Approved','Rejected') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `amount_requested` decimal(15, 2) NULL DEFAULT NULL,
  `proposal_path` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`application_id`) USING BTREE,
  INDEX `fk_grantapp_project`(`project_id`) USING BTREE,
  CONSTRAINT `fk_grantapp_project` FOREIGN KEY (`project_id`) REFERENCES `research_projects` (`project_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of grant_applications
-- ----------------------------
INSERT INTO `grant_applications` VALUES (1, 1, 'DST - SERB', '2021-12-10', 'Approved', 1500000.00, '/proposals/proj1_dst.pdf');
INSERT INTO `grant_applications` VALUES (2, 2, 'MeitY', '2022-10-01', 'Approved', 1200000.00, '/proposals/proj2_meity.pdf');
INSERT INTO `grant_applications` VALUES (3, 7, 'ICSSR', '2023-05-01', 'Submitted', 500000.00, '/proposals/proj7_icssr.pdf');

-- ----------------------------
-- Table structure for grant_expenditures
-- ----------------------------
DROP TABLE IF EXISTS `grant_expenditures`;
CREATE TABLE `grant_expenditures`  (
  `expenditure_id` int(11) NOT NULL AUTO_INCREMENT,
  `grant_id` int(11) NULL DEFAULT NULL,
  `category` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `amount` decimal(15, 2) NULL DEFAULT NULL,
  `expenditure_date` date NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `approved_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`expenditure_id`) USING BTREE,
  INDEX `fk_grantexp_grant`(`grant_id`) USING BTREE,
  INDEX `fk_grantexp_user`(`approved_by`) USING BTREE,
  CONSTRAINT `fk_grantexp_grant` FOREIGN KEY (`grant_id`) REFERENCES `research_grants` (`grant_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_grantexp_user` FOREIGN KEY (`approved_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of grant_expenditures
-- ----------------------------
INSERT INTO `grant_expenditures` VALUES (1, 1, 'Manpower', 400000.00, '2023-04-30', 'Salary for JRF for Year 1', 101);
INSERT INTO `grant_expenditures` VALUES (2, 1, 'Consumables', 50000.00, '2023-06-15', 'Purchase of datasets/software licenses', 101);
INSERT INTO `grant_expenditures` VALUES (3, 2, 'Equipment', 500000.00, '2023-03-10', 'Purchase of FPGA Development Boards', 102);

-- ----------------------------
-- Table structure for green_initiatives
-- ----------------------------
DROP TABLE IF EXISTS `green_initiatives`;
CREATE TABLE `green_initiatives`  (
  `initiative_id` int(11) NOT NULL AUTO_INCREMENT,
  `initiative_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `budget` decimal(15, 2) NULL DEFAULT NULL,
  `coordinator_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`initiative_id`) USING BTREE,
  INDEX `fk_green_staff`(`coordinator_id`) USING BTREE,
  CONSTRAINT `fk_green_staff` FOREIGN KEY (`coordinator_id`) REFERENCES `staff` (`staff_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of green_initiatives
-- ----------------------------
INSERT INTO `green_initiatives` VALUES (1, 'Campus Tree Plantation Drive 2024', '2024-07-28', '2024-07-28', 'Planting 100 saplings near sports ground.', 5000.00, 8);
INSERT INTO `green_initiatives` VALUES (2, 'Waste Segregation Awareness Campaign', '2024-09-01', '2024-09-30', 'Promote segregation of waste in hostels and academic blocks.', 2000.00, NULL);

-- ----------------------------
-- Table structure for guardians
-- ----------------------------
DROP TABLE IF EXISTS `guardians`;
CREATE TABLE `guardians`  (
  `guardian_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `first_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `relationship` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `emergency_contact` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`guardian_id`) USING BTREE,
  INDEX `fk_guardian_student`(`student_id`) USING BTREE,
  CONSTRAINT `fk_guardian_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of guardians
-- ----------------------------
INSERT INTO `guardians` VALUES (1, 11001, 'Sanjay', 'Sharma', 'Father', '9811100001', 'sanjay.s@email.com', 1);
INSERT INTO `guardians` VALUES (2, 11001, 'Sunita', 'Sharma', 'Mother', '9811200001', 'sunita.s@email.com', 0);
INSERT INTO `guardians` VALUES (3, 11002, 'Ashok', 'Das', 'Father', '9822100002', 'ashok.d@email.com', 1);
INSERT INTO `guardians` VALUES (4, 11003, 'Rakesh', 'Verma', 'Father', '9833100003', 'rakesh.v@email.com', 1);
INSERT INTO `guardians` VALUES (5, 11004, 'Kamlesh', 'Mistry', 'Father', '9844100004', 'kamlesh.m@email.com', 1);
INSERT INTO `guardians` VALUES (6, 11005, 'Rahim', 'Khan', 'Father', '9855100005', 'rahim.k@email.com', 1);
INSERT INTO `guardians` VALUES (7, 11006, 'Prakash', 'Joshi', 'Father', '9866100006', 'prakash.j@email.com', 1);
INSERT INTO `guardians` VALUES (8, 11007, 'Mahesh', 'Kumar', 'Father', '9877100007', 'mahesh.k@email.com', 1);
INSERT INTO `guardians` VALUES (9, 11008, 'Rajendra', 'Singh', 'Father', '9888100008', 'rajendra.s@email.com', 1);
INSERT INTO `guardians` VALUES (10, 11009, 'Bharat', 'Patel', 'Father', '9899100009', 'bharat.p@email.com', 1);
INSERT INTO `guardians` VALUES (11, 11010, 'Vikram', 'Sharma', 'Father', '9910100010', 'vikram.s@email.com', 1);
INSERT INTO `guardians` VALUES (12, 11011, 'Anand', 'Raj', 'Father', '9921100011', 'anand.r@email.com', 1);
INSERT INTO `guardians` VALUES (13, 11012, 'Manish', 'Gupta', 'Father', '9932100012', 'manish.g@email.com', 1);
INSERT INTO `guardians` VALUES (14, 11013, 'Rajesh', 'Verma', 'Father', '9943100013', 'rajesh.v@college.edu.in', 1);
INSERT INTO `guardians` VALUES (15, 11014, 'Subrata', 'Sen', 'Father', '9954100014', 'subrata.s@email.com', 1);
INSERT INTO `guardians` VALUES (16, 11015, 'Dipak', 'Mehta', 'Father', '9965100015', 'dipak.m@email.com', 1);
INSERT INTO `guardians` VALUES (17, 11016, 'Ajay', 'Agarwal', 'Father', '9976100016', 'ajay.a@email.com', 1);
INSERT INTO `guardians` VALUES (18, 11017, 'Anil', 'Nayar', 'Father', '9987100017', 'anil.n@email.com', 1);
INSERT INTO `guardians` VALUES (19, 11018, 'Rama', 'Devi', 'Mother', '9998100018', 'rama.d@email.com', 1);
INSERT INTO `guardians` VALUES (20, 11019, 'Karan', 'Singh', 'Father', '9109100019', 'karan.s@email.com', 1);
INSERT INTO `guardians` VALUES (21, 11020, 'Irfan', 'Ali', 'Father', '9210100020', 'irfan.a@email.com', 1);

-- ----------------------------
-- Table structure for health_campaigns
-- ----------------------------
DROP TABLE IF EXISTS `health_campaigns`;
CREATE TABLE `health_campaigns`  (
  `campaign_id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `target_audience` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`campaign_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of health_campaigns
-- ----------------------------
INSERT INTO `health_campaigns` VALUES (1, 'Mental Health Awareness Week', '2024-10-07', '2024-10-11', 'Series of workshops, talks on stress management, mental well-being.', 'All');
INSERT INTO `health_campaigns` VALUES (2, 'Healthy Lifestyle Challenge', '2025-02-01', '2025-02-28', 'Encouraging physical activity and healthy eating habits.', 'Students, Staff');

-- ----------------------------
-- Table structure for health_insurance
-- ----------------------------
DROP TABLE IF EXISTS `health_insurance`;
CREATE TABLE `health_insurance`  (
  `insurance_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `policy_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `provider` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `coverage_details` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`insurance_id`) USING BTREE,
  INDEX `fk_healthins_student`(`student_id`) USING BTREE,
  CONSTRAINT `fk_healthins_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of health_insurance
-- ----------------------------
INSERT INTO `health_insurance` VALUES (1, 11001, 'GRPCOL/12345/001', 'Star Health Insurance', '2023-08-01', '2024-07-31', 'Group policy coverage up to INR 1 Lakh.');
INSERT INTO `health_insurance` VALUES (2, 11002, 'GRPCOL/12345/002', 'Star Health Insurance', '2023-08-01', '2024-07-31', 'Group policy coverage up to INR 1 Lakh.');

-- ----------------------------
-- Table structure for health_records
-- ----------------------------
DROP TABLE IF EXISTS `health_records`;
CREATE TABLE `health_records`  (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `visit_date` date NULL DEFAULT NULL,
  `diagnosis` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `treatment` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `doctor_id` int(11) NULL DEFAULT NULL,
  `prescription_path` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE,
  INDEX `fk_healthrec_student`(`student_id`) USING BTREE,
  INDEX `fk_healthrec_staff`(`doctor_id`) USING BTREE,
  CONSTRAINT `fk_healthrec_staff` FOREIGN KEY (`doctor_id`) REFERENCES `staff` (`staff_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_healthrec_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of health_records
-- ----------------------------
INSERT INTO `health_records` VALUES (1, 11002, '2024-02-10', 'Viral Fever', 'Rest, Paracetamol, Hydration advised.', 21, NULL);
INSERT INTO `health_records` VALUES (2, 11009, '2023-11-25', 'Minor sprain during sports', 'Pain relief spray, rest recommended.', 21, '/prescriptions/11009_sprain_231125.pdf');

-- ----------------------------
-- Table structure for hostel_allocations
-- ----------------------------
DROP TABLE IF EXISTS `hostel_allocations`;
CREATE TABLE `hostel_allocations`  (
  `allocation_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `room_id` int(11) NULL DEFAULT NULL,
  `allocation_date` date NULL DEFAULT NULL,
  `vacate_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`allocation_id`) USING BTREE,
  INDEX `fk_hostelalloc_student`(`student_id`) USING BTREE,
  INDEX `fk_hostelalloc_room`(`room_id`) USING BTREE,
  CONSTRAINT `fk_hostelalloc_room` FOREIGN KEY (`room_id`) REFERENCES `hostel_rooms` (`room_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_hostelalloc_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hostel_allocations
-- ----------------------------
INSERT INTO `hostel_allocations` VALUES (1, 11001, 1, '2023-08-01', NULL);
INSERT INTO `hostel_allocations` VALUES (2, 11003, 1, '2023-08-05', NULL);
INSERT INTO `hostel_allocations` VALUES (3, 11005, 1, '2023-08-10', NULL);
INSERT INTO `hostel_allocations` VALUES (4, 11009, 2, '2023-08-01', NULL);
INSERT INTO `hostel_allocations` VALUES (5, 11011, 2, '2023-08-01', NULL);
INSERT INTO `hostel_allocations` VALUES (6, 11015, 2, '2023-08-05', NULL);
INSERT INTO `hostel_allocations` VALUES (7, 11002, 6, '2023-08-01', NULL);
INSERT INTO `hostel_allocations` VALUES (8, 11004, 6, '2023-08-05', NULL);
INSERT INTO `hostel_allocations` VALUES (9, 11006, 6, '2023-08-10', NULL);
INSERT INTO `hostel_allocations` VALUES (10, 11010, 7, '2023-08-05', NULL);
INSERT INTO `hostel_allocations` VALUES (11, 11012, 7, '2023-08-10', NULL);
INSERT INTO `hostel_allocations` VALUES (12, 11014, 7, '2023-08-01', NULL);
INSERT INTO `hostel_allocations` VALUES (13, 11008, 9, '2020-08-15', '2024-05-30');
INSERT INTO `hostel_allocations` VALUES (14, 11018, 9, '2023-08-05', NULL);
INSERT INTO `hostel_allocations` VALUES (15, 11020, 10, '2023-08-10', NULL);
INSERT INTO `hostel_allocations` VALUES (16, 11016, 10, '2023-08-10', NULL);

-- ----------------------------
-- Table structure for hostel_fees
-- ----------------------------
DROP TABLE IF EXISTS `hostel_fees`;
CREATE TABLE `hostel_fees`  (
  `fee_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `amount` decimal(10, 2) NULL DEFAULT NULL,
  `due_date` date NULL DEFAULT NULL,
  `payment_status` enum('Paid','Unpaid') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `payment_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`fee_id`) USING BTREE,
  INDEX `fk_hostelfee_student`(`student_id`) USING BTREE,
  CONSTRAINT `fk_hostelfee_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hostel_fees
-- ----------------------------
INSERT INTO `hostel_fees` VALUES (1, 11001, 60000.00, '2023-08-10', 'Paid', '2023-08-05');
INSERT INTO `hostel_fees` VALUES (2, 11002, 80000.00, '2023-08-10', 'Paid', '2023-08-08');
INSERT INTO `hostel_fees` VALUES (3, 11003, 60000.00, '2024-01-30', 'Unpaid', NULL);

-- ----------------------------
-- Table structure for hostel_incidents
-- ----------------------------
DROP TABLE IF EXISTS `hostel_incidents`;
CREATE TABLE `hostel_incidents`  (
  `incident_id` int(11) NOT NULL AUTO_INCREMENT,
  `hostel_id` int(11) NULL DEFAULT NULL,
  `incident_date` date NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `reported_by` int(11) NULL DEFAULT NULL,
  `status` enum('Open','Resolved') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `resolution` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`incident_id`) USING BTREE,
  INDEX `fk_hostelinc_hostel`(`hostel_id`) USING BTREE,
  INDEX `fk_hostelinc_user`(`reported_by`) USING BTREE,
  CONSTRAINT `fk_hostelinc_hostel` FOREIGN KEY (`hostel_id`) REFERENCES `hostels` (`hostel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_hostelinc_user` FOREIGN KEY (`reported_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hostel_incidents
-- ----------------------------
INSERT INTO `hostel_incidents` VALUES (1, 1, '2024-02-15', 'Ragging incident reported in Room NBH-305.', 22, 'Resolved', 'Students involved suspended for a semester after inquiry.');
INSERT INTO `hostel_incidents` VALUES (2, 2, '2024-07-10', 'Water leakage reported in washroom, GGH 2nd floor.', 212, 'Open', NULL);

-- ----------------------------
-- Table structure for hostel_maintenance
-- ----------------------------
DROP TABLE IF EXISTS `hostel_maintenance`;
CREATE TABLE `hostel_maintenance`  (
  `maintenance_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NULL DEFAULT NULL,
  `request_date` date NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `status` enum('Pending','In Progress','Completed') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `completed_date` date NULL DEFAULT NULL,
  `cost` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`maintenance_id`) USING BTREE,
  INDEX `fk_hostelmain_room`(`room_id`) USING BTREE,
  CONSTRAINT `fk_hostelmain_room` FOREIGN KEY (`room_id`) REFERENCES `hostel_rooms` (`room_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hostel_maintenance
-- ----------------------------
INSERT INTO `hostel_maintenance` VALUES (1, 7, '2024-06-01', 'AC not cooling effectively.', 'Completed', '2024-06-03', 1200.00);
INSERT INTO `hostel_maintenance` VALUES (2, 1, '2024-07-12', 'Room cleaning requested for common area.', 'Pending', NULL, NULL);

-- ----------------------------
-- Table structure for hostel_rooms
-- ----------------------------
DROP TABLE IF EXISTS `hostel_rooms`;
CREATE TABLE `hostel_rooms`  (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `hostel_id` int(11) NULL DEFAULT NULL,
  `room_number` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `capacity` int(11) NULL DEFAULT NULL,
  `current_occupancy` int(11) NULL DEFAULT NULL,
  `room_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`room_id`) USING BTREE,
  INDEX `fk_hostelroom_hostel`(`hostel_id`) USING BTREE,
  CONSTRAINT `fk_hostelroom_hostel` FOREIGN KEY (`hostel_id`) REFERENCES `hostels` (`hostel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hostel_rooms
-- ----------------------------
INSERT INTO `hostel_rooms` VALUES (1, 1, 'NBH-101', 3, 3, 'Triple Sharing Non-AC');
INSERT INTO `hostel_rooms` VALUES (2, 1, 'NBH-102', 3, 3, 'Triple Sharing Non-AC');
INSERT INTO `hostel_rooms` VALUES (3, 1, 'NBH-103', 3, 2, 'Triple Sharing Non-AC');
INSERT INTO `hostel_rooms` VALUES (4, 1, 'NBH-201', 2, 2, 'Double Sharing Non-AC');
INSERT INTO `hostel_rooms` VALUES (5, 1, 'NBH-202', 2, 1, 'Double Sharing Non-AC');
INSERT INTO `hostel_rooms` VALUES (6, 2, 'GGH-101', 3, 3, 'Triple Sharing AC');
INSERT INTO `hostel_rooms` VALUES (7, 2, 'GGH-102', 3, 3, 'Triple Sharing AC');
INSERT INTO `hostel_rooms` VALUES (8, 2, 'GGH-103', 3, 0, 'Triple Sharing AC');
INSERT INTO `hostel_rooms` VALUES (9, 2, 'GGH-201', 2, 2, 'Double Sharing Non-AC');
INSERT INTO `hostel_rooms` VALUES (10, 2, 'GGH-202', 2, 2, 'Double Sharing Non-AC');
INSERT INTO `hostel_rooms` VALUES (11, 3, 'KBH-101', 4, 4, 'Quad Sharing Non-AC');
INSERT INTO `hostel_rooms` VALUES (12, 3, 'KBH-102', 4, 3, 'Quad Sharing Non-AC');
INSERT INTO `hostel_rooms` VALUES (13, 1, 'NBH-G01', 1, 1, 'Single Room (Special)');

-- ----------------------------
-- Table structure for hostel_visitor_logs
-- ----------------------------
DROP TABLE IF EXISTS `hostel_visitor_logs`;
CREATE TABLE `hostel_visitor_logs`  (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `visitor_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `visit_date` date NULL DEFAULT NULL,
  `entry_time` time NULL DEFAULT NULL,
  `exit_time` time NULL DEFAULT NULL,
  `purpose` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `fk_hostelvis_student`(`student_id`) USING BTREE,
  CONSTRAINT `fk_hostelvis_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hostel_visitor_logs
-- ----------------------------
INSERT INTO `hostel_visitor_logs` VALUES (1, 11001, 'Sunita Sharma', '2024-07-14', '14:05:00', '15:25:00', 'Meeting student (Mother)');
INSERT INTO `hostel_visitor_logs` VALUES (2, 11002, 'Friend - Meena', '2024-07-15', '17:00:00', '18:30:00', 'Study group');

-- ----------------------------
-- Table structure for hostels
-- ----------------------------
DROP TABLE IF EXISTS `hostels`;
CREATE TABLE `hostels`  (
  `hostel_id` int(11) NOT NULL AUTO_INCREMENT,
  `hostel_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `warden_id` int(11) NULL DEFAULT NULL,
  `capacity` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`hostel_id`) USING BTREE,
  INDEX `fk_hostel_faculty`(`warden_id`) USING BTREE,
  CONSTRAINT `fk_hostel_faculty` FOREIGN KEY (`warden_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hostels
-- ----------------------------
INSERT INTO `hostels` VALUES (1, 'Narmada Boys Hostel', 'Block H1, College Campus, Bangalore', 22, 200);
INSERT INTO `hostels` VALUES (2, 'Godavari Girls Hostel', 'Block H2, College Campus, Bangalore', 212, 250);
INSERT INTO `hostels` VALUES (3, 'Kaveri Boys Hostel Annexe', 'Block H3, College Campus, Bangalore', 22, 150);
INSERT INTO `hostels` VALUES (4, 'Yamuna Faculty/Staff Hostel', 'Near Main Gate, College Campus', NULL, 50);

-- ----------------------------
-- Table structure for initiative_participation
-- ----------------------------
DROP TABLE IF EXISTS `initiative_participation`;
CREATE TABLE `initiative_participation`  (
  `participation_id` int(11) NOT NULL AUTO_INCREMENT,
  `initiative_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `participation_date` date NULL DEFAULT NULL,
  `contribution` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`participation_id`) USING BTREE,
  INDEX `fk_initpart_init`(`initiative_id`) USING BTREE,
  INDEX `fk_initpart_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_initpart_init` FOREIGN KEY (`initiative_id`) REFERENCES `green_initiatives` (`initiative_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_initpart_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of initiative_participation
-- ----------------------------
INSERT INTO `initiative_participation` VALUES (1, 1, 11001, '2024-07-28', 'Planted 2 saplings, helped with watering.');
INSERT INTO `initiative_participation` VALUES (2, 1, 103, '2024-07-28', 'Supervised student volunteers.');

-- ----------------------------
-- Table structure for inter_library_loans
-- ----------------------------
DROP TABLE IF EXISTS `inter_library_loans`;
CREATE TABLE `inter_library_loans`  (
  `loan_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NULL DEFAULT NULL,
  `borrowing_library` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `loan_date` date NULL DEFAULT NULL,
  `return_date` date NULL DEFAULT NULL,
  `status` enum('Requested','Loaned','Returned') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `shipping_cost` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`loan_id`) USING BTREE,
  INDEX `fk_ill_book`(`book_id`) USING BTREE,
  CONSTRAINT `fk_ill_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inter_library_loans
-- ----------------------------
INSERT INTO `inter_library_loans` VALUES (1, 16, 'IIT Madras Library', '2024-05-10', '2024-06-09', 'Returned', 150.00);
INSERT INTO `inter_library_loans` VALUES (2, 7, 'IISc Library Bangalore', '2024-06-01', NULL, 'Loaned', 100.00);

-- ----------------------------
-- Table structure for international_applications
-- ----------------------------
DROP TABLE IF EXISTS `international_applications`;
CREATE TABLE `international_applications`  (
  `international_app_id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NULL DEFAULT NULL,
  `passport_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `visa_status` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `language_proficiency_test` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `test_score` decimal(5, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`international_app_id`) USING BTREE,
  INDEX `fk_intlapp_app`(`application_id`) USING BTREE,
  CONSTRAINT `fk_intlapp_app` FOREIGN KEY (`application_id`) REFERENCES `applications` (`application_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of international_applications
-- ----------------------------
INSERT INTO `international_applications` VALUES (1, 6, 'SGP123456X', 'Student Pass Application Pending', 'IELTS', 7.50);

-- ----------------------------
-- Table structure for international_students
-- ----------------------------
DROP TABLE IF EXISTS `international_students`;
CREATE TABLE `international_students`  (
  `international_student_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `country_of_origin` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `passport_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `visa_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `visa_expiry_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`international_student_id`) USING BTREE,
  INDEX `fk_intlstudent_student`(`student_id`) USING BTREE,
  CONSTRAINT `fk_intlstudent_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of international_students
-- ----------------------------
INSERT INTO `international_students` VALUES (1, 11021, 'Singapore', 'SGP123456X', 'Student Visa', '2026-07-31');

-- ----------------------------
-- Table structure for internships
-- ----------------------------
DROP TABLE IF EXISTS `internships`;
CREATE TABLE `internships`  (
  `internship_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `stipend` decimal(15, 2) NULL DEFAULT NULL,
  `status` enum('Applied','Ongoing','Completed') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `certificate_path` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`internship_id`) USING BTREE,
  INDEX `fk_intern_comp`(`company_id`) USING BTREE,
  INDEX `fk_intern_student`(`student_id`) USING BTREE,
  CONSTRAINT `fk_intern_comp` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_intern_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of internships
-- ----------------------------
INSERT INTO `internships` VALUES (1, 1, 11008, '2023-06-01', '2023-11-30', 15000.00, 'Completed', '/internships/isha_infosys.pdf');
INSERT INTO `internships` VALUES (2, 4, 11014, '2024-06-15', '2024-08-14', 12000.00, 'Ongoing', NULL);

-- ----------------------------
-- Table structure for interview_schedules
-- ----------------------------
DROP TABLE IF EXISTS `interview_schedules`;
CREATE TABLE `interview_schedules`  (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `interview_date` date NULL DEFAULT NULL,
  `interview_time` time NULL DEFAULT NULL,
  `interviewer` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `platform` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`schedule_id`) USING BTREE,
  INDEX `fk_interv_job`(`job_id`) USING BTREE,
  INDEX `fk_interv_student`(`student_id`) USING BTREE,
  CONSTRAINT `fk_interv_job` FOREIGN KEY (`job_id`) REFERENCES `job_postings` (`job_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_interv_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of interview_schedules
-- ----------------------------
INSERT INTO `interview_schedules` VALUES (1, 1, 11008, '2024-08-06', '10:00:00', 'Ms. Priya Singh (Infosys)', 'Infosys Webex');
INSERT INTO `interview_schedules` VALUES (2, 4, 11001, '2024-08-18', '14:30:00', 'Accenture Tech Panel', 'MS Teams');

-- ----------------------------
-- Table structure for job_applications
-- ----------------------------
DROP TABLE IF EXISTS `job_applications`;
CREATE TABLE `job_applications`  (
  `application_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `job_id` int(11) NULL DEFAULT NULL,
  `application_date` date NULL DEFAULT NULL,
  `status` enum('Applied','Interviewed','Selected','Rejected') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `resume_path` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`application_id`) USING BTREE,
  INDEX `fk_jobapp_student`(`student_id`) USING BTREE,
  INDEX `fk_jobapp_job`(`job_id`) USING BTREE,
  CONSTRAINT `fk_jobapp_job` FOREIGN KEY (`job_id`) REFERENCES `job_postings` (`job_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jobapp_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of job_applications
-- ----------------------------
INSERT INTO `job_applications` VALUES (1, 11008, 1, '2024-07-22', 'Selected', '/resumes/isha_singh.pdf');
INSERT INTO `job_applications` VALUES (2, 11014, 2, '2024-08-01', 'Applied', '/resumes/priya_sen.pdf');
INSERT INTO `job_applications` VALUES (3, 11001, 4, '2024-08-05', 'Applied', '/resumes/akash_sharma.pdf');

-- ----------------------------
-- Table structure for job_postings
-- ----------------------------
DROP TABLE IF EXISTS `job_postings`;
CREATE TABLE `job_postings`  (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NULL DEFAULT NULL,
  `job_title` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `eligibility_criteria` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `application_deadline` date NULL DEFAULT NULL,
  `salary_range` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`job_id`) USING BTREE,
  INDEX `fk_jobpost_comp`(`company_id`) USING BTREE,
  CONSTRAINT `fk_jobpost_comp` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of job_postings
-- ----------------------------
INSERT INTO `job_postings` VALUES (1, 1, 'Systems Engineer Trainee', 'Role for fresh B.Tech graduates in CS/IT/ECE/EEE.', 'B.Tech (CS/IT/ECE/EEE), Final Year, Min 7 CGPA, No active backlogs.', '2024-07-31', '3.6 - 4.2 LPA');
INSERT INTO `job_postings` VALUES (2, 4, 'Graduate Engineer Trainee - Civil', 'On-site roles for civil engineering graduates.', 'B.Tech (Civil), Final Year, Min 6.5 CGPA.', '2024-08-10', '4.0 - 4.5 LPA');
INSERT INTO `job_postings` VALUES (3, 6, 'Management Trainee - Finance', 'Role for MBA Finance freshers.', 'MBA (Finance Specialization), Final Year, Good Academic Record.', '2024-09-01', '6.0 - 7.5 LPA');
INSERT INTO `job_postings` VALUES (4, 9, 'Analyst - Technology Consulting', 'Entry-level analyst role for various engineering grads.', 'B.Tech (Any Branch), Min 7 CGPA.', '2024-08-15', '4.5 - 5.5 LPA');

-- ----------------------------
-- Table structure for lab_schedules
-- ----------------------------
DROP TABLE IF EXISTS `lab_schedules`;
CREATE TABLE `lab_schedules`  (
  `lab_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NULL DEFAULT NULL,
  `faculty_id` int(11) NULL DEFAULT NULL,
  `room_id` int(11) NULL DEFAULT NULL,
  `day_of_week` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `start_time` time NULL DEFAULT NULL,
  `end_time` time NULL DEFAULT NULL,
  `semester` int(11) NULL DEFAULT NULL,
  `year` int(11) NULL DEFAULT NULL,
  `equipment_needed` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`lab_id`) USING BTREE,
  INDEX `fk_lab_course`(`course_id`) USING BTREE,
  INDEX `fk_lab_faculty`(`faculty_id`) USING BTREE,
  INDEX `fk_lab_room`(`room_id`) USING BTREE,
  CONSTRAINT `fk_lab_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_lab_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_lab_room` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lab_schedules
-- ----------------------------
INSERT INTO `lab_schedules` VALUES (1, 101, 12, 11, 'Friday', '09:00:00', '11:00:00', 1, 2023, 'PCs with C Compiler (Turbo C/GCC)');
INSERT INTO `lab_schedules` VALUES (2, 201, 13, 14, 'Wednesday', '09:00:00', '11:00:00', 1, 2023, 'CROs, Function Generators, Diodes, Resistors');

-- ----------------------------
-- Table structure for learning_outcomes
-- ----------------------------
DROP TABLE IF EXISTS `learning_outcomes`;
CREATE TABLE `learning_outcomes`  (
  `outcome_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `assessment_method` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bloom_level` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`outcome_id`) USING BTREE,
  INDEX `fk_outcome_course`(`course_id`) USING BTREE,
  CONSTRAINT `fk_outcome_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of learning_outcomes
-- ----------------------------
INSERT INTO `learning_outcomes` VALUES (1, 101, 'Understand and apply fundamental programming constructs (variables, loops, conditions) in C.', 'Assignments, Midterm, Final Exam', 'Apply');
INSERT INTO `learning_outcomes` VALUES (2, 101, 'Write, compile, and debug simple C programs.', 'Lab Exercises, Assignments', 'Apply');
INSERT INTO `learning_outcomes` VALUES (3, 103, 'Analyze the time and space complexity of algorithms.', 'Assignments, Quizzes, Exams', 'Analyze');
INSERT INTO `learning_outcomes` VALUES (4, 103, 'Implement and compare different sorting and searching algorithms.', 'Assignments, Lab Exams', 'Apply/Evaluate');

-- ----------------------------
-- Table structure for leave_records
-- ----------------------------
DROP TABLE IF EXISTS `leave_records`;
CREATE TABLE `leave_records`  (
  `leave_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `leave_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `approved_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`leave_id`) USING BTREE,
  INDEX `fk_leave_user`(`user_id`) USING BTREE,
  INDEX `fk_leave_approver`(`approved_by`) USING BTREE,
  CONSTRAINT `fk_leave_approver` FOREIGN KEY (`approved_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_leave_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of leave_records
-- ----------------------------
INSERT INTO `leave_records` VALUES (1, 101, 'Casual Leave', '2024-07-22', '2024-07-22', 'Approved', 24);
INSERT INTO `leave_records` VALUES (2, 205, 'Medical Leave', '2024-06-10', '2024-06-12', 'Approved', 202);
INSERT INTO `leave_records` VALUES (3, 102, 'Earned Leave', '2024-08-01', '2024-08-05', 'Pending', 25);

-- ----------------------------
-- Table structure for ledger_entry
-- ----------------------------
DROP TABLE IF EXISTS `ledger_entry`;
CREATE TABLE `ledger_entry`  (
  `entry_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NULL DEFAULT NULL,
  `account_id` int(11) NULL DEFAULT NULL,
  `debit` decimal(15, 2) NULL DEFAULT 0.00,
  `credit` decimal(15, 2) NULL DEFAULT 0.00,
  `entry_description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`entry_id`) USING BTREE,
  INDEX `fk_ledgerentry_gl`(`transaction_id`) USING BTREE,
  INDEX `fk_ledgerentry_account`(`account_id`) USING BTREE,
  CONSTRAINT `fk_ledgerentry_account` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_ledgerentry_gl` FOREIGN KEY (`transaction_id`) REFERENCES `general_ledger` (`transaction_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ledger_entry
-- ----------------------------
INSERT INTO `ledger_entry` VALUES (1, 1, 1110, 168500.00, 0.00, 'Dr Cash/Bank for fee receipt Inv #1');
INSERT INTO `ledger_entry` VALUES (2, 1, 1120, 0.00, 168500.00, 'Cr Accounts Receivable - Fees for Inv #1');
INSERT INTO `ledger_entry` VALUES (3, 2, 1110, 17000.00, 0.00, 'Dr Cash/Bank for fee receipt Inv #2');
INSERT INTO `ledger_entry` VALUES (4, 2, 1120, 0.00, 17000.00, 'Cr Accounts Receivable - Fees for Inv #2');
INSERT INTO `ledger_entry` VALUES (5, 3, 1110, 250000.00, 0.00, 'Dr Cash/Bank for partial fee receipt Inv #3');
INSERT INTO `ledger_entry` VALUES (6, 3, 1120, 0.00, 250000.00, 'Cr Accounts Receivable - Fees for Inv #3 partial');
INSERT INTO `ledger_entry` VALUES (7, 4, 5100, 500000.00, 0.00, 'Dr Salary Expense Jan 2024');
INSERT INTO `ledger_entry` VALUES (8, 4, 1110, 0.00, 500000.00, 'Cr Cash/Bank for salary payment');
INSERT INTO `ledger_entry` VALUES (9, 5, 5300, 5000.00, 0.00, 'Dr Maintenance/Lab Supplies Expense');
INSERT INTO `ledger_entry` VALUES (10, 5, 1110, 0.00, 5000.00, 'Cr Cash/Bank for consumables payment');
INSERT INTO `ledger_entry` VALUES (11, 6, 1110, 329500.00, 0.00, 'Dr Cash/Bank for fee receipt Inv #4');
INSERT INTO `ledger_entry` VALUES (12, 6, 1120, 0.00, 329500.00, 'Cr Accounts Receivable - Fees for Inv #4');
INSERT INTO `ledger_entry` VALUES (13, 7, 1110, 163000.00, 0.00, 'Dr Cash/Bank for fee receipt Inv #5');
INSERT INTO `ledger_entry` VALUES (14, 7, 1120, 0.00, 163000.00, 'Cr Accounts Receivable - Fees for Inv #5');
INSERT INTO `ledger_entry` VALUES (15, 8, 1110, 12000.00, 0.00, 'Dr Cash/Bank for fee receipt Inv #6');
INSERT INTO `ledger_entry` VALUES (16, 8, 1120, 0.00, 12000.00, 'Cr Accounts Receivable - Fees for Inv #6');
INSERT INTO `ledger_entry` VALUES (17, 9, 1110, 80000.00, 0.00, 'Dr Cash/Bank for partial fee receipt Inv #9');
INSERT INTO `ledger_entry` VALUES (18, 9, 1120, 0.00, 80000.00, 'Cr Accounts Receivable - Fees for Inv #9 partial');
INSERT INTO `ledger_entry` VALUES (19, 1, 1120, 168500.00, 0.00, 'Dr A/R Inv#1 Reversal? No, that was asset swap.');
INSERT INTO `ledger_entry` VALUES (20, 1, 4100, 0.00, 168500.00, 'Cr Tuition Fee Revenue Inv #1');
INSERT INTO `ledger_entry` VALUES (21, 2, 4100, 0.00, 17000.00, 'Cr Tuition Fee Revenue Inv #2');
INSERT INTO `ledger_entry` VALUES (22, 3, 4100, 0.00, 250000.00, 'Cr Tuition Fee Revenue Inv #3 (Partial)');
INSERT INTO `ledger_entry` VALUES (23, 4, 4100, 0.00, 329500.00, 'Cr Tuition Fee Revenue Inv #4');
INSERT INTO `ledger_entry` VALUES (24, 7, 4100, 0.00, 163000.00, 'Cr Tuition Fee Revenue Inv #5');
INSERT INTO `ledger_entry` VALUES (25, 8, 4100, 0.00, 12000.00, 'Cr Tuition Fee Revenue Inv #6');
INSERT INTO `ledger_entry` VALUES (26, 9, 4100, 0.00, 80000.00, 'Cr Tuition Fee Revenue Inv #9 (Partial)');
INSERT INTO `ledger_entry` VALUES (27, 10, 1110, 60000.00, 0.00, 'Dr Cash/Bank Hostel Fee Inv #10');
INSERT INTO `ledger_entry` VALUES (28, 10, 4150, 0.00, 60000.00, 'Cr Hostel Fee Revenue Inv #10');
INSERT INTO `ledger_entry` VALUES (29, 11, 1110, 80000.00, 0.00, 'Dr Cash/Bank Hostel Fee Inv #11');
INSERT INTO `ledger_entry` VALUES (30, 11, 4150, 0.00, 80000.00, 'Cr Hostel Fee Revenue Inv #11');
INSERT INTO `ledger_entry` VALUES (31, 12, 1110, 25000.00, 0.00, 'Dr Cash/Bank Transport Fee Inv #12');
INSERT INTO `ledger_entry` VALUES (32, 12, 4160, 0.00, 25000.00, 'Cr Transport Fee Revenue Inv #12');

-- ----------------------------
-- Table structure for library_fines
-- ----------------------------
DROP TABLE IF EXISTS `library_fines`;
CREATE TABLE `library_fines`  (
  `fine_id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) NULL DEFAULT NULL,
  `fine_amount` decimal(5, 2) NULL DEFAULT NULL,
  `fine_date` date NULL DEFAULT NULL,
  `payment_status` enum('Unpaid','Paid','Waived') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `payment_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`fine_id`) USING BTREE,
  INDEX `fk_libfine_issue`(`issue_id`) USING BTREE,
  CONSTRAINT `fk_libfine_issue` FOREIGN KEY (`issue_id`) REFERENCES `book_issues` (`issue_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of library_fines
-- ----------------------------
INSERT INTO `library_fines` VALUES (1, 3, 3.00, '2024-07-02', 'Paid', '2024-07-03');

-- ----------------------------
-- Table structure for library_members
-- ----------------------------
DROP TABLE IF EXISTS `library_members`;
CREATE TABLE `library_members`  (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `membership_type` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `join_date` date NULL DEFAULT NULL,
  `expiry_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`member_id`) USING BTREE,
  INDEX `fk_libmember_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_libmember_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of library_members
-- ----------------------------
INSERT INTO `library_members` VALUES (1, 11001, 'Student', '2021-08-02', '2025-07-31');
INSERT INTO `library_members` VALUES (2, 11002, 'Student', '2021-08-02', '2025-07-31');
INSERT INTO `library_members` VALUES (3, 11003, 'Student', '2022-08-06', '2026-07-31');
INSERT INTO `library_members` VALUES (4, 11004, 'Student', '2022-08-06', '2026-07-31');
INSERT INTO `library_members` VALUES (5, 11005, 'Student', '2023-08-11', '2027-07-31');
INSERT INTO `library_members` VALUES (6, 11006, 'Student', '2023-08-11', '2027-07-31');
INSERT INTO `library_members` VALUES (7, 11007, 'Student', '2023-07-21', '2025-06-30');
INSERT INTO `library_members` VALUES (8, 11008, 'Student', '2020-08-16', '2024-07-31');
INSERT INTO `library_members` VALUES (9, 11009, 'Student', '2021-08-02', '2025-07-31');
INSERT INTO `library_members` VALUES (10, 11010, 'Student', '2022-08-06', '2026-07-31');
INSERT INTO `library_members` VALUES (11, 101, 'Faculty', '2008-07-20', NULL);
INSERT INTO `library_members` VALUES (12, 102, 'Faculty', '2009-06-05', NULL);
INSERT INTO `library_members` VALUES (13, 110, 'Faculty', '2011-08-15', NULL);
INSERT INTO `library_members` VALUES (14, 24, 'Faculty', '2010-01-10', NULL);
INSERT INTO `library_members` VALUES (15, 201, 'Staff', '2007-05-15', NULL);
INSERT INTO `library_members` VALUES (16, 203, 'Staff', '2006-07-05', NULL);
INSERT INTO `library_members` VALUES (17, 208, 'Staff', '2011-01-25', NULL);
INSERT INTO `library_members` VALUES (18, 11015, 'Student', '2022-08-06', '2026-07-31');

-- ----------------------------
-- Table structure for library_usage_analytics
-- ----------------------------
DROP TABLE IF EXISTS `library_usage_analytics`;
CREATE TABLE `library_usage_analytics`  (
  `analytic_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NULL DEFAULT NULL,
  `issue_count` int(11) NULL DEFAULT NULL,
  `reservation_count` int(11) NULL DEFAULT NULL,
  `analysis_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`analytic_id`) USING BTREE,
  INDEX `fk_libusage_book`(`book_id`) USING BTREE,
  CONSTRAINT `fk_libusage_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of library_usage_analytics
-- ----------------------------
INSERT INTO `library_usage_analytics` VALUES (1, 1, 55, 5, '2024-06-30');
INSERT INTO `library_usage_analytics` VALUES (2, 3, 25, 8, '2024-06-30');

-- ----------------------------
-- Table structure for lms_certifications
-- ----------------------------
DROP TABLE IF EXISTS `lms_certifications`;
CREATE TABLE `lms_certifications`  (
  `certification_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `course_id` int(11) NULL DEFAULT NULL,
  `issue_date` date NULL DEFAULT NULL,
  `certificate_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `expiry_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`certification_id`) USING BTREE,
  INDEX `fk_lmscert_student`(`student_id`) USING BTREE,
  INDEX `fk_lmscert_course`(`course_id`) USING BTREE,
  CONSTRAINT `fk_lmscert_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_lmscert_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lms_certifications
-- ----------------------------
INSERT INTO `lms_certifications` VALUES (1, 11001, 101, '2023-12-20', 'LMSCERT/CS101/001', NULL);
INSERT INTO `lms_certifications` VALUES (2, 11002, 201, '2023-12-20', 'LMSCERT/EC101/001', NULL);

-- ----------------------------
-- Table structure for marks
-- ----------------------------
DROP TABLE IF EXISTS `marks`;
CREATE TABLE `marks`  (
  `mark_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `exam_id` int(11) NULL DEFAULT NULL,
  `marks_obtained` decimal(6, 2) NULL DEFAULT NULL,
  `grade` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `evaluated_by` int(11) NULL DEFAULT NULL,
  `evaluation_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`mark_id`) USING BTREE,
  INDEX `fk_marks_student`(`student_id`) USING BTREE,
  INDEX `fk_marks_exam`(`exam_id`) USING BTREE,
  INDEX `fk_marks_faculty`(`evaluated_by`) USING BTREE,
  CONSTRAINT `fk_marks_exam` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_marks_faculty` FOREIGN KEY (`evaluated_by`) REFERENCES `faculty` (`faculty_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_marks_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of marks
-- ----------------------------
INSERT INTO `marks` VALUES (1, 11001, 1, 40.00, 'A', 101, '2023-10-15 10:00:00');
INSERT INTO `marks` VALUES (2, 11016, 1, 45.00, 'A+', 101, '2023-10-15 10:05:00');
INSERT INTO `marks` VALUES (3, 11011, 1, 35.00, 'B+', 101, '2023-10-15 10:10:00');
INSERT INTO `marks` VALUES (4, 11001, 2, 38.00, 'A', 108, '2023-10-16 11:00:00');
INSERT INTO `marks` VALUES (5, 11002, 2, 42.00, 'A+', 108, '2023-10-16 11:05:00');
INSERT INTO `marks` VALUES (6, 11001, 4, 80.00, 'A', 101, '2023-12-20 14:00:00');
INSERT INTO `marks` VALUES (7, 11016, 4, 88.00, 'A+', 101, '2023-12-20 14:05:00');
INSERT INTO `marks` VALUES (8, 11011, 4, 75.00, 'B+', 101, '2023-12-20 14:10:00');
INSERT INTO `marks` VALUES (9, 11001, 8, 42.00, 'A+', 24, '2024-04-15 15:00:00');
INSERT INTO `marks` VALUES (10, 11009, 8, 38.00, 'A', 24, '2024-04-15 15:05:00');
INSERT INTO `marks` VALUES (11, 11002, 9, 40.00, 'A', 25, '2024-04-16 16:00:00');
INSERT INTO `marks` VALUES (12, 11010, 9, 36.00, 'B+', 25, '2024-04-16 16:05:00');
INSERT INTO `marks` VALUES (13, 11001, 11, 8.00, 'A', 24, '2024-03-21 10:00:00');
INSERT INTO `marks` VALUES (14, 11009, 11, 7.00, 'B+', 24, '2024-03-21 10:05:00');
INSERT INTO `marks` VALUES (15, 11001, 5, 78.00, 'A', 108, '2023-12-21 11:00:00');
INSERT INTO `marks` VALUES (16, 11002, 6, 85.00, 'A+', 102, '2023-12-22 10:00:00');
INSERT INTO `marks` VALUES (17, 11003, 10, 41.00, 'A', 26, '2024-04-18 09:00:00');

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages`  (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NULL DEFAULT NULL,
  `receiver_id` int(11) NULL DEFAULT NULL,
  `message_text` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `sent_date` datetime NULL DEFAULT NULL,
  `read_status` tinyint(1) NULL DEFAULT NULL,
  `priority` enum('Low','Medium','High') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`message_id`) USING BTREE,
  INDEX `fk_msg_sender`(`sender_id`) USING BTREE,
  INDEX `fk_msg_receiver`(`receiver_id`) USING BTREE,
  CONSTRAINT `fk_msg_receiver` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_msg_sender` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of messages
-- ----------------------------
INSERT INTO `messages` VALUES (1, 101, 11001, 'Akash, please see me regarding your assignment submission during office hours.', '2024-07-15 09:00:00', 0, 'Medium');
INSERT INTO `messages` VALUES (2, 24, 101, 'Faculty Meeting scheduled for tomorrow at 3 PM in Dept Conference room.', '2024-07-14 16:00:00', 1, 'High');
INSERT INTO `messages` VALUES (3, 11002, 11010, 'Hi Kavita, can we study for the EC202 exam together this weekend?', '2024-07-13 10:00:00', 1, 'Low');

-- ----------------------------
-- Table structure for networking_opportunities
-- ----------------------------
DROP TABLE IF EXISTS `networking_opportunities`;
CREATE TABLE `networking_opportunities`  (
  `opportunity_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `posted_by` int(11) NULL DEFAULT NULL,
  `posted_date` date NULL DEFAULT NULL,
  `expiry_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`opportunity_id`) USING BTREE,
  INDEX `fk_netopp_alumni`(`posted_by`) USING BTREE,
  CONSTRAINT `fk_netopp_alumni` FOREIGN KEY (`posted_by`) REFERENCES `alumni` (`alumni_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of networking_opportunities
-- ----------------------------
INSERT INTO `networking_opportunities` VALUES (1, 'AI/ML Enthusiasts Meetup - Bangalore', 'Informal meetup for people working in AI/ML.', 1, '2024-07-11', '2024-07-31');

-- ----------------------------
-- Table structure for notices
-- ----------------------------
DROP TABLE IF EXISTS `notices`;
CREATE TABLE `notices`  (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `published_by` int(11) NULL DEFAULT NULL,
  `published_date` date NULL DEFAULT NULL,
  `target_audience` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `expiry_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`notice_id`) USING BTREE,
  INDEX `fk_notice_user`(`published_by`) USING BTREE,
  CONSTRAINT `fk_notice_user` FOREIGN KEY (`published_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notices
-- ----------------------------
INSERT INTO `notices` VALUES (1, 'Midterm Exam Schedule - Oct 2023', 'The schedule for the upcoming Midterm examinations for all programs is attached. Please check the notice board and college website.', 1, '2023-09-25', 'Students,Faculty', '2023-10-15');
INSERT INTO `notices` VALUES (2, 'TechVistara 2024 - Event Participation Call', 'Students interested in participating in TechVistara events should register by March 1st. Contact the Student Council.', 208, '2024-02-15', 'Students', '2024-03-01');
INSERT INTO `notices` VALUES (3, 'Holiday Notice - Diwali', 'The college will remain closed on Nov 1st and 2nd, 2024 on account of Diwali.', 2, '2024-10-25', 'All', '2024-11-03');
INSERT INTO `notices` VALUES (4, 'Library Book Return Reminder', 'All issued books due before July 15th must be returned immediately to avoid fines.', 203, '2024-07-10', 'Students,Faculty,Staff', '2024-07-20');
INSERT INTO `notices` VALUES (5, 'Placement Drive - Infosys', 'Infosys Campus Recruitment drive scheduled for Aug 5th, 2024. Eligible final year students check placement portal.', 23, '2024-07-20', 'Students', '2024-08-05');

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications`  (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `notification_text` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `sent_date` datetime NULL DEFAULT NULL,
  `read_status` tinyint(1) NULL DEFAULT NULL,
  `category` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`notification_id`) USING BTREE,
  INDEX `fk_notif_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_notif_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notifications
-- ----------------------------
INSERT INTO `notifications` VALUES (1, 11001, 'Your attendance appeal for 2023-08-07 has been approved.', '2023-08-10 11:00:00', 1, 'Attendance');
INSERT INTO `notifications` VALUES (2, 101, 'Reminder: Submit appraisal self-assessment by June 5th.', '2024-06-01 09:00:00', 1, 'HR/Admin');
INSERT INTO `notifications` VALUES (3, 11010, 'Your library book \"Digital Design\" is due on 2024-07-28.', '2024-07-14 10:00:00', 0, 'Library');

-- ----------------------------
-- Table structure for offline_sync_queue
-- ----------------------------
DROP TABLE IF EXISTS `offline_sync_queue`;
CREATE TABLE `offline_sync_queue`  (
  `sync_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_user_id` int(11) NULL DEFAULT NULL,
  `action_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `table_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `data` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `sync_status` enum('Pending','Synced') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sync_id`) USING BTREE,
  INDEX `fk_offsync_appuser`(`app_user_id`) USING BTREE,
  CONSTRAINT `fk_offsync_appuser` FOREIGN KEY (`app_user_id`) REFERENCES `app_users` (`app_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of offline_sync_queue
-- ----------------------------
INSERT INTO `offline_sync_queue` VALUES (1, 1, 'UPDATE_ATTENDANCE', 'attendance', '{\"record_id\": 99, \"status\": \"Present\"}', '2024-07-16 11:00:00', 'Pending');

-- ----------------------------
-- Table structure for outcome_assessments
-- ----------------------------
DROP TABLE IF EXISTS `outcome_assessments`;
CREATE TABLE `outcome_assessments`  (
  `assessment_id` int(11) NOT NULL AUTO_INCREMENT,
  `outcome_id` int(11) NULL DEFAULT NULL,
  `assessment_date` date NULL DEFAULT NULL,
  `achieved_level` decimal(5, 2) NULL DEFAULT NULL,
  `comments` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`assessment_id`) USING BTREE,
  INDEX `fk_outassess_outcome`(`outcome_id`) USING BTREE,
  CONSTRAINT `fk_outassess_outcome` FOREIGN KEY (`outcome_id`) REFERENCES `program_outcomes` (`outcome_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of outcome_assessments
-- ----------------------------
INSERT INTO `outcome_assessments` VALUES (1, 1, '2023-12-20', 4.20, 'Good performance in assignments and exams related to basic constructs.');
INSERT INTO `outcome_assessments` VALUES (2, 2, '2023-12-20', 3.90, 'Most students able to debug simple programs, some struggled with complex logic.');

-- ----------------------------
-- Table structure for outreach_programs
-- ----------------------------
DROP TABLE IF EXISTS `outreach_programs`;
CREATE TABLE `outreach_programs`  (
  `program_id` int(11) NOT NULL AUTO_INCREMENT,
  `program_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `target_community` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `coordinator_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`program_id`) USING BTREE,
  INDEX `fk_outreach_faculty`(`coordinator_id`) USING BTREE,
  CONSTRAINT `fk_outreach_faculty` FOREIGN KEY (`coordinator_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of outreach_programs
-- ----------------------------
INSERT INTO `outreach_programs` VALUES (1, 'Computer Literacy Camp - Ramnagara Village', '2024-01-10', '2024-01-14', 'Basic computer skills training for village youth.', 'Ramnagara Village', 101);
INSERT INTO `outreach_programs` VALUES (2, 'Science Fun Day for School Children', '2023-11-25', '2023-11-25', 'Interactive science experiments for local school students.', 'Local Government Schools', 109);

-- ----------------------------
-- Table structure for parent_communications
-- ----------------------------
DROP TABLE IF EXISTS `parent_communications`;
CREATE TABLE `parent_communications`  (
  `comm_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `guardian_id` int(11) NULL DEFAULT NULL,
  `message_text` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `sent_date` datetime NULL DEFAULT NULL,
  `method` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`comm_id`) USING BTREE,
  INDEX `fk_parentcomm_student`(`student_id`) USING BTREE,
  INDEX `fk_parentcomm_guardian`(`guardian_id`) USING BTREE,
  CONSTRAINT `fk_parentcomm_guardian` FOREIGN KEY (`guardian_id`) REFERENCES `guardians` (`guardian_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_parentcomm_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of parent_communications
-- ----------------------------
INSERT INTO `parent_communications` VALUES (1, 11001, 1, 'Sent SMS regarding Fee Due Date reminder.', '2024-01-20 10:00:00', 'SMS');
INSERT INTO `parent_communications` VALUES (2, 11013, 14, 'Meeting requested to discuss student\'s academic performance and suspension.', '2024-02-22 14:00:00', 'Email');

-- ----------------------------
-- Table structure for participant_feedback
-- ----------------------------
DROP TABLE IF EXISTS `participant_feedback`;
CREATE TABLE `participant_feedback`  (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NULL DEFAULT NULL,
  `participant_id` int(11) NULL DEFAULT NULL,
  `feedback_text` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `rating` int(11) NULL DEFAULT NULL,
  `feedback_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`feedback_id`) USING BTREE,
  INDEX `fk_partfeed_event`(`event_id`) USING BTREE,
  INDEX `fk_partfeed_user`(`participant_id`) USING BTREE,
  CONSTRAINT `fk_partfeed_event` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_partfeed_user` FOREIGN KEY (`participant_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of participant_feedback
-- ----------------------------
INSERT INTO `participant_feedback` VALUES (1, 1, 11017, 'Techfest events were amazing, especially the coding competition!', 5, '2024-03-16');
INSERT INTO `participant_feedback` VALUES (2, 9, 102, 'Well organized blood donation camp.', 4, '2024-07-25');

-- ----------------------------
-- Table structure for partner_institutions
-- ----------------------------
DROP TABLE IF EXISTS `partner_institutions`;
CREATE TABLE `partner_institutions`  (
  `partner_id` int(11) NOT NULL AUTO_INCREMENT,
  `institution_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `country` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `contact_person` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `accreditation_status` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`partner_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of partner_institutions
-- ----------------------------
INSERT INTO `partner_institutions` VALUES (1, 'National University of Singapore (NUS)', 'Singapore', 'Prof. Tan Eng Chye', 'intl@nus.edu.sg', '+6565166666', 'Globally Accredited');
INSERT INTO `partner_institutions` VALUES (2, 'Technical University of Munich (TUM)', 'Germany', 'Dr. Klaus Schmidt', 'exchange@tum.de', '+498928901', 'EQUIS, AACSB');

-- ----------------------------
-- Table structure for password_history
-- ----------------------------
DROP TABLE IF EXISTS `password_history`;
CREATE TABLE `password_history`  (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `password_hash` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `change_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`history_id`) USING BTREE,
  INDEX `fk_passhist_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_passhist_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of password_history
-- ----------------------------
INSERT INTO `password_history` VALUES (1, 11001, '$2y$10$oldHashValue........', '2024-01-10 15:30:00');
INSERT INTO `password_history` VALUES (2, 101, '$2y$10$anotherOldHash.......', '2023-11-20 09:00:00');
INSERT INTO `password_history` VALUES (3, 2, '$2y$10$evenOlderPrincipalHash....', '2023-01-15 12:00:00');
INSERT INTO `password_history` VALUES (4, 11002, '$2y$10$veryOldStudentHash.......', '2023-09-01 08:00:00');

-- ----------------------------
-- Table structure for patents
-- ----------------------------
DROP TABLE IF EXISTS `patents`;
CREATE TABLE `patents`  (
  `patent_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NULL DEFAULT NULL,
  `title` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `patent_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `filing_date` date NULL DEFAULT NULL,
  `status` enum('Pending','Granted') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `country` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`patent_id`) USING BTREE,
  INDEX `fk_patent_project`(`project_id`) USING BTREE,
  CONSTRAINT `fk_patent_project` FOREIGN KEY (`project_id`) REFERENCES `research_projects` (`project_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of patents
-- ----------------------------
INSERT INTO `patents` VALUES (1, 2, 'Low Power Adiabatic Logic Circuit Design', 'IN/2024/12345', '2024-04-10', 'Pending', 'India');

-- ----------------------------
-- Table structure for payment_disputes
-- ----------------------------
DROP TABLE IF EXISTS `payment_disputes`;
CREATE TABLE `payment_disputes`  (
  `dispute_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `dispute_date` date NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `status` enum('Pending','Under Review','Resolved','Escalated') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `resolution` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `resolved_by` int(11) NULL DEFAULT NULL,
  `resolved_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`dispute_id`) USING BTREE,
  INDEX `fk_dispute_payment`(`payment_id`) USING BTREE,
  INDEX `fk_dispute_student`(`student_id`) USING BTREE,
  INDEX `fk_dispute_user`(`resolved_by`) USING BTREE,
  CONSTRAINT `fk_dispute_payment` FOREIGN KEY (`payment_id`) REFERENCES `fee_payments` (`payment_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_dispute_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_dispute_user` FOREIGN KEY (`resolved_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_disputes
-- ----------------------------
INSERT INTO `payment_disputes` VALUES (1, 3, 11005, '2023-08-15', 'Payment made via NEFT not fully reflected against invoice #3.', 'Resolved', 'NEFT confirmed, remaining balance adjusted.', 201, '2023-08-18');

-- ----------------------------
-- Table structure for peer_reviews
-- ----------------------------
DROP TABLE IF EXISTS `peer_reviews`;
CREATE TABLE `peer_reviews`  (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) NULL DEFAULT NULL,
  `reviewer_id` int(11) NULL DEFAULT NULL,
  `reviewee_id` int(11) NULL DEFAULT NULL,
  `review_date` date NULL DEFAULT NULL,
  `score` int(11) NULL DEFAULT NULL,
  `comments` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`review_id`) USING BTREE,
  INDEX `fk_peer_assign`(`assignment_id`) USING BTREE,
  INDEX `fk_peer_reviewer`(`reviewer_id`) USING BTREE,
  INDEX `fk_peer_reviewee`(`reviewee_id`) USING BTREE,
  CONSTRAINT `fk_peer_assign` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`assignment_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_peer_reviewee` FOREIGN KEY (`reviewee_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_peer_reviewer` FOREIGN KEY (`reviewer_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of peer_reviews
-- ----------------------------
INSERT INTO `peer_reviews` VALUES (1, 5, 11009, 11001, '2024-03-12', 8, 'Code is well structured. Analysis is detailed. Minor comment improvement needed.');
INSERT INTO `peer_reviews` VALUES (2, 5, 11001, 11009, '2024-03-12', 7, 'Complexity analysis could be more rigorous. Code works correctly.');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NULL DEFAULT NULL,
  `module_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `can_view` tinyint(1) NULL DEFAULT NULL,
  `can_edit` tinyint(1) NULL DEFAULT NULL,
  `can_delete` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`permission_id`) USING BTREE,
  INDEX `fk_perm_role`(`role_id`) USING BTREE,
  CONSTRAINT `fk_perm_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 1, 'Users', 1, 1, 1);
INSERT INTO `permissions` VALUES (2, 1, 'Students', 1, 1, 1);
INSERT INTO `permissions` VALUES (3, 1, 'Faculty', 1, 1, 1);
INSERT INTO `permissions` VALUES (4, 1, 'Courses', 1, 1, 1);
INSERT INTO `permissions` VALUES (5, 1, 'Attendance', 1, 1, 1);
INSERT INTO `permissions` VALUES (6, 1, 'Marks', 1, 1, 1);
INSERT INTO `permissions` VALUES (7, 1, 'Fees', 1, 1, 1);
INSERT INTO `permissions` VALUES (8, 1, 'Settings', 1, 1, 1);
INSERT INTO `permissions` VALUES (9, 2, 'Students', 1, 0, 0);
INSERT INTO `permissions` VALUES (10, 2, 'Courses', 1, 0, 0);
INSERT INTO `permissions` VALUES (11, 2, 'Attendance', 1, 1, 0);
INSERT INTO `permissions` VALUES (12, 2, 'Marks', 1, 1, 0);
INSERT INTO `permissions` VALUES (13, 2, 'Assignments', 1, 1, 1);
INSERT INTO `permissions` VALUES (14, 3, 'Courses', 1, 0, 0);
INSERT INTO `permissions` VALUES (15, 3, 'Attendance', 1, 0, 0);
INSERT INTO `permissions` VALUES (16, 3, 'Marks', 1, 0, 0);
INSERT INTO `permissions` VALUES (17, 3, 'Assignments', 1, 0, 0);
INSERT INTO `permissions` VALUES (18, 3, 'Fees', 1, 0, 0);

-- ----------------------------
-- Table structure for petty_cash
-- ----------------------------
DROP TABLE IF EXISTS `petty_cash`;
CREATE TABLE `petty_cash`  (
  `cash_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NULL DEFAULT NULL,
  `amount` decimal(10, 2) NULL DEFAULT NULL,
  `request_date` date NULL DEFAULT NULL,
  `purpose` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `status` enum('Requested','Approved','Disbursed') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `approved_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`cash_id`) USING BTREE,
  INDEX `fk_petty_dept`(`department_id`) USING BTREE,
  INDEX `fk_petty_user`(`approved_by`) USING BTREE,
  CONSTRAINT `fk_petty_dept` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_petty_user` FOREIGN KEY (`approved_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of petty_cash
-- ----------------------------
INSERT INTO `petty_cash` VALUES (1, 13, 2000.00, '2024-07-10', 'Purchase of urgent office stationery.', 'Approved', 202);
INSERT INTO `petty_cash` VALUES (2, 9, 5000.00, '2024-07-12', 'Minor repairs for Physics lab equipment.', 'Disbursed', 32);

-- ----------------------------
-- Table structure for placement_statistics
-- ----------------------------
DROP TABLE IF EXISTS `placement_statistics`;
CREATE TABLE `placement_statistics`  (
  `statistic_id` int(11) NOT NULL AUTO_INCREMENT,
  `year` year NULL DEFAULT NULL,
  `total_students` int(11) NULL DEFAULT NULL,
  `placed_students` int(11) NULL DEFAULT NULL,
  `average_salary` decimal(15, 2) NULL DEFAULT NULL,
  `top_employer_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`statistic_id`) USING BTREE,
  INDEX `fk_placestat_comp`(`top_employer_id`) USING BTREE,
  CONSTRAINT `fk_placestat_comp` FOREIGN KEY (`top_employer_id`) REFERENCES `companies` (`company_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of placement_statistics
-- ----------------------------
INSERT INTO `placement_statistics` VALUES (1, 2023, 450, 380, 450000.00, 2);
INSERT INTO `placement_statistics` VALUES (2, 2024, 480, 410, 480000.00, 1);

-- ----------------------------
-- Table structure for predictive_models
-- ----------------------------
DROP TABLE IF EXISTS `predictive_models`;
CREATE TABLE `predictive_models`  (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_date` date NULL DEFAULT NULL,
  `accuracy` decimal(5, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`model_id`) USING BTREE,
  INDEX `fk_predmodel_user`(`created_by`) USING BTREE,
  CONSTRAINT `fk_predmodel_user` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of predictive_models
-- ----------------------------
INSERT INTO `predictive_models` VALUES (1, 'Student Dropout Prediction Model v1', 'Uses past academic and demographic data to predict dropout risk.', 1, '2024-01-20', 85.50);
INSERT INTO `predictive_models` VALUES (2, 'Course Success Predictor', 'Predicts likelihood of student passing a course based on initial quiz scores and attendance.', 24, '2024-03-01', 78.20);

-- ----------------------------
-- Table structure for proctoring_logs
-- ----------------------------
DROP TABLE IF EXISTS `proctoring_logs`;
CREATE TABLE `proctoring_logs`  (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `proctor_id` int(11) NULL DEFAULT NULL,
  `incident_time` datetime NULL DEFAULT NULL,
  `incident_description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `action_taken` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `fk_proctor_exam`(`exam_id`) USING BTREE,
  INDEX `fk_proctor_student`(`student_id`) USING BTREE,
  INDEX `fk_proctor_faculty`(`proctor_id`) USING BTREE,
  CONSTRAINT `fk_proctor_exam` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_proctor_faculty` FOREIGN KEY (`proctor_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_proctor_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proctoring_logs
-- ----------------------------
INSERT INTO `proctoring_logs` VALUES (1, 8, 11015, 112, '2024-04-05 10:35:00', 'Student frequently looking away from screen. Possible use of phone.', 'Verbal warning issued via chat.');
INSERT INTO `proctoring_logs` VALUES (2, 4, 11011, 115, '2023-12-10 10:45:00', 'Student briefly disconnected and reconnected during final exam.', 'Connection logged. No suspicious activity observed on reconnect.');

-- ----------------------------
-- Table structure for program_outcomes
-- ----------------------------
DROP TABLE IF EXISTS `program_outcomes`;
CREATE TABLE `program_outcomes`  (
  `outcome_id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NULL DEFAULT NULL,
  `outcome_description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `assessment_method` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `target_level` decimal(5, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`outcome_id`) USING BTREE,
  INDEX `fk_progoutcome_prog`(`program_id`) USING BTREE,
  CONSTRAINT `fk_progoutcome_prog` FOREIGN KEY (`program_id`) REFERENCES `programs` (`program_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of program_outcomes
-- ----------------------------
INSERT INTO `program_outcomes` VALUES (1, 1, 'PO1: Engineering knowledge: Apply the knowledge of mathematics, science, engineering fundamentals...', 'Direct (Exams, Assign), Indirect (Surveys)', 3.50);
INSERT INTO `program_outcomes` VALUES (2, 1, 'PO2: Problem analysis: Identify, formulate, review research literature, and analyze complex engineering problems...', 'Direct (Projects, Assign), Indirect (Surveys)', 3.50);

-- ----------------------------
-- Table structure for programs
-- ----------------------------
DROP TABLE IF EXISTS `programs`;
CREATE TABLE `programs`  (
  `program_id` int(11) NOT NULL AUTO_INCREMENT,
  `program_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `department_id` int(11) NULL DEFAULT NULL,
  `duration` int(11) NULL DEFAULT NULL,
  `total_credits` int(11) NULL DEFAULT NULL,
  `program_type` enum('Undergraduate','Postgraduate','Diploma') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`program_id`) USING BTREE,
  INDEX `fk_program_dept`(`department_id`) USING BTREE,
  CONSTRAINT `fk_program_dept` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of programs
-- ----------------------------
INSERT INTO `programs` VALUES (1, 'B.Tech. Computer Science & Engineering', 1, 4, 160, 'Undergraduate');
INSERT INTO `programs` VALUES (2, 'B.Tech. Electronics & Communication Engineering', 2, 4, 160, 'Undergraduate');
INSERT INTO `programs` VALUES (3, 'B.Tech. Mechanical Engineering', 3, 4, 160, 'Undergraduate');
INSERT INTO `programs` VALUES (4, 'B.Tech. Civil Engineering', 4, 4, 160, 'Undergraduate');
INSERT INTO `programs` VALUES (5, 'B.Tech. Electrical & Electronics Engineering', 5, 4, 160, 'Undergraduate');
INSERT INTO `programs` VALUES (6, 'B.Tech. Information Technology', 6, 4, 160, 'Undergraduate');
INSERT INTO `programs` VALUES (7, 'Master of Business Administration', 7, 2, 80, 'Postgraduate');
INSERT INTO `programs` VALUES (8, 'M.Tech. Computer Science & Engineering', 1, 2, 70, 'Postgraduate');
INSERT INTO `programs` VALUES (9, 'M.Tech. VLSI Design', 2, 2, 70, 'Postgraduate');
INSERT INTO `programs` VALUES (10, 'M.Tech. Thermal Engineering', 3, 2, 70, 'Postgraduate');
INSERT INTO `programs` VALUES (11, 'Diploma in Web Development', 6, 1, 30, 'Diploma');
INSERT INTO `programs` VALUES (12, 'Diploma in Construction Management', 4, 1, 30, 'Diploma');
INSERT INTO `programs` VALUES (13, 'B.Sc. Mathematics', 8, 3, 120, 'Undergraduate');
INSERT INTO `programs` VALUES (14, 'B.Sc. Physics', 9, 3, 120, 'Undergraduate');
INSERT INTO `programs` VALUES (15, 'B.A. English Literature', 11, 3, 120, 'Undergraduate');

-- ----------------------------
-- Table structure for project_team
-- ----------------------------
DROP TABLE IF EXISTS `project_team`;
CREATE TABLE `project_team`  (
  `team_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `role` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `join_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`team_id`) USING BTREE,
  INDEX `fk_projteam_project`(`project_id`) USING BTREE,
  INDEX `fk_projteam_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_projteam_project` FOREIGN KEY (`project_id`) REFERENCES `research_projects` (`project_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_projteam_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of project_team
-- ----------------------------
INSERT INTO `project_team` VALUES (1, 1, 101, 'Principal Investigator', '2022-05-01');
INSERT INTO `project_team` VALUES (2, 1, 112, 'Co-Investigator', '2022-06-01');
INSERT INTO `project_team` VALUES (3, 1, 11008, 'Junior Research Fellow (Past)', '2022-07-01');

-- ----------------------------
-- Table structure for proxy_attendance
-- ----------------------------
DROP TABLE IF EXISTS `proxy_attendance`;
CREATE TABLE `proxy_attendance`  (
  `proxy_id` int(11) NOT NULL AUTO_INCREMENT,
  `attendance_record_id` int(11) NULL DEFAULT NULL,
  `reported_by` int(11) NULL DEFAULT NULL,
  `proxy_student_id` int(11) NULL DEFAULT NULL,
  `report_date` date NULL DEFAULT NULL,
  `action_taken` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`proxy_id`) USING BTREE,
  INDEX `fk_proxy_att`(`attendance_record_id`) USING BTREE,
  INDEX `fk_proxy_reporter`(`reported_by`) USING BTREE,
  INDEX `fk_proxy_student`(`proxy_student_id`) USING BTREE,
  CONSTRAINT `fk_proxy_att` FOREIGN KEY (`attendance_record_id`) REFERENCES `attendance` (`attendance_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_proxy_reporter` FOREIGN KEY (`reported_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_proxy_student` FOREIGN KEY (`proxy_student_id`) REFERENCES `students` (`student_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proxy_attendance
-- ----------------------------
INSERT INTO `proxy_attendance` VALUES (1, 19, 101, 11003, '2024-02-05', 'Student 11003 found marking attendance for 11019. Both reported to HOD.');

-- ----------------------------
-- Table structure for publications
-- ----------------------------
DROP TABLE IF EXISTS `publications`;
CREATE TABLE `publications`  (
  `publication_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NULL DEFAULT NULL,
  `title` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `journal_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `publication_date` date NULL DEFAULT NULL,
  `doi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `impact_factor` decimal(5, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`publication_id`) USING BTREE,
  INDEX `fk_pub_project`(`project_id`) USING BTREE,
  CONSTRAINT `fk_pub_project` FOREIGN KEY (`project_id`) REFERENCES `research_projects` (`project_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of publications
-- ----------------------------
INSERT INTO `publications` VALUES (1, 6, 'A Lightweight Secure Framework for Cloud-based EMR Systems', 'IEEE Transactions on Cloud Computing', '2024-05-15', '10.1109/TCC.2024.12345', 5.90);
INSERT INTO `publications` VALUES (2, 1, 'Scalable Parallel K-Means for Big Data Clustering', 'International Conference on Data Mining (ICDM) 2023', '2023-12-05', 'CONF/ICDM2023/P101', NULL);

-- ----------------------------
-- Table structure for push_notifications
-- ----------------------------
DROP TABLE IF EXISTS `push_notifications`;
CREATE TABLE `push_notifications`  (
  `push_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `message` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `sent_date` datetime NULL DEFAULT NULL,
  `status` enum('Sent','Failed') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `priority` enum('Low','High') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`push_id`) USING BTREE,
  INDEX `fk_push_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_push_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of push_notifications
-- ----------------------------
INSERT INTO `push_notifications` VALUES (1, 11001, 'Fee Payment Due Date: 2024-01-30', '2024-01-20 10:00:00', 'Sent', 'High');
INSERT INTO `push_notifications` VALUES (2, 101, 'Meeting cancelled: Dept Curriculum Review', '2024-07-15 14:00:00', 'Sent', 'Low');

-- ----------------------------
-- Table structure for question_banks
-- ----------------------------
DROP TABLE IF EXISTS `question_banks`;
CREATE TABLE `question_banks`  (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) NULL DEFAULT NULL,
  `question_text` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `question_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `difficulty_level` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `options` json NULL,
  `correct_answer` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `default_marks` decimal(5, 2) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`question_id`) USING BTREE,
  INDEX `fk_qbank_subject`(`subject_id`) USING BTREE,
  INDEX `fk_qbank_faculty`(`created_by`) USING BTREE,
  CONSTRAINT `fk_qbank_faculty` FOREIGN KEY (`created_by`) REFERENCES `faculty` (`faculty_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_qbank_subject` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of question_banks
-- ----------------------------
INSERT INTO `question_banks` VALUES (1, 1, 'What is the size of an integer data type in C?', 'MCQ', 'Easy', '{\"A\": \"2 bytes\", \"B\": \"4 bytes\", \"C\": \"Depends on compiler/arch\", \"D\": \"8 bytes\"}', 'C', 1.00, 101);
INSERT INTO `question_banks` VALUES (2, 8, 'Explain the difference between a stack and a queue.', 'Short Answer', 'Medium', NULL, 'Stack is LIFO, Queue is FIFO.', 2.00, 101);
INSERT INTO `question_banks` VALUES (3, 3, 'Calculate the derivative of x^3 + 2x^2 - 5x + 1.', 'Short Answer', 'Easy', NULL, '3x^2 + 4x - 5', 2.00, 108);
INSERT INTO `question_banks` VALUES (4, 12, 'What is the typical forward voltage drop across a silicon diode?', 'MCQ', 'Easy', '{\"A\": \"0.3V\", \"B\": \"0.7V\", \"C\": \"1.1V\", \"D\": \"5.0V\"}', 'B', 1.00, 102);

-- ----------------------------
-- Table structure for quiz_attempts
-- ----------------------------
DROP TABLE IF EXISTS `quiz_attempts`;
CREATE TABLE `quiz_attempts`  (
  `attempt_id` int(11) NOT NULL AUTO_INCREMENT,
  `quiz_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `start_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `score` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`attempt_id`) USING BTREE,
  INDEX `fk_quizatt_quiz`(`quiz_id`) USING BTREE,
  INDEX `fk_quizatt_student`(`student_id`) USING BTREE,
  CONSTRAINT `fk_quizatt_quiz` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`quiz_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_quizatt_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of quiz_attempts
-- ----------------------------
INSERT INTO `quiz_attempts` VALUES (1, 1, 11001, '2023-09-05 11:00:15', '2023-09-05 11:18:30', 8);
INSERT INTO `quiz_attempts` VALUES (2, 1, 11016, '2023-09-05 11:01:00', '2023-09-05 11:15:20', 9);
INSERT INTO `quiz_attempts` VALUES (3, 2, 11002, '2023-09-12 10:00:05', '2023-09-12 10:14:55', 7);

-- ----------------------------
-- Table structure for quiz_questions
-- ----------------------------
DROP TABLE IF EXISTS `quiz_questions`;
CREATE TABLE `quiz_questions`  (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `quiz_id` int(11) NULL DEFAULT NULL,
  `question_text` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `question_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `options` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `correct_answer` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `marks` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`question_id`) USING BTREE,
  INDEX `fk_quizq_quiz`(`quiz_id`) USING BTREE,
  CONSTRAINT `fk_quizq_quiz` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`quiz_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of quiz_questions
-- ----------------------------
INSERT INTO `quiz_questions` VALUES (1, 1, 'Which is NOT a valid variable name in C?', 'MCQ', '[\"_count\", \"intVar\", \"2names\", \"rate_of_interest\"]', '2names', 1);
INSERT INTO `quiz_questions` VALUES (2, 1, 'What is the output of printf(\"%d\", sizeof(float)); ?', 'MCQ', '[\"2\", \"4\", \"8\", \"Compiler Dependent\"]', '4', 1);
INSERT INTO `quiz_questions` VALUES (3, 1, 'Which operator has the highest precedence in C?', 'MCQ', '[\"++ (postfix)\", \"()\", \"*\", \"+\"]', '()', 1);
INSERT INTO `quiz_questions` VALUES (4, 2, 'A Zener diode is primarily used for?', 'MCQ', '[\"Rectification\", \"Amplification\", \"Voltage Regulation\", \"Oscillation\"]', 'Voltage Regulation', 1);

-- ----------------------------
-- Table structure for quizzes
-- ----------------------------
DROP TABLE IF EXISTS `quizzes`;
CREATE TABLE `quizzes`  (
  `quiz_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `start_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `duration` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`quiz_id`) USING BTREE,
  INDEX `fk_quiz_course`(`course_id`) USING BTREE,
  CONSTRAINT `fk_quiz_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of quizzes
-- ----------------------------
INSERT INTO `quizzes` VALUES (1, 101, 'Quiz 1: C Basics', 'Quiz covering variables, data types, operators.', '2023-09-05 11:00:00', '2023-09-05 11:20:00', 20);
INSERT INTO `quizzes` VALUES (2, 201, 'Quiz 1: Diode Fundamentals', 'MCQ quiz on diode characteristics.', '2023-09-12 10:00:00', '2023-09-12 10:15:00', 15);

-- ----------------------------
-- Table structure for research_collaborations
-- ----------------------------
DROP TABLE IF EXISTS `research_collaborations`;
CREATE TABLE `research_collaborations`  (
  `collaboration_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NULL DEFAULT NULL,
  `partner_institution` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `collaboration_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `agreement_path` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`collaboration_id`) USING BTREE,
  INDEX `fk_rescollab_project`(`project_id`) USING BTREE,
  CONSTRAINT `fk_rescollab_project` FOREIGN KEY (`project_id`) REFERENCES `research_projects` (`project_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of research_collaborations
-- ----------------------------
INSERT INTO `research_collaborations` VALUES (1, 5, 'Indian Institute of Science (IISc) Bangalore', '2023-06-01', '2025-05-31', 'Joint Research', '/research/collab/proj5_iisc_mou.pdf');
INSERT INTO `research_collaborations` VALUES (2, 9, 'Nokia Bell Labs India', '2023-01-01', '2025-12-31', 'Industry Collaboration', '/research/collab/proj9_nokia_nda.pdf');

-- ----------------------------
-- Table structure for research_commitments
-- ----------------------------
DROP TABLE IF EXISTS `research_commitments`;
CREATE TABLE `research_commitments`  (
  `commitment_id` int(11) NOT NULL AUTO_INCREMENT,
  `faculty_id` int(11) NULL DEFAULT NULL,
  `project_id` int(11) NULL DEFAULT NULL,
  `role` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `time_commitment` decimal(5, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`commitment_id`) USING BTREE,
  INDEX `fk_rescommit_faculty`(`faculty_id`) USING BTREE,
  INDEX `fk_rescommit_project`(`project_id`) USING BTREE,
  CONSTRAINT `fk_rescommit_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rescommit_project` FOREIGN KEY (`project_id`) REFERENCES `research_projects` (`project_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of research_commitments
-- ----------------------------
INSERT INTO `research_commitments` VALUES (1, 101, 1, 'Principal Investigator', 6.00);
INSERT INTO `research_commitments` VALUES (2, 112, 1, 'Co-Investigator', 4.00);
INSERT INTO `research_commitments` VALUES (3, 102, 2, 'Principal Investigator', 7.00);

-- ----------------------------
-- Table structure for research_grants
-- ----------------------------
DROP TABLE IF EXISTS `research_grants`;
CREATE TABLE `research_grants`  (
  `grant_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NULL DEFAULT NULL,
  `funding_agency` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grant_amount` decimal(15, 2) NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `status` enum('Applied','Awarded','Closed') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`grant_id`) USING BTREE,
  INDEX `fk_resgrant_project`(`project_id`) USING BTREE,
  CONSTRAINT `fk_resgrant_project` FOREIGN KEY (`project_id`) REFERENCES `research_projects` (`project_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of research_grants
-- ----------------------------
INSERT INTO `research_grants` VALUES (1, 1, 'DST - SERB', 1500000.00, '2022-05-01', '2025-04-30', 'Awarded');
INSERT INTO `research_grants` VALUES (2, 2, 'MeitY', 1200000.00, '2023-01-15', '2025-12-31', 'Awarded');

-- ----------------------------
-- Table structure for research_projects
-- ----------------------------
DROP TABLE IF EXISTS `research_projects`;
CREATE TABLE `research_projects`  (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lead_researcher_id` int(11) NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `funding_amount` decimal(15, 2) NULL DEFAULT NULL,
  `status` enum('Proposed','Ongoing','Completed') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`project_id`) USING BTREE,
  INDEX `fk_resproject_faculty`(`lead_researcher_id`) USING BTREE,
  CONSTRAINT `fk_resproject_faculty` FOREIGN KEY (`lead_researcher_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of research_projects
-- ----------------------------
INSERT INTO `research_projects` VALUES (1, 'Efficient Algorithms for Big Data Analytics', 101, '2022-05-01', '2025-04-30', 1500000.00, 'Ongoing');
INSERT INTO `research_projects` VALUES (2, 'Low Power VLSI Design Techniques', 102, '2023-01-15', '2025-12-31', 1200000.00, 'Ongoing');
INSERT INTO `research_projects` VALUES (3, 'Development of Advanced Composite Materials for Automotive Applications', 103, '2021-09-01', '2024-08-31', 2000000.00, 'Ongoing');
INSERT INTO `research_projects` VALUES (4, 'Seismic Performance Assessment of Reinforced Concrete Structures', 104, '2022-11-10', '2025-11-09', 800000.00, 'Ongoing');
INSERT INTO `research_projects` VALUES (5, 'Smart Grid Integration with Renewable Energy Sources', 105, '2023-03-20', '2026-03-19', 1800000.00, 'Ongoing');
INSERT INTO `research_projects` VALUES (6, 'Secure Cloud Computing Frameworks for Healthcare Data', 106, '2022-08-01', '2024-07-31', 1000000.00, 'Completed');
INSERT INTO `research_projects` VALUES (7, 'Impact of Microfinance on Rural Women Entrepreneurship in Karnataka', 107, '2023-06-15', '2025-06-14', 500000.00, 'Proposed');
INSERT INTO `research_projects` VALUES (8, 'Applications of Machine Learning in Financial Forecasting', 24, '2023-09-01', '2026-08-31', 750000.00, 'Ongoing');
INSERT INTO `research_projects` VALUES (9, 'Next Generation Wireless Communication Systems (5G and Beyond)', 25, '2022-12-01', '2025-11-30', 2500000.00, 'Ongoing');

-- ----------------------------
-- Table structure for revaluation_requests
-- ----------------------------
DROP TABLE IF EXISTS `revaluation_requests`;
CREATE TABLE `revaluation_requests`  (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `exam_id` int(11) NULL DEFAULT NULL,
  `request_date` date NULL DEFAULT NULL,
  `reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `status` enum('Pending','Approved','Completed','Rejected') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `revised_marks` decimal(6, 2) NULL DEFAULT NULL,
  `revised_grade` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `reviewed_by` int(11) NULL DEFAULT NULL,
  `review_comments` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `completion_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`request_id`) USING BTREE,
  INDEX `fk_reval_student`(`student_id`) USING BTREE,
  INDEX `fk_reval_exam`(`exam_id`) USING BTREE,
  INDEX `fk_reval_faculty`(`reviewed_by`) USING BTREE,
  CONSTRAINT `fk_reval_exam` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_reval_faculty` FOREIGN KEY (`reviewed_by`) REFERENCES `faculty` (`faculty_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_reval_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of revaluation_requests
-- ----------------------------
INSERT INTO `revaluation_requests` VALUES (1, 11011, 1, '2023-10-20', 'Believe Question 3 was marked incorrectly. Calculation steps were correct.', 'Completed', 38.00, 'A', 101, 'Minor calculation error found in marking Q3. Marks revised.', '2023-10-25');
INSERT INTO `revaluation_requests` VALUES (2, 11010, 9, '2024-04-22', 'Requesting re-check of total marks.', 'Pending', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `role_name`(`role_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (5, 'Accountant');
INSERT INTO `roles` VALUES (1, 'Admin');
INSERT INTO `roles` VALUES (9, 'Counselor');
INSERT INTO `roles` VALUES (2, 'Faculty');
INSERT INTO `roles` VALUES (14, 'HOD');
INSERT INTO `roles` VALUES (7, 'Hostel Warden');
INSERT INTO `roles` VALUES (11, 'IT Support');
INSERT INTO `roles` VALUES (6, 'Librarian');
INSERT INTO `roles` VALUES (8, 'Placement Officer');
INSERT INTO `roles` VALUES (13, 'Principal');
INSERT INTO `roles` VALUES (10, 'Security');
INSERT INTO `roles` VALUES (4, 'Staff');
INSERT INTO `roles` VALUES (3, 'Student');
INSERT INTO `roles` VALUES (12, 'Transport Manager');

-- ----------------------------
-- Table structure for room_bookings
-- ----------------------------
DROP TABLE IF EXISTS `room_bookings`;
CREATE TABLE `room_bookings`  (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `booking_date` date NULL DEFAULT NULL,
  `start_time` time NULL DEFAULT NULL,
  `end_time` time NULL DEFAULT NULL,
  `purpose` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`booking_id`) USING BTREE,
  INDEX `fk_booking_room`(`room_id`) USING BTREE,
  INDEX `fk_booking_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_booking_room` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_booking_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of room_bookings
-- ----------------------------
INSERT INTO `room_bookings` VALUES (1, 22, 101, '2024-08-20', '14:00:00', '16:00:00', 'Department Project Demo Session', 'Approved');
INSERT INTO `room_bookings` VALUES (2, 1, 11001, '2024-07-20', '17:00:00', '18:00:00', 'Group Study for Exam', 'Approved');

-- ----------------------------
-- Table structure for roommate_preferences
-- ----------------------------
DROP TABLE IF EXISTS `roommate_preferences`;
CREATE TABLE `roommate_preferences`  (
  `preference_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `preferred_roommate_id` int(11) NULL DEFAULT NULL,
  `preference_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `status` enum('Pending','Approved','Rejected') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`preference_id`) USING BTREE,
  INDEX `fk_roompref_student1`(`student_id`) USING BTREE,
  INDEX `fk_roompref_student2`(`preferred_roommate_id`) USING BTREE,
  CONSTRAINT `fk_roompref_student1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_roompref_student2` FOREIGN KEY (`preferred_roommate_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roommate_preferences
-- ----------------------------
INSERT INTO `roommate_preferences` VALUES (1, 11001, 11011, 'We are from the same hometown and know each other well.', 'Approved');
INSERT INTO `roommate_preferences` VALUES (2, 11011, 11001, 'Requesting to be placed with Akash Sharma.', 'Approved');

-- ----------------------------
-- Table structure for rooms
-- ----------------------------
DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms`  (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_number` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `building` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `capacity` int(11) NULL DEFAULT NULL,
  `type` enum('Lecture','Lab','Seminar','Auditorium') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`room_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rooms
-- ----------------------------
INSERT INTO `rooms` VALUES (1, 'A-101', 'Academic Block A', 60, 'Lecture');
INSERT INTO `rooms` VALUES (2, 'A-102', 'Academic Block A', 60, 'Lecture');
INSERT INTO `rooms` VALUES (3, 'A-201', 'Academic Block A', 70, 'Lecture');
INSERT INTO `rooms` VALUES (4, 'A-202', 'Academic Block A', 70, 'Lecture');
INSERT INTO `rooms` VALUES (5, 'A-301', 'Academic Block A', 75, 'Lecture');
INSERT INTO `rooms` VALUES (6, 'A-302', 'Academic Block A', 75, 'Lecture');
INSERT INTO `rooms` VALUES (7, 'B-101', 'Academic Block B', 60, 'Lecture');
INSERT INTO `rooms` VALUES (8, 'B-102', 'Academic Block B', 60, 'Lecture');
INSERT INTO `rooms` VALUES (9, 'B-201', 'Academic Block B', 70, 'Lecture');
INSERT INTO `rooms` VALUES (10, 'B-202', 'Academic Block B', 70, 'Lecture');
INSERT INTO `rooms` VALUES (11, 'CL-1', 'Computer Center', 40, 'Lab');
INSERT INTO `rooms` VALUES (12, 'CL-2', 'Computer Center', 40, 'Lab');
INSERT INTO `rooms` VALUES (13, 'CL-3', 'Computer Center', 40, 'Lab');
INSERT INTO `rooms` VALUES (14, 'EL-1', 'ECE Department Block', 30, 'Lab');
INSERT INTO `rooms` VALUES (15, 'EL-2', 'ECE Department Block', 30, 'Lab');
INSERT INTO `rooms` VALUES (16, 'ML-1', 'Mechanical Workshop', 35, 'Lab');
INSERT INTO `rooms` VALUES (17, 'ML-2', 'Mechanical Workshop', 35, 'Lab');
INSERT INTO `rooms` VALUES (18, 'CVL-1', 'Civil Department Block', 30, 'Lab');
INSERT INTO `rooms` VALUES (19, 'EEL-1', 'EEE Department Block', 30, 'Lab');
INSERT INTO `rooms` VALUES (20, 'CHL-1', 'Science Block', 30, 'Lab');
INSERT INTO `rooms` VALUES (21, 'PHL-1', 'Science Block', 30, 'Lab');
INSERT INTO `rooms` VALUES (22, 'SH-1', 'Seminar Hall Complex', 150, 'Seminar');
INSERT INTO `rooms` VALUES (23, 'SH-2', 'Seminar Hall Complex', 100, 'Seminar');
INSERT INTO `rooms` VALUES (24, 'AUD', 'Auditorium Complex', 500, 'Auditorium');
INSERT INTO `rooms` VALUES (25, 'MBA-101', 'Management Block', 50, 'Lecture');
INSERT INTO `rooms` VALUES (26, 'MBA-102', 'Management Block', 50, 'Lecture');
INSERT INTO `rooms` VALUES (27, 'MBA-201', 'Management Block', 60, 'Seminar');
INSERT INTO `rooms` VALUES (28, 'G-01', 'Ground Floor Wing', 50, 'Lecture');
INSERT INTO `rooms` VALUES (29, 'G-02', 'Ground Floor Wing', 50, 'Lecture');

-- ----------------------------
-- Table structure for routes
-- ----------------------------
DROP TABLE IF EXISTS `routes`;
CREATE TABLE `routes`  (
  `route_id` int(11) NOT NULL AUTO_INCREMENT,
  `route_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `start_location` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `end_location` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `distance` decimal(5, 2) NULL DEFAULT NULL,
  `travel_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`route_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of routes
-- ----------------------------
INSERT INTO `routes` VALUES (1, 'Route A - Majestic', 'Majestic Bus Stand', 'College Campus', 25.50, 60);
INSERT INTO `routes` VALUES (2, 'Route B - Electronic City', 'Electronic City Phase 1', 'College Campus', 15.20, 45);
INSERT INTO `routes` VALUES (3, 'Route C - Whitefield', 'ITPL Whitefield', 'College Campus', 30.00, 75);
INSERT INTO `routes` VALUES (4, 'Route D - Koramangala', 'Koramangala 5th Block', 'College Campus', 18.00, 50);

-- ----------------------------
-- Table structure for scholarships
-- ----------------------------
DROP TABLE IF EXISTS `scholarships`;
CREATE TABLE `scholarships`  (
  `scholarship_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `scholarship_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `scholarship_amount` decimal(10, 2) NULL DEFAULT NULL,
  `academic_year` int(11) NULL DEFAULT NULL,
  `semester` int(11) NULL DEFAULT NULL,
  `sponsor_id` int(11) NULL DEFAULT NULL,
  `award_date` date NULL DEFAULT NULL,
  `is_adjusted_in_fees` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`scholarship_id`) USING BTREE,
  INDEX `fk_schol_student`(`student_id`) USING BTREE,
  INDEX `fk_schol_sponsor`(`sponsor_id`) USING BTREE,
  CONSTRAINT `fk_schol_sponsor` FOREIGN KEY (`sponsor_id`) REFERENCES `sponsors` (`sponsor_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_schol_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of scholarships
-- ----------------------------
INSERT INTO `scholarships` VALUES (1, 11002, 'Merit Scholarship for SC/ST', 25000.00, 2023, 1, 2, '2023-09-10', 1);
INSERT INTO `scholarships` VALUES (2, 11007, 'MBA Excellence Scholarship', 50000.00, 2023, 1, 1, '2023-09-15', 1);

-- ----------------------------
-- Table structure for security_alerts
-- ----------------------------
DROP TABLE IF EXISTS `security_alerts`;
CREATE TABLE `security_alerts`  (
  `alert_id` int(11) NOT NULL AUTO_INCREMENT,
  `visitor_id` int(11) NULL DEFAULT NULL,
  `alert_date` datetime NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `status` enum('Active','Resolved') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `reported_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`alert_id`) USING BTREE,
  INDEX `fk_secalert_visitor`(`visitor_id`) USING BTREE,
  INDEX `fk_secalert_user`(`reported_by`) USING BTREE,
  CONSTRAINT `fk_secalert_user` FOREIGN KEY (`reported_by`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_secalert_visitor` FOREIGN KEY (`visitor_id`) REFERENCES `visitors` (`visitor_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of security_alerts
-- ----------------------------
INSERT INTO `security_alerts` VALUES (1, NULL, '2024-07-16 01:15:00', 'Unidentified person attempting to scale hostel H2 wall.', 'Resolved', 214);
INSERT INTO `security_alerts` VALUES (2, 1, '2024-07-12 11:30:00', 'Visitor refused security check at gate.', 'Resolved', 206);

-- ----------------------------
-- Table structure for security_incidents
-- ----------------------------
DROP TABLE IF EXISTS `security_incidents`;
CREATE TABLE `security_incidents`  (
  `incident_id` int(11) NOT NULL AUTO_INCREMENT,
  `incident_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `location` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `incident_date` datetime NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `reported_by` int(11) NULL DEFAULT NULL,
  `status` enum('Open','Under Investigation','Closed') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `resolution` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`incident_id`) USING BTREE,
  INDEX `fk_secinc_user`(`reported_by`) USING BTREE,
  CONSTRAINT `fk_secinc_user` FOREIGN KEY (`reported_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of security_incidents
-- ----------------------------
INSERT INTO `security_incidents` VALUES (1, 'Theft', 'Library Reading Hall', '2024-06-28 14:00:00', 'Student reported laptop stolen from bag.', 206, 'Under Investigation', NULL);

-- ----------------------------
-- Table structure for security_personnel
-- ----------------------------
DROP TABLE IF EXISTS `security_personnel`;
CREATE TABLE `security_personnel`  (
  `personnel_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `contact_number` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `shift_start` time NULL DEFAULT NULL,
  `shift_end` time NULL DEFAULT NULL,
  `clearance_level` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hire_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`personnel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of security_personnel
-- ----------------------------
INSERT INTO `security_personnel` VALUES (1, 'Ram', 'Bahadur', '7654321098', '06:00:00', '14:00:00', 'Gate Access', '2010-05-01');
INSERT INTO `security_personnel` VALUES (2, 'Shyam', 'Singh', '7543210987', '14:00:00', '22:00:00', 'Gate Access', '2011-06-15');
INSERT INTO `security_personnel` VALUES (3, 'Gopal', 'Thapa', '7432109876', '22:00:00', '06:00:00', 'Gate Access', '2012-07-20');
INSERT INTO `security_personnel` VALUES (4, 'Hari', 'Prasad', '7321098765', '08:00:00', '16:00:00', 'Campus Patrol', '2013-08-25');

-- ----------------------------
-- Table structure for security_training
-- ----------------------------
DROP TABLE IF EXISTS `security_training`;
CREATE TABLE `security_training`  (
  `training_id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_id` int(11) NULL DEFAULT NULL,
  `training_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `training_date` date NULL DEFAULT NULL,
  `duration` int(11) NULL DEFAULT NULL,
  `certification_path` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`training_id`) USING BTREE,
  INDEX `fk_sectrain_personnel`(`personnel_id`) USING BTREE,
  CONSTRAINT `fk_sectrain_personnel` FOREIGN KEY (`personnel_id`) REFERENCES `security_personnel` (`personnel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of security_training
-- ----------------------------
INSERT INTO `security_training` VALUES (1, 1, 'Basic First Aid Training', '2023-10-10', 8, NULL);
INSERT INTO `security_training` VALUES (2, 4, 'Campus Patrol Procedures Update', '2024-03-15', 4, NULL);

-- ----------------------------
-- Table structure for self_study_reports
-- ----------------------------
DROP TABLE IF EXISTS `self_study_reports`;
CREATE TABLE `self_study_reports`  (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `body_id` int(11) NULL DEFAULT NULL,
  `department_id` int(11) NULL DEFAULT NULL,
  `submission_date` date NULL DEFAULT NULL,
  `status` enum('Draft','Submitted','Reviewed') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `outcome` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `report_path` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`report_id`) USING BTREE,
  INDEX `fk_ssr_body`(`body_id`) USING BTREE,
  INDEX `fk_ssr_dept`(`department_id`) USING BTREE,
  CONSTRAINT `fk_ssr_body` FOREIGN KEY (`body_id`) REFERENCES `accreditation_bodies` (`body_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_ssr_dept` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of self_study_reports
-- ----------------------------
INSERT INTO `self_study_reports` VALUES (1, 1, 1, '2023-09-30', 'Submitted', NULL, '/ssr/nba/cse_2023.pdf');
INSERT INTO `self_study_reports` VALUES (2, 2, NULL, '2024-07-01', 'Draft', NULL, '/ssr/naac/naac_2024_draft.pdf');

-- ----------------------------
-- Table structure for sentiment_analysis
-- ----------------------------
DROP TABLE IF EXISTS `sentiment_analysis`;
CREATE TABLE `sentiment_analysis`  (
  `sentiment_id` int(11) NOT NULL AUTO_INCREMENT,
  `response_id` int(11) NULL DEFAULT NULL,
  `sentiment_score` decimal(5, 2) NULL DEFAULT NULL,
  `sentiment_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `analysis_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`sentiment_id`) USING BTREE,
  INDEX `fk_sentiment_resp`(`response_id`) USING BTREE,
  CONSTRAINT `fk_sentiment_resp` FOREIGN KEY (`response_id`) REFERENCES `feedback_responses` (`response_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sentiment_analysis
-- ----------------------------
INSERT INTO `sentiment_analysis` VALUES (1, 3, 0.75, 'Positive (with Suggestion)', '2024-01-11');
INSERT INTO `sentiment_analysis` VALUES (2, 5, 0.20, 'Negative', '2024-06-02');

-- ----------------------------
-- Table structure for site_visits
-- ----------------------------
DROP TABLE IF EXISTS `site_visits`;
CREATE TABLE `site_visits`  (
  `visit_id` int(11) NOT NULL AUTO_INCREMENT,
  `body_id` int(11) NULL DEFAULT NULL,
  `visit_date` date NULL DEFAULT NULL,
  `visit_outcome` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `visit_team` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`visit_id`) USING BTREE,
  INDEX `fk_sitevisit_body`(`body_id`) USING BTREE,
  CONSTRAINT `fk_sitevisit_body` FOREIGN KEY (`body_id`) REFERENCES `accreditation_bodies` (`body_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of site_visits
-- ----------------------------
INSERT INTO `site_visits` VALUES (1, 1, '2023-11-15', 'Accreditation granted for CSE program for 3 years.', 'Dr. ABC (Chair), Prof. XYZ, Dr. PQR');

-- ----------------------------
-- Table structure for skill_workshops
-- ----------------------------
DROP TABLE IF EXISTS `skill_workshops`;
CREATE TABLE `skill_workshops`  (
  `workshop_id` int(11) NOT NULL AUTO_INCREMENT,
  `workshop_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `trainer_id` int(11) NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `max_participants` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`workshop_id`) USING BTREE,
  INDEX `fk_skillws_faculty`(`trainer_id`) USING BTREE,
  CONSTRAINT `fk_skillws_faculty` FOREIGN KEY (`trainer_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of skill_workshops
-- ----------------------------
INSERT INTO `skill_workshops` VALUES (1, 'Python for Data Science', '2024-08-05', '2024-08-09', 106, 'Hands-on workshop covering Pandas, Numpy, Matplotlib.', 40);
INSERT INTO `skill_workshops` VALUES (2, 'Effective Presentation Skills', '2024-09-10', '2024-09-11', 111, 'Workshop on delivering impactful presentations.', 30);

-- ----------------------------
-- Table structure for sms_logs
-- ----------------------------
DROP TABLE IF EXISTS `sms_logs`;
CREATE TABLE `sms_logs`  (
  `sms_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `message_text` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `sent_date` datetime NULL DEFAULT NULL,
  `status` enum('Sent','Failed') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `provider` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sms_id`) USING BTREE,
  INDEX `fk_sms_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_sms_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_logs
-- ----------------------------
INSERT INTO `sms_logs` VALUES (1, 11001, 'Dear Student, Your fee payment is due on 2024-01-30.', '2024-01-20 10:00:30', 'Sent', 'Msg91');
INSERT INTO `sms_logs` VALUES (2, 101, 'Cancelled class alert: CS103 today at 2 PM cancelled.', '2024-07-15 13:00:00', 'Sent', 'Twilio');

-- ----------------------------
-- Table structure for sponsors
-- ----------------------------
DROP TABLE IF EXISTS `sponsors`;
CREATE TABLE `sponsors`  (
  `sponsor_id` int(11) NOT NULL AUTO_INCREMENT,
  `sponsor_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `contact_person` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sponsor_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sponsors
-- ----------------------------
INSERT INTO `sponsors` VALUES (1, 'Infosys Foundation', 'CSR Team Lead', 'foundation@infosys.com', '9880099887');
INSERT INTO `sponsors` VALUES (2, 'Tata Trusts', 'Programme Officer', 'connect@tatatrusts.org', '9770088776');
INSERT INTO `sponsors` VALUES (3, 'Reliance Foundation', 'Grants Manager', 'contact@reliancefoundation.org', '9660077665');

-- ----------------------------
-- Table structure for sponsorships
-- ----------------------------
DROP TABLE IF EXISTS `sponsorships`;
CREATE TABLE `sponsorships`  (
  `sponsorship_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NULL DEFAULT NULL,
  `sponsor_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sponsorship_amount` decimal(15, 2) NULL DEFAULT NULL,
  `benefits` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `contract_path` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sponsorship_id`) USING BTREE,
  INDEX `fk_spons_event`(`event_id`) USING BTREE,
  CONSTRAINT `fk_spons_event` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sponsorships
-- ----------------------------
INSERT INTO `sponsorships` VALUES (1, 1, 'Tech Mahindra', 100000.00, 'Gold Sponsor: Logo display, Stall, Speaker Slot.', '/contracts/sponsors/techm_techfest24.pdf');
INSERT INTO `sponsorships` VALUES (2, 1, 'State Bank of India', 50000.00, 'Silver Sponsor: Logo display, Banner.', '/contracts/sponsors/sbi_techfest24.pdf');

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff`  (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `department_id` int(11) NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `role` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hire_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`staff_id`) USING BTREE,
  INDEX `fk_staff_dept`(`department_id`) USING BTREE,
  CONSTRAINT `fk_staff_dept` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES (1, 'Anand', 'Rao', 14, 'anand.rao.acc@college.edu.in', '8989898989', 'Senior Accountant', '2007-05-10');
INSERT INTO `staff` VALUES (2, 'Bhavna', 'Shah', 13, 'bhavna.shah.adm@college.edu.in', '8887776665', 'Office Superintendent', '2008-06-20');
INSERT INTO `staff` VALUES (3, 'Chandra', 'Mohan', 12, 'chandra.mohan.lib@college.edu.in', '8776665554', 'Chief Librarian', '2006-07-01');
INSERT INTO `staff` VALUES (4, 'Divya', 'Patil', 12, 'divya.patil.lib@college.edu.in', '8665554443', 'Assistant Librarian', '2010-09-15');
INSERT INTO `staff` VALUES (5, 'Eshwar', 'Prasad', 13, 'eshwar.prasad.adm@college.edu.in', '8554443332', 'Clerk', '2015-11-01');
INSERT INTO `staff` VALUES (6, 'Firoz', 'Shaikh', 19, 'firoz.shaikh.sec@college.edu.in', '8443332221', 'Security Supervisor', '2009-03-10');
INSERT INTO `staff` VALUES (7, 'Girish', 'Naik', 16, 'girish.naik.trans@college.edu.in', '8332221110', 'Transport Manager', '2010-04-15');
INSERT INTO `staff` VALUES (8, 'Hema', 'Sundari', 15, 'hema.sundari.sw@college.edu.in', '8221110009', 'Student Counselor', '2011-01-20');
INSERT INTO `staff` VALUES (9, 'Ishaan', 'Bhatia', 6, 'ishaan.bhatia.it@college.edu.in', '8110009998', 'IT Technician', '2016-02-25');
INSERT INTO `staff` VALUES (10, 'Jaya', 'Lakshmi', 14, 'jaya.lakshmi.acc@college.edu.in', '8009998887', 'Junior Accountant', '2018-04-30');
INSERT INTO `staff` VALUES (11, 'Kamal', 'Kishore', 13, 'kamal.kishore.adm@college.edu.in', '7998887776', 'Receptionist', '2019-05-05');
INSERT INTO `staff` VALUES (12, 'Lalitha', 'Menon', 17, 'lalitha.menon.hostel@college.edu.in', '7887776665', 'Hostel Matron', '2008-10-10');
INSERT INTO `staff` VALUES (13, 'Madan', 'Gopal', 16, 'madan.gopal.trans@college.edu.in', '7776665554', 'Driver', '2011-06-01');
INSERT INTO `staff` VALUES (14, 'Naveen', 'Kumar', 19, 'naveen.kumar.sec@college.edu.in', '7665554443', 'Security Guard', '2012-07-10');
INSERT INTO `staff` VALUES (15, 'Omkar', 'Sawant', 3, 'omkar.sawant.lab@college.edu.in', '7554443332', 'Lab Technician (Mech)', '2013-08-15');
INSERT INTO `staff` VALUES (16, 'Parvati', 'Iyer', 9, 'parvati.iyer.lab@college.edu.in', '7443332221', 'Lab Technician (Phy)', '2014-09-20');
INSERT INTO `staff` VALUES (17, 'Qadir', 'Ali', 4, 'qadir.ali.lab@college.edu.in', '7332221110', 'Lab Technician (Civil)', '2015-10-25');
INSERT INTO `staff` VALUES (18, 'Ramesh', 'Patil', 5, 'ramesh.patil.lab@college.edu.in', '7221110009', 'Lab Technician (EEE)', '2016-11-30');
INSERT INTO `staff` VALUES (19, 'Saroj', 'Devi', 10, 'saroj.devi.lab@college.edu.in', '7110009998', 'Lab Technician (Chem)', '2017-12-05');
INSERT INTO `staff` VALUES (20, 'Tara', 'Singh', 15, 'tara.singh.sw@college.edu.in', '7009998887', 'Assistant Counselor', '2019-02-15');
INSERT INTO `staff` VALUES (21, 'Anil', 'Sharma', 15, 'anil.sharma.doc@college.edu.in', '7012345678', 'College Doctor', '2019-08-01');

-- ----------------------------
-- Table structure for student_demographics
-- ----------------------------
DROP TABLE IF EXISTS `student_demographics`;
CREATE TABLE `student_demographics`  (
  `demographic_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `nationality` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `religion` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `disability_status` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `socioeconomic_status` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`demographic_id`) USING BTREE,
  INDEX `fk_demo_student`(`student_id`) USING BTREE,
  CONSTRAINT `fk_demo_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student_demographics
-- ----------------------------
INSERT INTO `student_demographics` VALUES (1, 11001, 'Indian', 'Hindu', 'None', 'Middle Income Group');
INSERT INTO `student_demographics` VALUES (2, 11002, 'Indian', 'Hindu', 'None', 'Lower Income Group (Based on SC status + income)');
INSERT INTO `student_demographics` VALUES (3, 11005, 'Indian', 'Muslim', 'None', 'Upper Middle Income Group (Based on Mgmt Quota)');

-- ----------------------------
-- Table structure for student_documents
-- ----------------------------
DROP TABLE IF EXISTS `student_documents`;
CREATE TABLE `student_documents`  (
  `document_id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NULL DEFAULT NULL,
  `document_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `verification_status` tinyint(1) NULL DEFAULT NULL,
  `upload_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`document_id`) USING BTREE,
  INDEX `fk_doc_app`(`application_id`) USING BTREE,
  CONSTRAINT `fk_doc_app` FOREIGN KEY (`application_id`) REFERENCES `applications` (`application_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student_documents
-- ----------------------------
INSERT INTO `student_documents` VALUES (1, 1, '10th Marksheet', '/docs/adm2024/app1/10th.pdf', 1, '2024-05-10');
INSERT INTO `student_documents` VALUES (2, 1, '12th Marksheet', '/docs/adm2024/app1/12th.pdf', 1, '2024-05-10');
INSERT INTO `student_documents` VALUES (3, 1, 'Entrance Exam Scorecard', '/docs/adm2024/app1/cet_score.pdf', 1, '2024-05-10');
INSERT INTO `student_documents` VALUES (4, 2, '10th Marksheet', '/docs/adm2024/app2/10th.pdf', 1, '2024-05-12');
INSERT INTO `student_documents` VALUES (5, 2, '12th Marksheet', '/docs/adm2024/app2/12th.pdf', 1, '2024-05-12');
INSERT INTO `student_documents` VALUES (6, 3, '10th Marksheet', '/docs/adm2024/app3/10th.pdf', 1, '2024-05-15');
INSERT INTO `student_documents` VALUES (7, 3, '12th Marksheet', '/docs/adm2024/app3/12th.pdf', 0, '2024-05-15');
INSERT INTO `student_documents` VALUES (8, 4, '10th Marksheet', '/docs/adm2024/app4/10th.pdf', 1, '2024-05-18');
INSERT INTO `student_documents` VALUES (9, 5, 'Graduation Marksheet', '/docs/adm2024/app5/degree.pdf', 1, '2024-04-20');
INSERT INTO `student_documents` VALUES (10, 5, 'Entrance Exam Scorecard (CAT/MAT)', '/docs/adm2024/app5/cat_score.pdf', 1, '2024-04-20');

-- ----------------------------
-- Table structure for student_transfers
-- ----------------------------
DROP TABLE IF EXISTS `student_transfers`;
CREATE TABLE `student_transfers`  (
  `transfer_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `from_program_id` int(11) NULL DEFAULT NULL,
  `to_program_id` int(11) NULL DEFAULT NULL,
  `transfer_date` date NULL DEFAULT NULL,
  `reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `approval_status` enum('Pending','Approved','Rejected') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`transfer_id`) USING BTREE,
  INDEX `fk_transfer_student`(`student_id`) USING BTREE,
  INDEX `fk_transfer_fromprog`(`from_program_id`) USING BTREE,
  INDEX `fk_transfer_toprog`(`to_program_id`) USING BTREE,
  CONSTRAINT `fk_transfer_fromprog` FOREIGN KEY (`from_program_id`) REFERENCES `programs` (`program_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_transfer_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_transfer_toprog` FOREIGN KEY (`to_program_id`) REFERENCES `programs` (`program_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student_transfers
-- ----------------------------
INSERT INTO `student_transfers` VALUES (1, 11017, 2, 1, '2022-08-01', 'Stronger interest found in Computer Science subjects after first year.', 'Approved');

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students`  (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `date_of_birth` date NULL DEFAULT NULL,
  `gender` enum('Male','Female','Other') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `phone` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `enrollment_date` date NULL DEFAULT NULL,
  `program_id` int(11) NULL DEFAULT NULL,
  `category_id` int(11) NULL DEFAULT NULL,
  `student_status` enum('Active','Graduated','Dropped','Suspended') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `is_international` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`student_id`) USING BTREE,
  INDEX `fk_student_program`(`program_id`) USING BTREE,
  INDEX `fk_student_category`(`category_id`) USING BTREE,
  CONSTRAINT `fk_student_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_student_program` FOREIGN KEY (`program_id`) REFERENCES `programs` (`program_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11022 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES (11001, 'Akash', 'Sharma', '2003-05-10', 'Male', '12, MG Road, Bangalore, Karnataka', '9810000001', 'akash.sharma.cse21@college.edu.in', '2021-08-01', 1, 1, 'Active', 0);
INSERT INTO `students` VALUES (11002, 'Binita', 'Das', '2003-11-22', 'Female', '45, Park Street, Kolkata, West Bengal', '9810000002', 'binita.das.ece21@college.edu.in', '2021-08-01', 2, 3, 'Active', 0);
INSERT INTO `students` VALUES (11003, 'Chetan', 'Verma', '2004-02-15', 'Male', '78, Sector 17, Chandigarh', '9810000003', 'chetan.verma.mech22@college.edu.in', '2022-08-05', 3, 1, 'Active', 0);
INSERT INTO `students` VALUES (11004, 'Divya', 'Mistry', '2004-09-01', 'Female', '101, Ashram Road, Ahmedabad, Gujarat', '9810000004', 'divya.mistry.civil22@college.edu.in', '2022-08-05', 4, 4, 'Active', 0);
INSERT INTO `students` VALUES (11005, 'Faizal', 'Khan', '2005-03-20', 'Male', '33, Charminar Road, Hyderabad, Telangana', '9810000005', 'faizal.khan.eee23@college.edu.in', '2023-08-10', 5, 2, 'Active', 0);
INSERT INTO `students` VALUES (11006, 'Gayatri', 'Joshi', '2005-07-12', 'Female', 'Plot 5, FC Road, Pune, Maharashtra', '9810000006', 'gayatri.joshi.it23@college.edu.in', '2023-08-10', 6, 1, 'Active', 0);
INSERT INTO `students` VALUES (11007, 'Harish', 'Kumar', '2000-01-05', 'Male', 'Flat 15, Anna Nagar, Chennai, Tamil Nadu', '9810000007', 'harish.kumar.mba23@college.edu.in', '2023-07-20', 7, 1, 'Active', 0);
INSERT INTO `students` VALUES (11008, 'Isha', 'Singh', '2002-06-30', 'Female', 'B-10, Defence Colony, New Delhi', '9810000008', 'isha.singh.cse20@college.edu.in', '2020-08-15', 1, 1, 'Graduated', 0);
INSERT INTO `students` VALUES (11009, 'Jagdish', 'Patel', '2003-10-18', 'Male', '20, Linking Road, Mumbai, Maharashtra', '9810000009', 'jagdish.patel.mech21@college.edu.in', '2021-08-01', 3, 2, 'Active', 0);
INSERT INTO `students` VALUES (11010, 'Kavita', 'Sharma', '2004-04-25', 'Female', 'House 55, Sector 8, Jaipur, Rajasthan', '9810000010', 'kavita.sharma.ece22@college.edu.in', '2022-08-05', 2, 1, 'Active', 0);
INSERT INTO `students` VALUES (11011, 'Mohan', 'Raj', '2003-08-11', 'Male', 'Door No 1, Indiranagar, Bangalore', '9810000011', 'mohan.raj.cse21@college.edu.in', '2021-08-01', 1, 7, 'Active', 0);
INSERT INTO `students` VALUES (11012, 'Neha', 'Gupta', '2005-12-02', 'Female', '18, Gomti Nagar, Lucknow, UP', '9810000012', 'neha.gupta.it23@college.edu.in', '2023-08-10', 6, 1, 'Active', 0);
INSERT INTO `students` VALUES (11013, 'Rahul', 'Verma', '2004-01-09', 'Male', 'C/O Mr. Verma, Staff Quarters, College Campus', '9810000013', 'rahul.verma.mech22@college.edu.in', '2022-08-05', 3, 6, 'Suspended', 0);
INSERT INTO `students` VALUES (11014, 'Priya', 'Sen', '2003-06-14', 'Female', 'House 9, Salt Lake, Kolkata', '9810000014', 'priya.sen.civil21@college.edu.in', '2021-08-01', 4, 1, 'Active', 0);
INSERT INTO `students` VALUES (11015, 'Rohit', 'Mehta', '2004-07-28', 'Male', '42, Juhu Tara Road, Mumbai', '9810000015', 'rohit.mehta.eee22@college.edu.in', '2022-08-05', 5, 2, 'Active', 0);
INSERT INTO `students` VALUES (11016, 'Sonia', 'Agarwal', '2005-02-18', 'Female', 'Apt 5B, Connaught Place, New Delhi', '9810000016', 'sonia.agarwal.cse23@college.edu.in', '2023-08-10', 1, 1, 'Active', 0);
INSERT INTO `students` VALUES (11017, 'Tarun', 'Nayar', '2003-04-03', 'Male', 'Villa 10, Jubilee Hills, Hyderabad', '9810000017', 'tarun.nayar.ece21@college.edu.in', '2021-08-01', 2, 1, 'Active', 0);
INSERT INTO `students` VALUES (11018, 'Uma', 'Devi', '2004-11-09', 'Female', '#111, Besant Nagar, Chennai', '9810000018', 'uma.devi.mech22@college.edu.in', '2022-08-05', 3, 3, 'Active', 0);
INSERT INTO `students` VALUES (11019, 'Vikrant', 'Singh', '2003-01-21', 'Male', 'Near City Center, Durgapur, West Bengal', '9810000019', 'vikrant.singh.civil21@college.edu.in', '2021-08-01', 4, 4, 'Active', 0);
INSERT INTO `students` VALUES (11020, 'Zara', 'Ali', '2005-05-30', 'Female', '45, Richmond Road, Bangalore', '9810000020', 'zara.ali.eee23@college.edu.in', '2023-08-10', 5, 1, 'Active', 0);
INSERT INTO `students` VALUES (11021, 'Fatima', 'Khan', '2004-06-01', 'Female', '15, Orchid Rd, Singapore', '9810000021', 'fatima.khan.ece22@int.college.edu.in', '2022-08-05', 2, 5, 'Active', 1);

-- ----------------------------
-- Table structure for subjects
-- ----------------------------
DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects`  (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `course_id` int(11) NULL DEFAULT NULL,
  `hours_per_week` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`subject_id`) USING BTREE,
  INDEX `fk_subject_course`(`course_id`) USING BTREE,
  CONSTRAINT `fk_subject_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of subjects
-- ----------------------------
INSERT INTO `subjects` VALUES (1, 'C Programming Theory', 101, 3);
INSERT INTO `subjects` VALUES (2, 'C Programming Lab', 101, 2);
INSERT INTO `subjects` VALUES (3, 'Mathematics I', 901, 4);
INSERT INTO `subjects` VALUES (4, 'Physics Theory', 902, 3);
INSERT INTO `subjects` VALUES (5, 'Physics Lab', 906, 2);
INSERT INTO `subjects` VALUES (6, 'Chemistry Theory', 903, 3);
INSERT INTO `subjects` VALUES (7, 'Chemistry Lab', 907, 2);
INSERT INTO `subjects` VALUES (8, 'Data Structures Theory', 102, 3);
INSERT INTO `subjects` VALUES (9, 'Data Structures Lab', 102, 2);
INSERT INTO `subjects` VALUES (10, 'Algorithms Theory', 103, 3);
INSERT INTO `subjects` VALUES (11, 'Algorithms Lab', 103, 2);
INSERT INTO `subjects` VALUES (12, 'Basic Electronics Theory', 201, 3);
INSERT INTO `subjects` VALUES (13, 'Basic Electronics Lab', 201, 2);
INSERT INTO `subjects` VALUES (14, 'Digital Logic Design Theory', 202, 3);
INSERT INTO `subjects` VALUES (15, 'Digital Logic Design Lab', 202, 2);
INSERT INTO `subjects` VALUES (16, 'Engineering Mechanics', 301, 4);
INSERT INTO `subjects` VALUES (17, 'Thermodynamics', 302, 4);
INSERT INTO `subjects` VALUES (18, 'Marketing Management', 704, 3);

-- ----------------------------
-- Table structure for suppliers
-- ----------------------------
DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers`  (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `contact_person` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`supplier_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of suppliers
-- ----------------------------
INSERT INTO `suppliers` VALUES (1, 'Scientific Equipment Suppliers', 'Mr. Sharma', 'sales@scientificeq.in', '8123456780');
INSERT INTO `suppliers` VALUES (2, 'Campus Stationary Mart', 'Mr. Gupta', 'info@campusmart.co.in', '8234567891');
INSERT INTO `suppliers` VALUES (3, 'Housekeeping Services Pvt Ltd', 'Manager', 'contact@housekeepingserv.com', '8345678902');
INSERT INTO `suppliers` VALUES (4, 'Event Management Co', 'Ms. Priya', 'priya@eventsco.net', '8456789013');

-- ----------------------------
-- Table structure for survey_responses
-- ----------------------------
DROP TABLE IF EXISTS `survey_responses`;
CREATE TABLE `survey_responses`  (
  `response_id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NULL DEFAULT NULL,
  `alumni_id` int(11) NULL DEFAULT NULL,
  `response_text` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `response_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`response_id`) USING BTREE,
  INDEX `fk_survres_survey`(`survey_id`) USING BTREE,
  INDEX `fk_survres_alumni`(`alumni_id`) USING BTREE,
  CONSTRAINT `fk_survres_alumni` FOREIGN KEY (`alumni_id`) REFERENCES `alumni` (`alumni_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_survres_survey` FOREIGN KEY (`survey_id`) REFERENCES `alumni_surveys` (`survey_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of survey_responses
-- ----------------------------
INSERT INTO `survey_responses` VALUES (1, 1, 1, '{\"employment_status\": \"Employed\", \"company\": \"Infosys Limited\", \"salary_range\": \"3-5 LPA\", \"further_studies\": \"No\", \"satisfaction\": 4}', '2024-07-01');

-- ----------------------------
-- Table structure for sustainability_audits
-- ----------------------------
DROP TABLE IF EXISTS `sustainability_audits`;
CREATE TABLE `sustainability_audits`  (
  `audit_id` int(11) NOT NULL AUTO_INCREMENT,
  `audit_date` date NULL DEFAULT NULL,
  `auditor_id` int(11) NULL DEFAULT NULL,
  `findings` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `compliance_score` decimal(5, 2) NULL DEFAULT NULL,
  `recommendations` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`audit_id`) USING BTREE,
  INDEX `fk_susaudit_user`(`auditor_id`) USING BTREE,
  CONSTRAINT `fk_susaudit_user` FOREIGN KEY (`auditor_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sustainability_audits
-- ----------------------------
INSERT INTO `sustainability_audits` VALUES (1, '2024-05-15', 1, 'Energy consumption high in hostels. Waste segregation needs improvement.', 65.00, 'Install LED lighting in hostels. Conduct awareness drive for waste segregation.');

-- ----------------------------
-- Table structure for syllabi
-- ----------------------------
DROP TABLE IF EXISTS `syllabi`;
CREATE TABLE `syllabi`  (
  `syllabus_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NULL DEFAULT NULL,
  `semester` int(11) NULL DEFAULT NULL,
  `year` int(11) NULL DEFAULT NULL,
  `content` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `approved_by` int(11) NULL DEFAULT NULL,
  `approval_date` date NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`syllabus_id`) USING BTREE,
  INDEX `fk_syllabus_course`(`course_id`) USING BTREE,
  INDEX `fk_syllabus_faculty`(`approved_by`) USING BTREE,
  CONSTRAINT `fk_syllabus_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_syllabus_faculty` FOREIGN KEY (`approved_by`) REFERENCES `faculty` (`faculty_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of syllabi
-- ----------------------------
INSERT INTO `syllabi` VALUES (1, 101, 1, 2023, 'Module 1: Intro, Variables... Module 2: Operators... Module 5: Pointers...', 24, '2023-06-15', 1);
INSERT INTO `syllabi` VALUES (2, 103, 3, 2024, 'Unit 1: Asymptotic Notations... Unit 2: Divide & Conquer...', 24, '2024-01-10', 1);
INSERT INTO `syllabi` VALUES (3, 201, 1, 2023, 'Semiconductor basics, Diode circuits, Rectifiers, Clippers, Clampers...', 25, '2023-06-18', 1);

-- ----------------------------
-- Table structure for tax_records
-- ----------------------------
DROP TABLE IF EXISTS `tax_records`;
CREATE TABLE `tax_records`  (
  `tax_id` int(11) NOT NULL AUTO_INCREMENT,
  `fiscal_year` year NULL DEFAULT NULL,
  `tax_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `amount` decimal(15, 2) NULL DEFAULT NULL,
  `filing_date` date NULL DEFAULT NULL,
  `status` enum('Pending','Filed','Paid') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tax_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tax_records
-- ----------------------------
INSERT INTO `tax_records` VALUES (1, 2023, 'TDS (Salaries)', 1500000.00, '2024-04-30', 'Filed');
INSERT INTO `tax_records` VALUES (2, 2023, 'GST', 250000.00, '2024-03-20', 'Paid');
INSERT INTO `tax_records` VALUES (3, 2023, 'Property Tax', 500000.00, '2024-03-10', 'Paid');
INSERT INTO `tax_records` VALUES (4, 2024, 'TDS (Salaries) Q1', 400000.00, '2024-07-31', 'Pending');

-- ----------------------------
-- Table structure for teaching_assignments
-- ----------------------------
DROP TABLE IF EXISTS `teaching_assignments`;
CREATE TABLE `teaching_assignments`  (
  `assignment_id` int(11) NOT NULL AUTO_INCREMENT,
  `faculty_id` int(11) NULL DEFAULT NULL,
  `course_id` int(11) NULL DEFAULT NULL,
  `semester` int(11) NULL DEFAULT NULL,
  `year` int(11) NULL DEFAULT NULL,
  `hours_per_week` decimal(5, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`assignment_id`) USING BTREE,
  INDEX `fk_teachassign_faculty`(`faculty_id`) USING BTREE,
  INDEX `fk_teachassign_course`(`course_id`) USING BTREE,
  CONSTRAINT `fk_teachassign_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_teachassign_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teaching_assignments
-- ----------------------------
INSERT INTO `teaching_assignments` VALUES (1, 101, 101, 1, 2023, 3.00);
INSERT INTO `teaching_assignments` VALUES (2, 101, 103, 3, 2024, 3.00);
INSERT INTO `teaching_assignments` VALUES (3, 12, 101, 1, 2023, 2.00);
INSERT INTO `teaching_assignments` VALUES (4, 108, 901, 1, 2023, 4.00);

-- ----------------------------
-- Table structure for timetable_conflicts
-- ----------------------------
DROP TABLE IF EXISTS `timetable_conflicts`;
CREATE TABLE `timetable_conflicts`  (
  `conflict_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NULL DEFAULT NULL,
  `conflicting_class_id` int(11) NULL DEFAULT NULL,
  `conflict_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `resolution_status` enum('Pending','Resolved') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `resolved_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`conflict_id`) USING BTREE,
  INDEX `fk_conflict_class1`(`class_id`) USING BTREE,
  INDEX `fk_conflict_class2`(`conflicting_class_id`) USING BTREE,
  INDEX `fk_conflict_user`(`resolved_by`) USING BTREE,
  CONSTRAINT `fk_conflict_class1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_conflict_class2` FOREIGN KEY (`conflicting_class_id`) REFERENCES `classes` (`class_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_conflict_user` FOREIGN KEY (`resolved_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of timetable_conflicts
-- ----------------------------
INSERT INTO `timetable_conflicts` VALUES (1, 6, 999, 'Faculty Clash', 'Pending', NULL);

-- ----------------------------
-- Table structure for timetable_rescheduling
-- ----------------------------
DROP TABLE IF EXISTS `timetable_rescheduling`;
CREATE TABLE `timetable_rescheduling`  (
  `reschedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NULL DEFAULT NULL,
  `original_date` date NULL DEFAULT NULL,
  `new_date` date NULL DEFAULT NULL,
  `original_start_time` time NULL DEFAULT NULL,
  `new_start_time` time NULL DEFAULT NULL,
  `new_end_time` time NULL DEFAULT NULL,
  `reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `new_room_id` int(11) NULL DEFAULT NULL,
  `requested_by` int(11) NULL DEFAULT NULL,
  `approved_by` int(11) NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'Pending',
  PRIMARY KEY (`reschedule_id`) USING BTREE,
  INDEX `fk_resched_class`(`class_id`) USING BTREE,
  INDEX `fk_resched_approvedby`(`approved_by`) USING BTREE,
  INDEX `fk_resched_newroom`(`new_room_id`) USING BTREE,
  INDEX `fk_resched_reqby`(`requested_by`) USING BTREE,
  CONSTRAINT `fk_resched_approvedby` FOREIGN KEY (`approved_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_resched_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_resched_newroom` FOREIGN KEY (`new_room_id`) REFERENCES `rooms` (`room_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_resched_reqby` FOREIGN KEY (`requested_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of timetable_rescheduling
-- ----------------------------
INSERT INTO `timetable_rescheduling` VALUES (1, 1, '2023-08-21', '2023-08-22', '09:00:00', '14:00:00', '15:00:00', 'Faculty unavailable due to urgent meeting.', 1, 101, 24, 'Approved');

-- ----------------------------
-- Table structure for training_attendance
-- ----------------------------
DROP TABLE IF EXISTS `training_attendance`;
CREATE TABLE `training_attendance`  (
  `attendance_id` int(11) NOT NULL AUTO_INCREMENT,
  `training_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `attendance_date` date NULL DEFAULT NULL,
  `status` enum('Present','Absent') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `certificate_issued` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`attendance_id`) USING BTREE,
  INDEX `fk_trainatt_training`(`training_id`) USING BTREE,
  INDEX `fk_trainatt_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_trainatt_training` FOREIGN KEY (`training_id`) REFERENCES `training_programs` (`training_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_trainatt_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of training_attendance
-- ----------------------------
INSERT INTO `training_attendance` VALUES (1, 1, 101, '2024-01-08', 'Present', 1);
INSERT INTO `training_attendance` VALUES (2, 1, 102, '2024-01-08', 'Present', 1);
INSERT INTO `training_attendance` VALUES (3, 2, 202, '2023-12-18', 'Present', 1);
INSERT INTO `training_attendance` VALUES (4, 2, 205, '2023-12-18', 'Absent', 0);

-- ----------------------------
-- Table structure for training_programs
-- ----------------------------
DROP TABLE IF EXISTS `training_programs`;
CREATE TABLE `training_programs`  (
  `training_id` int(11) NOT NULL AUTO_INCREMENT,
  `training_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `trainer_id` int(11) NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `budget` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`training_id`) USING BTREE,
  INDEX `fk_training_trainer`(`trainer_id`) USING BTREE,
  CONSTRAINT `fk_training_trainer` FOREIGN KEY (`trainer_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of training_programs
-- ----------------------------
INSERT INTO `training_programs` VALUES (1, 'Faculty Development Program: OBE Implementation', '2024-01-08', '2024-01-12', 21, 'Workshop on Outcome Based Education for faculty.', 50000.00);
INSERT INTO `training_programs` VALUES (2, 'Staff Training: Office Productivity Tools', '2023-12-18', '2023-12-19', 209, 'Training on MS Office / Google Workspace for Admin staff.', 15000.00);

-- ----------------------------
-- Table structure for transport_accidents
-- ----------------------------
DROP TABLE IF EXISTS `transport_accidents`;
CREATE TABLE `transport_accidents`  (
  `accident_id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) NULL DEFAULT NULL,
  `accident_date` date NULL DEFAULT NULL,
  `location` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `reported_by` int(11) NULL DEFAULT NULL,
  `insurance_claimed` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`accident_id`) USING BTREE,
  INDEX `fk_transacc_vehicle`(`vehicle_id`) USING BTREE,
  INDEX `fk_transacc_user`(`reported_by`) USING BTREE,
  CONSTRAINT `fk_transacc_user` FOREIGN KEY (`reported_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_transacc_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of transport_accidents
-- ----------------------------
INSERT INTO `transport_accidents` VALUES (1, 1, '2024-05-10', 'Near Silk Board Junction', 'Minor collision with auto-rickshaw. Minor damage to bus bumper.', 207, 0);

-- ----------------------------
-- Table structure for transport_allocations
-- ----------------------------
DROP TABLE IF EXISTS `transport_allocations`;
CREATE TABLE `transport_allocations`  (
  `allocation_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `route_id` int(11) NULL DEFAULT NULL,
  `vehicle_id` int(11) NULL DEFAULT NULL,
  `allocation_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`allocation_id`) USING BTREE,
  INDEX `fk_transalloc_user`(`user_id`) USING BTREE,
  INDEX `fk_transalloc_route`(`route_id`) USING BTREE,
  INDEX `fk_transalloc_vehicle`(`vehicle_id`) USING BTREE,
  CONSTRAINT `fk_transalloc_route` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_transalloc_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_transalloc_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of transport_allocations
-- ----------------------------
INSERT INTO `transport_allocations` VALUES (1, 11004, 2, 1, '2023-08-01');
INSERT INTO `transport_allocations` VALUES (2, 11019, 1, 1, '2023-08-01');
INSERT INTO `transport_allocations` VALUES (3, 11012, 3, 2, '2023-08-10');
INSERT INTO `transport_allocations` VALUES (4, 11001, 4, 2, '2023-08-01');

-- ----------------------------
-- Table structure for transport_passes
-- ----------------------------
DROP TABLE IF EXISTS `transport_passes`;
CREATE TABLE `transport_passes`  (
  `pass_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `route_id` int(11) NULL DEFAULT NULL,
  `issue_date` date NULL DEFAULT NULL,
  `expiry_date` date NULL DEFAULT NULL,
  `pass_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pass_id`) USING BTREE,
  INDEX `fk_transpass_student`(`student_id`) USING BTREE,
  INDEX `fk_transpass_route`(`route_id`) USING BTREE,
  CONSTRAINT `fk_transpass_route` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_transpass_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of transport_passes
-- ----------------------------
INSERT INTO `transport_passes` VALUES (1, 11004, 2, '2023-08-01', '2024-01-31', 'Semester Pass');
INSERT INTO `transport_passes` VALUES (2, 11019, 1, '2023-08-01', '2024-07-31', 'Annual Pass');

-- ----------------------------
-- Table structure for two_factor_auth
-- ----------------------------
DROP TABLE IF EXISTS `two_factor_auth`;
CREATE TABLE `two_factor_auth`  (
  `tfa_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `secret_key` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `enabled` tinyint(1) NULL DEFAULT NULL,
  `last_verified` datetime NULL DEFAULT NULL,
  `backup_code` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tfa_id`) USING BTREE,
  INDEX `fk_tfa_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_tfa_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of two_factor_auth
-- ----------------------------
INSERT INTO `two_factor_auth` VALUES (1, 1, 'SECRETKEYFORADMINUSERXYZ', 1, '2024-07-15 10:00:05', 'BACKUP12345');
INSERT INTO `two_factor_auth` VALUES (2, 101, 'SECRETKEYFACULTY1ABCDEFG', 1, '2024-07-12 15:00:10', 'BACKUP67890');

-- ----------------------------
-- Table structure for user_activity_logs
-- ----------------------------
DROP TABLE IF EXISTS `user_activity_logs`;
CREATE TABLE `user_activity_logs`  (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `activity_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `activity_timestamp` datetime NULL DEFAULT NULL,
  `details` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `ip_address` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `fk_userlog_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_userlog_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_activity_logs
-- ----------------------------
INSERT INTO `user_activity_logs` VALUES (1, 11001, 'LOGIN', '2024-07-14 22:00:10', 'Successful login via web portal', '103.45.67.89');
INSERT INTO `user_activity_logs` VALUES (2, 101, 'VIEW_ATTENDANCE', '2024-07-12 15:01:00', 'Viewed attendance for course CS101 Sem 1 2023', '192.168.1.50');
INSERT INTO `user_activity_logs` VALUES (3, 201, 'CREATE_LEDGER_ENTRY', '2024-07-15 11:30:00', 'Posted entries for transaction ID 12', '192.168.1.25');
INSERT INTO `user_activity_logs` VALUES (4, 11002, 'LOGOUT', '2024-07-15 07:45:00', 'User logged out from app', '117.89.10.11');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password_hash` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `last_login` datetime NULL DEFAULT NULL,
  `account_status` enum('Active','Inactive','Locked') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `fk_user_role`(`role_id`) USING BTREE,
  CONSTRAINT `fk_user_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11022 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', '$2y$10$U.V/GzW5CgR..k./l0oM..z/0UaI8GZp4A6J0z/4rK3n2mB/8qW1a', 1, 'admin@college.edu.in', '9999999999', '2024-07-15 10:00:00', 'Active');
INSERT INTO `users` VALUES (2, 'principal', '$2y$10$q..k0l/aI8GZpU.V/GzW5CgRM./..z/4A6J0z/4rK3n2mB/8qW1a', 13, 'mohan.krishnan@college.edu.in', '9111122220', '2024-07-14 09:30:00', 'Active');
INSERT INTO `users` VALUES (3, 'adm_sup', '$2y$10$Zp4A6J0z/.V/GzW5CgR.K./l0oM..k./.z/0UaI8G3n2mB/8qW1a', 4, 'bhavna.shah.adm@college.edu.in', '8887776665', '2024-07-15 09:00:00', 'Active');
INSERT INTO `users` VALUES (101, 'rkumar', '$2y$10$0UaI8GZp.V/GzW5CgR4A6J0z/K./l0oM..k.n2mB/8qW1a', 2, 'rajesh.kumar.cse@college.edu.in', '9876543210', '2024-07-12 15:00:00', 'Active');
INSERT INTO `users` VALUES (102, 'psharma', '$2y$10$5CgRM./l.V/GzW0oM..k./0UaI8GZp4A6J0z/4rK3n2mB/8qW1a', 2, 'priya.sharma.ece@college.edu.in', '9123456789', '2024-07-11 11:00:00', 'Active');
INSERT INTO `users` VALUES (103, 'asingh', '$2y$10$k./l0oM..V/GzW5CgR/0UaI8GZp4A6J0z/.z4rK3n2mB/8qW1a', 2, 'amit.singh.mech@college.edu.in', '9988776655', '2024-07-14 14:00:00', 'Active');
INSERT INTO `users` VALUES (104, 'sverma', '$2y$10$A6J0z/4r.V/GzW5CgRK./l0oM..k.3n2mB/8qW1a/0UaI8GZp', 2, 'sneha.verma.civil@college.edu.in', '9000011111', '2024-07-13 10:30:00', 'Active');
INSERT INTO `users` VALUES (105, 'mgupta', '$2y$10$K3n2mB/8.V/GzW5CgR./l0oM..k./qW1aI8GZp4A6J0z/4r0Ua', 2, 'manoj.gupta.eee@college.edu.in', '9888877776', '2024-07-15 08:45:00', 'Active');
INSERT INTO `users` VALUES (106, 'apatel', '$2y$10$l0oM..k./.V/GzW5CgRqW1a0UaI8GZp4A6J0z/4rK3n2mB/8', 2, 'anjali.patel.it@college.edu.in', '9777766665', '2024-07-10 16:00:00', 'Active');
INSERT INTO `users` VALUES (107, 'sreddy', '$2y$10$8GZp4A6J.V/GzW5CgR.n2mB/8qW1a/l0oM..k./0Uz/4rK30Ua', 2, 'suresh.reddy.mba@college.edu.in', '9666655554', '2024-07-13 12:00:00', 'Active');
INSERT INTO `users` VALUES (108, 'dnair', '$2y$10$CgRk./l0o.V/GzW5M..k./qW1a0UaI8GZp4A6J0z/4rK3n2mB/8', 2, 'deepika.nair.math@college.edu.in', '9555544443', '2024-07-14 11:15:00', 'Active');
INSERT INTO `users` VALUES (109, 'vchauhan', '$2y$10$rK3n2mB/8.V/GzW5CgRz/4A6J0/l0oM..k./0UaI8GZp4qW1a', 2, 'vikram.chauhan.phy@college.edu.in', '9444433332', '2024-07-12 10:00:00', 'Active');
INSERT INTO `users` VALUES (110, 'miyer', '$2y$10$.V/GzW5CgR./l0oM./0UaI8GZp4A6J0z/.k4rK3n2mB/8qW1a', 2, 'meera.iyer.chem@college.edu.in', '9333322221', '2024-07-15 09:50:00', 'Active');
INSERT INTO `users` VALUES (111, 'rshankar', '$2y$10$U.V/GzW5CgRaI8GZp..k./l0oM4A6J0z/.z/04rK3n2mB/8qW1a', 2, 'ravi.shankar.hss@college.edu.in', '9222211110', '2024-07-13 13:30:00', 'Active');
INSERT INTO `users` VALUES (112, 'sjain', '$2y$10$V/GzW5CgR./.z/0Uak./l0oM8GZp4A6J0z/4rK3n2mB/8qW1aI', 2, 'sunita.jain.cse@college.edu.in', '9876501234', '2024-07-11 14:45:00', 'Active');
INSERT INTO `users` VALUES (113, 'amenon', '$2y$10$GzW5CgR..k./.z/0UaV/l0oM8GZp4A6J0z/4rK3n2mB/8qW1aI', 2, 'arun.menon.ece@college.edu.in', '9123498765', '2024-07-14 10:10:00', 'Active');
INSERT INTO `users` VALUES (114, 'vagarwal', '$2y$10$W5CgR..k./l0oM..zV/Gz/0UaI8GZp4A6J0z/4rK3n2mB/8qW1a', 2, 'vivek.agarwal.mech@college.edu.in', '9988712345', '2024-07-12 11:30:00', 'Active');
INSERT INTO `users` VALUES (115, 'ndave', '$2y$10$CgR..k./l0oM..z/0V/GzUaI8GZp4A6J0z/4rK3n2mB/8qW1aW', 2, 'nisha.dave.civil@college.edu.in', '9000054321', '2024-07-10 09:00:00', 'Active');
INSERT INTO `users` VALUES (116, 'ksubbu', '$2y$10$R..k./l0oM..z/0UaI8V/GzGZp4A6J0z/4rK3n2mB/8qW1a5C', 2, 'karthik.s.eee@college.edu.in', '9888898765', '2024-07-15 10:05:00', 'Active');
INSERT INTO `users` VALUES (117, 'pmalhotra', '$2y$10$.k./l0oM..z/0UaI8GZV/GzWp4A6J0z/4rK3n2mB/8qW1a5CgR', 2, 'pooja.malhotra.it@college.edu.in', '9777787654', NULL, 'Active');
INSERT INTO `users` VALUES (118, 'skhan', '$2y$10$k./l0oM..z/0UaI8GZp4V/GzA6J0z/4rK3n2mB/8qW1a.k5CgR.', 2, 'sameer.khan.mba@college.edu.in', '9666676543', '2024-07-11 10:20:00', 'Active');
INSERT INTO `users` VALUES (119, 'grao', '$2y$10$/l0oM..z/0UaI8GZp4A6V/GzJ0z/4rK3n2mB/8qW1a5CgR..k./l', 2, 'geeta.rao.math@college.edu.in', '9555565432', '2024-07-13 14:30:00', 'Active');
INSERT INTO `users` VALUES (120, 'hpandey', '$2y$10$oM..z/0UaI8GZp4A6J0z/V/Gz4rK3n2mB/8qW1a5CgR..k./l0', 2, 'harish.pandey.phy@college.edu.in', '9444454321', '2024-07-14 12:45:00', 'Active');
INSERT INTO `users` VALUES (201, 'arao', '$2y$10$Zp4A6J0z/..z/0UaI8GzV/G.k./l0oMK3n2mB/8qW1a5CgR..', 5, 'anand.rao.acc@college.edu.in', '8989898989', '2024-07-15 09:10:00', 'Active');
INSERT INTO `users` VALUES (202, 'bshah', '$2y$10$.k./l0oM./GzW5CgR.z/0UaI8GZp4A6J0z/4rK3n2mB/8qW1a', 4, 'bhavna.shah.adm@college.edu.in', '8887776665', '2024-07-15 08:55:00', 'Active');
INSERT INTO `users` VALUES (203, 'cmohan', '$2y$10$/l0oM..k.8GZp4A6J0z/V/GzW5CgR.z/0UaI4rK3n2mB/8qW1a', 6, 'chandra.mohan.lib@college.edu.in', '8776665554', '2024-07-14 16:30:00', 'Active');
INSERT INTO `users` VALUES (204, 'dpatil', '$2y$10$oM..k./l08GZp4A6J0z/.z/0UaIV/GzW5CgR.rK3n2mB/8qW1a', 6, 'divya.patil.lib@college.edu.in', '8665554443', '2024-07-14 15:00:00', 'Active');
INSERT INTO `users` VALUES (205, 'eprasad', '$2y$10$..k./l0oM8GZp4A6J0z/.z/0UaI8V/GzW5CgRKrK3n2mB/8qW1', 4, 'eshwar.prasad.adm@college.edu.in', '8554443332', '2024-07-15 09:05:00', 'Active');
INSERT INTO `users` VALUES (206, 'fshaikh', '$2y$10$UaI8GZp4.V/GzW5CgR.k./l0oM/.z/0A6J0z/4rK3n2mB/8qW1', 10, 'firoz.shaikh.sec@college.edu.in', '8443332221', '2024-07-15 06:00:00', 'Active');
INSERT INTO `users` VALUES (207, 'gnaik', '$2y$10$I8GZp4A6J.V/GzW5CgR.n2mB/.k./l0oM0Ua/8qW1az/4rK30z', 12, 'girish.naik.trans@college.edu.in', '8332221110', '2024-07-14 17:00:00', 'Active');
INSERT INTO `users` VALUES (208, 'hsundari', '$2y$10$GZp4A6J0z/V/GzW5CgR.mB/8q.k./l0oM.UaI.K3n2W1a/4rKz', 9, 'hema.sundari.sw@college.edu.in', '8221110009', '2024-07-13 16:00:00', 'Active');
INSERT INTO `users` VALUES (209, 'ibhatia', '$2y$10$p4A6J0z/4rK.V/GzW5CgR/8qW1a3n2mB.k./l0oM.UaI8GZ.', 11, 'ishaan.bhatia.it@college.edu.in', '8110009998', '2024-07-15 09:45:00', 'Active');
INSERT INTO `users` VALUES (210, 'jlakshmi', '$2y$10$6J0z/4rK3n.V/GzW5CgR/8qW1a2mB/.k./l0oM.UaI8GZp4A', 5, 'jaya.lakshmi.acc@college.edu.in', '8009998887', '2024-07-15 09:20:00', 'Active');
INSERT INTO `users` VALUES (211, 'kkishore', '$2y$10$J0z/4rK3n2.V/GzW5CgR/qW1amB/8.k./l0oM.UaI8GZp4A6', 4, 'kamal.kishore.adm@college.edu.in', '7998887776', '2024-07-15 10:10:00', 'Active');
INSERT INTO `users` VALUES (212, 'lmenon', '$2y$10$0z/4rK3n2m.V/GzW5CgR/qW1aB/8/.k./l0oM.UaI8GZp4A6J', 7, 'lalitha.menon.hostel@college.edu.in', '7887776665', '2024-07-15 09:55:00', 'Active');
INSERT INTO `users` VALUES (213, 'mgopal', '$2y$10$z/4rK3n2mB/.V/GzW5CgR/W1aqB/8.k./l0oM.UaI8GZp4A6J0', 4, 'madan.gopal.trans@college.edu.in', '7776665554', '2024-07-14 18:00:00', 'Active');
INSERT INTO `users` VALUES (214, 'nkumar', '$2y$10$/4rK3n2mB/8.V/GzW5CgR/1aqB/k./l0oM.UaI8GZp4A6J0z/.', 10, 'naveen.kumar.sec@college.edu.in', '7665554443', '2024-07-15 14:00:00', 'Active');
INSERT INTO `users` VALUES (221, 'drsharma', '$2y$10$someHashPlaceholder....', 4, 'anil.sharma.doc@college.edu.in', '7012345678', NULL, 'Active');
INSERT INTO `users` VALUES (11001, 'student001', '$2y$10$4rK3n2mB/8q.V/GzW5CgR/W1a.k./l0oM.UaI8GZp4A6J0z', 3, 'akash.sharma.cse21@college.edu.in', '9810000001', '2024-07-14 22:00:00', 'Active');
INSERT INTO `users` VALUES (11002, 'student002', '$2y$10$rK3n2mB/8qW.V/GzW5CgR/1a/.k./l0oM.UaI8GZp4A6J0z', 3, 'binita.das.ece21@college.edu.in', '9810000002', '2024-07-15 07:30:00', 'Active');
INSERT INTO `users` VALUES (11003, 'student003', '$2y$10$K3n2mB/8qW1.V/GzW5CgR/a./.k./l0oM.UaI8GZp4A6J0z', 3, 'chetan.verma.mech22@college.edu.in', '9810000003', '2024-07-13 18:00:00', 'Active');
INSERT INTO `users` VALUES (11004, 'student004', '$2y$10$3n2mB/8qW1a.V/GzW5CgR//.k./l0oM.UaI8GZp4A6J0z/4', 3, 'divya.mistry.civil22@college.edu.in', '9810000004', '2024-07-14 19:00:00', 'Active');
INSERT INTO `users` VALUES (11005, 'student005', '$2y$10$n2mB/8qW1a/.V/GzW5CgR/.k./l0oM.UaI8GZp4A6J0z/4rK', 3, 'faizal.khan.eee23@college.edu.in', '9810000005', '2024-07-15 08:00:00', 'Active');
INSERT INTO `users` VALUES (11006, 'student006', '$2y$10$2mB/8qW1a/..V/GzW5CgRk./l0oM.UaI8GZp4A6J0z/4rK3', 3, 'gayatri.joshi.it23@college.edu.in', '9810000006', NULL, 'Active');
INSERT INTO `users` VALUES (11007, 'student007', '$2y$10$mB/8qW1a/..V/GzW5CgRk.l0oM./UaI8GZp4A6J0z/4rK3n2', 3, 'harish.kumar.mba23@college.edu.in', '9810000007', '2024-07-12 23:00:00', 'Active');
INSERT INTO `users` VALUES (11008, 'student008', '$2y$10$B/8qW1a/..V/GzW5CgRk/l0oM./.UaI8GZp4A6J0z/4rK3n2m', 3, 'isha.singh.cse20@college.edu.in', '9810000008', '2024-07-14 15:30:00', 'Inactive');
INSERT INTO `users` VALUES (11009, 'student009', '$2y$10$/8qW1a/..V/GzW5CgRk//l0oM./.UaI8GZp4A6J0z/4rK3n2mB', 3, 'jagdish.patel.mech21@college.edu.in', '9810000009', '2024-07-15 09:30:00', 'Active');
INSERT INTO `users` VALUES (11010, 'student010', '$2y$10$qW1a/..V/GzW5CgRk//8l0oM./.UaI8GZp4A6J0z/4rK3n2mB', 3, 'kavita.sharma.ece22@college.edu.in', '9810000010', '2024-07-14 21:00:00', 'Active');
INSERT INTO `users` VALUES (11011, 'student011', '$2y$10$W1a/..V/GzW5CgRk//8/l0oM..UaI8GZp4A6J0z/4rK3n2mBq', 3, 'mohan.raj.cse21@college.edu.in', '9810000011', '2024-07-15 10:15:00', 'Active');
INSERT INTO `users` VALUES (11012, 'student012', '$2y$10$1a/..V/GzW5CgRk//8/qWl0oM.UaI8GZp4A6J0z/4rK3n2mB.', 3, 'neha.gupta.it23@college.edu.in', '9810000012', '2024-07-14 18:45:00', 'Active');
INSERT INTO `users` VALUES (11013, 'student013', '$2y$10$a/..V/GzW5CgRk//8/qW1l0oM.UaI8GZp4A6J0z/4rK3n2mB.', 3, 'rahul.verma.mech22@college.edu.in', '9810000013', NULL, 'Locked');
INSERT INTO `users` VALUES (11014, 'student014', '$2y$10$/..V/GzW5CgRk//8/qW1a/l0oM.UaI8GZp4A6J0z/4rK3n2mB', 3, 'priya.sen.civil21@college.edu.in', '9810000014', '2024-07-15 08:20:00', 'Active');
INSERT INTO `users` VALUES (11015, 'student015', '$2y$10$..V/GzW5CgRk//8/qW1a/..l0oM.UaI8GZp4A6J0z/4rK3n2mB', 3, 'rohit.mehta.eee22@college.edu.in', '9810000015', '2024-07-13 20:30:00', 'Active');
INSERT INTO `users` VALUES (11021, 'student021', '$2y$10$anotherStudentHash.....', 3, 'fatima.khan.ece22@int.college.edu.in', '9810000021', NULL, 'Active');

-- ----------------------------
-- Table structure for vehicle_maintenance
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_maintenance`;
CREATE TABLE `vehicle_maintenance`  (
  `maintenance_id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) NULL DEFAULT NULL,
  `maintenance_date` date NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `cost` decimal(10, 2) NULL DEFAULT NULL,
  `status` enum('Pending','Completed') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `service_provider` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`maintenance_id`) USING BTREE,
  INDEX `fk_vmaint_vehicle`(`vehicle_id`) USING BTREE,
  CONSTRAINT `fk_vmaint_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of vehicle_maintenance
-- ----------------------------
INSERT INTO `vehicle_maintenance` VALUES (1, 1, '2024-04-01', 'Routine 10,000km Service - Oil Change, Filter Check', 8500.00, 'Completed', 'Tata Motors Service Center');
INSERT INTO `vehicle_maintenance` VALUES (2, 2, '2024-06-15', 'Tyre Replacement (2 nos)', 15000.00, 'Completed', 'Local Tyre Dealer');

-- ----------------------------
-- Table structure for vehicles
-- ----------------------------
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles`  (
  `vehicle_id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_number` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `capacity` int(11) NULL DEFAULT NULL,
  `driver_id` int(11) NULL DEFAULT NULL,
  `vehicle_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`vehicle_id`) USING BTREE,
  INDEX `fk_vehicle_staff`(`driver_id`) USING BTREE,
  CONSTRAINT `fk_vehicle_staff` FOREIGN KEY (`driver_id`) REFERENCES `staff` (`staff_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of vehicles
-- ----------------------------
INSERT INTO `vehicles` VALUES (1, 'KA05MP1234', 50, 13, 'Bus');
INSERT INTO `vehicles` VALUES (2, 'KA05MP5678', 40, NULL, 'Bus');
INSERT INTO `vehicles` VALUES (3, 'KA01F9999', 5, NULL, 'Car');

-- ----------------------------
-- Table structure for visit_logs
-- ----------------------------
DROP TABLE IF EXISTS `visit_logs`;
CREATE TABLE `visit_logs`  (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `visitor_id` int(11) NULL DEFAULT NULL,
  `entry_time` datetime NULL DEFAULT NULL,
  `exit_time` datetime NULL DEFAULT NULL,
  `host_id` int(11) NULL DEFAULT NULL,
  `gate_number` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `fk_visitlog_visitor`(`visitor_id`) USING BTREE,
  INDEX `fk_visitlog_user`(`host_id`) USING BTREE,
  CONSTRAINT `fk_visitlog_user` FOREIGN KEY (`host_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_visitlog_visitor` FOREIGN KEY (`visitor_id`) REFERENCES `visitors` (`visitor_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of visit_logs
-- ----------------------------
INSERT INTO `visit_logs` VALUES (1, 1, '2024-07-12 11:05:15', '2024-07-12 12:31:00', 201, 'Main Gate');
INSERT INTO `visit_logs` VALUES (2, 2, '2024-07-14 14:01:30', '2024-07-14 15:35:10', 11001, 'Main Gate');
INSERT INTO `visit_logs` VALUES (3, 3, '2024-07-20 09:58:00', '2024-07-20 13:05:45', 23, 'Main Gate');

-- ----------------------------
-- Table structure for visitor_analytics
-- ----------------------------
DROP TABLE IF EXISTS `visitor_analytics`;
CREATE TABLE `visitor_analytics`  (
  `analytic_id` int(11) NOT NULL AUTO_INCREMENT,
  `visit_date` date NULL DEFAULT NULL,
  `total_visitors` int(11) NULL DEFAULT NULL,
  `peak_hour` time NULL DEFAULT NULL,
  `most_common_purpose` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `analysis_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`analytic_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of visitor_analytics
-- ----------------------------
INSERT INTO `visitor_analytics` VALUES (1, '2024-07-12', 85, '11:00:00', 'Meeting Faculty/Staff', '2024-07-13');
INSERT INTO `visitor_analytics` VALUES (2, '2024-07-14', 120, '14:00:00', 'Meeting Student', '2024-07-15');

-- ----------------------------
-- Table structure for visitor_badges
-- ----------------------------
DROP TABLE IF EXISTS `visitor_badges`;
CREATE TABLE `visitor_badges`  (
  `badge_id` int(11) NOT NULL AUTO_INCREMENT,
  `visitor_id` int(11) NULL DEFAULT NULL,
  `badge_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `issue_date` date NULL DEFAULT NULL,
  `expiry_date` date NULL DEFAULT NULL,
  `badge_status` enum('Issued','Returned') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`badge_id`) USING BTREE,
  INDEX `fk_badge_visitor`(`visitor_id`) USING BTREE,
  CONSTRAINT `fk_badge_visitor` FOREIGN KEY (`visitor_id`) REFERENCES `visitors` (`visitor_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of visitor_badges
-- ----------------------------
INSERT INTO `visitor_badges` VALUES (1, 1, 'VISTBADGE001', '2024-07-12', '2024-07-12', 'Returned');
INSERT INTO `visitor_badges` VALUES (2, 3, 'VISTBADGE002', '2024-07-20', '2024-07-20', 'Issued');

-- ----------------------------
-- Table structure for visitor_pre_registrations
-- ----------------------------
DROP TABLE IF EXISTS `visitor_pre_registrations`;
CREATE TABLE `visitor_pre_registrations`  (
  `pre_reg_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `contact_number` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `purpose` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `expected_date` date NULL DEFAULT NULL,
  `host_id` int(11) NULL DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pre_reg_id`) USING BTREE,
  INDEX `fk_visitorprereg_user`(`host_id`) USING BTREE,
  CONSTRAINT `fk_visitorprereg_user` FOREIGN KEY (`host_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of visitor_pre_registrations
-- ----------------------------
INSERT INTO `visitor_pre_registrations` VALUES (1, 'Vendor', 'Rep', '8844332211', 'vendor@supplier.com', 'Deliver lab equipment', '2024-07-22', 25, 'Approved');

-- ----------------------------
-- Table structure for visitors
-- ----------------------------
DROP TABLE IF EXISTS `visitors`;
CREATE TABLE `visitors`  (
  `visitor_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `contact_number` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `purpose` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `visit_date` date NULL DEFAULT NULL,
  `entry_time` time NULL DEFAULT NULL,
  `exit_time` time NULL DEFAULT NULL,
  `host_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`visitor_id`) USING BTREE,
  INDEX `fk_visitor_user`(`host_id`) USING BTREE,
  CONSTRAINT `fk_visitor_user` FOREIGN KEY (`host_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of visitors
-- ----------------------------
INSERT INTO `visitors` VALUES (1, 'Mahesh', 'Gupta', '8877665544', 'mahesh.g@vendor.com', 'Meeting with Accounts Dept', '2024-07-12', '11:05:00', '12:30:00', 201);
INSERT INTO `visitors` VALUES (2, 'Priya', 'Verma', '8866554433', 'priya.v@parent.com', 'Meet Student Akash Sharma (11001)', '2024-07-14', '14:00:00', '15:30:00', 11001);
INSERT INTO `visitors` VALUES (3, 'Representative', 'Infosys HR', '8855443322', 'campus@infosys.com', 'Pre-placement Talk', '2024-07-20', '10:00:00', '13:00:00', 23);

-- ----------------------------
-- Table structure for volunteer_activities
-- ----------------------------
DROP TABLE IF EXISTS `volunteer_activities`;
CREATE TABLE `volunteer_activities`  (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NULL DEFAULT NULL,
  `activity_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `activity_date` date NULL DEFAULT NULL,
  `location` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hours` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`activity_id`) USING BTREE,
  INDEX `fk_volact_prog`(`program_id`) USING BTREE,
  CONSTRAINT `fk_volact_prog` FOREIGN KEY (`program_id`) REFERENCES `outreach_programs` (`program_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of volunteer_activities
-- ----------------------------
INSERT INTO `volunteer_activities` VALUES (1, 1, 'Teaching Basics MS Office', '2024-01-11', 'Ramnagara Village Community Hall', 4);
INSERT INTO `volunteer_activities` VALUES (2, 2, 'Physics Magic Show Setup', '2023-11-25', 'College Lab Prep Room', 3);

-- ----------------------------
-- Table structure for volunteers
-- ----------------------------
DROP TABLE IF EXISTS `volunteers`;
CREATE TABLE `volunteers`  (
  `volunteer_id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `participation_date` date NULL DEFAULT NULL,
  `hours_contributed` int(11) NULL DEFAULT NULL,
  `feedback` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`volunteer_id`) USING BTREE,
  INDEX `fk_vol_activity`(`activity_id`) USING BTREE,
  INDEX `fk_vol_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_vol_activity` FOREIGN KEY (`activity_id`) REFERENCES `volunteer_activities` (`activity_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_vol_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of volunteers
-- ----------------------------
INSERT INTO `volunteers` VALUES (1, 1, 11016, '2024-01-11', 4, 'Rewarding experience helping the youth.');
INSERT INTO `volunteers` VALUES (2, 2, 11019, '2023-11-25', 3, 'Fun setting up the experiments!');

-- ----------------------------
-- Table structure for waste_management
-- ----------------------------
DROP TABLE IF EXISTS `waste_management`;
CREATE TABLE `waste_management`  (
  `waste_id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_date` date NULL DEFAULT NULL,
  `waste_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `quantity_kg` decimal(10, 2) NULL DEFAULT NULL,
  `disposal_method` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cost` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`waste_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of waste_management
-- ----------------------------
INSERT INTO `waste_management` VALUES (1, '2024-07-15', 'Paper Waste', 55.50, 'Recycling Partner', 0.00);
INSERT INTO `waste_management` VALUES (2, '2024-07-15', 'E-Waste', 10.20, 'Certified E-waste Vendor', 500.00);
INSERT INTO `waste_management` VALUES (3, '2024-07-15', 'Wet Waste (Canteen)', 80.00, 'Composting Unit', 0.00);
INSERT INTO `waste_management` VALUES (4, '2024-07-16', 'Dry Waste (Mixed)', 150.00, 'Municipal Collection', 1000.00);
INSERT INTO `waste_management` VALUES (5, '2024-07-16', 'Horticulture Waste', 200.00, 'Composting Unit', 0.00);

-- ----------------------------
-- Table structure for wellness_program_registrations
-- ----------------------------
DROP TABLE IF EXISTS `wellness_program_registrations`;
CREATE TABLE `wellness_program_registrations`  (
  `registration_id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `registration_date` date NULL DEFAULT NULL,
  `participation_status` enum('Registered','Attended','Dropped') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`registration_id`) USING BTREE,
  INDEX `fk_wellreg_prog`(`program_id`) USING BTREE,
  INDEX `fk_wellreg_student`(`student_id`) USING BTREE,
  CONSTRAINT `fk_wellreg_prog` FOREIGN KEY (`program_id`) REFERENCES `wellness_programs` (`program_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_wellreg_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wellness_program_registrations
-- ----------------------------
INSERT INTO `wellness_program_registrations` VALUES (1, 1, 11002, '2023-09-01', 'Attended');
INSERT INTO `wellness_program_registrations` VALUES (2, 1, 11010, '2023-09-02', 'Dropped');
INSERT INTO `wellness_program_registrations` VALUES (3, 2, 11001, '2024-02-10', 'Attended');

-- ----------------------------
-- Table structure for wellness_programs
-- ----------------------------
DROP TABLE IF EXISTS `wellness_programs`;
CREATE TABLE `wellness_programs`  (
  `program_id` int(11) NOT NULL AUTO_INCREMENT,
  `program_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `coordinator_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`program_id`) USING BTREE,
  INDEX `fk_wellness_staff`(`coordinator_id`) USING BTREE,
  CONSTRAINT `fk_wellness_staff` FOREIGN KEY (`coordinator_id`) REFERENCES `staff` (`staff_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wellness_programs
-- ----------------------------
INSERT INTO `wellness_programs` VALUES (1, 'Yoga and Meditation Sessions - Sem 1', '2023-09-04', '2023-11-30', 'Weekly sessions for stress relief.', 8);
INSERT INTO `wellness_programs` VALUES (2, 'Healthy Eating Workshop', '2024-02-15', '2024-02-15', 'Workshop by nutritionist on healthy diet plans.', 20);

-- ----------------------------
-- Table structure for workload_thresholds
-- ----------------------------
DROP TABLE IF EXISTS `workload_thresholds`;
CREATE TABLE `workload_thresholds`  (
  `threshold_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NULL DEFAULT NULL,
  `max_teaching_hours` decimal(5, 2) NULL DEFAULT NULL,
  `max_research_hours` decimal(5, 2) NULL DEFAULT NULL,
  `max_admin_hours` decimal(5, 2) NULL DEFAULT NULL,
  `academic_year` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`threshold_id`) USING BTREE,
  INDEX `fk_workload_dept`(`department_id`) USING BTREE,
  CONSTRAINT `fk_workload_dept` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of workload_thresholds
-- ----------------------------
INSERT INTO `workload_thresholds` VALUES (1, 1, 14.00, 8.00, 4.00, 2024);
INSERT INTO `workload_thresholds` VALUES (2, 7, 12.00, 6.00, 6.00, 2024);

-- ----------------------------
-- Table structure for workshop_registrations
-- ----------------------------
DROP TABLE IF EXISTS `workshop_registrations`;
CREATE TABLE `workshop_registrations`  (
  `registration_id` int(11) NOT NULL AUTO_INCREMENT,
  `workshop_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `registration_date` date NULL DEFAULT NULL,
  `attendance_status` enum('Registered','Attended','Absent') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`registration_id`) USING BTREE,
  INDEX `fk_wsreg_ws`(`workshop_id`) USING BTREE,
  INDEX `fk_wsreg_student`(`student_id`) USING BTREE,
  CONSTRAINT `fk_wsreg_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_wsreg_ws` FOREIGN KEY (`workshop_id`) REFERENCES `skill_workshops` (`workshop_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of workshop_registrations
-- ----------------------------
INSERT INTO `workshop_registrations` VALUES (1, 1, 11005, '2024-07-20', 'Registered');
INSERT INTO `workshop_registrations` VALUES (2, 1, 11012, '2024-07-21', 'Registered');
INSERT INTO `workshop_registrations` VALUES (3, 2, 11001, '2024-08-15', 'Registered');

SET FOREIGN_KEY_CHECKS = 1;
