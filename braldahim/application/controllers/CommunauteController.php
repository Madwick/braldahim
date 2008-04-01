<?php

class CommunauteController extends Zend_Controller_Action {

	function init() {
		if (!Zend_Auth::getInstance()->hasIdentity()) {
			$this->_redirect('/');
		}

		$this->initView();
		$this->view->baseUrl = $this->_request->getBaseUrl();
		$this->view->user = Zend_Auth::getInstance()->getIdentity();
		$this->view->config = Zend_Registry::get('config');
		$this->view->controleur = $this->_request->controller;

		Zend_Loader::loadClass('Communaute');
		Zend_Loader::loadClass('Bral_Communaute_Factory');

	}

	function indexAction() {
	//	$this->_redirect('/messagerie/reception');
	}

	function askactionAction() {
		$this->doactionAction();
	}

	function doactionAction() {
		$xml_entry = new Bral_Xml_Entry();
		$xml_entry->set_type("display");
		$xml_response = new Bral_Xml_Response();
		try {
			$communaute = Bral_Communaute_Factory::getAction($this->_request, $this->view);
			$xml_entry->set_valeur($communaute->getNomInterne());
			$xml_entry->set_data($communaute->render());
			$xml_response->add_entry($xml_entry);
		} catch (Zend_Exception $e) {
			$b = Bral_Box_Factory::getErreur($this->_request, $this->view, false, $e->getMessage());
			$xml_entry->set_valeur($b->getNomInterne());
			$xml_entry->set_data($b->render());
			$xml_response->add_entry($xml_entry);
		}
		$xml_response->render();
	}
}
