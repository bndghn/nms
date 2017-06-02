<?php

class email {
	

    function send($address_to, $subject, $htmlcontent, $plaincontent, $attachment) {
	  global $admin_name, $admin_email;
        $PHPMailer = new PHPMailer;

        $PHPMailer->From		= $admin_email;
        $PHPMailer->CharSet		= 'UTF-8';
        $PHPMailer->FromName	= $admin_name;
        $PHPMailer->ClearAllRecipients();
        $PHPMailer->AddAddress($address_to);
        $PHPMailer->Subject		= $subject;
        $PHPMailer->Body		= $htmlcontent;
        $PHPMailer->AltBody	= $plaincontent;
        $PHPMailer->IsHTML(true);
		while(list($k,$v) = each($attachment))
		{
			$PHPMailer->AddAttachment($v['file'],$v['nickname']);
        }	
        $status = @$PHPMailer->Send();
		$PHPMailer->ClearAddresses();
		$PHPMailer->ClearAttachments();
	  return $status;	
    }
}
?>
