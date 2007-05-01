<?php

class Bral_Box_CompetencesBasiques {
	
	function __construct($request, $view) {
		$this->_request = $request;
		$this->view = $view;
	}
	
	function getTitreOnglet() {
		return "Basiques";
	}
	
	function getNomInterne() {
		return "competences_basiques";		
	}
	
	function setDisplay($display) {
		$this->view->display = $display;
	}
	
	function render() {
		$this->view->nom_interne = $this->getNomInterne();
		return $this->view->render("interface/competences_basiques.phtml");
	}
}
?>