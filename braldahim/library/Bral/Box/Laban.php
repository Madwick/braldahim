<?php

class Bral_Box_Laban {

	function __construct($request, $view, $interne) {
		Zend_Loader::loadClass('Laban');
		Zend_Loader::loadClass('LabanMinerai');
		Zend_Loader::loadClass('LabanPartieplante');
		Zend_Loader::loadClass('LabanRune');
		$this->_request = $request;
		$this->view = $view;
		$this->view->affichageInterne = $interne;
	}

	function getTitreOnglet() {
		return "Laban";
	}

	function getNomInterne() {
		return "box_laban";
	}

	function setDisplay($display) {
		$this->view->display = $display;
	}

	function render() {
		$tabPartiePlantes = null;
		$labanPartiePlanteTable = new LabanPartieplante();
		$partiePlantes = $labanPartiePlanteTable->findByIdHobbit($this->view->user->id_hobbit);

		foreach ($partiePlantes as $p) {
			$tabPartiePlantes[] = array(
			"nom_type" => $p["nom_type_partieplante"],
			"quantite" => $p["quantite_laban_partieplante"],
			);
		}

		$tabMinerais = null;
		$labanMineraiTable = new LabanMinerai();
		$minerais = $labanMineraiTable->findByIdHobbit($this->view->user->id_hobbit);

		foreach ($minerais as $m) {
			$tabMinerais[] = array(
			"type" => $m["nom_type_minerai"],
			"quantite" => $m["quantite_laban_minerai"],
			);
		}

		$tabLaban = null;
		$labanTable = new Laban();
		$laban = $labanTable->findByIdHobbit($this->view->user->id_hobbit);
		
		foreach ($laban as $p) {
			$tabLaban = array(
			"nb_peau" => $p["quantite_peau_laban"],
			"nb_fourrure" => $p["quantite_fourrure_laban"],
			"nb_viande" => $p["quantite_viande_laban"],
			"nb_viande_preparee" => $p["quantite_viande_preparee_laban"],
			"nb_ration" => $p["quantite_ration_laban"],
			);
		}
		
		$tabRunes = null;
		$labanRuneTable = new LabanRune();
		$runes = $labanRuneTable->findByIdHobbit($this->view->user->id_hobbit);

		foreach ($runes as $r) {
			$tabRunes[] = array(
			"id_rune" => $r["id_rune_laban_rune"],
			"type" => $r["nom_type_rune"],
			"image" => $r["image_type_rune"],
			"est_identifiee" => $r["est_identifiee_rune"]
			);
		}
		
		$this->view->nb_partieplantes = count($tabPartiePlantes);
		$this->view->partieplantes = $tabPartiePlantes;
		$this->view->nb_minerais = count($tabMinerais);
		$this->view->minerais = $tabMinerais;
		$this->view->nb_runes = count($tabRunes);
		$this->view->runes = $tabRunes;
		$this->view->laban = $tabLaban;
		$this->view->nom_interne = $this->getNomInterne();
		
		return $this->view->render("interface/laban.phtml");
	}
}
