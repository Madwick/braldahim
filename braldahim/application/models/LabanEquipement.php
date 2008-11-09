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
class LabanEquipement extends Zend_Db_Table {
	protected $_name = 'laban_equipement';
	protected $_primary = array('id_laban_equipement');

	function findByIdHobbit($id_hobbit) {
		$db = $this->getAdapter();
		$select = $db->select();
		$select->from('laban_equipement', '*')
		->from('recette_equipements')
		->from('type_equipement')
		->from('type_qualite')
		->from('type_emplacement')
		->where('id_fk_recette_laban_equipement = id_recette_equipement')
		->where('id_fk_type_recette_equipement = id_type_equipement')
		->where('id_fk_type_qualite_recette_equipement = id_type_qualite')
		->where('id_fk_type_emplacement_recette_equipement = id_type_emplacement')
		->where('id_fk_hobbit_laban_equipement = ?', intval($id_hobbit))
		->joinLeft('mot_runique','id_fk_mot_runique_laban_equipement = id_mot_runique');
		$sql = $select->__toString();
		return $db->fetchAll($sql);
	}
}
