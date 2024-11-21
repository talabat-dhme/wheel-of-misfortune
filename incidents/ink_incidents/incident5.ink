-> start

=== start ===
# Incident 5: The DH Data Drama 🚨

**You've received alerts: Integration with DH is broken! Some data from specific vendors is missing.

+ [Acknowledge like a Hero engineer.] -> check_customer_impact
+ [No, I’m busy coding. Someone else will pick this up, right?] -> incident_neglect

=== check_customer_impact ===
**Is there any order loss or poor customer experience?
+ [No drop in orders, but customer experience might be impacted. Time to dig deeper.] -> create_incident
+ [No need to check order loss. Logs are calling my name.] -> incident_neglect

=== create_incident ===
**Still create an incident?
+ [Yes, it’s a customer-facing endpoint. Let’s document it.] -> page_team
+ [No need. I’ll fix it before anyone even notices.] -> page_team
+ [No, I’ve had enough post-mortems for a lifetime.] -> incident_neglect

=== page_team ===
**You need more insights into the business logic and DH integration.
+ [Page the team. Collaboration is key!] -> team_response
+ [I’ll figure it out on my own. Who needs a team?] -> incident_neglect

=== team_response ===
**The team mentions that DH calls their service through an API Gateway backed by a Lambda function.
+ [Acknowledge this valuable intel.] -> check_release
+ [Ignore. I prefer to stay in the dark.] -> incident_neglect

=== check_release ===
**Was there a new release?
+ [Nope, no new releases today.] -> check_fwf
+ [Not sure. Let me check the deployment logs later.] -> incident_neglect

=== check_fwf ===
**Were any FWF flags recently enabled?
+ [Nope, all flags are unchanged.] -> check_cloudwatch
+ [I have no idea. FWF is a mystery to me.] -> incident_neglect

=== check_cloudwatch ===
**Check CloudWatch metrics for the API Gateway and Lambda logs?
+ [Metrics look good. No increase in error rates.] -> check_client_response
+ [Who has time for metrics? Let’s skip to conclusions.] -> incident_neglect

=== check_client_response ===
**The client (DH) response shows 5xx errors originating from Cloudflare.
+ [Acknowledge. Time to dive into Cloudflare details.] -> check_cloudflare
+ [Ignore. Maybe it will fix itself.] -> incident_neglect

=== check_cloudflare ===
**Is the endpoint public and behind Cloudflare?
+ [Yes, it’s public. Cloudflare might be the culprit.] -> analyze_cloudflare
+ [Not sure. Let’s just keep guessing.] -> incident_neglect

=== analyze_cloudflare ===
**Check the Cloudflare analysis dashboard.
+ [Yes, I’m on it.] -> escalate_to_security
+ [I don’t have access to Cloudflare. This is someone else’s problem.] -> incident_neglect

=== escalate_to_security ===
**Increase in 5xx errors is related to Cloudflare rules. What’s next?
+ [Escalate to Talabat Security and page them to assist.] -> monitor_whitelisting
+ [Ignore. Security issues aren’t my problem.] -> incident_neglect

=== monitor_whitelisting ===
**Monitor after the security team adds a whitelisting rule.
+ [Yes, let’s ensure the errors subside.] -> update_incident
+ [Nope, I’m confident it’s resolved now.] -> incident_neglect

=== update_incident ===
**Update the incident?
+ [Yes, keep stakeholders informed.] -> close_incident
+ [No, I’m too busy enjoying my newfound peace.] -> incident_neglect

=== close_incident ===
**Close the incident?
+ [Yes, DH integration is back on track. Job well done!] -> post_incident
+ [No, I’ll leave it open for dramatic effect.] -> incident_neglect

=== post_incident ===
🎉 **Victory!** You’ve resolved the DH integration issue and restored vendor data flow. Everyone applauds your engineering prowess. Take a bow! 🏆
-> END

=== incident_neglect ===
💀 **Disaster strikes!** The issue escalates, stakeholders are panicking, and your inbox explodes with angry messages. Better luck next time.
-> END
