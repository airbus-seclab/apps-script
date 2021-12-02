/* test for false positive in suspicious email detection */


a = "me@mycorp.com"
b = a
MailApp.sendEmail(b, 'hope you will not catch it', 'Sending email inside the organization');
