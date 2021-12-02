/* test for false positive in suspicious email detection */


MailApp.sendEmail('me@mycorp.com', 'hope you will not catch it', 'Sending email inside the organization');
