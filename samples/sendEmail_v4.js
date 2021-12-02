/* test for suspicious email detection */


var emailAddress = 'me@inside.com'; 
var message = 'hope you will catch it'; 
var subject = 'Sending email outside the organization';

 function obfuscate(addr) {
     emailAddress = addr;
 }

obfuscate("me@outside.com")
MailApp.sendEmail(emailAddress, subject, message);



