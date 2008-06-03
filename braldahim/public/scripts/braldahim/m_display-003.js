function _display_(box, data) {
	if (box == "erreur_catch") {
		$("erreur_catch_contenu").innerHTML = data;
	} else {
		_display_box(box, data);
	}
}

function _display_box(box, data) {
	if ($(box)) {
		$(box).innerHTML = data;
	}

	if (box == 'racine') { // si l'on fait appel a boxes, on appelle la vue ensuite
		_get_('/interface/load/?box=box_vue');
	}
}

// Switch pour les onglets sur les box
function my_switch(box, conteneur) {
	val = $('switch_' + conteneur).value.split(',');
	for (i = 0; i < val.length; i++) {
		if ($(val[i])) {
			$(val[i]).style.display = "none";
		}
		$("onglet_" + val[i]).className = "onglet inactif";
	}
	if ($(box)) {
		$(box).style.display = "block";
	}
	$("onglet_" + box).className = "onglet actif";
	
	if ($("loaded_" + box).value != "1") {
		$("loaded_" + box).value = 1;
		_get_('/interface/load/?box='+ box);
	}
}

// Switch pour afficher un div et en cacher un autre
function switch2div(div1, div2) {
	if ($(div1).style.display == "none") {
		$(div1).style.display = "block";
		$(div2).style.display = "none";
	} else {
		$(div1).style.display = "none";
		$(div2).style.display = "block";
	}
}

// n'autorise que des chiffres.
// exemple d'utilisation : <input type="text" onkeypress="chiffres(event)">
function chiffres(event, negatif) {
	// Compatibilité IE / Firefox
	if (!event && window.event) {
		event = window.event;
	}

	// IE 
	if (event.keyCode == 37 || event.keyCode == 39 || // fleches deplacement
			event.keyCode == 46 || event.keyCode == 8) { // backspace ou delete
		return;
	} else if (event.keyCode < 48 || event.keyCode > 57) {
		event.returnValue = false;
		event.cancelBubble = true;
	}

	// DOM
	if (event.which == 46 || event.which == 8) { // backspace ou delete
		return;
	} else if (negatif != null && event.which == 45) { // signe -
		return;
	} else if (event.which < 48 || event.which > 57) {
		event.preventDefault();
		event.stopPropagation();
	}
}

function maccordion_fermer(el) {
	var eldown = el.parentNode.id + '-body';
	new Effect.SlideUp(eldown, { duration :0.1 });
	el.style.backgroundImage = "url(/public/images/collapsed.gif);";
}

function maccordion_ouvrir(el) {
	var eldown = el.parentNode.id + '-body';
	new Effect.SlideDown(eldown, { duration :0.1 });
	el.style.backgroundImage = "url(/public/images/expanded.gif);";
}

function maccordion(el) {
	var eldown = el.parentNode.id + '-body';
	if ($(eldown)) {
		if ($(eldown).style.display == "none") {
			maccordion_ouvrir(el);
		} else {
			maccordion_fermer(el);
		}
	}
}

function limiteTailleTextarea(textarea, max, iddesc) {
	if (textarea.value.length >= max) {
		textarea.value = textarea.value.substring(0, max);
	}
	var reste = max - textarea.value.length;
	var affichage_reste = reste + ' caract&egrave;res restants';
	$(iddesc).innerHTML = affichage_reste;
}

function ouvrirWin(url, titre) {
	window.open(url, titre, "directories=no,location=no,menubar=no,resizable=yes,scrollbars=yes,status=no,toolbar=no,width=800,height=600");
}

function messagerie(nbMessageNonLu) {
	$('message_nb').style.display = "block";
	$('message_nb_img').style.display = "block";
	$('img_message_nouveau').style.display = "none";
	$('img_message_ancien').style.display = "none";
	
	if (nbMessageNonLu == 1) {
		$('message_nb_label').innerHTML = " 1 nouveau message&nbsp;";
		$('img_message_nouveau').style.display = "block";
	} else if (nbMessageNonLu > 1) {
		$('message_nb_label').innerHTML = nbMessageNonLu + " nouveaux messages&nbsp;";
		$('img_message_nouveau').style.display = "block";
	} else { // 0
		$('message_nb_label').innerHTML = " Pas de nouveau message&nbsp;";
		$('img_message_ancien').style.display = "block";
	}
}

function revealModal(divID) {
    window.onscroll = function () { $(divID).style.top = document.body.scrollTop; };
    $(divID).style.display = "block";
    $(divID).style.top = document.body.scrollTop;
}

function hideModal(divID) {
    $(divID).style.display = "none";
}