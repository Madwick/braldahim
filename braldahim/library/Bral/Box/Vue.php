<?php

class Bral_Box_Vue {

	function __construct($request, $view, $interne) {
		Zend_Loader::loadClass("Lieu");
		Zend_Loader::loadClass("TypeLieu");
		Zend_Loader::loadClass("Ville");
		Zend_Loader::loadClass("Region");

		$this->_request = $request;
		$this->view = $view;
		$this->view->affichageInterne = $interne;
		$this->prepare();
		$this->deplacement();
	}

	function getTitreOnglet() {
		return "Vue";
	}

	function getNomInterne() {
		return "box_vue";
	}

	function setDisplay($display) {
		$this->view->display = $display;
	}

	function render() {
		$this->data();
		$this->view->nom_interne = $this->getNomInterne();
		return $this->view->render("interface/vue.phtml");
	}

	private function prepare() {
		$this->view->nb_cases = $this->view->user->vue_base_hobbit + $this->view->user->vue_bm_hobbit;
		$this->view->x_min = $this->view->user->x_hobbit - $this->view->nb_cases;
		$this->view->x_max = $this->view->user->x_hobbit + $this->view->nb_cases;
		$this->view->y_min = $this->view->user->y_hobbit - $this->view->nb_cases;
		$this->view->y_max = $this->view->user->y_hobbit + $this->view->nb_cases;

		if (($this->_request->get("caction") == "box_vue") && ($this->_request->get("valeur_1") != "")) { // si le joueur a cliqu? sur une icone
			$this->deplacement = $this->_request->get("valeur_1");
			$this->view->centre_x = $this->get_deplacement_verif($this->view->x_min, $this->view->x_max, $this->_request->get("valeur_2"), 0);
			$this->view->centre_y = $this->get_deplacement_verif($this->view->y_min, $this->view->y_max, $this->_request->get("valeur_3"), 0);
		} else {
			$this->view->centre_x = $this->view->user->x_hobbit;
			$this->view->centre_y = $this->view->user->y_hobbit;
		}
	}

	private function deplacement() {
		switch ($this->_request->get("valeur_1")) {
			case "hg" :
				$this->view->centre_x = $this->get_deplacement_verif($this->view->x_min, $this->view->x_max, $this->view->centre_x, -1);
				$this->view->centre_y = $this->get_deplacement_verif($this->view->y_min, $this->view->y_max, $this->view->centre_y, +1);
				break;
			case "h" :
				$this->view->centre_y = $this->get_deplacement_verif($this->view->y_min, $this->view->y_max, $this->view->centre_y, +1);
				break;
			case "hd" :
				$this->view->centre_x = $this->get_deplacement_verif($this->view->x_min, $this->view->x_max, $this->view->centre_x, +1);
				$this->view->centre_y = $this->get_deplacement_verif($this->view->y_min, $this->view->y_max, $this->view->centre_y, +1);
				break;
			case "g" :
				$this->view->centre_x = $this->get_deplacement_verif($this->view->x_min, $this->view->x_max, $this->view->centre_x, -1);
				break;
			case "d" :
				$this->view->centre_x = $this->get_deplacement_verif($this->view->x_min, $this->view->x_max, $this->view->centre_x, +1);
				break;
			case "bg" :
				$this->view->centre_x = $this->get_deplacement_verif($this->view->x_min, $this->view->x_max, $this->view->centre_x, +1);
				$this->view->centre_y = $this->get_deplacement_verif($this->view->y_min, $this->view->y_max, $this->view->centre_y, -1);
				break;
			case "b" :
				$this->view->centre_y = $this->get_deplacement_verif($this->view->y_min, $this->view->y_max, $this->view->centre_y, -1);
				break;
			case "bd" :
				$this->view->centre_x = $this->get_deplacement_verif($this->view->x_min, $this->view->x_max, $this->view->centre_x, +1);
				$this->view->centre_y = $this->get_deplacement_verif($this->view->y_min, $this->view->y_max, $this->view->centre_y, -1);
				break;
			default :
				return null;
		}
		$this->view->centre_x_min = $this->view->centre_x - $this->view->config->game->box_vue_taille;
		$this->view->centre_x_max = $this->view->centre_x + $this->view->config->game->box_vue_taille;
		$this->view->centre_y_min = $this->view->centre_y - $this->view->config->game->box_vue_taille;
		$this->view->centre_y_max = $this->view->centre_y + $this->view->config->game->box_vue_taille;
	}

