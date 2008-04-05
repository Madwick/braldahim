<?php

abstract class Bral_Competences_Competence {
	
	protected $view;
	
	function __construct($competence, $hobbitCompetence, $request, $view, $action) {
		Zend_Loader::loadClass("Bral_Util_Evenement");
		
		$this->view = $view;
		$this->request = $request;
		$this->action = $action;
		$this->nom_systeme = $competence["nom_systeme"];
		$this->competence = $competence;
		$this->view->jetUtilise = false;
		$this->view->balanceFaimUtilisee = false;
		
		$this->view->effetMotD = false;
		$this->view->effetMotE = false;
		$this->view->effetMotG = false;
		$this->view->effetMotH = false;
		$this->view->effetMotI = false;
		$this->view->effetMotJ = false;
		$this->view->effetMotL = false;
		$this->view->effetMotQ = false;
		
		// recuperation de hobbit competence
		$this->hobbit_competence = $hobbitCompetence;

		$this->prepareCommun();
		$this->calculNbPa();

		switch($this->action) {
			case "ask" :
				$this->prepareFormulaire();
				break;
			case "do":
				$this->prepareResultat();
				break;
			default:
				throw new Zend_Exception(get_class($this)."::action invalide :".$this->action);
		}
	}

	abstract function prepareCommun();
	abstract function prepareFormulaire();
	abstract function prepareResultat();
	abstract function getListBoxRefresh();

	public function getIdEchoppeCourante() {
		return false;
	}
	
	public function calculNbPa() {
		if ($this->view->user->pa_hobbit - $this->competence["pa_utilisation"] < 0) {
			$this->view->assezDePa = false;
		} else {
			$this->view->assezDePa = true;
		}
		$this->view->nb_pa = $this->competence["pa_utilisation"];
	}
	
	public function ameliorationCompetenceMetier() {
		Zend_Loader::loadClass("HobbitsMetiers");
		
		$hobbitsMetiersTable = new HobbitsMetiers();
		$hobbitsMetierRowset = $hobbitsMetiersTable->findMetiersByHobbitId($this->view->user->id_hobbit);
		$ameliorationCompetence = false;
		foreach($hobbitsMetierRowset as $m) {
			if ($this->competence["id_fk_metier_competence"] == $m["id_metier"]) {
				if ($m["est_actif_hmetier"] == "oui") {
					$ameliorationCompetence = true;
				}
				break;
			}
		}
		return $ameliorationCompetence;
	}
	
	public function getIdMetier() {
		if ($this->competence["type_competence"] == "metier") {
			return $this->competence["id_fk_metier_competence"];
		} else {
			return null;
		}
	}
	
	public function calculPx() {
		$this->view->nb_px_commun = 0;
		$this->view->calcul_px_generique = true;
		if ($this->view->okJet1 === true) {
			$this->view->nb_px_perso = $this->competence["px_gain"];
		} else {
			$this->view->nb_px_perso = 0;
		}
		$this->view->nb_px = $this->view->nb_px_perso + $this->view->nb_px_commun;
	}

	public function calculBalanceFaim() {
		$this->view->balanceFaimUtilisee = true;
		$this->view->balance_faim = $this->competence["balance_faim"];
	}

	public function calculJets() {
		$this->view->jetUtilise = true;
		$this->view->okJet1 = false; // jet de comp�tence
		$this->view->okJet2 = false; // jet am�lioration de la comp�tence
		$this->view->okJet3 = false; // jet du % d'am�lioration
		$this->calculJets1();
		$this->calculJets2et3();
		$this->majSuiteJets();
	}

	public function calculJets1() {
		// 1er Jet : r�ussite ou non de la comp�tence
		$this->view->jet1 = Bral_Util_De::get_1d100();
		if ($this->view->jet1 <= $this->hobbit_competence["pourcentage_hcomp"]) {
			$this->view->okJet1 = true;
		} else { // si le jet est manquee, on recalcule le cout en PA
			$this->view->nb_pa = $this->competence["pa_manquee"];
		}
	}

