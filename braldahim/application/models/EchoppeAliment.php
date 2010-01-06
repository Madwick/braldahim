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
class EchoppeAliment extends Zend_Db_Table {
	protected $_name = 'echoppe_aliment';
	protected $_primary = "id_echoppe_aliment";

	public function findByIdEchoppe($idEchoppe, $typeVente = null) {
		$db = $this->getAdapter();
		$select = $db->select();
		$select->from('echoppe_aliment', '*')
		->from('type_aliment')
		->from('aliment')
		->from('type_qualite')
		->where('id_echoppe_aliment = id_aliment')
		->where('id_fk_type_aliment = id_type_aliment')
		->where('id_fk_type_qualite_aliment = id_type_qualite')
		->where('id_fk_echoppe_echoppe_aliment = ?', $idEchoppe);
		if ($typeVente != null) {
			$select->where('type_vente_echoppe_aliment like ?', $typeVente);
		}
		$sql = $select->__toString();
		return $db->fetchAll($sql);
	}
}