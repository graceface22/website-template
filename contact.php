<?php 

if ( isset($_GET["send"]) ) {
	$f_name = htmlspecialchars($_POST["name"]);
	$f_message = htmlspecialchars($_POST["message"]);
	
	$error = false;
	$mailcopy = "";
	$mail_from = "kontaktformular@agenturkessler.com";
	$mail_to = "info@agenturkessler.com";
	
	// Error missing fields
	if (!$f_message()) {
		$feedback = '<div class="error">Bitte geben Sie eine Nachricht ein. Vielen Dank.</div>';
		$error = true;
	}
	
	// Send Mail
	if ($error == false) {
		if ($f_email == "") {
			$header = "From: $mail_from\r\n";
		}
		else {
			$header = "From: $f_email\r\nBcc: $f_email\r\n";
			$f_subject = $f_subject;
		}
		$f_message = wordwrap($f_message, 70);
		$f_subject = "Kontaktanfrage über agenturkessler.com: ".$f_subject;
		// Send mail
		$return = mail("$mail_to", $f_subject, $f_message, $header);
		// Mail is on the way!
		if ($return == true) {
			if ($f_email) {
				$mailcopy = " Sie erhalten eine Kopie per E-Mail.";
			}
			$feedback = '<div class="success">Vielen Dank für Ihre Nachricht.'.$mailcopy.'</div>';
		}
		// Error while sending!
		else {
			$feedback = '<div class="error">Leider trat ein Problem beim Senden der E-Mail auf. Sollte der Fehler sich wiederholen '.
				'geben Sie uns bitte per Telefon Bescheid. Vielen Dank für Ihr Verständnis.</div>';
			$error = true;
		}
	} // $error == false
	
	// AJAX Anfrage
	if ( isset($_GET["ajax"]) ) {
		echo $feedback;
		exit;
	}
	
} // end isset send

?>
<form class="contact" action="kontakt.php?send" method="post">
	<div class="response"><?php echo $feedback; ?></div>
	<div class="field">
		<label for="f-name">Name</label><input id="f-name" class="required" type="text" name="name">
	</div>
	<div class="field">
		<label for="f-telefon">Telefon</label><input id="f-telefon" type="text" name="phone">
	</div>
	<div class="field">
		<label for="f-email">E-Mail</label><input id="f-email" type="text" name="email">
	</div>
	<div class="field">
		<label for="f-nachricht">Nachricht</label><textarea id="f-nachricht" class="required" name="message"></textarea>
	</div>
	<div class="submit">
		<input type="submit" value="senden">
	</div>
</form>