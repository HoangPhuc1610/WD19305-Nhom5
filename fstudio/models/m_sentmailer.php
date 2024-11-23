<?php
use PHPMailer\PHPMailer\PHPMailer;

function gmail($cont, $sub, $email, $name)
{
    $mail = new PHPMailer(true);
    $mail->isSMTP();                                            //Send using SMTP
    $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
    $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
    $mail->Username   = 'huynhquoctrieu58@gmail.com';                     //SMTP username
    $mail->Password   = 'vgukqbkbdddxsgbo';                               //SMTP password
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
    $mail->Port       = 465;  
    //Server settings
    // $mail->SMTPDebug = SMTP::DEBUG_SERVER;                      //Enable verbose debug output
    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

    //Recipients
    $mail->setFrom('huynhquoctrieu58@gmail.com', 'trieu');
    $mail->addAddress($email,$name); 
    // $mail->addAddress('hvu1436@gmail.com', 'vu');         //Add a recipient
    // $mail->addAddress('ellen@example.com');              //Name is optional
    // $mail->addReplyTo('info@example.com', 'Information');
    // $mail->addCC('cc@example.com');
    // $mail->addBCC('bcc@example.com');

    //Attachments
    // $mail->addAttachment('/var/tmp/file.tar.gz');         //Add attachments
    // $mail->addAttachment('/tmp/image.jpg', 'new.jpg');    //Optional name

    //Content
    // $mail->isHTML(true);                                  //Set email format to HTML
    $mail->Subject = $sub;
    $mail->Body    = $cont;
    // $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

    $mail->send();
}   