<?php

/**
 * This file is part of Braldahim, under Gnu Public Licence v3.
 * See licence.txt or http://www.gnu.org/licenses/gpl-3.0.html
 *
 * $Id: $
 * $Author: $
 * $LastChangedDate: $
 * $LastChangedRevision: $
 * $LastChangedBy: $
 */
class Bral_Monstres_Competences_Factory {

	public static function getAction($competence, &$monstre, $cible, $view) {
		Zend_Loader::loadClass("Bral_Monstres_Competences_Attaque");
		Zend_Loader::loadClass("Bral_Monstres_Competences_Attaquer");
		Zend_Loader::loadClass("Bral_Monstres_Competences_Fuite");
		
		$construct = "Bral_Monstres_Competences_".Bral_Util_String::firstToUpper($competence["nom_systeme_mcompetence"]);
		try {
			Zend_Loader::loadClass($construct);
		} catch(Exception $e) {
			throw new Zend_Exception("Bral_Monstres_Competences_Factory construct invalide (classe): ".$competence["nom_systeme_mcompetence"]);
		}

		// verification que la classe de l'action existe.
		if (($construct != null) && (class_exists($construct))) {
			return new $construct ($competence, &$monstre, $cible, $view);
		} else {
			throw new Zend_Exception("Bral_Monstres_Competences_Factory action invalide: ".$competence["nom_systeme_mcompetence"]);
		}
	}
}