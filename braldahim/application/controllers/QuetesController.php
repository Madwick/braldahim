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
class QuetesController extends Bral_Controller_Action {

	public function doactionAction() {
		Zend_Loader :: loadClass("Bral_Quetes_Factory");
		$this->doBralAction("Bral_Quetes_Factory");
	}
}