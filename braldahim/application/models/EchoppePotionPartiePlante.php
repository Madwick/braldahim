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
class EchoppePotionPartiePlante extends Zend_Db_Table {
	protected $_name = 'echoppe_potion_partieplante';
	protected $_primary = array("id_fk_type_echoppe_potion_partieplante","id_fk_type_plante_echoppe_potion_partieplante", "id_fk_echoppe_potion_partieplante");

	function insertOrUpdate($data) {
		$db = $this->getAdapter();
		$select = $db->select();
		$select->from(
		'echoppe_potion_partieplante', 
		'count(*) as nombre, prix_echoppe_potion_partieplante as prix')
		->where('id_fk_type_echoppe_potion_partieplante = ?',$data["id_fk_type_echoppe_potion_partieplante"])
		->where('id_fk_type_plante_echoppe_potion_partieplante = ?',$data["id_fk_type_plante_echoppe_potion_partieplante"])
		->where('id_fk_echoppe_potion_partieplante = ?',$data["id_fk_echoppe_potion_partieplante"])
		->group(array('prix'));
		$sql = $select->__toString();
		$resultat = $db->fetchAll($sql);

		if (count($resultat) == 0) { // insert
			$this->insert($data);
		} else { // update
			$nombre = $resultat[0]["nombre"];
			$prix = $resultat[0]["prix"];
			
			$prix = $prix + $data["prix_echoppe_potion_partieplante"];
			if ($prix < 0) $prix = 0;
			
			$dataUpdate = array(
			'prix_echoppe_potion_partieplante' => $prix,
			);
			$where = ' id_fk_type_echoppe_potion_partieplante = '.$data["id_fk_type_echoppe_potion_partieplante"];
			$where .= ' AND id_fk_type_plante_echoppe_potion_partieplante = '.$data["id_fk_type_plante_echoppe_potion_partieplante"];
			$where .= ' AND id_fk_echoppe_potion_partieplante = '.$data["id_fk_echoppe_potion_partieplante"];
			$this->update($dataUpdate, $where);
		}
	}

  function findByIdsPotion($tabId) {
    	$where = "";
    	if ($tabId == null || count($tabId) == 0) {
    		return null;
    	}
    	
    	foreach($tabId as $id) {
			if ($where == "") {
				$or = "";
			} else {
				$or = " OR ";
			}
			$where .= " $or id_fk_echoppe_potion_partieplante =".(int)$id;
    	}
    	
		$db = $this->getAdapter();
		$select = $db->select();
		$select->from('echoppe_potion_partieplante', '*')
		->from('type_partieplante', '*')
		->from('type_plante', '*')
		->where($where)
		->where('echoppe_potion_partieplante.id_fk_type_echoppe_potion_partieplante = type_partieplante.id_type_partieplante')
		->where('echoppe_potion_partieplante.id_fk_type_plante_echoppe_potion_partieplante = type_plante.id_type_plante');
		$sql = $select->__toString();
		
		return $db->fetchAll($sql);
    }
}