	private function get_deplacement_verif($min, $max, $centre, $offset) {
		if (intval($centre) != $centre) {
			throw new Exception("Valeur invalide : $centre <-> intval($centre)");
		}
		if ($centre + $offset < $min) {
			return $centre;
		}
		if ($centre + $offset > $max) {
			return $centre;
		}
		return $centre + $offset;
	}

	private function data() {
		Zend_Loader::loadClass('zone');
		$zoneTable = new Zone();
		$zones = $zoneTable->selectVue($this->view->x_min, $this->view->y_min, $this->view->x_max, $this->view->y_max);
		$hobbitTable = new Hobbit();
		$hobbits = $hobbitTable->selectVue($this->view->x_min, $this->view->y_min, $this->view->x_max, $this->view->y_max);
		$lieuxTable = new Lieu();
		$lieux = $lieuxTable->selectVue($this->view->x_min, $this->view->y_min, $this->view->x_max, $this->view->y_max);

		$centre_x_min = $this->view->centre_x - $this->view->config->game->box_vue_taille;
		$centre_x_max = $this->view->centre_x + $this->view->config->game->box_vue_taille;
		$centre_y_min = $this->view->centre_y - $this->view->config->game->box_vue_taille;
		$centre_y_max = $this->view->centre_y + $this->view->config->game->box_vue_taille;


		for ($j = $centre_y_max; $j >= $centre_y_min; $j --) {
			$change_level = true;
			for ($i = $centre_x_min; $i <= $centre_x_max; $i ++) {
				$display_x = $i;
				$display_y = $j;
				$tabHobbits = null;
				$tabLieux = null;
				$nom_systeme_environnement = null;
				$nom_environnement = null;
				$nom_zone = null;
				$description_zone = null;
					
				if (($j > $this->view->y_max) || ($j < $this->view->y_min) ||
				($i < $this->view->x_min) || ($i > $this->view->x_max)) {
					$nom_systeme_environnement = "inconnu";
				} else {
					foreach($zones as $z) {
						if ($display_x >= $z["x_min_zone"] &&
						$display_x <= $z["x_max_zone"] &&
						$display_y >= $z["y_min_zone"] &&
						$display_y <= $z["y_max_zone"]) {
							$nom_zone = $z["nom_zone"];
							$description_zone = $z["description_zone"];
							$nom_systeme_environnement = $z["nom_systeme_environnement"];
							$nom_environnement = htmlentities($z["nom_environnement"]);
							break;
						}
					}

					foreach($hobbits as $h) {
						if ($display_x == $h["x_hobbit"] && $display_y == $h["y_hobbit"]) {
							$tabHobbits[] = array("id_hobbit" => $h["id"], "nom_hobbit" => $h["nom_hobbit"]);
						}
					}

					foreach($lieux as $l) {
						if ($display_x == $l["x_lieu"] && $display_y == $l["y_lieu"]) {
							$tabLieux[] = array("id_lieu" => $l["id"], "nom_lieu" => $l["nom_lieu"], "nom_type_lieu" => $l["nom_type_lieu"]);
						}
					}
				}

				if ($this->view->user->x_hobbit == $display_x && $this->view->user->y_hobbit == $display_y) { // Position du joueur
					$actuelle = true;
					$css = "actuelle";
					$this->view->environnement = $nom_environnement;
				} else {
					$actuelle = false;
					$css = $nom_systeme_environnement;
				}

				if ($this->view->centre_x == $display_x && $this->view->centre_y == $display_y) {
					$this->view->centre_environnement = $nom_environnement;
				}

				$tab = array ("x" => $display_x, "y" => $display_y, //
				"change_level" => $change_level, // nouvelle ligne dans le tableau ;
				"position_actuelle" => $actuelle,
				"nom_zone" => $nom_zone,
				"description_zone" => $nom_zone,
				"css" => $css,
				"n_hobbits" => count($tabHobbits),
				"hobbits" => $tabHobbits,
				"n_lieux" => count($tabLieux),
				"lieux" => $tabLieux,
				);
				$tableau[] = $tab;
				if ($change_level) {
					$change_level = false;
				}
			}
		}

		$this->view->tableau = $tableau;
	}
}
