-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2023 at 02:01 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ageis_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `ageis_app_appliedjobs`
--

CREATE TABLE `ageis_app_appliedjobs` (
  `id` bigint(20) NOT NULL,
  `applied_date` date NOT NULL,
  `applied_job_id` bigint(20) NOT NULL,
  `applied_user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ageis_app_appliedjobs`
--

INSERT INTO `ageis_app_appliedjobs` (`id`, `applied_date`, `applied_job_id`, `applied_user_id`) VALUES
(1, '2023-12-03', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ageis_app_clients`
--

CREATE TABLE `ageis_app_clients` (
  `id` bigint(20) NOT NULL,
  `company_logo` varchar(100) DEFAULT NULL,
  `company_name` varchar(50) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `added_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ageis_app_clients`
--

INSERT INTO `ageis_app_clients` (`id`, `company_logo`, `company_name`, `address`, `added_by_id`) VALUES
(3, 'Logos/1639735252350_1ffFZ4L.jpg', 'A2Z ALPHABET SOLUTIONZ', 'KUMARAPURAM, TRIVANDRUM', 2),
(4, 'Logos/geonyms_logo.png', 'TECHVERSANT', 'TECHNOPARK , TRIVANDRUM', 2),
(6, 'Logos/maintenance.png', '4 LABS', 'TECHNPOARK PHASE3\r\nTRIVANDRUM', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ageis_app_country`
--

CREATE TABLE `ageis_app_country` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ageis_app_country`
--

INSERT INTO `ageis_app_country` (`id`, `name`) VALUES
(1, 'Afghanistan'),
(2, 'India'),
(3, 'Albania'),
(4, 'Algeria'),
(5, 'Andorra'),
(6, 'Angola'),
(7, 'Antigua and Barbuda'),
(8, 'Argentina');

-- --------------------------------------------------------

--
-- Table structure for table `ageis_app_district`
--

CREATE TABLE `ageis_app_district` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ageis_app_district`
--

INSERT INTO `ageis_app_district` (`id`, `name`, `state_id`) VALUES
(1, 'Trivandrum', 1),
(2, 'Kollam', 1),
(3, 'Alappuzha', 1),
(4, 'Chennai', 2),
(5, 'Kanyakumari', 2),
(6, 'Ernakulam', 1),
(8, 'Anakapalli', 3);

-- --------------------------------------------------------

--
-- Table structure for table `ageis_app_extendedusermodel`
--

CREATE TABLE `ageis_app_extendedusermodel` (
  `id` bigint(20) NOT NULL,
  `cv` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ageis_app_extendedusermodel`
--

INSERT INTO `ageis_app_extendedusermodel` (`id`, `cv`, `user_id`, `phone`) VALUES
(2, 'CV/Page.pdf', 4, '8075994020'),
(4, 'CV/Page_3UeJkqP.pdf', 6, '4571524010');

-- --------------------------------------------------------

--
-- Table structure for table `ageis_app_jobcategories`
--

CREATE TABLE `ageis_app_jobcategories` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ageis_app_jobcategories`
--

INSERT INTO `ageis_app_jobcategories` (`id`, `name`) VALUES
(2, 'Human resources adviser'),
(4, 'Administrator'),
(5, 'Business development manager'),
(6, 'Civil service administrative o'),
(7, 'Compliance officer'),
(8, 'Health and safety adviser'),
(9, 'Civil service administrative o'),
(10, 'Developer');

-- --------------------------------------------------------

--
-- Table structure for table `ageis_app_jobs`
--

CREATE TABLE `ageis_app_jobs` (
  `id` bigint(20) NOT NULL,
  `job_post_date` date NOT NULL,
  `job_title` varchar(50) NOT NULL,
  `company_logo` varchar(100) NOT NULL,
  `company_email` varchar(254) NOT NULL,
  `end_date` date NOT NULL,
  `job_des` longtext NOT NULL,
  `skills` varchar(100) NOT NULL,
  `experience` int(11) NOT NULL,
  `salary` varchar(25) NOT NULL,
  `languages` varchar(100) NOT NULL,
  `website_link` varchar(200) NOT NULL,
  `company_name_id` bigint(20) NOT NULL,
  `country_id` bigint(20) NOT NULL,
  `district_id` bigint(20) NOT NULL,
  `job_category_id` bigint(20) NOT NULL,
  `job_type_id` bigint(20) NOT NULL,
  `state_id` bigint(20) NOT NULL,
  `added_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ageis_app_jobs`
--

INSERT INTO `ageis_app_jobs` (`id`, `job_post_date`, `job_title`, `company_logo`, `company_email`, `end_date`, `job_des`, `skills`, `experience`, `salary`, `languages`, `website_link`, `company_name_id`, `country_id`, `district_id`, `job_category_id`, `job_type_id`, `state_id`, `added_by_id`) VALUES
(2, '2023-12-01', 'test2', 'companylogo/1615019875261.jpg', 'test@gmail.com', '2023-12-01', 'jhdgfjhdszhbvf', 'testhgh', 5, '500', 'ghgjg', 'https://www.youtube.com/watch?v=niH01K8fFYQ', 3, 2, 1, 5, 1, 1, 2),
(3, '2023-12-02', 'Software Developer', 'companylogo/1.png', 'techversant@gmail.com', '2023-12-31', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,but also the leap into essentially unchanged.\r\n\r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.', 'PYTHON, DJANGO,HTML,CSS,BOOTSTRAP,MYSQL', 1, '50000', 'English,Hindi,Malayalam,Tamil', 'https://a2zserver.in/ageisrecruitment.online/job-details.html', 4, 2, 1, 10, 2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ageis_app_jobtype`
--

CREATE TABLE `ageis_app_jobtype` (
  `id` bigint(20) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ageis_app_jobtype`
--

INSERT INTO `ageis_app_jobtype` (`id`, `name`) VALUES
(1, 'Freelances'),
(2, 'Onsite'),
(3, 'Remote');

-- --------------------------------------------------------

--
-- Table structure for table `ageis_app_state`
--

CREATE TABLE `ageis_app_state` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `country_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ageis_app_state`
--

INSERT INTO `ageis_app_state` (`id`, `name`, `country_id`) VALUES
(1, 'Kerala', 2),
(2, 'Tamilnadu', 2),
(3, 'Andra', 2),
(6, 'Badakhshan', 1),
(7, 'Badghis', 1),
(8, 'kerala', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ageis_app_testimonials`
--

CREATE TABLE `ageis_app_testimonials` (
  `id` bigint(20) NOT NULL,
  `customer_name` varchar(25) DEFAULT NULL,
  `customer_img` varchar(100) DEFAULT NULL,
  `reviews` longtext DEFAULT NULL,
  `added_by_id` int(11) DEFAULT NULL,
  `company_name_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ageis_app_testimonials`
--

INSERT INTO `ageis_app_testimonials` (`id`, `customer_name`, `customer_img`, `reviews`, `added_by_id`, `company_name_id`) VALUES
(1, 'Ehas Ahammed', 'customerimg/17013377495805278147398350830436.jpg', 'Nice work place', 2, 3),
(4, 'Amal', 'customerimg/detected2022-06-08_111107.723865.jpg', 'Nice', 2, 4),
(7, 'midhun', 'customerimg/SOP_Mammootty2016_edSBBpw.jpg', 'Good', 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add extended user model', 7, 'add_extendedusermodel'),
(26, 'Can change extended user model', 7, 'change_extendedusermodel'),
(27, 'Can delete extended user model', 7, 'delete_extendedusermodel'),
(28, 'Can view extended user model', 7, 'view_extendedusermodel'),
(29, 'Can add clients', 8, 'add_clients'),
(30, 'Can change clients', 8, 'change_clients'),
(31, 'Can delete clients', 8, 'delete_clients'),
(32, 'Can view clients', 8, 'view_clients'),
(33, 'Can add testimonials', 9, 'add_testimonials'),
(34, 'Can change testimonials', 9, 'change_testimonials'),
(35, 'Can delete testimonials', 9, 'delete_testimonials'),
(36, 'Can view testimonials', 9, 'view_testimonials'),
(37, 'Can add job categories', 10, 'add_jobcategories'),
(38, 'Can change job categories', 10, 'change_jobcategories'),
(39, 'Can delete job categories', 10, 'delete_jobcategories'),
(40, 'Can view job categories', 10, 'view_jobcategories'),
(41, 'Can add country', 11, 'add_country'),
(42, 'Can change country', 11, 'change_country'),
(43, 'Can delete country', 11, 'delete_country'),
(44, 'Can view country', 11, 'view_country'),
(45, 'Can add state', 12, 'add_state'),
(46, 'Can change state', 12, 'change_state'),
(47, 'Can delete state', 12, 'delete_state'),
(48, 'Can view state', 12, 'view_state'),
(49, 'Can add district', 13, 'add_district'),
(50, 'Can change district', 13, 'change_district'),
(51, 'Can delete district', 13, 'delete_district'),
(52, 'Can view district', 13, 'view_district'),
(53, 'Can add job type', 14, 'add_jobtype'),
(54, 'Can change job type', 14, 'change_jobtype'),
(55, 'Can delete job type', 14, 'delete_jobtype'),
(56, 'Can view job type', 14, 'view_jobtype'),
(57, 'Can add jobs', 15, 'add_jobs'),
(58, 'Can change jobs', 15, 'change_jobs'),
(59, 'Can delete jobs', 15, 'delete_jobs'),
(60, 'Can view jobs', 15, 'view_jobs'),
(61, 'Can add applied jobs', 16, 'add_appliedjobs'),
(62, 'Can change applied jobs', 16, 'change_appliedjobs'),
(63, 'Can delete applied jobs', 16, 'delete_appliedjobs'),
(64, 'Can view applied jobs', 16, 'view_appliedjobs');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(2, 'pbkdf2_sha256$260000$NbIfG4PmCpJ6fALAfkgbFB$BOTXfmyz866ko4JRTlbpYkOMMrRJ6Ba8blhIX73tK6k=', '2023-12-03 10:45:18.827109', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2023-11-28 06:51:29.974183'),
(4, 'pbkdf2_sha256$260000$JNDv8lBdwudAUQV1OnR83O$yGBOji4WaYpW97Z/Jywk1nGPmdKOAL9JdHh22oesUZ4=', '2023-12-03 10:44:17.666183', 0, 'ehas1990', 'Ehas', 'Ahammed', 'ehas@gmail.com', 0, 1, '2023-12-03 05:53:36.904036'),
(6, 'pbkdf2_sha256$260000$QIBbwRgcKpsI1vWrH382ai$pFYycys826zz/Jzcdgx6HiXPqqcIoph0xfEYqbH716c=', NULL, 0, 'suraj123', 'Suraj', 'sc', 'suraj@gmail.com', 0, 1, '2023-12-03 07:08:13.126128');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(2, '2023-11-29 05:46:58.600649', '1', 'A2Z ALPHABET SOLUTIONZ', 3, '', 8, 2),
(3, '2023-11-29 06:04:40.092619', '2', 'A2Z ALPHABET SOLUTIONZ', 3, '', 8, 2),
(4, '2023-11-29 06:04:50.443682', '3', 'A2Z ALPHABET SOLUTIONZ', 2, '[{\"changed\": {\"fields\": [\"Company logo\"]}}]', 8, 2),
(5, '2023-11-29 13:02:16.105653', '1', 'A2Z ALPHABET SOLUTIONZ', 2, '[{\"changed\": {\"fields\": [\"Customer img\"]}}]', 9, 2),
(6, '2023-11-30 12:42:06.731480', '1', 'Afghanistan', 1, '[{\"added\": {}}]', 11, 2),
(7, '2023-11-30 12:42:26.286031', '2', 'India', 1, '[{\"added\": {}}]', 11, 2),
(8, '2023-11-30 12:42:56.857012', '3', 'Albania', 1, '[{\"added\": {}}]', 11, 2),
(9, '2023-11-30 12:43:13.359922', '4', 'Algeria', 1, '[{\"added\": {}}]', 11, 2),
(10, '2023-11-30 12:43:29.489730', '5', 'Andorra', 1, '[{\"added\": {}}]', 11, 2),
(11, '2023-11-30 12:43:46.077229', '6', 'Angola', 1, '[{\"added\": {}}]', 11, 2),
(12, '2023-11-30 12:44:00.304384', '7', 'Antigua and Barbuda', 1, '[{\"added\": {}}]', 11, 2),
(13, '2023-11-30 12:44:17.275798', '8', 'Argentina', 1, '[{\"added\": {}}]', 11, 2),
(14, '2023-11-30 12:52:49.533850', '1', 'Kasargod', 1, '[{\"added\": {}}]', 12, 2),
(15, '2023-11-30 12:52:50.800980', '1', 'Kasargod', 2, '[]', 12, 2),
(16, '2023-11-30 12:52:59.945943', '2', 'Kannur', 1, '[{\"added\": {}}]', 12, 2),
(17, '2023-11-30 12:53:06.924073', '3', 'Vayanadu', 1, '[{\"added\": {}}]', 12, 2),
(18, '2023-11-30 12:53:17.650124', '4', 'Trivandrum', 1, '[{\"added\": {}}]', 12, 2),
(19, '2023-11-30 12:53:28.769135', '5', 'Alappuzha', 1, '[{\"added\": {}}]', 12, 2),
(20, '2023-11-30 12:53:59.531977', '1', 'Kerala', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 12, 2),
(21, '2023-11-30 12:54:11.898201', '2', 'Tamilnadu', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 12, 2),
(22, '2023-11-30 12:54:18.828019', '3', 'Andra', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 12, 2),
(23, '2023-11-30 12:54:24.090204', '5', 'Alappuzha', 3, '', 12, 2),
(24, '2023-11-30 12:54:24.092215', '4', 'Trivandrum', 3, '', 12, 2),
(25, '2023-11-30 12:54:49.455517', '1', 'Trivandrum', 1, '[{\"added\": {}}]', 13, 2),
(26, '2023-11-30 12:54:57.656946', '2', 'Kollam', 1, '[{\"added\": {}}]', 13, 2),
(27, '2023-11-30 12:55:07.815758', '3', 'Alappuzha', 1, '[{\"added\": {}}]', 13, 2),
(28, '2023-11-30 12:55:23.337597', '4', 'Chennai', 1, '[{\"added\": {}}]', 13, 2),
(29, '2023-11-30 12:56:08.409512', '5', 'Kanyakumari', 1, '[{\"added\": {}}]', 13, 2),
(30, '2023-11-30 12:57:19.800591', '6', 'Badakhshan', 1, '[{\"added\": {}}]', 12, 2),
(31, '2023-11-30 12:57:31.209310', '7', 'Badghis', 1, '[{\"added\": {}}]', 12, 2),
(32, '2023-11-30 12:59:55.985223', '1', 'Freelance', 1, '[{\"added\": {}}]', 14, 2),
(33, '2023-11-30 13:00:02.974072', '2', 'Onsite', 1, '[{\"added\": {}}]', 14, 2),
(34, '2023-11-30 13:00:09.063028', '3', 'Remote', 1, '[{\"added\": {}}]', 14, 2),
(35, '2023-12-02 04:33:43.006414', '6', 'Badakhshan', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 12, 2),
(36, '2023-12-03 05:52:50.050156', '3', 'ehas1990', 3, '', 4, 2),
(37, '2023-12-03 06:02:28.146989', '5', 'ehas1990g', 3, '', 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(16, 'ageis_app', 'appliedjobs'),
(8, 'ageis_app', 'clients'),
(11, 'ageis_app', 'country'),
(13, 'ageis_app', 'district'),
(7, 'ageis_app', 'extendedusermodel'),
(10, 'ageis_app', 'jobcategories'),
(15, 'ageis_app', 'jobs'),
(14, 'ageis_app', 'jobtype'),
(12, 'ageis_app', 'state'),
(9, 'ageis_app', 'testimonials'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-11-28 05:41:52.657353'),
(2, 'auth', '0001_initial', '2023-11-28 05:41:53.355079'),
(3, 'admin', '0001_initial', '2023-11-28 05:41:53.533084'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-11-28 05:41:53.545580'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-11-28 05:41:53.560594'),
(6, 'ageis_app', '0001_initial', '2023-11-28 05:41:53.600074'),
(7, 'ageis_app', '0002_extendedusermodel_user', '2023-11-28 05:41:53.742575'),
(8, 'ageis_app', '0003_clients', '2023-11-28 05:41:53.778075'),
(9, 'ageis_app', '0004_auto_20231116_1217', '2023-11-28 05:41:53.806578'),
(10, 'contenttypes', '0002_remove_content_type_name', '2023-11-28 05:41:53.893577'),
(11, 'auth', '0002_alter_permission_name_max_length', '2023-11-28 05:41:53.964575'),
(12, 'auth', '0003_alter_user_email_max_length', '2023-11-28 05:41:53.997575'),
(13, 'auth', '0004_alter_user_username_opts', '2023-11-28 05:41:54.010577'),
(14, 'auth', '0005_alter_user_last_login_null', '2023-11-28 05:41:54.077077'),
(15, 'auth', '0006_require_contenttypes_0002', '2023-11-28 05:41:54.081582'),
(16, 'auth', '0007_alter_validators_add_error_messages', '2023-11-28 05:41:54.093576'),
(17, 'auth', '0008_alter_user_username_max_length', '2023-11-28 05:41:54.126582'),
(18, 'auth', '0009_alter_user_last_name_max_length', '2023-11-28 05:41:54.162074'),
(19, 'auth', '0010_alter_group_name_max_length', '2023-11-28 05:41:54.194076'),
(20, 'auth', '0011_update_proxy_permissions', '2023-11-28 05:41:54.203074'),
(21, 'auth', '0012_alter_user_first_name_max_length', '2023-11-28 05:41:54.234575'),
(22, 'sessions', '0001_initial', '2023-11-28 05:41:54.294575'),
(23, 'ageis_app', '0005_clients_added_by', '2023-11-29 05:40:05.072685'),
(24, 'ageis_app', '0006_alter_clients_added_by', '2023-11-29 05:45:59.165326'),
(25, 'ageis_app', '0007_testimonials', '2023-11-29 12:17:25.630677'),
(26, 'ageis_app', '0008_jobcategories', '2023-11-30 07:24:16.545381'),
(27, 'ageis_app', '0009_country', '2023-11-30 11:07:23.048717'),
(28, 'ageis_app', '0010_state', '2023-11-30 11:08:08.912167'),
(29, 'ageis_app', '0011_district', '2023-11-30 11:09:01.098137'),
(30, 'ageis_app', '0012_jobtype', '2023-11-30 11:27:51.041072'),
(31, 'ageis_app', '0013_jobs', '2023-11-30 11:36:35.551683'),
(32, 'ageis_app', '0014_jobs_added_by', '2023-11-30 11:51:19.565271'),
(33, 'ageis_app', '0015_appliedjobs', '2023-12-03 10:09:54.887972');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0b9g0pd5i9xmnj8sza0zw34kj8e5zajs', '.eJxVjDsOwjAQBe_iGlmxnVgOJT1niN56F2wgjpRPFXF3sJQm7cy8t6ttkblgFHVV4DEXdVEDtjUNVQyZ_9yeGSG-pVTBL5TnpONU1jmTrok-7KLvE8vndrSng4Ql1TXEILJhashTB9gozneGQc4LWdO6PlAnLpi2f5Dl0BL5JjQG5C169f0Bmhs-8g:1r8de1:gx2Nqu4U5YgRSuCNeZkYAAsXCNF9umo-m7TxiMU9_Po', '2023-12-14 09:47:41.362831'),
('0ngkjyjbzpm42lxkomoopv6sagcvhdc4', '.eJxVjDsOwjAQBe_iGlmxnVgOJT1niN56F2wgjpRPFXF3sJQm7cy8t6ttkblgFHVV4DEXdVEDtjUNVQyZ_9yeGSG-pVTBL5TnpONU1jmTrok-7KLvE8vndrSng4Ql1TXEILJhashTB9gozneGQc4LWdO6PlAnLpi2f5Dl0BL5JjQG5C169f0Bmhs-8g:1r8cbK:z8QVGrQK6RHftZoEllMoGNX-1MQ4c1PDg0YNUOjUi94', '2023-12-14 08:40:50.816389'),
('0pjyhhri4grd5ha1sf2cjox3a6xoexke', '.eJxVjEEOgyAQRe_CuiEyoGiX3XsGMsxAta2QiK6a3r2SuHH73vv_K_YS1oRLEHeBvMxJ3ITDfZtcFW7mg8OVeaR3SFXwC9MzS8ppW2cvayJPW-SYOXweZ3s5mLBMxzrqvu8QDPZW-86CahXqwQRrWxOABmLyg1GKGozI0VuK4GOHDLqlBkD8_lsaPn4:1r9KOA:5WxqbfOkcjcIIP_Dr8o6BPi8pouzXnb5yRdj_kFHyxU', '2023-12-16 07:26:10.276178'),
('26oncuumzy1oylqo6lho0dm4u9rrnvck', '.eJxVjEEOgyAQRe_CujEyoGhXjUnPQYZhUFJBU-uq6d0rSbtw-_57_y32jZ8ZE4urQJ9ivo0J41zRksRFWNxfky2Kjf4w4Mwc0oNzGXDkuFlc14pLbudljPm_V_fChp98ephwm448qK5rETR2RrnWgGwkql6zMY1moJ48uV5LSTUG9MEZCuBCix5UQzWA-HwBkvhCzw:1r8zSP:KJeFgkNZTAI9G_Ll3hHtopJMUEFnWYAXA790wWo1FF0', '2023-12-15 09:05:09.015089'),
('7ibe9dnote5mkc5zwcg6tjkqkji4csrk', '.eJxVjMsOwiAQRf-FtSFleLt07zeQYQCpGkhKuzL-uzbpQrf3nHNfLOC21rCNvIQ5sTMDdvrdItIjtx2kO7Zb59TbusyR7wo_6ODXnvLzcrh_BxVH_dZFOmcQFDoro7EgtEDpVbZWqwzkKVH0SgiasGAq0VKBWAwmkJomAPb-ANkkOCc:1r8zVi:UIRacFZNMJKlItuU88z4Yl21sXJPtkezMgDwSygarkc', '2023-12-15 09:08:34.174414'),
('8p9vswi9sqpwhehdorbcfm325xp64b0m', '.eJxVjjsOwyAQRO9CHSGzYINTpvcZrGUXgpMYJH-qKHePkVwk7byZp3mLEfctjfsalnFicRUgLr-ZR3qGXAE_MN-LpJK3ZfKyVuRJVzkUDq_b2f0TJFzTsY7auQ7BoLPadxZUq1D3JljbmgDUE5PvjVLUYESO3lIEHztk0C01UF9VXcY5HDbkecri8wVBAj5-:1r9gW6:IYFiRJv1JcATowniL4jnH2wU6w7B5pqs1Cc8xqTpDIw', '2023-12-17 07:03:50.550335'),
('anh9rpp31w6sok3v0p7j1ztsmdpdqz1s', '.eJxVzDkOwyAQBdC7UEcIGwxMyvQ5gzUDQ-wsIHmpotw9ILlI2r-8txhx36ZxX3kZ5yjOwojTb0YYHpxbEe-Yb0WGkrdlJtkm8mhXeS2Rn5dj-wdMuE7tDdawTckNCIb6CM6qoDlyCtT5aHvvwehEGihBx04H5UgP6Ch58H6oaOMyvrhqXNUOQInPFx99Pvs:1r9gUp:LfdzK4SgGQXICFmS9nntn2dacuhzGQfosx2Bf5BBJmQ', '2023-12-17 07:02:31.878043'),
('brlcqc62nr3ruhcfpmiquwt8x0v14pi1', '.eJxVjMsKwjAUBf8layl5k7gU_I5wbnJtgrUWY1fiv2tBQbczZ85DJKz3mtbOt9SK2Astdr-MkM88bwIjt56wLANf0KY0Xcc2f_1w3NjhM_57qOj1nRewQi6qkCRPDtCZjXeqgIxn0sqaGMixCcrGE-kSLJGXQSqQ14ji-QJxxTk1:1r8K4s:V9cWuiYDt5Fv_EIOQz-hi-gik3t11b68ZdKnNvVhbVU', '2023-12-13 12:54:06.889882'),
('bxdaya296q6zgu7vemuigr4f5rtzggvk', '.eJxVjEEOgyAQRe_CujEyoGhXjUnPQYZhUFJBU-uq6d0rSbtw-_57_y32jZ8ZE4urQJ9ivo0J41zRksRFWNxfky2Kjf4w4Mwc0oNzGXDkuFlc14pLbudljPm_V_fChp98ephwm448qK5rETR2RrnWgGwkql6zMY1moJ48uV5LSTUG9MEZCuBCix5UQzWA-HwBkvhCzw:1r90fK:mqGlqWzQa9sMVkU_2Q8JbsrfWyN4OxtO0y2Cq5phWBs', '2023-12-15 10:22:34.921758'),
('clx5xex2c83u21ratqo1n6ngihzhdgfv', '.eJxVjEEOgyAQRe_CujEyoGhXjUnPQYZhUFJBU-uq6d0rSbtw-_57_y32jZ8ZE4urQJ9ivo0J41zRksRFWNxfky2Kjf4w4Mwc0oNzGXDkuFlc14pLbudljPm_V_fChp98ephwm448qK5rETR2RrnWgGwkql6zMY1moJ48uV5LSTUG9MEZCuBCix5UQzWA-HwBkvhCzw:1r90aD:mj1TTTspGF1LcYxvPsPQCxDRlnrgB7juEOcAkqGgNoQ', '2023-12-15 10:17:17.764295'),
('ctmt0qnh7nknf4zg0yw7odtahi91qov8', '.eJxVjjsOwyAQRO9CHSGzYINTpvcZrGUXgpMYJH-qKHePkVwk7byZp3mLEfctjfsalnFicRUgLr-ZR3qGXAE_MN-LpJK3ZfKyVuRJVzkUDq_b2f0TJFzTsY7auQ7BoLPadxZUq1D3JljbmgDUE5PvjVLUYESO3lIEHztk0C01UF9VXcY5HDbkecri8wVBAj5-:1r9gUK:flGYaKc_elNWz6iLHvm74tUIc-BEeKQA9HD5IaIcdVE', '2023-12-17 07:02:00.917307'),
('cvypbo8h4yml9gdq4mgdk4kbzqcb1zvh', '.eJxVjMsOwiAQRf-FtSFleLt07zeQYQCpGkhKuzL-uzbpQrf3nHNfLOC21rCNvIQ5sTMDdvrdItIjtx2kO7Zb59TbusyR7wo_6ODXnvLzcrh_BxVH_dZFOmcQFDoro7EgtEDpVbZWqwzkKVH0SgiasGAq0VKBWAwmkJomAPb-ANkkOCc:1r9Ohm:NahZ_RdRf77Hbyi_B6IxK3s4GrOIOhIxxBBTTFpbIoY', '2023-12-16 12:02:42.032930'),
('ieuydiq5s3be7rnv7fg1id6dc5xttaal', '.eJxVjMsOwiAQRf-FtSFleLt07zeQYQCpGkhKuzL-uzbpQrf3nHNfLOC21rCNvIQ5sTMDdvrdItIjtx2kO7Zb59TbusyR7wo_6ODXnvLzcrh_BxVH_dZFOmcQFDoro7EgtEDpVbZWqwzkKVH0SgiasGAq0VKBWAwmkJomAPb-ANkkOCc:1r9fYO:Ik8XWlwNv08x61q1QXUZDF0A1Kv6kJ8f65_jwgJ8rWg', '2023-12-17 06:02:08.193654'),
('k98771h7mc394xhlmdvan8y0gfovdo7i', '.eJxVjDsOwjAQBe_iGlmxnVgOJT1niN56F2wgjpRPFXF3sJQm7cy8t6ttkblgFHVV4DEXdVEDtjUNVQyZ_9yeGSG-pVTBL5TnpONU1jmTrok-7KLvE8vndrSng4Ql1TXEILJhashTB9gozneGQc4LWdO6PlAnLpi2f5Dl0BL5JjQG5C169f0Bmhs-8g:1r8dz0:haOZ-cThFhFhzJdgYp3BUuxbjxQvfiY2urNU5fvt_z0', '2023-12-14 10:09:22.394142'),
('lr5x3wbcgeimxtpgea8ijgrjcqac6veu', '.eJxVjDsOwjAQBe_iGlmxnVgOJT1niN56F2wgjpRPFXF3sJQm7cy8t6ttkblgFHVV4DEXdVEDtjUNVQyZ_9yeGSG-pVTBL5TnpONU1jmTrok-7KLvE8vndrSng4Ql1TXEILJhashTB9gozneGQc4LWdO6PlAnLpi2f5Dl0BL5JjQG5C169f0Bmhs-8g:1r8gPJ:0zB70oz4G0u5_pxgptXB6HOGpT1U25A-5Vdj88ohvTU', '2023-12-14 12:44:41.422114'),
('miy4a95cyrpwo3eqd2hh4wmncucpt5ij', '.eJxVzDkOwyAQBdC7UEcIGwxMyvQ5gzUDQ-wsIHmpotw9ILlI2r-8txhx36ZxX3kZ5yjOwojTb0YYHpxbEe-Yb0WGkrdlJtkm8mhXeS2Rn5dj-wdMuE7tDdawTckNCIb6CM6qoDlyCtT5aHvvwehEGihBx04H5UgP6Ch58H6oaOMyvrhqXNUOQInPFx99Pvs:1r9j5T:lLDwnTKN4z9KvX2S7ZhZuIiecx-V1fnkQwVsASx3DxI', '2023-12-17 09:48:31.615125'),
('mot7w8jgq3495ql7ptdqlugbli1vv0s8', '.eJxVjjsOwyAQRO9CHSGzYINTpvcZrGUXgpMYJH-qKHePkVwk7byZp3mLEfctjfsalnFicRUgLr-ZR3qGXAE_MN-LpJK3ZfKyVuRJVzkUDq_b2f0TJFzTsY7auQ7BoLPadxZUq1D3JljbmgDUE5PvjVLUYESO3lIEHztk0C01UF9VXcY5HDbkecri8wVBAj5-:1r9jyR:rSAE93RLkrsVRP4OxS30xjBUeouQI1ZQpqtHEHVnoL8', '2023-12-17 10:45:19.383749'),
('n6rrfnp5sgv54ccmsoxoouuc8505lio5', '.eJxVjEEOgyAQRe_CuiEyoGiX3XsGMsxAta2QiK6a3r2SuHH73vv_K_YS1oRLEHeBvMxJ3ITDfZtcFW7mg8OVeaR3SFXwC9MzS8ppW2cvayJPW-SYOXweZ3s5mLBMxzrqvu8QDPZW-86CahXqwQRrWxOABmLyg1GKGozI0VuK4GOHDLqlBkD8_lsaPn4:1r90jY:i3U9lMzbELBAeffFoVoEMuV_gepSaJbXrUOa0kdLhbg', '2023-12-15 10:26:56.523989'),
('qtjbwli3jlao3wa1ippjolzirgmq9352', '.eJxVjEsOAiEQBe_C2hD-AZfuPQPpplsZNZAMMyvj3Q3JLHT7quq9RYZ9q3kfvOaFxFkYcfrdEMqT2wT0gHbvsvS2rQvKqciDDnntxK_L4f4dVBh11sAaCmlChQE9gClsg9cEaAOj0c6miJ5t1C7d0FB0iEFFpQGDgSQ-Xxg0OJs:1r7rwf:1gz64TXjBLRfXn5dBwptvrKuz451-FVxDglDh7TRh-4', '2023-12-12 06:51:45.718939'),
('tugvw189vxln2basfphv08is3ybilsh6', '.eJxVjMsOgjAUBf-la0Pog6a4MiZ-R3Nue4VGWojIyvjv0kQXbOfMnLfYVn4WZBZngZhTuQwZaWrCnMVJeGyv0VfFp7gb6sgI4cGlDhg4rR7L0nDN_TQPqfz35lbZ9ScfHkas455HsESIMlJLljpABda2kxGkLZOSRveOOtZOmv5OKjpDZFvXSpBV6MXnC9H5Q0M:1r8aIh:YutTiDxw8liTC6s--pDJvo_5dh0bN6L4cGAW6BX1-58', '2023-12-14 06:13:27.861098'),
('uyhht563rvgz3c1ctsa3o59lm59pmzkg', '.eJxVjEEOgyAQRe_CuiEyoGiX3XsGMsxAta2QiK6a3r2SuHH73vv_K_YS1oRLEHeBvMxJ3ITDfZtcFW7mg8OVeaR3SFXwC9MzS8ppW2cvayJPW-SYOXweZ3s5mLBMxzrqvu8QDPZW-86CahXqwQRrWxOABmLyg1GKGozI0VuK4GOHDLqlBkD8_lsaPn4:1r9HM0:Jn4P0Kj0GBMZ0bd_qTfW8c3SMJWxXMKi7_8AFL5Uwi0', '2023-12-16 04:11:44.621676'),
('vumyal1nr8zmomoxeoguck8l1beswlda', '.eJxVjEEOgyAQRe_CujEyoGhXjUnPQYZhUFJBU-uq6d0rSbtw-_57_y32jZ8ZE4urQJ9ivo0J41zRksRFWNxfky2Kjf4w4Mwc0oNzGXDkuFlc14pLbudljPm_V_fChp98ephwm448qK5rETR2RrnWgGwkql6zMY1moJ48uV5LSTUG9MEZCuBCix5UQzWA-HwBkvhCzw:1r91Gb:b95FmIkermRd9kt-bRGGw5Udr8KIeyQL6b5_fbYUgu0', '2023-12-15 11:01:05.203380'),
('wfq4tq9x4nu40pd7zt86upshz1orwq1t', '.eJxVjEEOgyAQRe_CujEyoGhXjUnPQYZhUFJBU-uq6d0rSbtw-_57_y32jZ8ZE4urQJ9ivo0J41zRksRFWNxfky2Kjf4w4Mwc0oNzGXDkuFlc14pLbudljPm_V_fChp98ephwm448qK5rETR2RrnWgGwkql6zMY1moJ48uV5LSTUG9MEZCuBCix5UQzWA-HwBkvhCzw:1r9026:lmiubzKy-cOVgdy8U_RKJsCsigcOALK0OcwAvzzhuic', '2023-12-15 09:42:02.385851'),
('yzyumtoquaq0kkfl08fhu241xoax0t0f', '.eJxVjEEOgyAQRe_CujEyoGhXjUnPQYZhUFJBU-uq6d0rSbtw-_57_y32jZ8ZE4urQJ9ivo0J41zRksRFWNxfky2Kjf4w4Mwc0oNzGXDkuFlc14pLbudljPm_V_fChp98ephwm448qK5rETR2RrnWgGwkql6zMY1moJ48uV5LSTUG9MEZCuBCix5UQzWA-HwBkvhCzw:1r91Fw:Vv3sxgWGwH1goH9qCwskSIfzybGY1A7rmxJhRz9AfEk', '2023-12-15 11:00:24.919231'),
('ztonnjfuk81884qvwg47xm7wkxoqafjh', '.eJxVjMsKwjAUBf8layl5k7gU_I5wbnJtgrUWY1fiv2tBQbczZ85DJKz3mtbOt9SK2Astdr-MkM88bwIjt56wLANf0KY0Xcc2f_1w3NjhM_57qOj1nRewQi6qkCRPDtCZjXeqgIxn0sqaGMixCcrGE-kSLJGXQSqQ14ji-QJxxTk1:1r7utZ:Pt8oESWEjwJGG_eWWNQPPXlzL0o3FOpjvnZt3BM7cwU', '2023-12-12 10:00:45.409489');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ageis_app_appliedjobs`
--
ALTER TABLE `ageis_app_appliedjobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ageis_app_appliedjob_applied_job_id_75b332fa_fk_ageis_app` (`applied_job_id`),
  ADD KEY `ageis_app_appliedjob_applied_user_id_6f93ca4a_fk_ageis_app` (`applied_user_id`);

--
-- Indexes for table `ageis_app_clients`
--
ALTER TABLE `ageis_app_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ageis_app_clients_added_by_id_7e0c6880_fk_auth_user_id` (`added_by_id`);

--
-- Indexes for table `ageis_app_country`
--
ALTER TABLE `ageis_app_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ageis_app_district`
--
ALTER TABLE `ageis_app_district`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ageis_app_district_state_id_7f625924_fk_ageis_app_state_id` (`state_id`);

--
-- Indexes for table `ageis_app_extendedusermodel`
--
ALTER TABLE `ageis_app_extendedusermodel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ageis_app_extendedusermodel_user_id_2afe96db_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `ageis_app_jobcategories`
--
ALTER TABLE `ageis_app_jobcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ageis_app_jobs`
--
ALTER TABLE `ageis_app_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ageis_app_jobs_company_name_id_e14b6c3f_fk_ageis_app_clients_id` (`company_name_id`),
  ADD KEY `ageis_app_jobs_country_id_79540048_fk_ageis_app_country_id` (`country_id`),
  ADD KEY `ageis_app_jobs_district_id_a60e96f2_fk_ageis_app_district_id` (`district_id`),
  ADD KEY `ageis_app_jobs_job_category_id_bee60e06_fk_ageis_app` (`job_category_id`),
  ADD KEY `ageis_app_jobs_job_type_id_134cb28c_fk_ageis_app_jobtype_id` (`job_type_id`),
  ADD KEY `ageis_app_jobs_state_id_3224230c_fk_ageis_app_state_id` (`state_id`),
  ADD KEY `ageis_app_jobs_added_by_id_338b65f8_fk_auth_user_id` (`added_by_id`);

--
-- Indexes for table `ageis_app_jobtype`
--
ALTER TABLE `ageis_app_jobtype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ageis_app_state`
--
ALTER TABLE `ageis_app_state`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ageis_app_state_country_id_76221b4e_fk_ageis_app_country_id` (`country_id`);

--
-- Indexes for table `ageis_app_testimonials`
--
ALTER TABLE `ageis_app_testimonials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ageis_app_testimonials_added_by_id_e9b37086_fk_auth_user_id` (`added_by_id`),
  ADD KEY `ageis_app_testimonia_company_name_id_d4c45708_fk_ageis_app` (`company_name_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ageis_app_appliedjobs`
--
ALTER TABLE `ageis_app_appliedjobs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ageis_app_clients`
--
ALTER TABLE `ageis_app_clients`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ageis_app_country`
--
ALTER TABLE `ageis_app_country`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ageis_app_district`
--
ALTER TABLE `ageis_app_district`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ageis_app_extendedusermodel`
--
ALTER TABLE `ageis_app_extendedusermodel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ageis_app_jobcategories`
--
ALTER TABLE `ageis_app_jobcategories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ageis_app_jobs`
--
ALTER TABLE `ageis_app_jobs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ageis_app_jobtype`
--
ALTER TABLE `ageis_app_jobtype`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ageis_app_state`
--
ALTER TABLE `ageis_app_state`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ageis_app_testimonials`
--
ALTER TABLE `ageis_app_testimonials`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ageis_app_appliedjobs`
--
ALTER TABLE `ageis_app_appliedjobs`
  ADD CONSTRAINT `ageis_app_appliedjob_applied_job_id_75b332fa_fk_ageis_app` FOREIGN KEY (`applied_job_id`) REFERENCES `ageis_app_jobs` (`id`),
  ADD CONSTRAINT `ageis_app_appliedjob_applied_user_id_6f93ca4a_fk_ageis_app` FOREIGN KEY (`applied_user_id`) REFERENCES `ageis_app_extendedusermodel` (`id`);

--
-- Constraints for table `ageis_app_clients`
--
ALTER TABLE `ageis_app_clients`
  ADD CONSTRAINT `ageis_app_clients_added_by_id_7e0c6880_fk_auth_user_id` FOREIGN KEY (`added_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `ageis_app_district`
--
ALTER TABLE `ageis_app_district`
  ADD CONSTRAINT `ageis_app_district_state_id_7f625924_fk_ageis_app_state_id` FOREIGN KEY (`state_id`) REFERENCES `ageis_app_state` (`id`);

--
-- Constraints for table `ageis_app_extendedusermodel`
--
ALTER TABLE `ageis_app_extendedusermodel`
  ADD CONSTRAINT `ageis_app_extendedusermodel_user_id_2afe96db_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `ageis_app_jobs`
--
ALTER TABLE `ageis_app_jobs`
  ADD CONSTRAINT `ageis_app_jobs_added_by_id_338b65f8_fk_auth_user_id` FOREIGN KEY (`added_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `ageis_app_jobs_company_name_id_e14b6c3f_fk_ageis_app_clients_id` FOREIGN KEY (`company_name_id`) REFERENCES `ageis_app_clients` (`id`),
  ADD CONSTRAINT `ageis_app_jobs_country_id_79540048_fk_ageis_app_country_id` FOREIGN KEY (`country_id`) REFERENCES `ageis_app_country` (`id`),
  ADD CONSTRAINT `ageis_app_jobs_district_id_a60e96f2_fk_ageis_app_district_id` FOREIGN KEY (`district_id`) REFERENCES `ageis_app_district` (`id`),
  ADD CONSTRAINT `ageis_app_jobs_job_category_id_bee60e06_fk_ageis_app` FOREIGN KEY (`job_category_id`) REFERENCES `ageis_app_jobcategories` (`id`),
  ADD CONSTRAINT `ageis_app_jobs_job_type_id_134cb28c_fk_ageis_app_jobtype_id` FOREIGN KEY (`job_type_id`) REFERENCES `ageis_app_jobtype` (`id`),
  ADD CONSTRAINT `ageis_app_jobs_state_id_3224230c_fk_ageis_app_state_id` FOREIGN KEY (`state_id`) REFERENCES `ageis_app_state` (`id`);

--
-- Constraints for table `ageis_app_state`
--
ALTER TABLE `ageis_app_state`
  ADD CONSTRAINT `ageis_app_state_country_id_76221b4e_fk_ageis_app_country_id` FOREIGN KEY (`country_id`) REFERENCES `ageis_app_country` (`id`);

--
-- Constraints for table `ageis_app_testimonials`
--
ALTER TABLE `ageis_app_testimonials`
  ADD CONSTRAINT `ageis_app_testimonia_company_name_id_d4c45708_fk_ageis_app` FOREIGN KEY (`company_name_id`) REFERENCES `ageis_app_clients` (`id`),
  ADD CONSTRAINT `ageis_app_testimonials_added_by_id_e9b37086_fk_auth_user_id` FOREIGN KEY (`added_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
