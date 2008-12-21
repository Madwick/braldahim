-- phpMyAdmin SQL Dump
-- version 2.10.2
-- http://www.phpmyadmin.net
-- 
-- Serveur: localhost
-- Généré le : Ven 19 Décembre 2008 à 22:45
-- Version du serveur: 5.0.41
-- Version de PHP: 5.2.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Base de données: `braldahim_beta`
-- 

-- --------------------------------------------------------

-- 
-- Structure de la table `batch`
-- 

CREATE TABLE `batch` (
  `id_batch` int(11) NOT NULL auto_increment,
  `type_batch` varchar(20) NOT NULL,
  `date_debut_batch` datetime NOT NULL,
  `date_fin_batch` datetime default NULL,
  `etat_batch` varchar(10) NOT NULL,
  `message_batch` mediumtext,
  PRIMARY KEY  (`id_batch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Structure de la table `boutique_bois`
-- 

CREATE TABLE `boutique_bois` (
  `id_boutique_bois` int(11) NOT NULL auto_increment,
  `date_achat_boutique_bois` datetime NOT NULL,
  `id_fk_lieu_boutique_bois` int(11) NOT NULL,
  `id_fk_hobbit_boutique_bois` int(11) NOT NULL,
  `quantite_rondin_boutique_bois` int(11) NOT NULL,
  `prix_unitaire_boutique_bois` int(11) NOT NULL,
  `id_fk_region_boutique_bois` int(11) NOT NULL,
  `action_boutique_bois` enum('reprise','vente') NOT NULL,
  PRIMARY KEY  (`id_boutique_bois`),
  KEY `id_fk_hobbit_boutique_bois` (`id_fk_hobbit_boutique_bois`),
  KEY `id_fk_lieu_boutique_bois` (`id_fk_lieu_boutique_bois`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Structure de la table `boutique_minerai`
-- 

CREATE TABLE `boutique_minerai` (
  `id_boutique_minerai` int(11) NOT NULL auto_increment,
  `date_achat_boutique_minerai` datetime NOT NULL,
  `id_fk_type_boutique_minerai` int(11) NOT NULL,
  `id_fk_lieu_boutique_minerai` int(11) NOT NULL,
  `id_fk_hobbit_boutique_minerai` int(11) NOT NULL,
  `quantite_brut_boutique_minerai` int(11) NOT NULL default '0',
  `prix_unitaire_boutique_minerai` int(11) NOT NULL,
  `id_fk_region_boutique_minerai` int(11) NOT NULL,
  `action_boutique_minerai` enum('reprise','vente') NOT NULL,
  PRIMARY KEY  (`id_boutique_minerai`),
  KEY `id_fk_lieu_laban_minerai` (`id_fk_lieu_boutique_minerai`),
  KEY `id_fk_hobbit_boutique_minerai` (`id_fk_hobbit_boutique_minerai`),
  KEY `id_fk_region_boutique_minerai` (`id_fk_region_boutique_minerai`),
  KEY `id_fk_type_boutique_minerai` (`id_fk_type_boutique_minerai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Structure de la table `boutique_partieplante`
-- 

CREATE TABLE `boutique_partieplante` (
  `id_boutique_partieplante` int(11) NOT NULL auto_increment,
  `date_achat_boutique_partieplante` datetime NOT NULL,
  `id_fk_type_boutique_partieplante` int(11) NOT NULL,
  `id_fk_type_plante_boutique_partieplante` int(11) NOT NULL,
  `id_fk_lieu_boutique_partieplante` int(11) NOT NULL,
  `id_fk_hobbit_boutique_partieplante` int(11) NOT NULL,
  `quantite_brut_boutique_partieplante` int(11) NOT NULL,
  `prix_unitaire_boutique_partieplante` int(11) NOT NULL,
  `id_fk_region_boutique_partieplante` int(11) NOT NULL,
  `action_boutique_partieplante` enum('reprise','vente') NOT NULL,
  PRIMARY KEY  (`id_boutique_partieplante`),
  KEY `id_fk_type_plante_boutique_partieplante` (`id_fk_type_plante_boutique_partieplante`),
  KEY `id_fk_lieu_boutique_partieplante` (`id_fk_lieu_boutique_partieplante`),
  KEY `id_fk_hobbit_boutique_partieplante` (`id_fk_hobbit_boutique_partieplante`),
  KEY `id_fk_region_boutique_partieplante` (`id_fk_region_boutique_partieplante`),
  KEY `id_fk_type_boutique_partieplante` (`id_fk_type_boutique_partieplante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Structure de la table `boutique_tabac`
-- 

CREATE TABLE `boutique_tabac` (
  `id_boutique_tabac` int(11) NOT NULL auto_increment,
  `date_achat_boutique_tabac` datetime NOT NULL,
  `id_fk_type_boutique_tabac` int(11) NOT NULL,
  `id_fk_lieu_boutique_tabac` int(11) NOT NULL,
  `id_fk_hobbit_boutique_tabac` int(11) NOT NULL,
  `quantite_feuille_boutique_tabac` int(11) NOT NULL default '0',
  `prix_unitaire_boutique_tabac` int(11) NOT NULL,
  `id_fk_region_boutique_tabac` int(11) NOT NULL,
  `action_boutique_tabac` enum('reprise','vente') NOT NULL,
  PRIMARY KEY  (`id_boutique_tabac`),
  KEY `id_fk_lieu_laban_tabac` (`id_fk_lieu_boutique_tabac`),
  KEY `id_fk_hobbit_boutique_tabac` (`id_fk_hobbit_boutique_tabac`),
  KEY `id_fk_region_boutique_tabac` (`id_fk_region_boutique_tabac`),
  KEY `id_fk_type_boutique_tabac` (`id_fk_type_boutique_tabac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Structure de la table `cadavre`
-- 

CREATE TABLE `cadavre` (
  `id_cadavre` int(11) NOT NULL,
  `id_fk_type_monstre_cadavre` int(11) NOT NULL,
  `id_fk_taille_cadavre` int(11) NOT NULL,
  `x_cadavre` int(11) NOT NULL,
  `y_cadavre` int(11) NOT NULL,
  PRIMARY KEY  (`id_cadavre`),
  KEY `idx_x_cadavre_y_cadavre` (`x_cadavre`,`y_cadavre`),
  KEY `id_fk_type_monstre_cadavre` (`id_fk_type_monstre_cadavre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `castar`
-- 

CREATE TABLE `castar` (
  `x_castar` int(11) NOT NULL,
  `y_castar` int(11) NOT NULL,
  `nb_castar` int(11) NOT NULL,
  PRIMARY KEY  (`x_castar`,`y_castar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `charrette`
-- 

CREATE TABLE `charrette` (
  `id_charrette` int(11) NOT NULL auto_increment,
  `id_fk_hobbit_charrette` int(11) default NULL,
  `quantite_rondin_charrette` int(11) NOT NULL,
  `x_charrette` int(11) default NULL,
  `y_charrette` int(11) default NULL,
  PRIMARY KEY  (`id_charrette`),
  UNIQUE KEY `id_fk_hobbit_charrette` (`id_fk_hobbit_charrette`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `coffre`
-- 

CREATE TABLE `coffre` (
  `id_fk_hobbit_coffre` int(11) NOT NULL,
  `quantite_viande_coffre` int(11) NOT NULL default '0',
  `quantite_peau_coffre` int(11) NOT NULL default '0',
  `quantite_viande_preparee_coffre` int(11) NOT NULL default '0',
  `quantite_ration_coffre` int(11) NOT NULL default '0',
  `quantite_cuir_coffre` int(11) NOT NULL default '0',
  `quantite_fourrure_coffre` int(11) NOT NULL default '0',
  `quantite_planche_coffre` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id_fk_hobbit_coffre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `coffre_equipement`
-- 

CREATE TABLE `coffre_equipement` (
  `id_coffre_equipement` int(11) NOT NULL,
  `id_fk_recette_coffre_equipement` int(11) NOT NULL,
  `id_fk_hobbit_coffre_equipement` int(11) NOT NULL,
  `nb_runes_coffre_equipement` int(11) NOT NULL,
  `id_fk_mot_runique_coffre_equipement` int(11) default NULL,
  PRIMARY KEY  (`id_coffre_equipement`),
  KEY `id_fk_hobbit_coffre_equipement` (`id_fk_hobbit_coffre_equipement`),
  KEY `id_fk_recette_coffre_equipement` (`id_fk_recette_coffre_equipement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `coffre_minerai`
-- 

CREATE TABLE `coffre_minerai` (
  `id_fk_type_coffre_minerai` int(11) NOT NULL,
  `id_fk_hobbit_coffre_minerai` int(11) NOT NULL,
  `quantite_brut_coffre_minerai` int(11) default '0',
  `quantite_lingots_coffre_minerai` int(11) NOT NULL,
  PRIMARY KEY  (`id_fk_type_coffre_minerai`,`id_fk_hobbit_coffre_minerai`),
  KEY `id_fk_hobbit_coffre_minerai` (`id_fk_hobbit_coffre_minerai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `coffre_partieplante`
-- 

CREATE TABLE `coffre_partieplante` (
  `id_fk_type_coffre_partieplante` int(11) NOT NULL,
  `id_fk_type_plante_coffre_partieplante` int(11) NOT NULL,
  `id_fk_hobbit_coffre_partieplante` int(11) NOT NULL,
  `quantite_coffre_partieplante` int(11) NOT NULL,
  `quantite_preparee_coffre_partieplante` int(11) NOT NULL,
  PRIMARY KEY  (`id_fk_type_coffre_partieplante`,`id_fk_type_plante_coffre_partieplante`,`id_fk_hobbit_coffre_partieplante`),
  KEY `id_fk_type_plante_coffre_partieplante` (`id_fk_type_plante_coffre_partieplante`),
  KEY `id_fk_hobbit_coffre_partieplante` (`id_fk_hobbit_coffre_partieplante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `coffre_rune`
-- 

CREATE TABLE `coffre_rune` (
  `id_fk_hobbit_coffre_rune` int(11) NOT NULL,
  `id_rune_coffre_rune` int(11) NOT NULL,
  `id_fk_type_coffre_rune` int(11) NOT NULL,
  `est_identifiee_rune` enum('oui','non') NOT NULL default 'non',
  PRIMARY KEY  (`id_rune_coffre_rune`),
  KEY `id_fk_hobbit_coffre_rune` (`id_fk_hobbit_coffre_rune`),
  KEY `id_fk_type_coffre_rune` (`id_fk_type_coffre_rune`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `communaute`
-- 

CREATE TABLE `communaute` (
  `id_communaute` int(11) NOT NULL auto_increment,
  `nom_communaute` varchar(40) NOT NULL,
  `date_creation_communaute` datetime NOT NULL,
  `id_fk_hobbit_gestionnaire_communaute` int(11) NOT NULL,
  `description_communaute` mediumtext,
  `site_web_communaute` varchar(255) default NULL,
  PRIMARY KEY  (`id_communaute`),
  UNIQUE KEY `id_fk_hobbit_createur_communaute` (`id_fk_hobbit_gestionnaire_communaute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Structure de la table `competence`
-- 

CREATE TABLE `competence` (
  `id_competence` int(11) NOT NULL auto_increment,
  `nom_systeme_competence` varchar(255) NOT NULL default '',
  `nom_competence` varchar(255) NOT NULL default '',
  `description_competence` mediumtext NOT NULL,
  `niveau_requis_competence` int(11) NOT NULL default '0',
  `pi_cout_competence` int(11) NOT NULL default '0',
  `px_gain_competence` int(11) NOT NULL default '0',
  `balance_faim_competence` int(11) NOT NULL,
  `pourcentage_max_competence` int(11) NOT NULL default '90',
  `pourcentage_init_competence` int(11) NOT NULL,
  `pa_utilisation_competence` int(11) NOT NULL default '6',
  `pa_manquee_competence` int(11) NOT NULL default '0',
  `type_competence` enum('basic','commun','metier') NOT NULL default 'basic',
  `id_fk_metier_competence` int(11) default NULL,
  `id_fk_type_tabac_competence` int(11) default NULL,
  PRIMARY KEY  (`id_competence`),
  UNIQUE KEY `nom_competence` (`nom_competence`),
  KEY `id_fk_metier_competence` (`id_fk_metier_competence`),
  KEY `id_fk_type_tabac_competence` (`id_fk_type_tabac_competence`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `couple`
-- 

CREATE TABLE `couple` (
  `id_fk_m_hobbit_couple` int(11) NOT NULL,
  `id_fk_f_hobbit_couple` int(11) NOT NULL,
  `date_creation_couple` datetime NOT NULL,
  `nb_enfants_couple` int(11) NOT NULL,
  PRIMARY KEY  (`id_fk_m_hobbit_couple`,`id_fk_f_hobbit_couple`),
  UNIQUE KEY `id_fk_f_hobbit_couple` (`id_fk_f_hobbit_couple`),
  UNIQUE KEY `id_fk_m_hobbit_couple` (`id_fk_m_hobbit_couple`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `echoppe`
-- 

CREATE TABLE `echoppe` (
  `id_echoppe` int(11) NOT NULL auto_increment,
  `id_fk_hobbit_echoppe` int(11) NOT NULL,
  `x_echoppe` int(11) NOT NULL,
  `y_echoppe` int(11) NOT NULL,
  `date_creation_echoppe` datetime NOT NULL,
  `commentaire_echoppe` mediumtext,
  `id_fk_metier_echoppe` int(11) NOT NULL,
  `quantite_peau_caisse_echoppe` int(11) NOT NULL default '0',
  `quantite_castar_caisse_echoppe` int(11) NOT NULL default '0',
  `quantite_rondin_caisse_echoppe` int(11) NOT NULL default '0',
  `quantite_peau_arriere_echoppe` int(11) NOT NULL default '0',
  `quantite_rondin_arriere_echoppe` int(11) NOT NULL default '0',
  `quantite_cuir_arriere_echoppe` int(11) NOT NULL default '0',
  `quantite_fourrure_arriere_echoppe` int(11) NOT NULL default '0',
  `quantite_planche_arriere_echoppe` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id_echoppe`),
  KEY `xy_echoppe` (`x_echoppe`,`y_echoppe`),
  KEY `id_fk_hobbit_echoppe` (`id_fk_hobbit_echoppe`),
  KEY `id_fk_metier_echoppe` (`id_fk_metier_echoppe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `echoppe_equipement`
-- 

CREATE TABLE `echoppe_equipement` (
  `id_echoppe_equipement` int(11) NOT NULL auto_increment,
  `id_fk_echoppe_echoppe_equipement` int(11) NOT NULL,
  `id_fk_recette_echoppe_equipement` int(11) NOT NULL,
  `nb_runes_echoppe_equipement` int(11) NOT NULL,
  `type_vente_echoppe_equipement` enum('aucune','publique','hobbit') NOT NULL default 'aucune',
  `commentaire_vente_echoppe_equipement` varchar(300) default NULL,
  `id_fk_hobbit_vente_echoppe_equipement` int(11) default NULL,
  `unite_1_vente_echoppe_equipement` int(11) NOT NULL default '0',
  `unite_2_vente_echoppe_equipement` int(11) NOT NULL default '0',
  `unite_3_vente_echoppe_equipement` int(11) NOT NULL default '0',
  `prix_1_vente_echoppe_equipement` int(11) NOT NULL default '0',
  `prix_2_vente_echoppe_equipement` int(11) NOT NULL default '0',
  `prix_3_vente_echoppe_equipement` int(11) NOT NULL default '0',
  `id_fk_mot_runique_echoppe_equipement` int(11) default NULL,
  PRIMARY KEY  (`id_echoppe_equipement`),
  KEY `id_fk_echoppe_echoppe_equipement` (`id_fk_echoppe_echoppe_equipement`),
  KEY `id_fk_recette_echoppe_equipement` (`id_fk_recette_echoppe_equipement`),
  KEY `id_hobbit_vente_echoppe_equipement` (`id_fk_hobbit_vente_echoppe_equipement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `echoppe_equipement_minerai`
-- 

CREATE TABLE `echoppe_equipement_minerai` (
  `id_fk_type_echoppe_equipement_minerai` int(11) NOT NULL,
  `id_fk_echoppe_equipement_minerai` int(11) NOT NULL,
  `prix_echoppe_equipement_minerai` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id_fk_type_echoppe_equipement_minerai`,`id_fk_echoppe_equipement_minerai`),
  KEY `id_fk_echoppe_equipement_minerai` (`id_fk_echoppe_equipement_minerai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `echoppe_equipement_partieplante`
-- 

CREATE TABLE `echoppe_equipement_partieplante` (
  `id_fk_type_echoppe_equipement_partieplante` int(11) NOT NULL,
  `id_fk_type_plante_echoppe_equipement_partieplante` int(11) NOT NULL,
  `id_fk_echoppe_equipement_partieplante` int(11) NOT NULL,
  `prix_echoppe_equipement_partieplante` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id_fk_type_echoppe_equipement_partieplante`,`id_fk_type_plante_echoppe_equipement_partieplante`,`id_fk_echoppe_equipement_partieplante`),
  KEY `id_fk_type_plante_echoppe_equipement_partieplante` (`id_fk_type_plante_echoppe_equipement_partieplante`),
  KEY `id_fk_echoppe_equipement_partieplante` (`id_fk_echoppe_equipement_partieplante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `echoppe_minerai`
-- 

CREATE TABLE `echoppe_minerai` (
  `id_fk_type_echoppe_minerai` int(11) NOT NULL,
  `id_fk_echoppe_echoppe_minerai` int(11) NOT NULL,
  `quantite_caisse_echoppe_minerai` int(11) NOT NULL default '0',
  `quantite_arriere_echoppe_minerai` int(11) NOT NULL default '0',
  `quantite_lingots_echoppe_minerai` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id_fk_type_echoppe_minerai`,`id_fk_echoppe_echoppe_minerai`),
  KEY `id_fk_echoppe_echoppe_minerai` (`id_fk_echoppe_echoppe_minerai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `echoppe_partieplante`
-- 

CREATE TABLE `echoppe_partieplante` (
  `id_fk_type_echoppe_partieplante` int(11) NOT NULL,
  `id_fk_type_plante_echoppe_partieplante` int(11) NOT NULL,
  `id_fk_echoppe_echoppe_partieplante` int(11) NOT NULL,
  `quantite_caisse_echoppe_partieplante` int(11) NOT NULL default '0',
  `quantite_arriere_echoppe_partieplante` int(11) NOT NULL default '0',
  `quantite_preparees_echoppe_partieplante` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id_fk_type_echoppe_partieplante`,`id_fk_type_plante_echoppe_partieplante`,`id_fk_echoppe_echoppe_partieplante`),
  KEY `id_fk_type_plante_echoppe_partieplante` (`id_fk_type_plante_echoppe_partieplante`),
  KEY `id_fk_echoppe_echoppe_partieplante` (`id_fk_echoppe_echoppe_partieplante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `echoppe_potion`
-- 

CREATE TABLE `echoppe_potion` (
  `id_echoppe_potion` int(11) NOT NULL auto_increment,
  `id_fk_echoppe_echoppe_potion` int(11) NOT NULL,
  `id_fk_type_qualite_echoppe_potion` int(11) NOT NULL,
  `niveau_echoppe_potion` int(11) NOT NULL,
  `id_fk_type_potion_echoppe_potion` int(11) NOT NULL,
  `type_vente_echoppe_potion` enum('aucune','publique','hobbit') NOT NULL default 'aucune',
  `commentaire_vente_echoppe_potion` varchar(300) default NULL,
  `id_fk_hobbit_vente_echoppe_potion` int(11) default NULL,
  `unite_1_vente_echoppe_potion` int(11) NOT NULL default '0',
  `unite_2_vente_echoppe_potion` int(11) NOT NULL default '0',
  `unite_3_vente_echoppe_potion` int(11) NOT NULL default '0',
  `prix_1_vente_echoppe_potion` int(11) NOT NULL default '0',
  `prix_2_vente_echoppe_potion` int(11) NOT NULL default '0',
  `prix_3_vente_echoppe_potion` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id_echoppe_potion`),
  KEY `id_fk_echoppe_potion` (`id_fk_echoppe_echoppe_potion`),
  KEY `id_fk_qualite_echoppe_potion` (`id_fk_type_qualite_echoppe_potion`),
  KEY `id_fk_type_potion_echoppe_potion` (`id_fk_type_potion_echoppe_potion`),
  KEY `id_fk_hobbit_vente_echoppe_potion` (`id_fk_hobbit_vente_echoppe_potion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `echoppe_potion_minerai`
-- 

CREATE TABLE `echoppe_potion_minerai` (
  `id_fk_type_echoppe_potion_minerai` int(11) NOT NULL,
  `id_fk_echoppe_potion_minerai` int(11) NOT NULL,
  `prix_echoppe_potion_minerai` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id_fk_type_echoppe_potion_minerai`,`id_fk_echoppe_potion_minerai`),
  KEY `id_fk_echoppe_potion_minerai` (`id_fk_echoppe_potion_minerai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `echoppe_potion_partieplante`
-- 

CREATE TABLE `echoppe_potion_partieplante` (
  `id_fk_type_echoppe_potion_partieplante` int(11) NOT NULL,
  `id_fk_type_plante_echoppe_potion_partieplante` int(11) NOT NULL,
  `id_fk_echoppe_potion_partieplante` int(11) NOT NULL,
  `prix_echoppe_potion_partieplante` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id_fk_type_echoppe_potion_partieplante`,`id_fk_type_plante_echoppe_potion_partieplante`,`id_fk_echoppe_potion_partieplante`),
  KEY `id_fk_type_plante_echoppe_potion_partieplante` (`id_fk_type_plante_echoppe_potion_partieplante`),
  KEY `id_fk_echoppe_potion_partieplante` (`id_fk_echoppe_potion_partieplante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `effet_mot_f`
-- 

CREATE TABLE `effet_mot_f` (
  `id_fk_hobbit_effet_mot_f` int(11) NOT NULL,
  `id_fk_type_monstre_effet_mot_f` int(11) NOT NULL,
  PRIMARY KEY  (`id_fk_hobbit_effet_mot_f`,`id_fk_type_monstre_effet_mot_f`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `effet_potion_hobbit`
-- 

CREATE TABLE `effet_potion_hobbit` (
  `id_effet_potion_hobbit` int(11) NOT NULL auto_increment,
  `id_fk_type_potion_effet_potion_hobbit` int(11) NOT NULL,
  `id_fk_hobbit_cible_effet_potion_hobbit` int(11) NOT NULL,
  `id_fk_hobbit_lanceur_effet_potion_hobbit` int(11) NOT NULL,
  `id_fk_type_qualite_effet_potion_hobbit` int(11) NOT NULL,
  `nb_tour_restant_effet_potion_hobbit` int(11) NOT NULL,
  `niveau_effet_potion_hobbit` int(11) NOT NULL,
  PRIMARY KEY  (`id_effet_potion_hobbit`),
  KEY `id_fk_type_potion_effet_potion_hobbit` (`id_fk_type_potion_effet_potion_hobbit`),
  KEY `id_fk_hobbit_cible_effet_potion_hobbit` (`id_fk_hobbit_cible_effet_potion_hobbit`),
  KEY `id_fk_hobbit_lanceur_effet_potion_hobbit` (`id_fk_hobbit_lanceur_effet_potion_hobbit`),
  KEY `id_fk_type_qualite_effet_potion_hobbit` (`id_fk_type_qualite_effet_potion_hobbit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `effet_potion_monstre`
-- 

CREATE TABLE `effet_potion_monstre` (
  `id_effet_potion_monstre` int(11) NOT NULL auto_increment,
  `id_fk_type_potion_effet_potion_monstre` int(11) NOT NULL,
  `id_fk_monstre_cible_effet_potion_monstre` int(11) NOT NULL,
  `id_fk_hobbit_lanceur_effet_potion_monstre` int(11) NOT NULL,
  `id_fk_type_qualite_effet_potion_monstre` int(11) NOT NULL,
  `nb_tour_restant_effet_potion_monstre` int(11) NOT NULL,
  `niveau_effet_potion_monstre` int(11) NOT NULL,
  PRIMARY KEY  (`id_effet_potion_monstre`),
  KEY `id_fk_type_potion_effet_potion_hobbit` (`id_fk_type_potion_effet_potion_monstre`),
  KEY `id_fk_monstre_cible_effet_potion_monstre` (`id_fk_monstre_cible_effet_potion_monstre`),
  KEY `id_fk_hobbit_lanceur_effet_potion_monstre` (`id_fk_hobbit_lanceur_effet_potion_monstre`),
  KEY `id_fk_type_qualite_effet_potion_monstre` (`id_fk_type_qualite_effet_potion_monstre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `element`
-- 

CREATE TABLE `element` (
  `x_element` int(11) NOT NULL,
  `y_element` int(11) NOT NULL,
  `quantite_viande_element` int(11) NOT NULL default '0',
  `quantite_peau_element` int(11) NOT NULL default '0',
  `quantite_viande_preparee_element` int(11) NOT NULL default '0',
  `quantite_ration_element` int(11) NOT NULL default '0',
  `quantite_cuir_element` int(11) NOT NULL default '0',
  `quantite_fourrure_element` int(11) NOT NULL default '0',
  `quantite_planche_element` int(11) NOT NULL default '0',
  PRIMARY KEY  (`x_element`,`y_element`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `element_equipement`
-- 

CREATE TABLE `element_equipement` (
  `id_element_equipement` int(11) NOT NULL,
  `x_element_equipement` int(11) NOT NULL,
  `y_element_equipement` int(11) NOT NULL,
  `id_fk_recette_element_equipement` int(11) NOT NULL,
  `nb_runes_element_equipement` int(11) NOT NULL,
  `id_fk_mot_runique_element_equipement` int(11) default NULL,
  PRIMARY KEY  (`id_element_equipement`),
  KEY `id_fk_recette_element_equipement` (`id_fk_recette_element_equipement`),
  KEY `x_element_equipement` (`x_element_equipement`,`y_element_equipement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `element_minerai`
-- 

CREATE TABLE `element_minerai` (
  `x_element_minerai` int(11) NOT NULL,
  `y_element_minerai` int(11) NOT NULL,
  `id_fk_type_element_minerai` int(11) NOT NULL,
  `quantite_brut_element_minerai` int(11) default '0',
  `quantite_lingots_element_minerai` int(11) NOT NULL,
  PRIMARY KEY  (`id_fk_type_element_minerai`,`x_element_minerai`,`y_element_minerai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `element_partieplante`
-- 

CREATE TABLE `element_partieplante` (
  `id_fk_type_element_partieplante` int(11) NOT NULL,
  `id_fk_type_plante_element_partieplante` int(11) NOT NULL,
  `x_element_partieplante` int(11) NOT NULL,
  `y_element_partieplante` int(11) NOT NULL,
  `quantite_element_partieplante` int(11) NOT NULL,
  `quantite_preparee_element_partieplante` int(11) NOT NULL,
  PRIMARY KEY  (`id_fk_type_element_partieplante`,`id_fk_type_plante_element_partieplante`,`x_element_partieplante`,`y_element_partieplante`),
  KEY `id_fk_type_plante_element_partieplante` (`id_fk_type_plante_element_partieplante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `element_potion`
-- 

CREATE TABLE `element_potion` (
  `id_element_potion` int(11) NOT NULL,
  `x_element_potion` int(11) NOT NULL,
  `y_element_potion` int(11) NOT NULL,
  `id_fk_type_element_potion` int(11) NOT NULL,
  `id_fk_type_qualite_element_potion` int(11) NOT NULL,
  `niveau_element_potion` int(11) NOT NULL,
  PRIMARY KEY  (`id_element_potion`),
  KEY `id_fk_type_element_potion` (`id_fk_type_element_potion`),
  KEY `id_fk_type_qualite_element_potion` (`id_fk_type_qualite_element_potion`),
  KEY `x_element_potion` (`x_element_potion`,`y_element_potion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `element_rune`
-- 

CREATE TABLE `element_rune` (
  `x_element_rune` int(11) NOT NULL,
  `y_element_rune` int(11) NOT NULL,
  `id_element_rune` int(11) NOT NULL auto_increment,
  `id_fk_type_element_rune` int(11) NOT NULL,
  PRIMARY KEY  (`id_element_rune`),
  KEY `id_fk_type_element_rune` (`id_fk_type_element_rune`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `environnement`
-- 

CREATE TABLE `environnement` (
  `id_environnement` int(11) NOT NULL auto_increment,
  `nom_environnement` varchar(20) NOT NULL,
  `description_environnement` varchar(250) NOT NULL,
  `nom_systeme_environnement` varchar(20) NOT NULL,
  `image_environnement` varchar(100) NOT NULL,
  PRIMARY KEY  (`id_environnement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `equipement_rune`
-- 

CREATE TABLE `equipement_rune` (
  `id_equipement_rune` int(11) NOT NULL,
  `id_rune_equipement_rune` int(11) NOT NULL,
  `id_fk_type_rune_equipement_rune` int(11) NOT NULL,
  `ordre_equipement_rune` int(11) NOT NULL,
  PRIMARY KEY  (`id_equipement_rune`,`id_rune_equipement_rune`),
  KEY `id_fk_type_rune_equipement_rune` (`id_fk_type_rune_equipement_rune`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `evenement`
-- 

CREATE TABLE `evenement` (
  `id_evenement` int(11) NOT NULL auto_increment,
  `id_fk_hobbit_evenement` int(11) default NULL,
  `id_fk_monstre_evenement` int(11) default NULL,
  `date_evenement` datetime NOT NULL,
  `id_fk_type_evenement` int(11) NOT NULL,
  `details_evenement` varchar(1000) NOT NULL,
  `details_bot_evenement` mediumtext,
  PRIMARY KEY  (`id_evenement`),
  KEY `idx_id_hobbit_evenement` (`id_fk_hobbit_evenement`),
  KEY `idx_id_monstre_evenement` (`id_fk_monstre_evenement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Structure de la table `filon`
-- 

CREATE TABLE `filon` (
  `id_filon` int(11) NOT NULL auto_increment,
  `id_fk_type_minerai_filon` int(11) NOT NULL,
  `x_filon` int(11) NOT NULL,
  `y_filon` int(11) NOT NULL,
  `quantite_restante_filon` int(11) NOT NULL,
  `quantite_max_filon` int(11) NOT NULL,
  PRIMARY KEY  (`id_filon`),
  KEY `idx_x_filon_y_filon` (`x_filon`,`y_filon`),
  KEY `id_fk_type_minerai_filon` (`id_fk_type_minerai_filon`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `gardiennage`
-- 

CREATE TABLE `gardiennage` (
  `id_gardiennage` int(11) NOT NULL auto_increment,
  `id_fk_hobbit_gardiennage` int(11) NOT NULL,
  `id_fk_gardien_gardiennage` int(11) NOT NULL,
  `date_debut_gardiennage` date NOT NULL,
  `date_fin_gardiennage` date NOT NULL,
  `nb_jours_gardiennage` int(11) NOT NULL,
  `commentaire_gardiennage` varchar(100) NOT NULL,
  PRIMARY KEY  (`id_gardiennage`),
  KEY `id_gardien_gardiennage` (`id_fk_gardien_gardiennage`),
  KEY `id_fk_hobbit_gardiennage` (`id_fk_hobbit_gardiennage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Structure de la table `groupe_monstre`
-- 

CREATE TABLE `groupe_monstre` (
  `id_groupe_monstre` int(11) NOT NULL auto_increment,
  `id_fk_type_groupe_monstre` int(11) NOT NULL,
  `date_creation_groupe_monstre` datetime NOT NULL,
  `id_fk_hobbit_cible_groupe_monstre` int(11) default NULL,
  `nb_membres_max_groupe_monstre` int(11) NOT NULL,
  `nb_membres_restant_groupe_monstre` int(11) NOT NULL,
  `phase_tactique_groupe_monstre` int(11) NOT NULL,
  `id_role_a_groupe_monstre` int(11) default NULL,
  `id_role_b_groupe_monstre` int(11) default NULL,
  `date_fin_tour_groupe_monstre` datetime default NULL COMMENT 'DLA du dernier monstre à jouer dans ce groupe',
  `x_direction_groupe_monstre` int(11) NOT NULL,
  `y_direction_groupe_monstre` int(11) NOT NULL,
  PRIMARY KEY  (`id_groupe_monstre`),
  KEY `id_fk_type_groupe_monstre` (`id_fk_type_groupe_monstre`),
  KEY `id_fk_hobbit_cible_groupe_monstre` (`id_fk_hobbit_cible_groupe_monstre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `historique_equipement`
-- 

CREATE TABLE `historique_equipement` (
  `id_historique_equipement` int(11) NOT NULL auto_increment,
  `id_fk_historique_equipement` int(11) NOT NULL,
  `date_historique_equipement` datetime NOT NULL,
  `details_historique_equipement` varchar(200) NOT NULL,
  PRIMARY KEY  (`id_historique_equipement`),
  KEY `id_fk_historique_equipement` (`id_fk_historique_equipement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `hobbit`
-- 

CREATE TABLE `hobbit` (
  `id_hobbit` int(11) NOT NULL auto_increment,
  `id_fk_jos_users_hobbit` int(11) default NULL COMMENT 'identifiant vers User Joomla : jos_users.id',
  `sysgroupe_hobbit` varchar(10) default NULL,
  `nom_hobbit` varchar(20) NOT NULL,
  `prenom_hobbit` varchar(23) NOT NULL,
  `id_fk_nom_initial_hobbit` int(11) NOT NULL,
  `password_hobbit` varchar(50) NOT NULL,
  `email_hobbit` varchar(100) NOT NULL,
  `etat_hobbit` int(11) NOT NULL,
  `sexe_hobbit` enum('feminin','masculin') NOT NULL,
  `x_hobbit` int(11) NOT NULL,
  `y_hobbit` int(1) NOT NULL,
  `date_debut_tour_hobbit` datetime NOT NULL,
  `date_fin_tour_hobbit` datetime NOT NULL,
  `date_fin_latence_hobbit` datetime NOT NULL,
  `date_debut_cumul_hobbit` datetime NOT NULL,
  `duree_prochain_tour_hobbit` time NOT NULL,
  `duree_courant_tour_hobbit` time NOT NULL,
  `tour_position_hobbit` int(11) NOT NULL,
  `pa_hobbit` int(11) NOT NULL,
  `vue_bm_hobbit` int(11) NOT NULL,
  `vue_malus_hobbit` int(11) NOT NULL,
  `force_base_hobbit` int(11) NOT NULL,
  `force_bm_hobbit` int(11) NOT NULL,
  `force_bbdf_hobbit` int(11) NOT NULL default '0',
  `agilite_base_hobbit` int(11) NOT NULL,
  `agilite_bm_hobbit` int(11) NOT NULL,
  `agilite_bbdf_hobbit` int(11) NOT NULL default '0',
  `agilite_malus_hobbit` int(11) NOT NULL,
  `sagesse_base_hobbit` int(11) NOT NULL,
  `sagesse_bm_hobbit` int(11) NOT NULL,
  `sagesse_bbdf_hobbit` int(11) NOT NULL default '0',
  `vigueur_base_hobbit` int(11) NOT NULL,
  `vigueur_bm_hobbit` int(11) NOT NULL,
  `vigueur_bbdf_hobbit` int(11) NOT NULL default '0',
  `regeneration_hobbit` int(11) NOT NULL,
  `regeneration_malus_hobbit` int(11) NOT NULL,
  `px_perso_hobbit` int(11) NOT NULL default '0',
  `px_commun_hobbit` int(11) NOT NULL,
  `pi_cumul_hobbit` int(11) NOT NULL default '0',
  `pi_hobbit` int(11) NOT NULL default '0',
  `niveau_hobbit` int(11) NOT NULL default '0',
  `balance_faim_hobbit` int(11) NOT NULL,
  `armure_naturelle_hobbit` int(11) NOT NULL,
  `armure_equipement_hobbit` int(11) NOT NULL,
  `bm_attaque_hobbit` int(11) NOT NULL,
  `bm_defense_hobbit` int(11) NOT NULL,
  `bm_degat_hobbit` int(11) NOT NULL,
  `poids_transportable_hobbit` float NOT NULL default '0',
  `poids_transporte_hobbit` float NOT NULL default '0',
  `castars_hobbit` int(11) NOT NULL,
  `pv_max_hobbit` int(11) NOT NULL COMMENT 'calculé à l''activation du tour',
  `pv_restant_hobbit` int(11) NOT NULL,
  `pv_max_bm_hobbit` int(11) NOT NULL,
  `est_mort_hobbit` enum('oui','non') NOT NULL default 'non',
  `nb_mort_hobbit` int(11) NOT NULL default '0',
  `nb_hobbit_kill_hobbit` int(11) NOT NULL default '0',
  `nb_monstre_kill_hobbit` int(11) NOT NULL,
  `est_compte_actif_hobbit` enum('oui','non') NOT NULL default 'non',
  `est_en_hibernation_hobbit` enum('oui','non') NOT NULL default 'non',
  `date_fin_hibernation_hobbit` datetime NOT NULL,
  `date_creation_hobbit` datetime NOT NULL,
  `id_fk_mere_hobbit` int(11) default NULL,
  `id_fk_pere_hobbit` int(11) default NULL,
  `description_hobbit` mediumtext NOT NULL,
  `id_fk_communaute_hobbit` int(11) default NULL,
  `id_fk_rang_communaute_hobbit` int(11) default NULL,
  `date_entree_communaute_hobbit` datetime default NULL,
  `url_blason_hobbit` varchar(200) default 'http://',
  `url_avatar_hobbit` varchar(200) default 'http://',
  `envoi_mail_message_hobbit` enum('oui','non') NOT NULL default 'oui',
  `envoi_mail_evenement_hobbit` enum('oui','non') NOT NULL default 'non',
  `titre_courant_hobbit` varchar(15) default NULL,
  PRIMARY KEY  (`id_hobbit`),
  UNIQUE KEY `email_hobbit` (`email_hobbit`),
  KEY `idx_x_hobbit_y_hobbit` (`x_hobbit`,`y_hobbit`),
  KEY `id_fk_communaute_hobbit` (`id_fk_communaute_hobbit`),
  KEY `id_fk_rang_communaute_hobbit` (`id_fk_rang_communaute_hobbit`),
  KEY `id_fk_jos_users_hobbit` (`id_fk_jos_users_hobbit`),
  KEY `est_en_hibernation_hobbit` (`est_en_hibernation_hobbit`),
  KEY `id_fk_mere_hobbit` (`id_fk_mere_hobbit`),
  KEY `id_fk_pere_hobbit` (`id_fk_pere_hobbit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tables des Hobbits';

-- --------------------------------------------------------

-- 
-- Structure de la table `hobbits_competences`
-- 

CREATE TABLE `hobbits_competences` (
  `id_fk_hobbit_hcomp` int(11) NOT NULL default '0',
  `id_fk_competence_hcomp` int(11) NOT NULL default '0',
  `pourcentage_hcomp` int(11) NOT NULL default '10',
  `date_debut_tour_hcomp` datetime NOT NULL default '0000-00-00 00:00:00',
  `nb_action_tour_hcomp` int(11) NOT NULL default '0',
  `nb_gain_tour_hcomp` int(11) NOT NULL default '0',
  `nb_tour_restant_bonus_tabac_hcomp` int(11) NOT NULL default '0',
  `nb_tour_restant_malus_tabac_hcomp` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id_fk_hobbit_hcomp`,`id_fk_competence_hcomp`),
  KEY `id_fk_competence_hcomp` (`id_fk_competence_hcomp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `hobbits_equipement`
-- 

CREATE TABLE `hobbits_equipement` (
  `id_equipement_hequipement` int(11) NOT NULL,
  `id_fk_hobbit_hequipement` int(11) NOT NULL,
  `id_fk_recette_hequipement` int(11) NOT NULL,
  `nb_runes_hequipement` int(11) NOT NULL,
  `id_fk_mot_runique_hequipement` int(11) default NULL,
  PRIMARY KEY  (`id_equipement_hequipement`),
  KEY `id_fk_hobbit_hequipement` (`id_fk_hobbit_hequipement`),
  KEY `id_fk_type_hequipement` (`id_fk_recette_hequipement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `hobbits_metiers`
-- 

CREATE TABLE `hobbits_metiers` (
  `id_fk_hobbit_hmetier` int(11) NOT NULL,
  `id_fk_metier_hmetier` int(11) NOT NULL,
  `est_actif_hmetier` enum('oui','non') NOT NULL,
  `date_apprentissage_hmetier` date NOT NULL,
  PRIMARY KEY  (`id_fk_hobbit_hmetier`,`id_fk_metier_hmetier`),
  KEY `id_fk_metier_hmetier` (`id_fk_metier_hmetier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `hobbits_titres`
-- 

CREATE TABLE `hobbits_titres` (
  `id_fk_hobbit_htitre` int(11) NOT NULL,
  `id_fk_type_htitre` int(11) NOT NULL,
  `niveau_acquis_htitre` int(11) NOT NULL,
  `date_acquis_htitre` date NOT NULL,
  PRIMARY KEY  (`id_fk_hobbit_htitre`,`id_fk_type_htitre`,`niveau_acquis_htitre`),
  KEY `id_fk_type_htitre` (`id_fk_type_htitre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Structure de la table `info_jeu`
-- 

CREATE TABLE `info_jeu` (
  `id_info_jeu` int(11) NOT NULL auto_increment,
  `date_info_jeu` datetime NOT NULL,
  `text_info_jeu` text NOT NULL,
  `est_sur_accueil_info_jeu` enum('oui','non') NOT NULL default 'oui',
  PRIMARY KEY  (`id_info_jeu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Structure de la table `laban`
-- 

CREATE TABLE `laban` (
  `id_fk_hobbit_laban` int(11) NOT NULL,
  `quantite_viande_laban` int(11) NOT NULL default '0',
  `quantite_peau_laban` int(11) NOT NULL default '0',
  `quantite_viande_preparee_laban` int(11) NOT NULL default '0',
  `quantite_ration_laban` int(11) NOT NULL default '0',
  `quantite_cuir_laban` int(11) NOT NULL default '0',
  `quantite_fourrure_laban` int(11) NOT NULL default '0',
  `quantite_planche_laban` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id_fk_hobbit_laban`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `laban_equipement`
-- 

CREATE TABLE `laban_equipement` (
  `id_laban_equipement` int(11) NOT NULL,
  `id_fk_recette_laban_equipement` int(11) NOT NULL,
  `id_fk_hobbit_laban_equipement` int(11) NOT NULL,
  `nb_runes_laban_equipement` int(11) NOT NULL,
  `id_fk_mot_runique_laban_equipement` int(11) default NULL,
  PRIMARY KEY  (`id_laban_equipement`),
  KEY `id_fk_hobbit_laban_equipement` (`id_fk_hobbit_laban_equipement`),
  KEY `id_fk_recette_laban_equipement` (`id_fk_recette_laban_equipement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `laban_minerai`
-- 

CREATE TABLE `laban_minerai` (
  `id_fk_type_laban_minerai` int(11) NOT NULL,
  `id_fk_hobbit_laban_minerai` int(11) NOT NULL,
  `quantite_brut_laban_minerai` int(11) default '0',
  `quantite_lingots_laban_minerai` int(11) NOT NULL,
  PRIMARY KEY  (`id_fk_type_laban_minerai`,`id_fk_hobbit_laban_minerai`),
  KEY `id_fk_hobbit_laban_minerai` (`id_fk_hobbit_laban_minerai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `laban_partieplante`
-- 

CREATE TABLE `laban_partieplante` (
  `id_fk_type_laban_partieplante` int(11) NOT NULL,
  `id_fk_type_plante_laban_partieplante` int(11) NOT NULL,
  `id_fk_hobbit_laban_partieplante` int(11) NOT NULL,
  `quantite_laban_partieplante` int(11) NOT NULL,
  `quantite_preparee_laban_partieplante` int(11) NOT NULL,
  PRIMARY KEY  (`id_fk_type_laban_partieplante`,`id_fk_type_plante_laban_partieplante`,`id_fk_hobbit_laban_partieplante`),
  KEY `id_fk_type_plante_laban_partieplante` (`id_fk_type_plante_laban_partieplante`),
  KEY `id_fk_hobbit_laban_partieplante` (`id_fk_hobbit_laban_partieplante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `laban_potion`
-- 

CREATE TABLE `laban_potion` (
  `id_laban_potion` int(11) NOT NULL,
  `id_fk_type_laban_potion` int(11) NOT NULL,
  `id_fk_hobbit_laban_potion` int(11) NOT NULL,
  `id_fk_type_qualite_laban_potion` int(11) NOT NULL,
  `niveau_laban_potion` int(11) NOT NULL,
  PRIMARY KEY  (`id_laban_potion`),
  KEY `id_fk_hobbit_laban_potion` (`id_fk_hobbit_laban_potion`),
  KEY `id_fk_type_laban_potion` (`id_fk_type_laban_potion`),
  KEY `id_fk_type_qualite_laban_potion` (`id_fk_type_qualite_laban_potion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `laban_rune`
-- 

CREATE TABLE `laban_rune` (
  `id_fk_hobbit_laban_rune` int(11) NOT NULL,
  `id_rune_laban_rune` int(11) NOT NULL,
  `id_fk_type_laban_rune` int(11) NOT NULL,
  `est_identifiee_rune` enum('oui','non') NOT NULL default 'non',
  PRIMARY KEY  (`id_rune_laban_rune`),
  KEY `id_fk_hobbit_laban_rune` (`id_fk_hobbit_laban_rune`),
  KEY `id_fk_type_laban_rune` (`id_fk_type_laban_rune`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `laban_tabac`
-- 

CREATE TABLE `laban_tabac` (
  `id_fk_type_laban_tabac` int(11) NOT NULL,
  `id_fk_hobbit_laban_tabac` int(11) NOT NULL,
  `quantite_feuille_laban_tabac` int(11) default '0',
  PRIMARY KEY  (`id_fk_type_laban_tabac`,`id_fk_hobbit_laban_tabac`),
  KEY `id_fk_hobbit_laban_tabac` (`id_fk_hobbit_laban_tabac`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `lieu`
-- 

CREATE TABLE `lieu` (
  `id_lieu` int(11) NOT NULL auto_increment,
  `nom_lieu` varchar(30) NOT NULL,
  `description_lieu` mediumtext NOT NULL,
  `x_lieu` int(11) NOT NULL,
  `y_lieu` int(11) NOT NULL,
  `etat_lieu` int(11) NOT NULL,
  `id_fk_type_lieu` int(11) NOT NULL,
  `id_fk_ville_lieu` int(11) default NULL,
  `date_creation_lieu` datetime NOT NULL,
  PRIMARY KEY  (`id_lieu`),
  UNIQUE KEY `xy_lieu` (`x_lieu`,`y_lieu`),
  KEY `id_fk_type_lieu` (`id_fk_type_lieu`),
  KEY `id_fk_ville_lieu` (`id_fk_ville_lieu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `message`
-- 

CREATE TABLE `message` (
  `id_message` int(11) NOT NULL auto_increment,
  `id_fk_hobbit_message` int(11) NOT NULL,
  `id_fk_type_message` int(11) NOT NULL,
  `date_envoi_message` datetime NOT NULL,
  `date_lecture_message` datetime default NULL,
  `expediteur_message` int(11) NOT NULL,
  `destinataires_message` varchar(1000) NOT NULL,
  `copies_message` varchar(1000) default NULL,
  `titre_message` varchar(80) NOT NULL,
  `contenu_message` text NOT NULL,
  PRIMARY KEY  (`id_message`),
  KEY `date_envoi_message` (`date_envoi_message`),
  KEY `id_fk_hobbit_message` (`id_fk_hobbit_message`),
  KEY `id_fk_type_message` (`id_fk_type_message`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `metier`
-- 

CREATE TABLE `metier` (
  `id_metier` int(11) NOT NULL auto_increment,
  `nom_masculin_metier` varchar(20) NOT NULL,
  `nom_feminin_metier` varchar(20) NOT NULL,
  `nom_systeme_metier` varchar(20) NOT NULL,
  `description_metier` mediumtext NOT NULL,
  `construction_charrette_metier` enum('oui','non') NOT NULL,
  `construction_echoppe_metier` enum('oui','non') NOT NULL default 'non',
  PRIMARY KEY  (`id_metier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `monstre`
-- 

CREATE TABLE `monstre` (
  `id_monstre` int(11) NOT NULL auto_increment,
  `id_fk_type_monstre` int(11) NOT NULL,
  `id_fk_taille_monstre` int(11) NOT NULL,
  `id_fk_groupe_monstre` int(11) default NULL,
  `x_monstre` int(11) NOT NULL,
  `y_monstre` int(11) NOT NULL,
  `id_fk_hobbit_cible_monstre` int(11) default NULL,
  `pv_restant_monstre` int(11) NOT NULL,
  `pv_max_monstre` int(11) NOT NULL,
  `pa_monstre` int(11) NOT NULL,
  `niveau_monstre` int(11) NOT NULL,
  `vue_monstre` int(11) NOT NULL,
  `vue_malus_monstre` int(11) NOT NULL,
  `force_base_monstre` int(11) NOT NULL,
  `force_bm_monstre` int(11) NOT NULL,
  `agilite_base_monstre` int(11) NOT NULL,
  `agilite_bm_monstre` int(11) NOT NULL,
  `agilite_malus_monstre` int(11) NOT NULL,
  `sagesse_base_monstre` int(11) NOT NULL,
  `sagesse_bm_monstre` int(11) NOT NULL,
  `vigueur_base_monstre` int(11) NOT NULL,
  `vigueur_bm_monstre` int(11) NOT NULL,
  `regeneration_monstre` int(11) NOT NULL,
  `regeneration_malus_monstre` int(11) NOT NULL,
  `armure_naturelle_monstre` int(11) NOT NULL,
  `date_fin_tour_monstre` datetime NOT NULL,
  `duree_prochain_tour_monstre` time NOT NULL,
  `duree_base_tour_monstre` time NOT NULL,
  `nb_kill_monstre` int(11) NOT NULL,
  `date_creation_monstre` datetime NOT NULL,
  `est_mort_monstre` enum('oui','non') NOT NULL default 'non',
  PRIMARY KEY  (`id_monstre`),
  KEY `id_fk_groupe_monstre` (`id_fk_groupe_monstre`),
  KEY `idx_x_monstre_y_monstre` (`x_monstre`,`y_monstre`),
  KEY `id_fk_type_monstre` (`id_fk_type_monstre`),
  KEY `id_fk_taille_monstre` (`id_fk_taille_monstre`),
  KEY `id_fk_hobbit_cible_monstre` (`id_fk_hobbit_cible_monstre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `mot_runique`
-- 

CREATE TABLE `mot_runique` (
  `id_mot_runique` int(11) NOT NULL auto_increment,
  `nom_systeme_mot_runique` varchar(6) NOT NULL,
  `id_fk_type_piece_mot_runique` int(11) NOT NULL,
  `suffixe_mot_runique` varchar(15) NOT NULL,
  `id_fk_type_rune_1_mot_runique` int(11) NOT NULL,
  `id_fk_type_rune_2_mot_runique` int(11) default NULL,
  `id_fk_type_rune_3_mot_runique` int(11) default NULL,
  `id_fk_type_rune_4_mot_runique` int(11) default NULL,
  `id_fk_type_rune_5_mot_runique` int(11) default NULL,
  `id_fk_type_rune_6_mot_runique` int(11) default NULL,
  `effet_mot_runique` varchar(300) NOT NULL,
  PRIMARY KEY  (`id_mot_runique`),
  UNIQUE KEY `nom_systeme_mot_runique` (`nom_systeme_mot_runique`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `nom`
-- 

CREATE TABLE `nom` (
  `id_nom` int(11) NOT NULL auto_increment,
  `nom` varchar(20) NOT NULL,
  PRIMARY KEY  (`id_nom`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `palissade`
-- 

CREATE TABLE `palissade` (
  `id_palissade` int(11) NOT NULL auto_increment,
  `x_palissade` int(11) NOT NULL,
  `y_palissade` int(11) NOT NULL,
  `agilite_palissade` int(11) NOT NULL,
  `armure_naturelle_palissade` int(11) NOT NULL,
  `pv_max_palissade` int(11) NOT NULL,
  `pv_restant_palissade` int(11) NOT NULL,
  `date_creation_palissade` datetime NOT NULL,
  `date_fin_palissade` datetime NOT NULL,
  `est_destructible_palissade` enum('oui','non') NOT NULL default 'oui',
  PRIMARY KEY  (`id_palissade`),
  UNIQUE KEY `xy_palissade` (`x_palissade`,`y_palissade`),
  KEY `date_fin_palissade` (`date_fin_palissade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `plante`
-- 

CREATE TABLE `plante` (
  `id_plante` int(11) NOT NULL auto_increment,
  `id_fk_type_plante` int(11) NOT NULL,
  `x_plante` int(11) NOT NULL,
  `y_plante` int(11) NOT NULL,
  `partie_1_plante` int(11) NOT NULL,
  `partie_2_plante` int(11) default NULL,
  `partie_3_plante` int(11) default NULL,
  `partie_4_plante` int(11) default NULL,
  PRIMARY KEY  (`id_plante`),
  KEY `idx_x_plante_y_plante` (`x_plante`,`y_plante`),
  KEY `id_fk_type_plante` (`id_fk_type_plante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `rang_communaute`
-- 

CREATE TABLE `rang_communaute` (
  `id_rang_communaute` int(11) NOT NULL auto_increment,
  `id_fk_communaute_rang_communaute` int(11) NOT NULL,
  `ordre_rang_communaute` int(11) NOT NULL,
  `nom_rang_communaute` varchar(40) NOT NULL,
  `description_rang_communaute` varchar(200) NOT NULL,
  PRIMARY KEY  (`id_rang_communaute`),
  KEY `id_fk_communaute_rang_communaute` (`id_fk_communaute_rang_communaute`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `recette_cout`
-- 

CREATE TABLE `recette_cout` (
  `id_fk_type_equipement_recette_cout` int(11) NOT NULL,
  `niveau_recette_cout` int(11) NOT NULL,
  `cuir_recette_cout` int(11) NOT NULL,
  `fourrure_recette_cout` int(11) NOT NULL,
  `planche_recette_cout` int(11) NOT NULL,
  PRIMARY KEY  (`id_fk_type_equipement_recette_cout`,`niveau_recette_cout`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `recette_cout_minerai`
-- 

CREATE TABLE `recette_cout_minerai` (
  `id_fk_type_equipement_recette_cout_minerai` int(11) NOT NULL COMMENT 'Identifiant sur la table recette_equipement',
  `id_fk_type_recette_cout_minerai` int(11) NOT NULL COMMENT 'Identifiant sur la table type_minerai',
  `niveau_recette_cout_minerai` int(11) NOT NULL,
  `quantite_recette_cout_minerai` int(11) NOT NULL,
  PRIMARY KEY  (`id_fk_type_equipement_recette_cout_minerai`,`id_fk_type_recette_cout_minerai`,`niveau_recette_cout_minerai`),
  KEY `id_fk_type_recette_cout_minerai` (`id_fk_type_recette_cout_minerai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `recette_equipements`
-- 

CREATE TABLE `recette_equipements` (
  `id_recette_equipement` int(11) NOT NULL auto_increment,
  `id_fk_type_recette_equipement` int(11) NOT NULL,
  `niveau_recette_equipement` int(11) NOT NULL,
  `poids_recette_equipement` float NOT NULL,
  `id_fk_type_qualite_recette_equipement` int(11) NOT NULL,
  `armure_recette_equipement` int(11) NOT NULL,
  `force_recette_equipement` int(11) NOT NULL,
  `agilite_recette_equipement` int(11) NOT NULL,
  `vigueur_recette_equipement` int(11) NOT NULL,
  `sagesse_recette_equipement` int(11) NOT NULL,
  `vue_recette_equipement` int(11) NOT NULL,
  `bm_attaque_recette_equipement` int(11) NOT NULL,
  `bm_degat_recette_equipement` int(11) NOT NULL,
  `bm_defense_recette_equipement` int(11) NOT NULL,
  `id_fk_type_emplacement_recette_equipement` int(11) NOT NULL,
  PRIMARY KEY  (`id_recette_equipement`),
  UNIQUE KEY `id_fk_type_recette_equipement` (`id_fk_type_recette_equipement`,`niveau_recette_equipement`,`id_fk_type_qualite_recette_equipement`),
  KEY `id_fk_type_emplacement_recette_equipement` (`id_fk_type_emplacement_recette_equipement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `recette_potions`
-- 

CREATE TABLE `recette_potions` (
  `id_fk_type_potion_recette_potion` int(11) NOT NULL,
  `id_fk_type_plante_recette_potion` int(11) NOT NULL,
  `id_fk_type_partieplante_recette_potion` int(11) NOT NULL,
  `coef_recette_potion` int(11) NOT NULL,
  PRIMARY KEY  (`id_fk_type_potion_recette_potion`,`id_fk_type_plante_recette_potion`,`id_fk_type_partieplante_recette_potion`),
  KEY `id_fk_type_plante_recette_potion` (`id_fk_type_plante_recette_potion`),
  KEY `id_fk_type_partieplante_recette_potion` (`id_fk_type_partieplante_recette_potion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `ref_monstre`
-- 

CREATE TABLE `ref_monstre` (
  `id_ref_monstre` int(11) NOT NULL auto_increment,
  `id_fk_type_ref_monstre` int(11) NOT NULL,
  `id_fk_taille_ref_monstre` int(11) NOT NULL,
  `niveau_min_ref_monstre` int(11) NOT NULL,
  `niveau_max_ref_monstre` int(11) NOT NULL,
  `pourcentage_vigueur_ref_monstre` int(11) NOT NULL,
  `pourcentage_agilite_ref_monstre` int(11) NOT NULL,
  `pourcentage_sagesse_ref_monstre` int(11) NOT NULL,
  `pourcentage_force_ref_monstre` int(11) NOT NULL,
  `vue_ref_monstre` int(11) NOT NULL,
  PRIMARY KEY  (`id_ref_monstre`),
  UNIQUE KEY `id_fk_type_taille_ref_monstre` (`id_fk_type_ref_monstre`,`id_fk_taille_ref_monstre`),
  KEY `id_fk_taille_ref_monstre` (`id_fk_taille_ref_monstre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `region`
-- 

CREATE TABLE `region` (
  `id_region` int(11) NOT NULL auto_increment,
  `nom_region` varchar(20) NOT NULL,
  `nom_systeme_region` varchar(20) NOT NULL,
  `description_region` mediumtext NOT NULL,
  `x_min_region` int(11) NOT NULL,
  `x_max_region` int(11) NOT NULL,
  `y_min_region` int(11) NOT NULL,
  `y_max_region` int(11) NOT NULL,
  `est_pvp_region` enum('oui','non') NOT NULL default 'non',
  PRIMARY KEY  (`id_region`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `stock_bois`
-- 

CREATE TABLE `stock_bois` (
  `id_stock_bois` int(11) NOT NULL auto_increment,
  `date_stock_bois` date NOT NULL,
  `nb_rondin_initial_stock_bois` int(11) NOT NULL,
  `nb_rondin_restant_stock_bois` int(11) NOT NULL,
  `prix_unitaire_vente_stock_bois` int(11) NOT NULL,
  `prix_unitaire_reprise_stock_bois` int(11) NOT NULL,
  `id_fk_region_stock_bois` int(11) NOT NULL,
  PRIMARY KEY  (`id_stock_bois`),
  UNIQUE KEY `unique` (`date_stock_bois`,`id_fk_region_stock_bois`),
  KEY `id_fk_region_stock_bois` (`id_fk_region_stock_bois`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Structure de la table `stock_minerai`
-- 

CREATE TABLE `stock_minerai` (
  `id_stock_minerai` int(11) NOT NULL auto_increment,
  `date_stock_minerai` date NOT NULL,
  `id_fk_type_stock_minerai` int(11) NOT NULL,
  `id_fk_region_stock_minerai` int(11) NOT NULL,
  `nb_brut_initial_stock_minerai` int(11) NOT NULL default '0',
  `nb_brut_restant_stock_minerai` int(11) NOT NULL,
  `prix_unitaire_vente_stock_minerai` int(11) NOT NULL,
  `prix_unitaire_reprise_stock_minerai` int(11) NOT NULL,
  PRIMARY KEY  (`id_stock_minerai`),
  UNIQUE KEY `unique` (`date_stock_minerai`,`id_fk_type_stock_minerai`,`id_fk_region_stock_minerai`),
  KEY `stock_minerai_ibfk_3` (`id_fk_type_stock_minerai`),
  KEY `stock_minerai_ibfk_4` (`id_fk_region_stock_minerai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Structure de la table `stock_partieplante`
-- 

CREATE TABLE `stock_partieplante` (
  `id_stock_partieplante` int(11) NOT NULL auto_increment,
  `date_stock_partieplante` date NOT NULL,
  `id_fk_type_stock_partieplante` int(11) NOT NULL,
  `id_fk_type_plante_stock_partieplante` int(11) NOT NULL,
  `nb_brut_initial_stock_partieplante` int(11) NOT NULL,
  `nb_brut_restant_stock_partieplante` int(11) NOT NULL,
  `prix_unitaire_vente_stock_partieplante` int(11) NOT NULL,
  `prix_unitaire_reprise_stock_partieplante` int(11) NOT NULL,
  `id_fk_region_stock_partieplante` int(11) NOT NULL,
  PRIMARY KEY  (`id_stock_partieplante`),
  UNIQUE KEY `unique` (`id_fk_type_stock_partieplante`,`id_fk_type_plante_stock_partieplante`,`date_stock_partieplante`,`id_fk_region_stock_partieplante`),
  KEY `id_fk_type_plante_stock_partieplante` (`id_fk_type_plante_stock_partieplante`),
  KEY `id_fk_region_stock_partieplante` (`id_fk_region_stock_partieplante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Structure de la table `stock_tabac`
-- 

CREATE TABLE `stock_tabac` (
  `id_stock_tabac` int(11) NOT NULL auto_increment,
  `date_stock_tabac` date NOT NULL,
  `id_fk_type_stock_tabac` int(11) NOT NULL,
  `id_fk_region_stock_tabac` int(11) NOT NULL,
  `nb_feuille_initial_stock_tabac` int(11) NOT NULL default '0',
  `nb_feuille_restant_stock_tabac` int(11) NOT NULL,
  `prix_unitaire_vente_stock_tabac` int(11) NOT NULL,
  `prix_unitaire_reprise_stock_tabac` int(11) NOT NULL,
  PRIMARY KEY  (`id_stock_tabac`),
  UNIQUE KEY `unique` (`date_stock_tabac`,`id_fk_type_stock_tabac`,`id_fk_region_stock_tabac`),
  KEY `stock_tabac_ibfk_3` (`id_fk_type_stock_tabac`),
  KEY `stock_tabac_ibfk_4` (`id_fk_region_stock_tabac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Structure de la table `taille_monstre`
-- 

CREATE TABLE `taille_monstre` (
  `id_taille_monstre` int(11) NOT NULL auto_increment,
  `nom_taille_m_monstre` varchar(20) NOT NULL COMMENT 'Nom de la taille au masculin',
  `nom_taille_f_monstre` varchar(20) NOT NULL COMMENT 'Nom de la taille au féminin',
  `pourcentage_taille_monstre` int(11) NOT NULL COMMENT 'Pourcentage d''apparition',
  PRIMARY KEY  (`id_taille_monstre`),
  UNIQUE KEY `nom_taille_f_monstre` (`nom_taille_f_monstre`),
  UNIQUE KEY `nom_taille_m_monstre` (`nom_taille_m_monstre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `testeur`
-- 

CREATE TABLE `testeur` (
  `id_testeur` int(11) NOT NULL auto_increment,
  `email_testeur` varchar(100) NOT NULL,
  PRIMARY KEY  (`id_testeur`),
  UNIQUE KEY `email_testeur` (`email_testeur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `type_emplacement`
-- 

CREATE TABLE `type_emplacement` (
  `id_type_emplacement` int(11) NOT NULL auto_increment,
  `nom_systeme_type_emplacement` varchar(20) NOT NULL,
  `nom_type_emplacement` varchar(20) NOT NULL,
  `ordre_emplacement` int(11) NOT NULL,
  PRIMARY KEY  (`id_type_emplacement`),
  KEY `nom_systeme_type_emplacement` (`nom_systeme_type_emplacement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `type_equipement`
-- 

CREATE TABLE `type_equipement` (
  `id_type_equipement` int(11) NOT NULL auto_increment,
  `nom_type_equipement` varchar(50) NOT NULL,
  `description_type_equipement` varchar(300) default NULL,
  `nb_runes_max_type_equipement` int(11) NOT NULL,
  `id_fk_metier_type_equipement` int(11) NOT NULL,
  `id_fk_type_piece_type_equipement` int(11) NOT NULL,
  PRIMARY KEY  (`id_type_equipement`),
  KEY `nom_type_equipement` (`nom_type_equipement`),
  KEY `id_fk_type_piece_type_equipement` (`id_fk_type_piece_type_equipement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `type_evenement`
-- 

CREATE TABLE `type_evenement` (
  `id_type_evenement` int(11) NOT NULL auto_increment,
  `nom_type_evenement` varchar(20) NOT NULL,
  PRIMARY KEY  (`id_type_evenement`),
  UNIQUE KEY `nom_type_evenement` (`nom_type_evenement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `type_groupe_monstre`
-- 

CREATE TABLE `type_groupe_monstre` (
  `id_type_groupe_monstre` int(11) NOT NULL auto_increment,
  `nom_groupe_monstre` varchar(20) NOT NULL,
  `nb_membres_min_type_groupe_monstre` int(11) NOT NULL,
  `nb_membres_max_type_groupe_monstre` int(11) NOT NULL,
  `repeuplement_type_groupe_monstre` enum('oui','non') NOT NULL default 'non',
  PRIMARY KEY  (`id_type_groupe_monstre`),
  UNIQUE KEY `nom_groupe_monstre` (`nom_groupe_monstre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `type_lieu`
-- 

CREATE TABLE `type_lieu` (
  `id_type_lieu` int(11) NOT NULL auto_increment,
  `nom_type_lieu` varchar(20) NOT NULL,
  `nom_systeme_type_lieu` varchar(20) NOT NULL,
  `description_type_lieu` mediumtext NOT NULL,
  `niveau_min_type_lieu` int(2) NOT NULL,
  `pa_utilisation_type_lieu` int(1) NOT NULL,
  `est_alterable_type_lieu` enum('oui','non') NOT NULL,
  `est_franchissable_type_lieu` enum('oui','non') NOT NULL,
  PRIMARY KEY  (`id_type_lieu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `type_message`
-- 

CREATE TABLE `type_message` (
  `id_type_message` int(11) NOT NULL auto_increment,
  `nom_systeme_type_message` varchar(20) NOT NULL,
  `nom_type_message` varchar(30) NOT NULL,
  PRIMARY KEY  (`id_type_message`),
  UNIQUE KEY `nom_systeme_type_message` (`nom_systeme_type_message`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `type_minerai`
-- 

CREATE TABLE `type_minerai` (
  `id_type_minerai` int(11) NOT NULL auto_increment,
  `nom_type_minerai` varchar(20) NOT NULL,
  `nom_systeme_type_minerai` varchar(10) NOT NULL,
  `description_type_minerai` varchar(200) NOT NULL,
  PRIMARY KEY  (`id_type_minerai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `type_monstre`
-- 

CREATE TABLE `type_monstre` (
  `id_type_monstre` int(11) NOT NULL auto_increment,
  `nom_type_monstre` varchar(30) NOT NULL,
  `genre_type_monstre` enum('feminin','masculin') NOT NULL COMMENT 'Genre du monstre : masculin ou féminin',
  `id_fk_type_groupe_monstre` int(11) NOT NULL,
  PRIMARY KEY  (`id_type_monstre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `type_partieplante`
-- 

CREATE TABLE `type_partieplante` (
  `id_type_partieplante` int(11) NOT NULL auto_increment,
  `nom_type_partieplante` varchar(20) NOT NULL,
  `nom_systeme_type_partieplante` varchar(10) NOT NULL,
  `description_type_partieplante` varchar(200) NOT NULL,
  PRIMARY KEY  (`id_type_partieplante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `type_piece`
-- 

CREATE TABLE `type_piece` (
  `id_type_piece` int(11) NOT NULL auto_increment,
  `nom_systeme_type_piece` varchar(10) NOT NULL,
  `nom_type_piece` varchar(10) NOT NULL,
  PRIMARY KEY  (`id_type_piece`),
  UNIQUE KEY `nom_systeme_type_piece` (`nom_systeme_type_piece`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `type_plante`
-- 

CREATE TABLE `type_plante` (
  `id_type_plante` int(11) NOT NULL auto_increment,
  `nom_type_plante` varchar(20) NOT NULL,
  `nom_systeme_type_plante` varchar(200) NOT NULL,
  `prefix_type_plante` varchar(3) NOT NULL,
  `categorie_type_plante` enum('Arbre','Buisson','Fleur') NOT NULL,
  `id_fk_environnement_type_plante` int(11) NOT NULL,
  `id_fk_partieplante1_type_plante` int(11) NOT NULL,
  `id_fk_partieplante2_type_plante` int(11) default NULL,
  `id_fk_partieplante3_type_plante` int(11) default NULL,
  `id_fk_partieplante4_type_plante` int(11) default NULL,
  PRIMARY KEY  (`id_type_plante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `type_potion`
-- 

CREATE TABLE `type_potion` (
  `id_type_potion` int(11) NOT NULL auto_increment,
  `nom_type_potion` varchar(20) NOT NULL,
  `caract_type_potion` enum('FOR','AGI','VIG','SAG','PV') NOT NULL,
  `bm_type_potion` enum('bonus','malus') NOT NULL,
  PRIMARY KEY  (`id_type_potion`),
  UNIQUE KEY `nom_type_potion` (`nom_type_potion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `type_qualite`
-- 

CREATE TABLE `type_qualite` (
  `id_type_qualite` int(11) NOT NULL auto_increment,
  `nom_systeme_type_qualite` varchar(10) NOT NULL,
  `nom_type_qualite` varchar(10) NOT NULL,
  PRIMARY KEY  (`id_type_qualite`),
  KEY `nom_systeme_type_qualite` (`nom_systeme_type_qualite`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `type_rang_communaute`
-- 

CREATE TABLE `type_rang_communaute` (
  `id_type_rang_communaute` int(11) NOT NULL auto_increment,
  `nom_type_rang_communaute` varchar(10) NOT NULL,
  PRIMARY KEY  (`id_type_rang_communaute`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `type_rune`
-- 

CREATE TABLE `type_rune` (
  `id_type_rune` int(11) NOT NULL auto_increment,
  `nom_type_rune` varchar(2) NOT NULL,
  `effet_type_rune` varchar(200) NOT NULL,
  `sagesse_type_rune` int(11) NOT NULL,
  `type_type_rune` enum('caracteristique','metier') NOT NULL,
  `niveau_type_rune` enum('a','b','c','d') NOT NULL,
  `image_type_rune` varchar(250) default NULL,
  PRIMARY KEY  (`id_type_rune`),
  UNIQUE KEY `nom_type_rune` (`nom_type_rune`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `type_tabac`
-- 

CREATE TABLE `type_tabac` (
  `id_type_tabac` int(11) NOT NULL auto_increment,
  `nom_type_tabac` varchar(20) NOT NULL,
  `nom_systeme_type_tabac` varchar(10) NOT NULL,
  `description_type_tabac` varchar(200) NOT NULL,
  PRIMARY KEY  (`id_type_tabac`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `type_titre`
-- 

CREATE TABLE `type_titre` (
  `id_type_titre` int(11) NOT NULL auto_increment,
  `nom_masculin_type_titre` varchar(15) NOT NULL,
  `nom_feminin_type_titre` varchar(15) NOT NULL,
  `nom_systeme_type_titre` varchar(8) NOT NULL,
  `description_type_titre` varchar(10) NOT NULL,
  PRIMARY KEY  (`id_type_titre`),
  UNIQUE KEY `nom_systeme_type_titre` (`nom_systeme_type_titre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Structure de la table `type_unite`
-- 

CREATE TABLE `type_unite` (
  `id_type_unite` int(11) NOT NULL auto_increment,
  `nom_systeme_type_unite` varchar(10) NOT NULL,
  `nom_type_unite` varchar(10) NOT NULL,
  `nom_pluriel_type_unite` varchar(10) NOT NULL,
  PRIMARY KEY  (`id_type_unite`),
  UNIQUE KEY `nom_systeme_type_unite` (`nom_systeme_type_unite`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `ville`
-- 

CREATE TABLE `ville` (
  `id_ville` int(11) NOT NULL auto_increment,
  `nom_ville` varchar(20) NOT NULL,
  `description_ville` varchar(200) NOT NULL,
  `nom_systeme_ville` varchar(20) NOT NULL,
  `id_fk_region_ville` int(11) NOT NULL,
  `est_capitale_ville` enum('oui','non') NOT NULL,
  `x_min_ville` int(11) NOT NULL,
  `y_min_ville` int(11) NOT NULL,
  `x_max_ville` int(11) NOT NULL,
  `y_max_ville` int(11) NOT NULL,
  PRIMARY KEY  (`id_ville`),
  KEY `id_fk_region_ville` (`id_fk_region_ville`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- 
-- Structure de la table `zone`
-- 

CREATE TABLE `zone` (
  `id_zone` int(11) NOT NULL auto_increment,
  `id_fk_environnement_zone` int(11) NOT NULL,
  `nom_zone` varchar(100) NOT NULL,
  `description_zone` varchar(100) NOT NULL,
  `image_zone` varchar(100) NOT NULL,
  `x_min_zone` int(11) NOT NULL,
  `x_max_zone` int(11) NOT NULL,
  `y_min_zone` int(11) NOT NULL,
  `y_max_zone` int(11) NOT NULL,
  PRIMARY KEY  (`id_zone`),
  KEY `id_fk_environnement_zone` (`id_fk_environnement_zone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Contraintes pour les tables exportées
-- 

-- 
-- Contraintes pour la table `boutique_bois`
-- 
ALTER TABLE `boutique_bois`
  ADD CONSTRAINT `boutique_bois_ibfk_1` FOREIGN KEY (`id_fk_lieu_boutique_bois`) REFERENCES `lieu` (`id_lieu`) ON DELETE CASCADE,
  ADD CONSTRAINT `boutique_bois_ibfk_2` FOREIGN KEY (`id_fk_hobbit_boutique_bois`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `boutique_minerai`
-- 
ALTER TABLE `boutique_minerai`
  ADD CONSTRAINT `boutique_minerai_ibfk_6` FOREIGN KEY (`id_fk_type_boutique_minerai`) REFERENCES `type_minerai` (`id_type_minerai`) ON DELETE CASCADE,
  ADD CONSTRAINT `boutique_minerai_ibfk_7` FOREIGN KEY (`id_fk_lieu_boutique_minerai`) REFERENCES `lieu` (`id_lieu`) ON DELETE CASCADE,
  ADD CONSTRAINT `boutique_minerai_ibfk_8` FOREIGN KEY (`id_fk_hobbit_boutique_minerai`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE,
  ADD CONSTRAINT `boutique_minerai_ibfk_9` FOREIGN KEY (`id_fk_region_boutique_minerai`) REFERENCES `region` (`id_region`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `boutique_partieplante`
-- 
ALTER TABLE `boutique_partieplante`
  ADD CONSTRAINT `boutique_partieplante_ibfk_5` FOREIGN KEY (`id_fk_type_boutique_partieplante`) REFERENCES `type_partieplante` (`id_type_partieplante`) ON DELETE CASCADE,
  ADD CONSTRAINT `boutique_partieplante_ibfk_6` FOREIGN KEY (`id_fk_type_plante_boutique_partieplante`) REFERENCES `type_plante` (`id_type_plante`) ON DELETE CASCADE,
  ADD CONSTRAINT `boutique_partieplante_ibfk_7` FOREIGN KEY (`id_fk_lieu_boutique_partieplante`) REFERENCES `lieu` (`id_lieu`) ON DELETE CASCADE,
  ADD CONSTRAINT `boutique_partieplante_ibfk_8` FOREIGN KEY (`id_fk_hobbit_boutique_partieplante`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE,
  ADD CONSTRAINT `boutique_partieplante_ibfk_9` FOREIGN KEY (`id_fk_region_boutique_partieplante`) REFERENCES `region` (`id_region`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `boutique_tabac`
-- 
ALTER TABLE `boutique_tabac`
  ADD CONSTRAINT `boutique_tabac_ibfk_6` FOREIGN KEY (`id_fk_type_boutique_tabac`) REFERENCES `type_tabac` (`id_type_tabac`) ON DELETE CASCADE,
  ADD CONSTRAINT `boutique_tabac_ibfk_7` FOREIGN KEY (`id_fk_lieu_boutique_tabac`) REFERENCES `lieu` (`id_lieu`) ON DELETE CASCADE,
  ADD CONSTRAINT `boutique_tabac_ibfk_8` FOREIGN KEY (`id_fk_hobbit_boutique_tabac`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE,
  ADD CONSTRAINT `boutique_tabac_ibfk_9` FOREIGN KEY (`id_fk_region_boutique_tabac`) REFERENCES `region` (`id_region`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `cadavre`
-- 
ALTER TABLE `cadavre`
  ADD CONSTRAINT `cadavre_ibfk_1` FOREIGN KEY (`id_fk_type_monstre_cadavre`) REFERENCES `type_monstre` (`id_type_monstre`);

-- 
-- Contraintes pour la table `charrette`
-- 
ALTER TABLE `charrette`
  ADD CONSTRAINT `charrette_ibfk_1` FOREIGN KEY (`id_fk_hobbit_charrette`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `coffre`
-- 
ALTER TABLE `coffre`
  ADD CONSTRAINT `coffre_ibfk_1` FOREIGN KEY (`id_fk_hobbit_coffre`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `coffre_equipement`
-- 
ALTER TABLE `coffre_equipement`
  ADD CONSTRAINT `coffre_equipement_ibfk_2` FOREIGN KEY (`id_fk_recette_coffre_equipement`) REFERENCES `recette_equipements` (`id_recette_equipement`),
  ADD CONSTRAINT `coffre_equipement_ibfk_3` FOREIGN KEY (`id_fk_hobbit_coffre_equipement`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `coffre_minerai`
-- 
ALTER TABLE `coffre_minerai`
  ADD CONSTRAINT `coffre_minerai_ibfk_2` FOREIGN KEY (`id_fk_type_coffre_minerai`) REFERENCES `type_minerai` (`id_type_minerai`),
  ADD CONSTRAINT `coffre_minerai_ibfk_3` FOREIGN KEY (`id_fk_hobbit_coffre_minerai`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `coffre_partieplante`
-- 
ALTER TABLE `coffre_partieplante`
  ADD CONSTRAINT `coffre_partieplante_ibfk_1` FOREIGN KEY (`id_fk_type_coffre_partieplante`) REFERENCES `type_partieplante` (`id_type_partieplante`),
  ADD CONSTRAINT `coffre_partieplante_ibfk_2` FOREIGN KEY (`id_fk_type_plante_coffre_partieplante`) REFERENCES `type_plante` (`id_type_plante`),
  ADD CONSTRAINT `coffre_partieplante_ibfk_3` FOREIGN KEY (`id_fk_hobbit_coffre_partieplante`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `coffre_rune`
-- 
ALTER TABLE `coffre_rune`
  ADD CONSTRAINT `coffre_rune_ibfk_1` FOREIGN KEY (`id_fk_hobbit_coffre_rune`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE,
  ADD CONSTRAINT `coffre_rune_ibfk_2` FOREIGN KEY (`id_fk_type_coffre_rune`) REFERENCES `type_rune` (`id_type_rune`);

-- 
-- Contraintes pour la table `communaute`
-- 
ALTER TABLE `communaute`
  ADD CONSTRAINT `communaute_ibfk_1` FOREIGN KEY (`id_fk_hobbit_gestionnaire_communaute`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `competence`
-- 
ALTER TABLE `competence`
  ADD CONSTRAINT `competence_ibfk_2` FOREIGN KEY (`id_fk_type_tabac_competence`) REFERENCES `type_tabac` (`id_type_tabac`) ON DELETE SET NULL,
  ADD CONSTRAINT `competence_ibfk_1` FOREIGN KEY (`id_fk_metier_competence`) REFERENCES `metier` (`id_metier`);

-- 
-- Contraintes pour la table `couple`
-- 
ALTER TABLE `couple`
  ADD CONSTRAINT `couple_ibfk_1` FOREIGN KEY (`id_fk_m_hobbit_couple`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE,
  ADD CONSTRAINT `couple_ibfk_2` FOREIGN KEY (`id_fk_f_hobbit_couple`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `echoppe`
-- 
ALTER TABLE `echoppe`
  ADD CONSTRAINT `echoppe_ibfk_1` FOREIGN KEY (`id_fk_hobbit_echoppe`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE,
  ADD CONSTRAINT `echoppe_ibfk_2` FOREIGN KEY (`id_fk_metier_echoppe`) REFERENCES `metier` (`id_metier`);

-- 
-- Contraintes pour la table `echoppe_equipement`
-- 
ALTER TABLE `echoppe_equipement`
  ADD CONSTRAINT `echoppe_equipement_ibfk_6` FOREIGN KEY (`id_fk_echoppe_echoppe_equipement`) REFERENCES `echoppe` (`id_echoppe`) ON DELETE CASCADE,
  ADD CONSTRAINT `echoppe_equipement_ibfk_7` FOREIGN KEY (`id_fk_recette_echoppe_equipement`) REFERENCES `recette_equipements` (`id_recette_equipement`),
  ADD CONSTRAINT `echoppe_equipement_ibfk_8` FOREIGN KEY (`id_fk_hobbit_vente_echoppe_equipement`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE SET NULL;

-- 
-- Contraintes pour la table `echoppe_equipement_minerai`
-- 
ALTER TABLE `echoppe_equipement_minerai`
  ADD CONSTRAINT `echoppe_equipement_minerai_ibfk_3` FOREIGN KEY (`id_fk_type_echoppe_equipement_minerai`) REFERENCES `type_minerai` (`id_type_minerai`),
  ADD CONSTRAINT `echoppe_equipement_minerai_ibfk_4` FOREIGN KEY (`id_fk_echoppe_equipement_minerai`) REFERENCES `echoppe_equipement` (`id_echoppe_equipement`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `echoppe_equipement_partieplante`
-- 
ALTER TABLE `echoppe_equipement_partieplante`
  ADD CONSTRAINT `echoppe_equipement_partieplante_ibfk_7` FOREIGN KEY (`id_fk_type_echoppe_equipement_partieplante`) REFERENCES `type_partieplante` (`id_type_partieplante`),
  ADD CONSTRAINT `echoppe_equipement_partieplante_ibfk_8` FOREIGN KEY (`id_fk_type_plante_echoppe_equipement_partieplante`) REFERENCES `type_plante` (`id_type_plante`),
  ADD CONSTRAINT `echoppe_equipement_partieplante_ibfk_9` FOREIGN KEY (`id_fk_echoppe_equipement_partieplante`) REFERENCES `echoppe_equipement` (`id_echoppe_equipement`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `echoppe_minerai`
-- 
ALTER TABLE `echoppe_minerai`
  ADD CONSTRAINT `echoppe_minerai_ibfk_1` FOREIGN KEY (`id_fk_type_echoppe_minerai`) REFERENCES `type_minerai` (`id_type_minerai`),
  ADD CONSTRAINT `echoppe_minerai_ibfk_2` FOREIGN KEY (`id_fk_echoppe_echoppe_minerai`) REFERENCES `echoppe` (`id_echoppe`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `echoppe_partieplante`
-- 
ALTER TABLE `echoppe_partieplante`
  ADD CONSTRAINT `echoppe_partieplante_ibfk_5` FOREIGN KEY (`id_fk_type_echoppe_partieplante`) REFERENCES `type_partieplante` (`id_type_partieplante`),
  ADD CONSTRAINT `echoppe_partieplante_ibfk_6` FOREIGN KEY (`id_fk_type_plante_echoppe_partieplante`) REFERENCES `type_plante` (`id_type_plante`),
  ADD CONSTRAINT `echoppe_partieplante_ibfk_7` FOREIGN KEY (`id_fk_echoppe_echoppe_partieplante`) REFERENCES `echoppe` (`id_echoppe`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `echoppe_potion`
-- 
ALTER TABLE `echoppe_potion`
  ADD CONSTRAINT `echoppe_potion_ibfk_21` FOREIGN KEY (`id_fk_echoppe_echoppe_potion`) REFERENCES `echoppe` (`id_echoppe`) ON DELETE CASCADE,
  ADD CONSTRAINT `echoppe_potion_ibfk_22` FOREIGN KEY (`id_fk_type_qualite_echoppe_potion`) REFERENCES `type_qualite` (`id_type_qualite`),
  ADD CONSTRAINT `echoppe_potion_ibfk_23` FOREIGN KEY (`id_fk_type_potion_echoppe_potion`) REFERENCES `type_potion` (`id_type_potion`),
  ADD CONSTRAINT `echoppe_potion_ibfk_24` FOREIGN KEY (`id_fk_hobbit_vente_echoppe_potion`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE SET NULL;

-- 
-- Contraintes pour la table `echoppe_potion_minerai`
-- 
ALTER TABLE `echoppe_potion_minerai`
  ADD CONSTRAINT `echoppe_potion_minerai_ibfk_3` FOREIGN KEY (`id_fk_type_echoppe_potion_minerai`) REFERENCES `type_minerai` (`id_type_minerai`),
  ADD CONSTRAINT `echoppe_potion_minerai_ibfk_4` FOREIGN KEY (`id_fk_echoppe_potion_minerai`) REFERENCES `echoppe_potion` (`id_echoppe_potion`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `echoppe_potion_partieplante`
-- 
ALTER TABLE `echoppe_potion_partieplante`
  ADD CONSTRAINT `echoppe_potion_partieplante_ibfk_7` FOREIGN KEY (`id_fk_type_echoppe_potion_partieplante`) REFERENCES `type_partieplante` (`id_type_partieplante`),
  ADD CONSTRAINT `echoppe_potion_partieplante_ibfk_8` FOREIGN KEY (`id_fk_type_plante_echoppe_potion_partieplante`) REFERENCES `type_plante` (`id_type_plante`),
  ADD CONSTRAINT `echoppe_potion_partieplante_ibfk_9` FOREIGN KEY (`id_fk_echoppe_potion_partieplante`) REFERENCES `echoppe_potion` (`id_echoppe_potion`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `effet_mot_f`
-- 
ALTER TABLE `effet_mot_f`
  ADD CONSTRAINT `effet_mot_f_ibfk_1` FOREIGN KEY (`id_fk_hobbit_effet_mot_f`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `effet_potion_hobbit`
-- 
ALTER TABLE `effet_potion_hobbit`
  ADD CONSTRAINT `effet_potion_hobbit_ibfk_4` FOREIGN KEY (`id_fk_type_potion_effet_potion_hobbit`) REFERENCES `type_potion` (`id_type_potion`),
  ADD CONSTRAINT `effet_potion_hobbit_ibfk_5` FOREIGN KEY (`id_fk_hobbit_cible_effet_potion_hobbit`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE,
  ADD CONSTRAINT `effet_potion_hobbit_ibfk_6` FOREIGN KEY (`id_fk_hobbit_lanceur_effet_potion_hobbit`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE,
  ADD CONSTRAINT `effet_potion_hobbit_ibfk_7` FOREIGN KEY (`id_fk_type_qualite_effet_potion_hobbit`) REFERENCES `type_qualite` (`id_type_qualite`);

-- 
-- Contraintes pour la table `effet_potion_monstre`
-- 
ALTER TABLE `effet_potion_monstre`
  ADD CONSTRAINT `effet_potion_monstre_ibfk_11` FOREIGN KEY (`id_fk_type_potion_effet_potion_monstre`) REFERENCES `type_potion` (`id_type_potion`),
  ADD CONSTRAINT `effet_potion_monstre_ibfk_12` FOREIGN KEY (`id_fk_monstre_cible_effet_potion_monstre`) REFERENCES `monstre` (`id_monstre`) ON DELETE CASCADE,
  ADD CONSTRAINT `effet_potion_monstre_ibfk_13` FOREIGN KEY (`id_fk_hobbit_lanceur_effet_potion_monstre`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE,
  ADD CONSTRAINT `effet_potion_monstre_ibfk_14` FOREIGN KEY (`id_fk_type_qualite_effet_potion_monstre`) REFERENCES `type_qualite` (`id_type_qualite`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `element_equipement`
-- 
ALTER TABLE `element_equipement`
  ADD CONSTRAINT `element_equipement_ibfk_2` FOREIGN KEY (`id_fk_recette_element_equipement`) REFERENCES `recette_equipements` (`id_recette_equipement`);

-- 
-- Contraintes pour la table `element_minerai`
-- 
ALTER TABLE `element_minerai`
  ADD CONSTRAINT `element_minerai_ibfk_2` FOREIGN KEY (`id_fk_type_element_minerai`) REFERENCES `type_minerai` (`id_type_minerai`);

-- 
-- Contraintes pour la table `element_partieplante`
-- 
ALTER TABLE `element_partieplante`
  ADD CONSTRAINT `element_partieplante_ibfk_1` FOREIGN KEY (`id_fk_type_element_partieplante`) REFERENCES `type_partieplante` (`id_type_partieplante`),
  ADD CONSTRAINT `element_partieplante_ibfk_2` FOREIGN KEY (`id_fk_type_plante_element_partieplante`) REFERENCES `type_plante` (`id_type_plante`);

-- 
-- Contraintes pour la table `element_potion`
-- 
ALTER TABLE `element_potion`
  ADD CONSTRAINT `element_potion_ibfk_3` FOREIGN KEY (`id_fk_type_element_potion`) REFERENCES `type_potion` (`id_type_potion`),
  ADD CONSTRAINT `element_potion_ibfk_5` FOREIGN KEY (`id_fk_type_qualite_element_potion`) REFERENCES `type_qualite` (`id_type_qualite`);

-- 
-- Contraintes pour la table `element_rune`
-- 
ALTER TABLE `element_rune`
  ADD CONSTRAINT `element_rune_ibfk_2` FOREIGN KEY (`id_fk_type_element_rune`) REFERENCES `type_rune` (`id_type_rune`);

-- 
-- Contraintes pour la table `equipement_rune`
-- 
ALTER TABLE `equipement_rune`
  ADD CONSTRAINT `equipement_rune_ibfk_1` FOREIGN KEY (`id_fk_type_rune_equipement_rune`) REFERENCES `type_rune` (`id_type_rune`);

-- 
-- Contraintes pour la table `evenement`
-- 
ALTER TABLE `evenement`
  ADD CONSTRAINT `evenement_ibfk_5` FOREIGN KEY (`id_fk_hobbit_evenement`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `filon`
-- 
ALTER TABLE `filon`
  ADD CONSTRAINT `filon_ibfk_1` FOREIGN KEY (`id_fk_type_minerai_filon`) REFERENCES `type_minerai` (`id_type_minerai`);

-- 
-- Contraintes pour la table `gardiennage`
-- 
ALTER TABLE `gardiennage`
  ADD CONSTRAINT `gardiennage_ibfk_1` FOREIGN KEY (`id_fk_hobbit_gardiennage`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE,
  ADD CONSTRAINT `gardiennage_ibfk_2` FOREIGN KEY (`id_fk_gardien_gardiennage`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `groupe_monstre`
-- 
ALTER TABLE `groupe_monstre`
  ADD CONSTRAINT `groupe_monstre_ibfk_1` FOREIGN KEY (`id_fk_type_groupe_monstre`) REFERENCES `type_groupe_monstre` (`id_type_groupe_monstre`),
  ADD CONSTRAINT `groupe_monstre_ibfk_2` FOREIGN KEY (`id_fk_hobbit_cible_groupe_monstre`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE SET NULL;

-- 
-- Contraintes pour la table `hobbit`
-- 
ALTER TABLE `hobbit`
  ADD CONSTRAINT `hobbit_ibfk_4` FOREIGN KEY (`id_fk_rang_communaute_hobbit`) REFERENCES `rang_communaute` (`id_rang_communaute`) ON DELETE SET NULL,
  ADD CONSTRAINT `hobbit_ibfk_3` FOREIGN KEY (`id_fk_communaute_hobbit`) REFERENCES `communaute` (`id_communaute`) ON DELETE SET NULL;

-- 
-- Contraintes pour la table `hobbits_competences`
-- 
ALTER TABLE `hobbits_competences`
  ADD CONSTRAINT `hobbits_competences_ibfk_1` FOREIGN KEY (`id_fk_hobbit_hcomp`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE,
  ADD CONSTRAINT `hobbits_competences_ibfk_2` FOREIGN KEY (`id_fk_competence_hcomp`) REFERENCES `competence` (`id_competence`);

-- 
-- Contraintes pour la table `hobbits_equipement`
-- 
ALTER TABLE `hobbits_equipement`
  ADD CONSTRAINT `hobbits_equipement_ibfk_5` FOREIGN KEY (`id_fk_hobbit_hequipement`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE,
  ADD CONSTRAINT `hobbits_equipement_ibfk_6` FOREIGN KEY (`id_fk_recette_hequipement`) REFERENCES `recette_equipements` (`id_recette_equipement`);

-- 
-- Contraintes pour la table `hobbits_metiers`
-- 
ALTER TABLE `hobbits_metiers`
  ADD CONSTRAINT `hobbits_metiers_ibfk_4` FOREIGN KEY (`id_fk_hobbit_hmetier`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE,
  ADD CONSTRAINT `hobbits_metiers_ibfk_5` FOREIGN KEY (`id_fk_metier_hmetier`) REFERENCES `metier` (`id_metier`);

-- 
-- Contraintes pour la table `hobbits_titres`
-- 
ALTER TABLE `hobbits_titres`
  ADD CONSTRAINT `hobbits_titres_ibfk_1` FOREIGN KEY (`id_fk_hobbit_htitre`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE,
  ADD CONSTRAINT `hobbits_titres_ibfk_2` FOREIGN KEY (`id_fk_type_htitre`) REFERENCES `type_titre` (`id_type_titre`);

-- 
-- Contraintes pour la table `laban`
-- 
ALTER TABLE `laban`
  ADD CONSTRAINT `laban_ibfk_1` FOREIGN KEY (`id_fk_hobbit_laban`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `laban_equipement`
-- 
ALTER TABLE `laban_equipement`
  ADD CONSTRAINT `laban_equipement_ibfk_2` FOREIGN KEY (`id_fk_recette_laban_equipement`) REFERENCES `recette_equipements` (`id_recette_equipement`),
  ADD CONSTRAINT `laban_equipement_ibfk_3` FOREIGN KEY (`id_fk_hobbit_laban_equipement`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `laban_minerai`
-- 
ALTER TABLE `laban_minerai`
  ADD CONSTRAINT `laban_minerai_ibfk_2` FOREIGN KEY (`id_fk_type_laban_minerai`) REFERENCES `type_minerai` (`id_type_minerai`),
  ADD CONSTRAINT `laban_minerai_ibfk_3` FOREIGN KEY (`id_fk_hobbit_laban_minerai`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `laban_partieplante`
-- 
ALTER TABLE `laban_partieplante`
  ADD CONSTRAINT `laban_partieplante_ibfk_1` FOREIGN KEY (`id_fk_type_laban_partieplante`) REFERENCES `type_partieplante` (`id_type_partieplante`),
  ADD CONSTRAINT `laban_partieplante_ibfk_2` FOREIGN KEY (`id_fk_type_plante_laban_partieplante`) REFERENCES `type_plante` (`id_type_plante`),
  ADD CONSTRAINT `laban_partieplante_ibfk_3` FOREIGN KEY (`id_fk_hobbit_laban_partieplante`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `laban_potion`
-- 
ALTER TABLE `laban_potion`
  ADD CONSTRAINT `laban_potion_ibfk_3` FOREIGN KEY (`id_fk_type_laban_potion`) REFERENCES `type_potion` (`id_type_potion`),
  ADD CONSTRAINT `laban_potion_ibfk_4` FOREIGN KEY (`id_fk_hobbit_laban_potion`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE,
  ADD CONSTRAINT `laban_potion_ibfk_5` FOREIGN KEY (`id_fk_type_qualite_laban_potion`) REFERENCES `type_qualite` (`id_type_qualite`);

-- 
-- Contraintes pour la table `laban_rune`
-- 
ALTER TABLE `laban_rune`
  ADD CONSTRAINT `laban_rune_ibfk_1` FOREIGN KEY (`id_fk_hobbit_laban_rune`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE,
  ADD CONSTRAINT `laban_rune_ibfk_2` FOREIGN KEY (`id_fk_type_laban_rune`) REFERENCES `type_rune` (`id_type_rune`);

-- 
-- Contraintes pour la table `laban_tabac`
-- 
ALTER TABLE `laban_tabac`
  ADD CONSTRAINT `laban_tabac_ibfk_2` FOREIGN KEY (`id_fk_type_laban_tabac`) REFERENCES `type_tabac` (`id_type_tabac`),
  ADD CONSTRAINT `laban_tabac_ibfk_3` FOREIGN KEY (`id_fk_hobbit_laban_tabac`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `lieu`
-- 
ALTER TABLE `lieu`
  ADD CONSTRAINT `lieu_ibfk_3` FOREIGN KEY (`id_fk_type_lieu`) REFERENCES `type_lieu` (`id_type_lieu`),
  ADD CONSTRAINT `lieu_ibfk_4` FOREIGN KEY (`id_fk_ville_lieu`) REFERENCES `ville` (`id_ville`);

-- 
-- Contraintes pour la table `message`
-- 
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`id_fk_hobbit_message`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE CASCADE,
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`id_fk_type_message`) REFERENCES `type_message` (`id_type_message`);

-- 
-- Contraintes pour la table `monstre`
-- 
ALTER TABLE `monstre`
  ADD CONSTRAINT `monstre_ibfk_10` FOREIGN KEY (`id_fk_groupe_monstre`) REFERENCES `groupe_monstre` (`id_groupe_monstre`),
  ADD CONSTRAINT `monstre_ibfk_11` FOREIGN KEY (`id_fk_hobbit_cible_monstre`) REFERENCES `hobbit` (`id_hobbit`) ON DELETE SET NULL,
  ADD CONSTRAINT `monstre_ibfk_8` FOREIGN KEY (`id_fk_type_monstre`) REFERENCES `type_monstre` (`id_type_monstre`),
  ADD CONSTRAINT `monstre_ibfk_9` FOREIGN KEY (`id_fk_taille_monstre`) REFERENCES `taille_monstre` (`id_taille_monstre`);

-- 
-- Contraintes pour la table `plante`
-- 
ALTER TABLE `plante`
  ADD CONSTRAINT `plante_ibfk_1` FOREIGN KEY (`id_fk_type_plante`) REFERENCES `type_plante` (`id_type_plante`);

-- 
-- Contraintes pour la table `rang_communaute`
-- 
ALTER TABLE `rang_communaute`
  ADD CONSTRAINT `rang_communaute_ibfk_1` FOREIGN KEY (`id_fk_communaute_rang_communaute`) REFERENCES `communaute` (`id_communaute`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `recette_cout`
-- 
ALTER TABLE `recette_cout`
  ADD CONSTRAINT `recette_cout_ibfk_1` FOREIGN KEY (`id_fk_type_equipement_recette_cout`) REFERENCES `type_equipement` (`id_type_equipement`);

-- 
-- Contraintes pour la table `recette_cout_minerai`
-- 
ALTER TABLE `recette_cout_minerai`
  ADD CONSTRAINT `recette_cout_minerai_ibfk_1` FOREIGN KEY (`id_fk_type_equipement_recette_cout_minerai`) REFERENCES `type_equipement` (`id_type_equipement`),
  ADD CONSTRAINT `recette_cout_minerai_ibfk_2` FOREIGN KEY (`id_fk_type_recette_cout_minerai`) REFERENCES `type_minerai` (`id_type_minerai`);

-- 
-- Contraintes pour la table `recette_equipements`
-- 
ALTER TABLE `recette_equipements`
  ADD CONSTRAINT `recette_equipements_ibfk_1` FOREIGN KEY (`id_fk_type_recette_equipement`) REFERENCES `type_equipement` (`id_type_equipement`),
  ADD CONSTRAINT `recette_equipements_ibfk_2` FOREIGN KEY (`id_fk_type_emplacement_recette_equipement`) REFERENCES `type_emplacement` (`id_type_emplacement`);

-- 
-- Contraintes pour la table `recette_potions`
-- 
ALTER TABLE `recette_potions`
  ADD CONSTRAINT `recette_potions_ibfk_6` FOREIGN KEY (`id_fk_type_potion_recette_potion`) REFERENCES `type_potion` (`id_type_potion`),
  ADD CONSTRAINT `recette_potions_ibfk_7` FOREIGN KEY (`id_fk_type_plante_recette_potion`) REFERENCES `type_plante` (`id_type_plante`),
  ADD CONSTRAINT `recette_potions_ibfk_8` FOREIGN KEY (`id_fk_type_partieplante_recette_potion`) REFERENCES `type_partieplante` (`id_type_partieplante`);

-- 
-- Contraintes pour la table `ref_monstre`
-- 
ALTER TABLE `ref_monstre`
  ADD CONSTRAINT `ref_monstre_ibfk_1` FOREIGN KEY (`id_fk_type_ref_monstre`) REFERENCES `type_monstre` (`id_type_monstre`),
  ADD CONSTRAINT `ref_monstre_ibfk_2` FOREIGN KEY (`id_fk_taille_ref_monstre`) REFERENCES `taille_monstre` (`id_taille_monstre`);

-- 
-- Contraintes pour la table `stock_bois`
-- 
ALTER TABLE `stock_bois`
  ADD CONSTRAINT `stock_bois_ibfk_1` FOREIGN KEY (`id_fk_region_stock_bois`) REFERENCES `region` (`id_region`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `stock_minerai`
-- 
ALTER TABLE `stock_minerai`
  ADD CONSTRAINT `stock_minerai_ibfk_3` FOREIGN KEY (`id_fk_type_stock_minerai`) REFERENCES `type_minerai` (`id_type_minerai`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_minerai_ibfk_4` FOREIGN KEY (`id_fk_region_stock_minerai`) REFERENCES `region` (`id_region`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `stock_partieplante`
-- 
ALTER TABLE `stock_partieplante`
  ADD CONSTRAINT `stock_partieplante_ibfk_8` FOREIGN KEY (`id_fk_type_stock_partieplante`) REFERENCES `type_partieplante` (`id_type_partieplante`),
  ADD CONSTRAINT `stock_partieplante_ibfk_9` FOREIGN KEY (`id_fk_type_plante_stock_partieplante`) REFERENCES `type_plante` (`id_type_plante`);

-- 
-- Contraintes pour la table `stock_tabac`
-- 
ALTER TABLE `stock_tabac`
  ADD CONSTRAINT `stock_tabac_ibfk_3` FOREIGN KEY (`id_fk_type_stock_tabac`) REFERENCES `type_tabac` (`id_type_tabac`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_tabac_ibfk_4` FOREIGN KEY (`id_fk_region_stock_tabac`) REFERENCES `region` (`id_region`) ON DELETE CASCADE;

-- 
-- Contraintes pour la table `type_equipement`
-- 
ALTER TABLE `type_equipement`
  ADD CONSTRAINT `type_equipement_ibfk_1` FOREIGN KEY (`id_fk_type_piece_type_equipement`) REFERENCES `type_piece` (`id_type_piece`);

-- 
-- Contraintes pour la table `ville`
-- 
ALTER TABLE `ville`
  ADD CONSTRAINT `ville_ibfk_1` FOREIGN KEY (`id_fk_region_ville`) REFERENCES `region` (`id_region`);

-- 
-- Contraintes pour la table `zone`
-- 
ALTER TABLE `zone`
  ADD CONSTRAINT `zone_ibfk_1` FOREIGN KEY (`id_fk_environnement_zone`) REFERENCES `environnement` (`id_environnement`);
