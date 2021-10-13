-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 13 oct. 2021 à 16:10
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bddrh`
--

-- --------------------------------------------------------

--
-- Structure de la table `contrat`
--

CREATE TABLE `contrat` (
  `id` varchar(11) NOT NULL,
  `dateDebut` date NOT NULL,
  `DateFin` date NOT NULL,
  `idSal` varchar(11) NOT NULL,
  `idPoste` varchar(11) NOT NULL,
  `idService` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `contrat`
--

INSERT INTO `contrat` (`id`, `dateDebut`, `DateFin`, `idSal`, `idPoste`, `idService`) VALUES
('1977102', '1977-03-15', '1985-03-01', '148A12', '1', 'B01'),
('1985076', '1985-03-01', '2002-09-15', '148A12', '3', 'F01'),
('2002191', '2002-09-15', '0000-00-00', '148A12', '2', 'F01'),
('2000098', '2000-09-01', '2010-10-10', '156A12', '4', 'G01'),
('2010065', '0000-00-00', '0000-00-00', '156A12', '5', 'G01'),
('2008045', '0000-00-00', '0000-00-00', '196A12', '1', 'E21'),
('2008111', '0000-00-00', '0000-00-00', '196A12', '6', 'F01');

-- --------------------------------------------------------

--
-- Structure de la table `poste`
--

CREATE TABLE `poste` (
  `id` varchar(50) NOT NULL,
  `libelle` text NOT NULL,
  `caractéristique` text NOT NULL,
  `indice` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `poste`
--

INSERT INTO `poste` (`id`, `libelle`, `caractéristique`, `indice`) VALUES
('1', 'Magasiner(e)', 'Magasinier(e) en réserve', 385),
('2', 'Responsable Informatique', 'Gestion équipe de 2 à 3 personnes', 455),
('3', 'Informaticien(ne)', 'Maintenance Technique', 395),
('4', 'Hote(sse) de caisse', 'Rotation horaire et week-end', 365),
('5', 'chargé(e) d\'équipe', 'Manage une équipe de 10 hote(sse)s de caisse', 430),
('6', 'commercial(e)', 'poste de rayon', 400);

-- --------------------------------------------------------

--
-- Structure de la table `salarie`
--

CREATE TABLE `salarie` (
  `id` varchar(50) NOT NULL,
  `numSecu` varchar(50) NOT NULL,
  `nom` char(50) NOT NULL,
  `prenom` char(50) NOT NULL,
  `dateNaiss` date NOT NULL,
  `dateEmbauche` date NOT NULL,
  `tel` int(11) NOT NULL,
  `mel` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `salarie`
--

INSERT INTO `salarie` (`id`, `numSecu`, `nom`, `prenom`, `dateNaiss`, `dateEmbauche`, `tel`, `mel`) VALUES
('148A12', '152084168026', 'MARTIN', 'Pierre', '1952-08-05', '1977-03-15', 323315454, 'pierre.martin@proxim.fr'),
('15A12', '22254855154', 'ESTEN', 'Solène', '1967-11-18', '2000-09-01', 315495635, 'solène.esten@proxim.fr'),
('196A', '654516153848', 'BENARBIA', 'Samia', '1982-03-28', '2008-05-05', 385455955, 'samia.benarbia.esten@proxim.fr');

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE `service` (
  `id` varchar(50) NOT NULL,
  `libelle` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `service`
--

INSERT INTO `service` (`id`, `libelle`) VALUES
('A00', 'Direction générale'),
('B01', 'Approvisionnement'),
('C01', 'Comptabilité'),
('D01', 'Service après-vente'),
('D11', 'Boucherie'),
('D21', 'Boulangerie'),
('E01', 'Epicerie'),
('E11', 'Produits frais'),
('E21', 'Electromenager'),
('E31', 'Animalerie et jardin'),
('F01', 'Informatique'),
('F02', 'Ressources humaines'),
('G01', 'Caisse');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `contrat`
--
ALTER TABLE `contrat`
  ADD KEY `idSal` (`idSal`),
  ADD KEY `idPoste` (`idPoste`),
  ADD KEY `idService` (`idService`);

--
-- Index pour la table `poste`
--
ALTER TABLE `poste`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `salarie`
--
ALTER TABLE `salarie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `contrat`
--
ALTER TABLE `contrat`
  ADD CONSTRAINT `contrat_ibfk_1` FOREIGN KEY (`idService`) REFERENCES `service` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
