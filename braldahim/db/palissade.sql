-- phpMyAdmin SQL Dump-- version 2.9.2-- http://www.phpmyadmin.net-- -- Serveur: localhost-- G�n�r� le : Jeudi 08 Novembre 2007 � 17:20-- Version du serveur: 5.0.33-- Version de PHP: 5.2.0-- -- Base de donn�es: `braldahim`-- -- ---------------------------------------------------------- -- Structure de la table `palissade`-- CREATE TABLE `palissade` (  `id_palissade` int(11) NOT NULL auto_increment,  `x_palissade` int(11) NOT NULL,  `y_palissade` int(11) NOT NULL,  `agilite_palissade` int(11) NOT NULL,  `armure_naturelle_palissade` int(11) NOT NULL,  `pv_palissade` int(11) NOT NULL,  `date_creation_palissade` datetime NOT NULL,  `date_fin_palissade` datetime NOT NULL,  PRIMARY KEY  (`id_palissade`),  KEY `xy_palissade` (`x_palissade`,`y_palissade`)) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;-- -- Contenu de la table `palissade`-- 