	public function calculJets2et3() {
		$this->view->jet2Possible = false;
		
		$this->view->estCompetenceMetier = false;
		if ($this->competence["type_competence"] == "metier") {
			$this->view->estCompetenceMetier = true;
			$this->view->ameliorationCompetenceMetierCourant = $this->ameliorationCompetenceMetier();
		}
		
		// a t-on le droit d'am�liorer la comp�tence m�tier
		if ($this->view->estCompetenceMetier === true && $this->view->ameliorationCompetenceMetierCourant === false) { 
			$this->view->okJet2 = false;
			
		}  else if ($this->view->okJet1 === true || $this->hobbit_competence["pourcentage_hcomp"] < 50) {
			// 2nd Jet : r�ussite ou non de l'am�lioration de la comp�tence
			// seulement si la maitrise de la comp�tence est < 50 ou si le jet1 est r�ussi
			$this->view->jet2 = Bral_Util_De::get_1d100();
			$this->view->jet2Possible = true;
			if ($this->view->jet2 > $this->hobbit_competence["pourcentage_hcomp"]) {
				$this->view->okJet2 = true;
			}
		}

		// 3�me Jet : % d'am�lioration de la comp�tence
		if ($this->view->okJet2 === true) {
			if ($this->hobbit_competence["pourcentage_hcomp"] >= 90) { // pas d'am�lioration au del� de 90 %
				$this->view->okJet3 = false;
			} else {
				$this->view->okJet3 = true;
				if ($this->hobbit_competence["pourcentage_hcomp"] < 50) {
					if ($this->view->okJet1 === true) {
						$this->view->jet3 = Bral_Util_De::get_1d6();
					} else {
						$this->view->jet3 = Bral_Util_De::get_1d3();
					}
				} else if ($this->hobbit_competence["pourcentage_hcomp"] < 75) {
					$this->view->jet3 = Bral_Util_De::get_1d3();
				} else if ($this->hobbit_competence["pourcentage_hcomp"] < 90) {
					$this->view->jet3 = Bral_Util_De::get_1d1();
				}
			}
		}
	}

	// mise � jour de la table hobbit competence
	public function majSuiteJets() {
		if ($this->view->okJet3 === true) { // uniquement dans le cas de r�ussite du jet3
			$hobbitsCompetencesTable = new HobbitsCompetences();
			$pourcentage = $this->hobbit_competence["pourcentage_hcomp"] + $this->view->jet3;
			if ($pourcentage > 90) { // 90% maximum
				$pourcentage = 90;
			}
			$data = array('pourcentage_hcomp' => $pourcentage);
			$where = array("id_fk_competence_hcomp = ".$this->hobbit_competence["id_fk_competence_hcomp"]." AND id_fk_hobbit_hcomp = ".$this->view->user->id_hobbit);
			$hobbitsCompetencesTable->update($data, $where);
		}
	}

	/*
	 * Mise � jour des �v�nements du hobbit / du monstre.
	 */
	public function majEvenements($id_concerne, $id_type_evenement, $details, $type="hobbit") {
		Bral_Util_Evenement::majEvenements($id_concerne, $id_type_evenement, $details, $type);
	}
	
	/*
	 * Mise � jour des �v�nements du hobbit : type : comp�tence.
	 */
	public function majEvenementsStandard() {
		$id_type = $this->view->config->game->evenements->type->competence;
		$details = $this->view->user->prenom_hobbit ." ". $this->view->user->nom_hobbit ." (".$this->view->user->id_hobbit.") a r�ussi l'utilisation d'une comp�tence";
		$this->majEvenements($this->view->user->id_hobbit, $id_type, $details);
	}
	
