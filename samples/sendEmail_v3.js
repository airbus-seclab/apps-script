/* test for suspicious email detection */


var emailAddress = 'me@outside.com'; 
var message = 'hope you will catch it'; 
var subject = 'Sending email outside the organization';

MailApp.sendEmail(emailAddress, subject, message);



