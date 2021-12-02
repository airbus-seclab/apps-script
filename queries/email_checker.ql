/**
* @name check email
* @description check for suspicious emails
* @kind path-problem
* @problem.severity error
* @precision medium
* @id email
* @tags security
* @security-severity 10
*/

/*
Search for document exfiltration via email, see
https://developers.google.com/apps-script/reference/mail/mail-app
*/



import javascript
import DataFlow::PathGraph

class RecipientChecks extends TaintTracking::Configuration {
 RecipientChecks() { this = "RecipientChecks" }
  
 override predicate isSource(DataFlow::Node source) {
 not (source.asExpr() instanceof ConstantString and source.asExpr().getStringValue().matches("%internal.com"))
 }
  
  override predicate isSink(DataFlow::Node sink) {
    sink = DataFlow::globalVarRef("MailApp").getAMethodCall("sendEmail").getArgument(0)
  }

  override predicate isSanitizer(DataFlow::Node nd) {
  nd.asExpr() instanceof Assignment and nd.asExpr().(Assignment).getRhs().getStringValue().matches("%internal.com")
  }
}

from RecipientChecks config, DataFlow::PathNode source, DataFlow::PathNode sink
where config.hasFlowPath(source, sink)
select source.getNode(), source, sink, "suspicious activity"


