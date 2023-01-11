-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 11 jan. 2023 à 09:36
-- Version du serveur : 10.4.25-MariaDB
-- Version de PHP : 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cnps_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `accounts_account`
--

CREATE TABLE `accounts_account` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superadmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `accounts_account`
--

INSERT INTO `accounts_account` (`id`, `password`, `first_name`, `last_name`, `username`, `email`, `phone_number`, `date_joined`, `last_login`, `is_admin`, `is_staff`, `is_active`, `is_superadmin`) VALUES
(1, 'pbkdf2_sha256$390000$2XYXmDfsU8mpB2Ww1qaLt1$6183pke3mPttEo+mlpDAhfDDEtTCRWSOoCv9mghCBMk=', 'Abdelaziz', 'Mahamat', 'abdelaziz', 'azizmahamat@yahoo.fr', '', '2023-01-05 12:49:15.683955', '2023-01-11 08:30:04.348999', 1, 1, 1, 1),
(2, 'pbkdf2_sha256$390000$0dH7iNS8Tvtgut7sIgsocd$JSEJELI6ex8elUx5AmR87gNpPQtzwwKj5tvp5Lh7Avo=', 'Gestionnaire', 'Gestionnaire', 'gestionnaire', 'gestionaire@cnps.com', '99999999', '2023-01-05 13:16:34.685254', '2023-01-11 08:30:48.444707', 0, 0, 1, 0),
(3, 'pbkdf2_sha256$390000$KD29Hk4fhRZMCGnHi4BqGT$5/6n18sl9uHozFa8FwP2b0k17GMRMfuwxY+qhfzWouk=', 'Financier', 'Financier', 'financier@cnps.com', 'financier@cnps.com', '99999999', '2023-01-06 08:17:41.516826', '2023-01-11 08:11:47.669609', 0, 1, 1, 0),
(4, 'pbkdf2_sha256$390000$PpXT30HF2dKLvXhIvBTUz5$1z66HDaAsSvcZiNQbTr+Vc5UmkRBbh7lv+iPgkp2flQ=', 'Directeur', 'Directeur', 'directeur@cnps.com', 'directeur@cnps.com', '99999999', '2023-01-06 08:19:49.982750', '2023-01-11 08:17:11.217118', 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `auth_permission`
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
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add account', 6, 'add_account'),
(22, 'Can change account', 6, 'change_account'),
(23, 'Can delete account', 6, 'delete_account'),
(24, 'Can view account', 6, 'view_account'),
(25, 'Can add requisition', 7, 'add_requisition'),
(26, 'Can change requisition', 7, 'change_requisition'),
(27, 'Can delete requisition', 7, 'delete_requisition'),
(28, 'Can view requisition', 7, 'view_requisition'),
(29, 'Can add compte', 8, 'add_compte'),
(30, 'Can change compte', 8, 'change_compte'),
(31, 'Can delete compte', 8, 'delete_compte'),
(32, 'Can view compte', 8, 'view_compte'),
(33, 'Can add ligne', 9, 'add_ligne'),
(34, 'Can change ligne', 9, 'change_ligne'),
(35, 'Can delete ligne', 9, 'delete_ligne'),
(36, 'Can view ligne', 9, 'view_ligne');

-- --------------------------------------------------------

--
-- Structure de la table `budget_compte`
--

CREATE TABLE `budget_compte` (
  `id` bigint(20) NOT NULL,
  `code` int(11) NOT NULL,
  `label` varchar(100) NOT NULL,
  `year` int(11) NOT NULL,
  `module` int(11) NOT NULL,
  `prevision` decimal(14,2) NOT NULL,
  `executed` decimal(14,2) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `budget_compte`
--

INSERT INTO `budget_compte` (`id`, `code`, `label`, `year`, `module`, `prevision`, `executed`, `created_at`, `updated_at`) VALUES
(1, 610, 'Matiéres et Four. Consommées', 2023, 7, '420500000.00', '610000.00', '2023-01-05', '2023-01-11 08:01:12.207959'),
(2, 620, 'Transports Consommés', 2023, 7, '47246700.00', '0.00', '2023-01-05', '2023-01-05 12:56:13.095802'),
(3, 630, 'Autres services consommés', 2023, 7, '1126500000.00', '0.00', '2023-01-05', '2023-01-05 13:49:31.412518'),
(4, 640, 'Charges et pertes diverses', 2023, 7, '216000000.00', '0.00', '2023-01-05', '2023-01-05 12:57:41.544254'),
(5, 650, 'Frais du personnel', 2023, 7, '1126155012.00', '0.00', '2023-01-05', '2023-01-05 12:58:34.391733'),
(6, 660, 'Impots et taxes', 2023, 7, '319593988.00', '0.00', '2023-01-05', '2023-01-05 12:59:29.088663'),
(7, 670, 'Charges financières', 2023, 7, '35500000.00', '0.00', '2023-01-05', '2023-01-05 13:00:02.098453'),
(8, 680, 'Charges exceptionnelles', 2023, 7, '40000000.00', '0.00', '2023-01-05', '2023-01-05 13:00:56.678288'),
(9, 560, 'Charges techniques', 2023, 3, '195000000.00', '0.00', '2023-01-06', '2023-01-06 07:57:53.786386'),
(10, 561, 'Matières et fournitures consommées', 2023, 3, '73478000.00', '0.00', '2023-01-06', '2023-01-06 07:58:34.793068'),
(11, 562, 'Transports Consommés', 2023, 3, '5000000.00', '0.00', '2023-01-06', '2023-01-06 07:59:08.231999'),
(12, 1, 'PFM', 2023, 5, '1535000000.00', '54000.00', '2023-01-06', '2023-01-11 08:35:45.483948'),
(13, 2, 'ATMP', 2023, 5, '4800000000.00', '0.00', '2023-01-06', '2023-01-06 11:00:23.024387'),
(14, 3, 'PVID', 2023, 5, '10200000000.00', '0.00', '2023-01-06', '2023-01-06 11:00:37.128465');

-- --------------------------------------------------------

--
-- Structure de la table `budget_ligne`
--

CREATE TABLE `budget_ligne` (
  `id` bigint(20) NOT NULL,
  `code` int(11) NOT NULL,
  `label` varchar(100) NOT NULL,
  `prevision` decimal(14,2) NOT NULL,
  `executed` decimal(14,2) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `compte_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `budget_ligne`
--

INSERT INTO `budget_ligne` (`id`, `code`, `label`, `prevision`, `executed`, `created_at`, `updated_at`, `compte_id`) VALUES
(1, 610214, 'Alimentations et Boissons', '25000000.00', '0.00', '2023-01-05', '2023-01-05 13:02:16.968088', 1),
(2, 610022, 'Papiers et outils de bureau', '1500000.00', '0.00', '2023-01-05', '2023-01-05 13:03:41.007110', 1),
(3, 610222, 'Produits d\'entretien', '25000000.00', '60000.00', '2023-01-05', '2023-01-10 11:22:32.251969', 1),
(4, 610224, 'Fourniture de Magasin', '2000000.00', '0.00', '2023-01-05', '2023-01-05 13:05:48.328910', 1),
(5, 610220, 'Fourniture de Bureau', '40000000.00', '0.00', '2023-01-05', '2023-01-05 13:06:31.292061', 1),
(6, 610221, 'Imprimés', '45000000.00', '400000.00', '2023-01-05', '2023-01-10 11:19:27.766497', 1),
(7, 610227, 'Consommables Informatiques', '75000000.00', '0.00', '2023-01-05', '2023-01-05 13:07:38.461818', 1),
(8, 610228, 'Consommables Photos', '500000.00', '0.00', '2023-01-05', '2023-01-05 13:08:27.940125', 1),
(9, 610211, 'Electricité', '45000000.00', '0.00', '2023-01-05', '2023-01-05 13:09:18.882552', 1),
(10, 610212, 'Gaz', '4000000.00', '150000.00', '2023-01-05', '2023-01-11 08:01:12.207959', 1),
(11, 610213, 'Carburants et Lubrifiants', '100000000.00', '0.00', '2023-01-05', '2023-01-05 13:11:00.379389', 1),
(12, 610217, 'Eau', '2500000.00', '0.00', '2023-01-05', '2023-01-05 13:11:45.444665', 1),
(13, 610251, 'Linges, vêtements de travail', '15000000.00', '0.00', '2023-01-05', '2023-01-05 13:12:43.724257', 1),
(14, 610281, 'Fournitures pour véhicules', '15000000.00', '0.00', '2023-01-05', '2023-01-05 13:13:30.465592', 1),
(15, 610231, 'Fourniture d\'entretiens et petit equipement', '15000000.00', '0.00', '2023-01-05', '2023-01-05 13:14:38.625372', 1),
(16, 610881, 'Four. pour la securité des locaux', '10000000.00', '0.00', '2023-01-05', '2023-01-05 13:15:26.874831', 1),
(17, 62011, 'Frais de voy. et dép du Perl', '18246700.00', '0.00', '2023-01-05', '2023-01-05 13:21:16.191799', 2),
(18, 620121, 'Frais de voy. et dép des admin.', '4500000.00', '0.00', '2023-01-05', '2023-01-05 13:22:01.311684', 2),
(19, 620131, 'Frais de voy. et dép d\'autres pers.', '20000000.00', '0.00', '2023-01-05', '2023-01-05 13:22:41.486491', 2),
(20, 620510, 'Trans. des biens et Four.', '4500000.00', '0.00', '2023-01-05', '2023-01-05 13:23:22.343740', 2),
(21, 630011, 'Récéptions', '52000000.00', '0.00', '2023-01-05', '2023-01-05 13:24:00.216382', 3),
(22, 630021, 'Indemnités de Missions du Personnel', '40000000.00', '0.00', '2023-01-05', '2023-01-05 13:24:39.727104', 3),
(23, 630022, 'Indem. de Miss. des Admin.', '5000000.00', '0.00', '2023-01-05', '2023-01-05 13:25:13.527326', 3),
(24, 630028, 'Indem. de Miss. d\'Autres Pers.', '10000000.00', '0.00', '2023-01-05', '2023-01-05 13:25:46.471027', 3),
(25, 630211, 'Entre. et rép des mat. de bureau', '3000000.00', '0.00', '2023-01-05', '2023-01-05 13:26:31.510782', 3),
(26, 630381, 'Maintenance informatique', '35000000.00', '0.00', '2023-01-05', '2023-01-05 13:27:18.671298', 3),
(27, 630231, 'Loyers et char. Locat. des mat.', '300000.00', '0.00', '2023-01-05', '2023-01-05 13:27:53.111477', 3),
(28, 630311, 'Entr.et Répa. des imm.', '150000000.00', '0.00', '2023-01-05', '2023-01-05 13:28:26.655146', 3),
(29, 630321, 'Entr.et Répa. De mat.et mob.', '4500000.00', '0.00', '2023-01-05', '2023-01-05 13:29:07.423629', 3),
(30, 630322, 'Entr. Et rep. De mat. Infor.', '1500000.00', '0.00', '2023-01-05', '2023-01-05 13:29:42.096225', 3),
(31, 630323, 'Entr. et rep. De mat. trpt.', '25000000.00', '0.00', '2023-01-05', '2023-01-05 13:30:23.071824', 3),
(32, 630325, 'Entretien et Réparation du Mat Technique', '15000000.00', '0.00', '2023-01-05', '2023-01-05 13:31:04.055831', 3),
(33, 630326, 'Entretien et Rép du Mat et Mob d\'Habitation', '500000.00', '0.00', '2023-01-05', '2023-01-05 13:31:44.126856', 3),
(34, 630315, 'Entre. et rép des logts', '500000.00', '0.00', '2023-01-05', '2023-01-05 13:32:37.391593', 3),
(35, 630382, 'Entretien et Réparation des Installations', '15000000.00', '0.00', '2023-01-05', '2023-01-05 13:34:30.465945', 3),
(36, 630441, 'Honoraires', '145000000.00', '0.00', '2023-01-05', '2023-01-05 13:34:59.944638', 3),
(37, 630445, 'Frais d\'actes et de contentieux', '1500000.00', '0.00', '2023-01-05', '2023-01-05 13:35:39.206922', 3),
(38, 630511, 'Annonces et insertions Publicitaires', '30000000.00', '0.00', '2023-01-05', '2023-01-05 13:36:55.815715', 3),
(39, 630521, 'Foires et Expositions', '3000000.00', '0.00', '2023-01-05', '2023-01-05 13:37:25.822828', 3),
(40, 630531, 'Journaux, catalog et autres documentations', '5000000.00', '0.00', '2023-01-05', '2023-01-05 13:38:01.536000', 3),
(41, 630541, 'Publications', '25000000.00', '0.00', '2023-01-05', '2023-01-05 13:38:38.036030', 3),
(42, 630421, 'Remu.  persl prêté à l\'ordre.', '2500000.00', '0.00', '2023-01-05', '2023-01-05 13:39:18.375443', 3),
(43, 630571, 'Pourboires et dons courants', '2000000.00', '0.00', '2023-01-05', '2023-01-05 13:39:51.497420', 3),
(44, 630611, 'Affranchissements', '1500000.00', '0.00', '2023-01-05', '2023-01-05 13:40:29.215522', 3),
(45, 630621, 'Frais de Mandatement', '500000.00', '0.00', '2023-01-05', '2023-01-05 13:41:01.444953', 3),
(46, 630532, 'Téléphone, Télégramme, Télex, Fax', '9000000.00', '0.00', '2023-01-05', '2023-01-05 13:41:51.614574', 3),
(47, 630661, 'Redevances pour boite postale', '200000.00', '0.00', '2023-01-05', '2023-01-05 13:42:28.007706', 3),
(48, 630671, 'Lignes spécialisées informatiques', '135000000.00', '0.00', '2023-01-05', '2023-01-05 13:43:12.007827', 3),
(49, 630784, 'Frais et Commissions Bancaires', '5500000.00', '0.00', '2023-01-05', '2023-01-05 13:44:01.487891', 3),
(50, 630384, 'Cotisations, Participations', '150000000.00', '0.00', '2023-01-05', '2023-01-05 13:44:57.991432', 3),
(51, 630812, 'Frais de Congrès, Colloques, Conférences', '100000000.00', '0.00', '2023-01-05', '2023-01-05 13:45:28.639633', 3),
(52, 630823, 'Autres services rendus par les tiers', '95000000.00', '0.00', '2023-01-05', '2023-01-05 13:46:06.463525', 3),
(53, 630831, 'Etudes et Recherches', '55000000.00', '0.00', '2023-01-05', '2023-01-05 13:46:35.480515', 3),
(54, 630841, 'Frais de Recrutement du Personnel', '3500000.00', '0.00', '2023-01-05', '2023-01-05 13:47:15.455689', 3),
(55, 630861, 'Formation du Personnel( sur place)', '20000000.00', '0.00', '2023-01-05', '2023-01-05 13:47:51.423853', 3),
(56, 640110, 'Primes d\'Assurances Incendie', '85000000.00', '0.00', '2023-01-05', '2023-01-05 13:51:40.360683', 4),
(57, 640121, 'Primes d\'Assurances Vol', '5000000.00', '0.00', '2023-01-05', '2023-01-05 13:52:21.542940', 4),
(58, 640181, 'Primes d\'Assurances dégats des eaux', '3000000.00', '0.00', '2023-01-05', '2023-01-05 13:52:58.528182', 4),
(59, 640410, 'Primes d\'Assurances bris de glaces', '1000000.00', '0.00', '2023-01-05', '2023-01-05 13:53:35.640807', 4),
(60, 640131, 'Primes d\'Assurances Matériel de Transport', '8500000.00', '0.00', '2023-01-05', '2023-01-05 13:54:08.727622', 4),
(61, 640161, 'Primes d\'Assurances Responsabilité Civile', '3500000.00', '0.00', '2023-01-05', '2023-01-05 13:54:41.047694', 4),
(62, 640211, 'Jetons de Présence', '35000000.00', '0.00', '2023-01-05', '2023-01-05 13:55:08.838933', 4),
(63, 640212, 'Frais de participation au Conseil', '10000000.00', '0.00', '2023-01-05', '2023-01-05 13:55:37.294358', 4),
(64, 640218, 'Autres commissions', '65000000.00', '0.00', '2023-01-05', '2023-01-05 13:56:10.207516', 4),
(65, 651101, 'Salaires de Base', '3083268611.00', '0.00', '2023-01-06', '2023-01-06 07:41:04.621222', 5),
(66, 651102, 'Salaires de Base (Agents à recruter)', '55257847.00', '0.00', '2023-01-06', '2023-01-06 07:42:16.985426', 5),
(67, 650111, 'Heures supplémentaires', '28600000.00', '0.00', '2023-01-06', '2023-01-06 07:43:16.341501', 5),
(68, 650112, 'Primes d\'ancienneté', '183643895.00', '0.00', '2023-01-06', '2023-01-06 07:44:00.444353', 5),
(69, 650113, 'primes d\'assiduité', '42240000.00', '0.00', '2023-01-06', '2023-01-06 07:44:58.310964', 5),
(70, 650116, 'Primes de contact pub', '880000.00', '0.00', '2023-01-06', '2023-01-06 07:45:35.179692', 5),
(71, 651151, 'Prime de controle et de recouvrement', '100000000.00', '0.00', '2023-01-06', '2023-01-06 07:46:24.684162', 5),
(72, 650117, 'Gratification', '146611185.00', '0.00', '2023-01-06', '2023-01-06 07:47:36.048986', 5),
(73, 16011, 'Allocations prénatales', '9000000000.00', '54000.00', '2023-01-06', '2023-01-11 08:35:45.483948', 12),
(74, 16012, 'Allocations de maternité', '10000000.00', '0.00', '2023-01-06', '2023-01-06 11:04:00.694522', 12),
(75, 160130, 'Allocations familliales', '625000000.00', '0.00', '2023-01-06', '2023-01-06 11:04:58.527630', 12);

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-01-05 12:54:25.996060', '1', 'Matiéres et Four. Consommées', 1, '[{\"added\": {}}]', 8, 1),
(2, '2023-01-05 12:56:13.095802', '2', 'Transports Consommés', 1, '[{\"added\": {}}]', 8, 1),
(3, '2023-01-05 12:57:01.442655', '3', 'Autres services consommés', 1, '[{\"added\": {}}]', 8, 1),
(4, '2023-01-05 12:57:41.544254', '4', 'Charges et pertes diverses', 1, '[{\"added\": {}}]', 8, 1),
(5, '2023-01-05 12:58:34.391733', '5', 'Frais du personnel', 1, '[{\"added\": {}}]', 8, 1),
(6, '2023-01-05 12:59:29.088663', '6', 'Impots et taxes', 1, '[{\"added\": {}}]', 8, 1),
(7, '2023-01-05 13:00:02.098453', '7', 'Charges financières', 1, '[{\"added\": {}}]', 8, 1),
(8, '2023-01-05 13:00:56.693935', '8', 'Charges exceptionnelles', 1, '[{\"added\": {}}]', 8, 1),
(9, '2023-01-05 13:02:16.968088', '1', 'Alimentations et Boissons', 1, '[{\"added\": {}}]', 9, 1),
(10, '2023-01-05 13:03:41.007110', '2', 'Papiers et outils de bureau', 1, '[{\"added\": {}}]', 9, 1),
(11, '2023-01-05 13:04:28.745382', '3', 'Produits d\'entretien', 1, '[{\"added\": {}}]', 9, 1),
(12, '2023-01-05 13:05:48.328910', '4', 'Fourniture de Magasin', 1, '[{\"added\": {}}]', 9, 1),
(13, '2023-01-05 13:06:31.292061', '5', 'Fourniture de Bureau', 1, '[{\"added\": {}}]', 9, 1),
(14, '2023-01-05 13:07:07.222407', '6', 'Imprimés', 1, '[{\"added\": {}}]', 9, 1),
(15, '2023-01-05 13:07:38.461818', '7', 'Consommables Informatiques', 1, '[{\"added\": {}}]', 9, 1),
(16, '2023-01-05 13:08:27.940125', '8', 'Consommables Photos', 1, '[{\"added\": {}}]', 9, 1),
(17, '2023-01-05 13:09:18.882552', '9', 'Electricité', 1, '[{\"added\": {}}]', 9, 1),
(18, '2023-01-05 13:09:54.619978', '10', 'Gaz', 1, '[{\"added\": {}}]', 9, 1),
(19, '2023-01-05 13:11:00.379389', '11', 'Carburants et Lubrifiants', 1, '[{\"added\": {}}]', 9, 1),
(20, '2023-01-05 13:11:45.444665', '12', 'Eau', 1, '[{\"added\": {}}]', 9, 1),
(21, '2023-01-05 13:12:43.724257', '13', 'Linges, vêtements de travail', 1, '[{\"added\": {}}]', 9, 1),
(22, '2023-01-05 13:13:30.465592', '14', 'Fournitures pour véhicules', 1, '[{\"added\": {}}]', 9, 1),
(23, '2023-01-05 13:14:38.625372', '15', 'Fourniture d\'entretiens et petit equipement', 1, '[{\"added\": {}}]', 9, 1),
(24, '2023-01-05 13:15:26.890453', '16', 'Four. pour la securité des locaux', 1, '[{\"added\": {}}]', 9, 1),
(25, '2023-01-05 13:16:34.687250', '2', '', 1, '[{\"added\": {}}]', 6, 1),
(26, '2023-01-05 13:17:18.335617', '2', 'gestionaire@cnps.com', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email\", \"Phone number\", \"Is active\"]}}]', 6, 1),
(27, '2023-01-05 13:21:16.191799', '17', 'Frais de voy. et dép du Perl', 1, '[{\"added\": {}}]', 9, 1),
(28, '2023-01-05 13:22:01.311684', '18', 'Frais de voy. et dép des admin.', 1, '[{\"added\": {}}]', 9, 1),
(29, '2023-01-05 13:22:41.487640', '19', 'Frais de voy. et dép d\'autres pers.', 1, '[{\"added\": {}}]', 9, 1),
(30, '2023-01-05 13:23:22.343740', '20', 'Trans. des biens et Four.', 1, '[{\"added\": {}}]', 9, 1),
(31, '2023-01-05 13:24:00.216382', '21', 'Récéptions', 1, '[{\"added\": {}}]', 9, 1),
(32, '2023-01-05 13:24:39.727104', '22', 'Indemnités de Missions du Personnel', 1, '[{\"added\": {}}]', 9, 1),
(33, '2023-01-05 13:25:13.527326', '23', 'Indem. de Miss. des Admin.', 1, '[{\"added\": {}}]', 9, 1),
(34, '2023-01-05 13:25:46.471027', '24', 'Indem. de Miss. d\'Autres Pers.', 1, '[{\"added\": {}}]', 9, 1),
(35, '2023-01-05 13:26:31.510782', '25', 'Entre. et rép des mat. de bureau', 1, '[{\"added\": {}}]', 9, 1),
(36, '2023-01-05 13:27:18.671298', '26', 'Maintenance informatique', 1, '[{\"added\": {}}]', 9, 1),
(37, '2023-01-05 13:27:53.111477', '27', 'Loyers et char. Locat. des mat.', 1, '[{\"added\": {}}]', 9, 1),
(38, '2023-01-05 13:28:26.670768', '28', 'Entr.et Répa. des imm.', 1, '[{\"added\": {}}]', 9, 1),
(39, '2023-01-05 13:29:07.423629', '29', 'Entr.et Répa. De mat.et mob.', 1, '[{\"added\": {}}]', 9, 1),
(40, '2023-01-05 13:29:42.096225', '30', 'Entr. Et rep. De mat. Infor.', 1, '[{\"added\": {}}]', 9, 1),
(41, '2023-01-05 13:30:23.071824', '31', 'Entr. et rep. De mat. trpt.', 1, '[{\"added\": {}}]', 9, 1),
(42, '2023-01-05 13:31:04.055831', '32', 'Entretien et Réparation du Mat Technique', 1, '[{\"added\": {}}]', 9, 1),
(43, '2023-01-05 13:31:44.126856', '33', 'Entretien et Rép du Mat et Mob d\'Habitation', 1, '[{\"added\": {}}]', 9, 1),
(44, '2023-01-05 13:32:37.391593', '34', 'Entre. et rép des logts', 1, '[{\"added\": {}}]', 9, 1),
(45, '2023-01-05 13:34:30.465945', '35', 'Entretien et Réparation des Installations', 1, '[{\"added\": {}}]', 9, 1),
(46, '2023-01-05 13:34:59.944638', '36', 'Honoraires', 1, '[{\"added\": {}}]', 9, 1),
(47, '2023-01-05 13:35:39.206922', '37', 'Frais d\'actes et de contentieux', 1, '[{\"added\": {}}]', 9, 1),
(48, '2023-01-05 13:36:55.815715', '38', 'Annonces et insertions Publicitaires', 1, '[{\"added\": {}}]', 9, 1),
(49, '2023-01-05 13:37:25.822828', '39', 'Foires et Expositions', 1, '[{\"added\": {}}]', 9, 1),
(50, '2023-01-05 13:38:01.536000', '40', 'Journaux, catalog et autres documentations', 1, '[{\"added\": {}}]', 9, 1),
(51, '2023-01-05 13:38:38.037138', '41', 'Publications', 1, '[{\"added\": {}}]', 9, 1),
(52, '2023-01-05 13:39:18.391066', '42', 'Remu.  persl prêté à l\'ordre.', 1, '[{\"added\": {}}]', 9, 1),
(53, '2023-01-05 13:39:51.637944', '43', 'Pourboires et dons courants', 1, '[{\"added\": {}}]', 9, 1),
(54, '2023-01-05 13:40:29.637422', '44', 'Affranchissements', 1, '[{\"added\": {}}]', 9, 1),
(55, '2023-01-05 13:41:01.476885', '45', 'Frais de Mandatement', 1, '[{\"added\": {}}]', 9, 1),
(56, '2023-01-05 13:41:51.819274', '46', 'Téléphone, Télégramme, Télex, Fax', 1, '[{\"added\": {}}]', 9, 1),
(57, '2023-01-05 13:42:28.117707', '47', 'Redevances pour boite postale', 1, '[{\"added\": {}}]', 9, 1),
(58, '2023-01-05 13:43:12.023448', '48', 'Lignes spécialisées informatiques', 1, '[{\"added\": {}}]', 9, 1),
(59, '2023-01-05 13:44:01.834735', '49', 'Frais et Commissions Bancaires', 1, '[{\"added\": {}}]', 9, 1),
(60, '2023-01-05 13:44:57.991432', '50', 'Cotisations, Participations', 1, '[{\"added\": {}}]', 9, 1),
(61, '2023-01-05 13:45:28.853716', '51', 'Frais de Congrès, Colloques, Conférences', 1, '[{\"added\": {}}]', 9, 1),
(62, '2023-01-05 13:46:06.873469', '52', 'Autres services rendus par les tiers', 1, '[{\"added\": {}}]', 9, 1),
(63, '2023-01-05 13:46:35.595967', '53', 'Etudes et Recherches', 1, '[{\"added\": {}}]', 9, 1),
(64, '2023-01-05 13:47:15.555596', '54', 'Frais de Recrutement du Personnel', 1, '[{\"added\": {}}]', 9, 1),
(65, '2023-01-05 13:47:51.530838', '55', 'Formation du Personnel( sur place)', 1, '[{\"added\": {}}]', 9, 1),
(66, '2023-01-05 13:48:59.807667', '3', 'Autres services consommés', 2, '[{\"changed\": {\"fields\": [\"Prevision\"]}}]', 8, 1),
(67, '2023-01-05 13:49:31.414940', '3', 'Autres services consommés', 2, '[{\"changed\": {\"fields\": [\"Prevision\"]}}]', 8, 1),
(68, '2023-01-05 13:51:40.360683', '56', 'Primes d\'Assurances Incendie', 1, '[{\"added\": {}}]', 9, 1),
(69, '2023-01-05 13:52:21.542940', '57', 'Primes d\'Assurances Vol', 1, '[{\"added\": {}}]', 9, 1),
(70, '2023-01-05 13:52:58.528182', '58', 'Primes d\'Assurances dégats des eaux', 1, '[{\"added\": {}}]', 9, 1),
(71, '2023-01-05 13:53:35.640807', '59', 'Primes d\'Assurances bris de glaces', 1, '[{\"added\": {}}]', 9, 1),
(72, '2023-01-05 13:54:08.727622', '60', 'Primes d\'Assurances Matériel de Transport', 1, '[{\"added\": {}}]', 9, 1),
(73, '2023-01-05 13:54:41.047694', '61', 'Primes d\'Assurances Responsabilité Civile', 1, '[{\"added\": {}}]', 9, 1),
(74, '2023-01-05 13:55:08.838933', '62', 'Jetons de Présence', 1, '[{\"added\": {}}]', 9, 1),
(75, '2023-01-05 13:55:37.295360', '63', 'Frais de participation au Conseil', 1, '[{\"added\": {}}]', 9, 1),
(76, '2023-01-05 13:56:10.207516', '64', 'Autres commissions', 1, '[{\"added\": {}}]', 9, 1),
(77, '2023-01-06 07:41:04.636841', '65', 'Salaires de Base', 1, '[{\"added\": {}}]', 9, 1),
(78, '2023-01-06 07:42:16.985426', '66', 'Salaires de Base (Agents à recruter)', 1, '[{\"added\": {}}]', 9, 1),
(79, '2023-01-06 07:43:16.341501', '67', 'Heures supplémentaires', 1, '[{\"added\": {}}]', 9, 1),
(80, '2023-01-06 07:44:00.444353', '68', 'Primes d\'ancienneté', 1, '[{\"added\": {}}]', 9, 1),
(81, '2023-01-06 07:44:58.310964', '69', 'primes d\'assiduité', 1, '[{\"added\": {}}]', 9, 1),
(82, '2023-01-06 07:45:35.179692', '70', 'Primes de contact pub', 1, '[{\"added\": {}}]', 9, 1),
(83, '2023-01-06 07:46:24.699783', '71', 'Prime de controle et de recouvrement', 1, '[{\"added\": {}}]', 9, 1),
(84, '2023-01-06 07:47:36.048986', '72', 'Gratification', 1, '[{\"added\": {}}]', 9, 1),
(85, '2023-01-06 07:57:53.786386', '9', 'Charges techniques', 1, '[{\"added\": {}}]', 8, 1),
(86, '2023-01-06 07:58:34.793068', '10', 'Matières et fournitures consommées', 1, '[{\"added\": {}}]', 8, 1),
(87, '2023-01-06 07:59:08.231999', '11', 'Transports Consommés', 1, '[{\"added\": {}}]', 8, 1),
(88, '2023-01-06 08:11:50.233465', '12', 'Prestations familliales', 1, '[{\"added\": {}}]', 8, 1),
(89, '2023-01-06 08:12:33.719280', '13', 'Accidents de travail et MP', 1, '[{\"added\": {}}]', 8, 1),
(90, '2023-01-06 08:13:30.347925', '14', 'Pensions V.I.D', 1, '[{\"added\": {}}]', 8, 1),
(91, '2023-01-06 08:14:19.695213', '15', 'Immeubles de Rapport', 1, '[{\"added\": {}}]', 8, 1),
(92, '2023-01-06 08:14:55.895663', '16', 'Placement financiers', 1, '[{\"added\": {}}]', 8, 1),
(93, '2023-01-06 08:17:41.516826', '3', '', 1, '[{\"added\": {}}]', 6, 1),
(94, '2023-01-06 08:18:19.785276', '3', 'financier@cnps.com', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email\", \"Phone number\", \"Is staff\", \"Is active\"]}}]', 6, 1),
(95, '2023-01-06 08:19:49.982750', '4', '', 1, '[{\"added\": {}}]', 6, 1),
(96, '2023-01-06 08:20:21.880791', '4', 'directeur@cnps.com', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email\", \"Phone number\", \"Is admin\", \"Is active\"]}}]', 6, 1),
(97, '2023-01-06 10:59:19.399011', '16', 'Placement financiers', 3, '', 8, 1),
(98, '2023-01-06 10:59:23.827899', '15', 'Immeubles de Rapport', 3, '', 8, 1),
(99, '2023-01-06 10:59:40.330058', '14', 'Pensions V.I.D', 2, '[{\"changed\": {\"fields\": [\"Code\"]}}]', 8, 1),
(100, '2023-01-06 11:00:23.024387', '13', 'ATMP', 2, '[{\"changed\": {\"fields\": [\"Code\", \"Label\"]}}]', 8, 1),
(101, '2023-01-06 11:00:37.144093', '14', 'PVID', 2, '[{\"changed\": {\"fields\": [\"Label\"]}}]', 8, 1),
(102, '2023-01-06 11:00:49.116878', '12', 'PFM', 2, '[{\"changed\": {\"fields\": [\"Code\", \"Label\"]}}]', 8, 1),
(103, '2023-01-06 11:02:42.996628', '73', 'Allocations prénatales', 1, '[{\"added\": {}}]', 9, 1),
(104, '2023-01-06 11:04:00.694522', '74', 'Allocations de maternité', 1, '[{\"added\": {}}]', 9, 1),
(105, '2023-01-06 11:04:58.534152', '75', 'Allocations familliales', 1, '[{\"added\": {}}]', 9, 1),
(106, '2023-01-06 11:09:25.837717', '12', 'PFM', 2, '[{\"changed\": {\"fields\": [\"Prevision\"]}}]', 8, 1);

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(6, 'accounts', 'account'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(8, 'budget', 'compte'),
(9, 'budget', 'ligne'),
(4, 'contenttypes', 'contenttype'),
(7, 'requisitions', 'requisition'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'accounts', '0001_initial', '2023-01-05 12:47:53.152748'),
(2, 'contenttypes', '0001_initial', '2023-01-05 12:47:53.198564'),
(3, 'admin', '0001_initial', '2023-01-05 12:47:53.300632'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-01-05 12:47:53.315181'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-01-05 12:47:53.324278'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-01-05 12:47:53.398153'),
(7, 'auth', '0001_initial', '2023-01-05 12:47:53.608566'),
(8, 'auth', '0002_alter_permission_name_max_length', '2023-01-05 12:47:53.647135'),
(9, 'auth', '0003_alter_user_email_max_length', '2023-01-05 12:47:53.657258'),
(10, 'auth', '0004_alter_user_username_opts', '2023-01-05 12:47:53.665237'),
(11, 'auth', '0005_alter_user_last_login_null', '2023-01-05 12:47:53.680198'),
(12, 'auth', '0006_require_contenttypes_0002', '2023-01-05 12:47:53.683189'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2023-01-05 12:47:53.693165'),
(14, 'auth', '0008_alter_user_username_max_length', '2023-01-05 12:47:53.701143'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2023-01-05 12:47:53.711115'),
(16, 'auth', '0010_alter_group_name_max_length', '2023-01-05 12:47:53.729416'),
(17, 'auth', '0011_update_proxy_permissions', '2023-01-05 12:47:53.741684'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2023-01-05 12:47:53.749664'),
(19, 'budget', '0001_initial', '2023-01-05 12:47:53.845253'),
(20, 'budget', '0002_alter_compte_module', '2023-01-05 12:47:53.852236'),
(21, 'budget', '0003_alter_compte_module', '2023-01-05 12:47:53.857724'),
(22, 'budget', '0004_alter_compte_module', '2023-01-05 12:47:53.908876'),
(23, 'requisitions', '0001_initial', '2023-01-05 12:47:53.986512'),
(24, 'sessions', '0001_initial', '2023-01-05 12:47:54.022800'),
(25, 'budget', '0005_alter_compte_executed_alter_compte_label_and_more', '2023-01-11 08:23:27.855464');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2z0m5sm1yad4052dnwj597hgklpjw7it', '.eJxVjMsOwiAUBf-FtSHQChdcuu83EO4DqZo2Ke3K-O_apAvdnpk5L5Xytta0NVnSyOqirDr9bpjpIdMO-J6n26xpntZlRL0r-qBNDzPL83q4fwc1t_qtM3jjooPAEqX3RAAuxC7AWUwhz9gVXwgFUQIYKZgh9syOTA_WB6veH-xxOFc:1pDiKU:6XHekC1BBnEJSctZYGYpmMD3i2kHradB2QYGIfaiYwc', '2023-01-20 08:43:58.253492'),
('8p87e8mks669vy7fso4oiwzbrcvsk33y', '.eJxVjMsOwiAUBf-FtSHQChdcuu83EO4DqZo2Ke3K-O_apAvdnpk5L5Xytta0NVnSyOqirDr9bpjpIdMO-J6n26xpntZlRL0r-qBNDzPL83q4fwc1t_qtM3jjooPAEqX3RAAuxC7AWUwhz9gVXwgFUQIYKZgh9syOTA_WB6veH-xxOFc:1pDkJ3:QRx7XsCgiU-8IJP4aYdHVJuLOHUZxLZghNT4OIdZT8U', '2023-01-20 10:50:37.522013'),
('drcheyy8czq1139qav5pj3x20dgf3mq1', '.eJxVjMsOwiAUBf-FtSHQChdcuu83EO4DqZo2Ke3K-O_apAvdnpk5L5Xytta0NVnSyOqirDr9bpjpIdMO-J6n26xpntZlRL0r-qBNDzPL83q4fwc1t_qtM3jjooPAEqX3RAAuxC7AWUwhz9gVXwgFUQIYKZgh9syOTA_WB6veH-xxOFc:1pDhwc:bGbHKoIC7DvGMI1tGnO_Jz-QK_MKMXZHBGg_0M1SarM', '2023-01-20 08:19:18.115503'),
('mx4l8efhchq0wpl588g62gc15uw7iaan', '.eJxVjEEOwiAQRe_C2pACnQ64dO8ZyAxDpWpoUtqV8e7apAvd_vfef6lI21ri1vISJ1FnZdXpd2NKj1x3IHeqt1mnua7LxHpX9EGbvs6Sn5fD_Tso1Mq39qPNBgwhW-dyYIDeDAG6ZDscHYpn45H6wEnQeTHeWoYBAQgcknHq_QHA4za2:1pF9eg:_FZlG_zvZJuapMlQcZppM3bUnC7I2DLhtpXXai656sg', '2023-01-24 08:06:46.423557'),
('seheftx3s44980buq2h58yrd2g7o7cs0', '.eJxVjMsOwiAUBf-FtSHQChdcuu83EO4DqZo2Ke3K-O_apAvdnpk5L5Xytta0NVnSyOqirDr9bpjpIdMO-J6n26xpntZlRL0r-qBNDzPL83q4fwc1t_qtM3jjooPAEqX3RAAuxC7AWUwhz9gVXwgFUQIYKZgh9syOTA_WB6veH-xxOFc:1pFBcy:MovyY1RISUm1qFEiSnRa7ot6OEfvVxW_fsDRzRLdTNw', '2023-01-24 10:13:08.797991'),
('v9lcu85dq18s1pd9n3c9628zepe4jjkh', '.eJxVjEEOwiAQRe_C2pACnQ64dO8ZyAxDpWpoUtqV8e7apAvd_vfef6lI21ri1vISJ1FnZdXpd2NKj1x3IHeqt1mnua7LxHpX9EGbvs6Sn5fD_Tso1Mq39qPNBgwhW-dyYIDeDAG6ZDscHYpn45H6wEnQeTHeWoYBAQgcknHq_QHA4za2:1pFWVU:ymTltb-qtW8O785yTZC1-vJIzx_jzrQfc48JlkNo1NY', '2023-01-25 08:30:48.444707'),
('xj52k5n6ya11eolbg5aad4b8fonnaamm', '.eJxVjMsOwiAUBf-FtSHQChdcuu83EO4DqZo2Ke3K-O_apAvdnpk5L5Xytta0NVnSyOqirDr9bpjpIdMO-J6n26xpntZlRL0r-qBNDzPL83q4fwc1t_qtM3jjooPAEqX3RAAuxC7AWUwhz9gVXwgFUQIYKZgh9syOTA_WB6veH-xxOFc:1pDiws:sP0PoWqbwq3Pbq3naugLdUDyXrVD1xICwAnJCjG_rpQ', '2023-01-20 09:23:38.048282');

-- --------------------------------------------------------

--
-- Structure de la table `requisitions_requisition`
--

CREATE TABLE `requisitions_requisition` (
  `id` bigint(20) NOT NULL,
  `eng_number` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `purchase_order` varchar(100) NOT NULL,
  `label` varchar(200) NOT NULL,
  `amount` int(11) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `anterior_engagement` decimal(14,2) NOT NULL,
  `total_engagement` decimal(14,2) NOT NULL,
  `total_expense` decimal(14,2) NOT NULL,
  `available_amount` decimal(14,2) NOT NULL,
  `open_credit` decimal(14,2) NOT NULL,
  `status` varchar(100) NOT NULL,
  `module` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `account_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `requisitions_requisition`
--

INSERT INTO `requisitions_requisition` (`id`, `eng_number`, `type`, `purchase_order`, `label`, `amount`, `supplier_name`, `anterior_engagement`, `total_engagement`, `total_expense`, `available_amount`, `open_credit`, `status`, `module`, `created_at`, `updated_at`, `account_id`) VALUES
(1, 1, 'Requisition', '0001/2023', 'Rame de papier', 250000, 'ABCD', '0.00', '250000.00', '250000.00', '44750000.00', '45000000.00', 'validated', '7', '2023-01-06 09:02:49.808342', '2023-01-06 09:07:31.879127', 6),
(2, 2, 'Requisition', '002', 'Achat de Carburant', 150000, 'Total Energie', '250000.00', '400000.00', '400000.00', '44600000.00', '45000000.00', 'open', '7', '2023-01-10 11:19:27.757783', '2023-01-10 11:19:27.763765', 6),
(3, 3, 'Matiéres et Four. Consommées', '003', 'Achat boisson de la formation', 60000, 'SOMULCI', '0.00', '60000.00', '60000.00', '24940000.00', '25000000.00', 'open', '7', '2023-01-10 11:22:32.240896', '2023-01-10 11:22:32.247611', 3),
(4, 4, 'Matiéres et Four. Consommées', '012', 'Achat Gaz', 150000, 'Sopetrans', '0.00', '150000.00', '150000.00', '3850000.00', '4000000.00', 'validated', '7', '2023-01-11 08:01:12.192302', '2023-01-11 08:17:26.883280', 10),
(5, 5, 'PFM', '00123', 'Allocation familliale annuelle', 54000, 'Travailleur', '0.00', '54000.00', '54000.00', '8999946000.00', '9000000000.00', 'open', '5', '2023-01-11 08:35:45.362125', '2023-01-11 08:35:45.483948', 73);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `accounts_account`
--
ALTER TABLE `accounts_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `budget_compte`
--
ALTER TABLE `budget_compte`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Index pour la table `budget_ligne`
--
ALTER TABLE `budget_ligne`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `budget_ligne_compte_id_5fc663ed_fk_budget_compte_id` (`compte_id`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_accounts_account_id` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Index pour la table `requisitions_requisition`
--
ALTER TABLE `requisitions_requisition`
  ADD PRIMARY KEY (`id`),
  ADD KEY `requisitions_requisition_account_id_9713b1fc_fk_budget_ligne_id` (`account_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `accounts_account`
--
ALTER TABLE `accounts_account`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `budget_compte`
--
ALTER TABLE `budget_compte`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `budget_ligne`
--
ALTER TABLE `budget_ligne`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `requisitions_requisition`
--
ALTER TABLE `requisitions_requisition`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `budget_ligne`
--
ALTER TABLE `budget_ligne`
  ADD CONSTRAINT `budget_ligne_compte_id_5fc663ed_fk_budget_compte_id` FOREIGN KEY (`compte_id`) REFERENCES `budget_compte` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`);

--
-- Contraintes pour la table `requisitions_requisition`
--
ALTER TABLE `requisitions_requisition`
  ADD CONSTRAINT `requisitions_requisition_account_id_9713b1fc_fk_budget_ligne_id` FOREIGN KEY (`account_id`) REFERENCES `budget_ligne` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
