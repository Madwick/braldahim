<?php

/**
 * This file is part of Braldahim, under Gnu Public Licence v3. 
 * See licence.txt or http://www.gnu.org/licenses/gpl-3.0.html
 *
 * $Id$
 * $Author$
 * $LastChangedDate$
 * $LastChangedRevision$
 * $LastChangedBy$
 */
class BourgController extends Zend_Controller_Action {

	function init() {
		$this->initView();
		$this->view->config = Zend_Registry::get('config');
		Zend_Loader::loadClass('Zend_Filter_StripTags');
		Zend_Loader::loadClass('Bral_Util_ConvertDate');
		
		$f = new Zend_Filter_StripTags();
		$anneeCourante = date("Y");
		$anneeSelect = intval($f->filter($this->_request->get("anneeselect")));
		if ($anneeSelect <= 0 || $anneeSelect == null) {
			$anneeSelect = $anneeCourante;
		}
		$this->view->anneeSelect = $anneeSelect;
	}

	function indexAction() {
		$anneeDebut = 2008;
		$anneeCourante = date("Y");
		
		for ($i = $anneeDebut ; $i <= $anneeCourante; $i++) {
			$annees[] = $i;
		}
		
		$this->view->annees = $annees;
		$this->render();
	}
	
	function relatexmlAction() {
		Zend_Controller_Front::getInstance()->setParam('noViewRenderer', true);
		Zend_Layout::resetMvcInstance();
		
		Zend_Loader::loadClass('Evenement');
		Zend_Loader::loadClass('Bral_Xml_DhtmlxGrid');
		
		$f = new Zend_Filter_StripTags();
		$posStart = intval($f->filter($this->_request->get("posStart")));
		$count = intval($f->filter($this->_request->get("count")));
		
		$ordreRecu = intval($f->filter($this->_request->get("orderby")));
		$direct = $f->filter($this->_request->get("direct"));
		 
		$ordre = null;
		if ($direct == "asc") {
			$direct = "ASC";
		} else {
			$direct = "DESC";
		}
		
		if ($posStart == null || $posStart <= 0) {
			$posStart = 0;
		}
		
		if ($count == null || $count <= 0) {
			$count = 100;
		}
		
		switch($ordreRecu) {
			case 0:
				$ordre = "id_evenement ".$direct;
				break;
			case 1:
				$ordre = "id_hobbit ".$direct;
				break;
		}
		
		$evenementTable = new Evenement();
		$dateFin = date("Y-m-d H:i:s", mktime(0, 0, 0, 1, 1,  $this->view->anneeSelect+1));
		$dateDebut = date("Y-m-d H:i:s", mktime(0, 0, 0, 1, 1,  $this->view->anneeSelect));
		$type = $this->view->config->game->evenements->type->evenement;
		$rowset = $evenementTable->findByType($dateDebut, $dateFin, $type, $ordre, $posStart, $count);
		
		$dhtmlxGrid = new Bral_Xml_DhtmlxGrid();
		
		foreach($rowset as $r) {
			$tab = null;
			$tab[] = Bral_Util_ConvertDate::get_datetime_mysql_datetime('d/m/y à H:i:s ',$r["date_evenement"]);
			$hobbit = $r["prenom_hobbit"]." ".$r["prenom_hobbit"]." (".$r["id_hobbit"].")";
			$hobbit .= "^javascript:ouvrirWin(\"".$this->view->config->url->game."/voir/hobbit/?hobbit=".$r["id_hobbit"]."\");^_self";
			$tab[] = $hobbit;
			$tab[] = $r["details_evenement"];
			
			$dhtmlxGrid->addRow($r["id_evenement"], $tab);
		}
		
		$total = $evenementTable->countByType($dateDebut, $dateFin, $type, $ordre);
		$this->view->grid = $dhtmlxGrid->render($total, $posStart);
	}
}