	/*
	 * Mise � jour des PA, des PX et de la balance de faim.
	 */
	public function majHobbit() {
		$hobbitTable = new Hobbit();
		$hobbitRowset = $hobbitTable->find($this->view->user->id_hobbit);
		$hobbit = $hobbitRowset->current();

		$this->view->user->pa_hobbit = $this->view->user->pa_hobbit - $this->view->nb_pa;
		$this->view->user->px_perso_hobbit = $this->view->user->px_perso_hobbit + $this->view->nb_px_perso;
		$this->view->user->px_commun_hobbit = $this->view->user->px_commun_hobbit + $this->view->nb_px_commun;
		$this->view->user->balance_faim_hobbit = $this->view->user->balance_faim_hobbit + $this->view->balance_faim;

		if ($this->view->user->balance_faim_hobbit < 0) {
			$this->view->user->balance_faim_hobbit = 0;
		}

		$this->view->changeNiveau = false;
		$this->calculNiveau();

		$data = array(
			'pa_hobbit' => $this->view->user->pa_hobbit,
			'px_perso_hobbit' => $this->view->user->px_perso_hobbit,
			'px_commun_hobbit' => $this->view->user->px_commun_hobbit,
			'pi_hobbit' => $this->view->user->pi_hobbit,
			'niveau_hobbit' => $this->view->user->niveau_hobbit,
			'px_base_niveau_hobbit' => $this->view->user->px_base_niveau_hobbit,
			'balance_faim_hobbit' => $this->view->user->balance_faim_hobbit,
			'nb_hobbit_kill_hobbit' => $this->view->user->nb_hobbit_kill_hobbit,
			'nb_monstre_kill_hobbit' => $this->view->user->nb_monstre_kill_hobbit,
			'x_hobbit' => $this->view->user->x_hobbit,
			'y_hobbit'  => $this->view->user->y_hobbit,
			'pv_restant_hobbit' => $this->view->user->pv_restant_hobbit,
		);
		$where = "id_hobbit=".$this->view->user->id_hobbit;
		$hobbitTable->update($data, $where);
	}

	public function getNomInterne() {
		return "box_action";
	}

	public function render() {
		switch($this->action) {
			case "ask":
				return $this->view->render("competences/".$this->nom_systeme."_formulaire.phtml");
				break;
			case "do":
				return $this->view->render("competences/".$this->nom_systeme."_resultat.phtml");
				break;
			default:
				throw new Zend_Exception(get_class($this)."::action invalide :".$this->action);
		}
	}

	/**
	 * Le niveau suivant est calcul� � partir d'un certain nombre de px perso
	 * qui doit �tre >= � :
	 * NiveauSuivantPX = NiveauSuivant x 3 + debutNiveauPrecedentPx
	 */
	private function calculNiveau() {
		$niveauSuivantPx = ($this->view->user->niveau_hobbit + 1) * 3 + $this->view->user->px_base_niveau_hobbit;
		if ($this->view->user->px_perso_hobbit >= $niveauSuivantPx) {
			$this->view->user->px_perso_hobbit = $this->view->user->px_perso_hobbit - $niveauSuivantPx;
			$this->view->user->niveau_hobbit = $this->view->user->niveau_hobbit + 1;
			$this->view->user->px_base_niveau_hobbit = $niveauSuivantPx;
			$this->view->user->pi_hobbit = $this->view->user->pi_hobbit + $niveauSuivantPx;
			$this->view->changeNiveau = true;
		}

		$niveauSuivantPx = ($this->view->user->niveau_hobbit + 1) * 3 + $this->view->user->px_base_niveau_hobbit;
		if ($this->view->user->px_perso_hobbit >= $niveauSuivantPx) {
			$this->calculNiveau();
		}
	}
	
	protected function attaqueHobbit(&$hobbitAttaquant, $idHobbitCible, $effetMotSPossible = true) {
		Zend_Loader::loadClass("Bral_Util_Attaque");
		$jetAttaquant = $this->calculJetAttaque($hobbitAttaquant);
		$jetsDegat = $this->calculDegat($hobbitAttaquant);
		$hobbitTable = new Hobbit();
		$hobbitRowset = $hobbitTable->find($idHobbitCible);
		$hobbitCible = $hobbitRowset->current();
		$jetCible = Bral_Util_Attaque::calculJetCibleHobbit($hobbitCible);
		$retourAttaque = Bral_Util_Attaque::attaqueHobbit(&$hobbitAttaquant, $hobbitCible, $jetAttaquant, $jetCible, $jetsDegat, $effetMotSPossible);
		return $retourAttaque;
	}
	
	protected function attaqueMonstre(&$hobbitAttaquant, $idMonstre) {
		Zend_Loader::loadClass("Bral_Util_Attaque");
		$jetAttaquant = $this->calculJetAttaque($hobbitAttaquant);
		$jetsDegat = $this->calculDegat($hobbitAttaquant);
		$monstreTable = new Monstre();
		$monstreRowset = $monstreTable->findById($idMonstre);
		$monstre = $monstreRowset;
		$jetCible = Bral_Util_Attaque::calculJetCibleMonstre($monstre);
		$retourAttaque = Bral_Util_Attaque::attaqueMonstre(&$hobbitAttaquant, $idMonstre, $jetAttaquant, $jetCible, $jetsDegat);
		return $retourAttaque;
	}
	
}
