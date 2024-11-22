High Error Rate in Android API  
Your goal is to investigate and mitigate the issue while ensuring minimal impact on the system.

-> start_investigation

== start_investigation ==
It is 3 am, and we received an alert for a high error rate in the Android API.  
WHAT DO YOU DO FIRST?  
+ [Check the Android API APM] Investigate error rates and throughput trends. -> analyze_apm
* [Ignore the alert for now] Decide not to take immediate action. -> ignore_alert

== analyze_apm ==
You check the Android API APM and find that throughput is unusually high compared to the previous day/week.  
WHAT DO YOU CONCLUDE?  
* [It’s a potential DDoS attack] High throughput suggests unusual traffic patterns. -> check_order_dashboard
* [It’s a transient spike] Assume it might stabilize. -> ignore_alert

== check_order_dashboard ==
You check the order dashboard to see if order placement is impacted.  
WHAT DO YOU FIND?  
* [No impact on orders] No incident needs to be created yet. -> identify_attack_pattern
* [Impact on orders detected] Create an incident immediately. -> create_incident

== create_incident ==
You determine that the high error rate impacts order placement.  
WHAT DO YOU DO NEXT?  
* [Identify Attack Pattern] Inform the on-call team and relevant stakeholders. -> identify_attack_pattern

== identify_attack_pattern ==
You begin identifying the attack pattern using New Relic Transaction Queries and Cloudflare Security Analytics.  
HINT: Use these references:  
-   <a target="_blank" href="https:\/\/one.newrelic.com/alerts/issue?account=938958&state=ab6c5acf-c9d7-2e32-68f7-63e49703a82c">New Relic Alert</a>
-   <a target="_blank" href="https:\/\/dash.cloudflare.com/a24d979a90c8bac120ac9b36256f0d41/talabat.com/security/analytics">Cloudflare Security Analytics</a>

WHAT DO YOU DISCOVER?  
+ [Attack on `/apiAndroid/v1/AuthToken`] Most attacks target this URI. -> investigate_ja3
* [No clear pattern] Continue monitoring traffic. -> monitor_traffic

== investigate_ja3 ==
You identify that most of the attacks share the same JA3 fingerprint.  
WHAT IS JA3?  
JA3 is a method of creating a unique fingerprint for SSL/TLS clients based on the parameters they use during a connection.  
HINT: Learn more <a target="_blank" href="https:\/\/dash.cloudflare.com/a24d979a90c8bac120ac9b36256f0d41/talabat.com/security/analytics">here</a>
  

WHAT DO YOU DO NEXT?  
* [Investigate JA3 across the last week/month] Correlate JA3 activity with the attack timeline. -> create_firewall_rule
* [Skip JA3 analysis] Proceed without using JA3. -> monitor_traffic

== create_firewall_rule ==
You create a new Cloudflare firewall rule to match requests with the same JA3 causing the attack.  
HINT: Use this reference for creating rules:  
<a href="https:\/\/dash.cloudflare.com/a24d979a90c8bac120ac9b36256f0d41/talabat.com/security/waf/firewall-rules">rule</a>
WHAT ACTION DO YOU TAKE INITIALLY?  
* [Set the rule to log only] Monitor the rule to ensure no unexpected impact. -> monitor_firewall
* [Immediately block traffic] Block traffic matching the JA3 fingerprint. -> assess_impact

== assess_impact ==
The new firewall rule starts blocking traffic.  
HOW DO YOU VERIFY THE IMPACT?  
HINT: Compare traffic before and after the rule implementation using Cloudflare Security Analytics.  
- <a href="https:\/\/dash.cloudflare.com/a24d979a90c8bac120ac9b36256f0d41/talabat.com/security/analytics">Cloudflare Security Analytics</a>


* [Rule is effective] The attack traffic is mitigated with no side effects. -> share_with_security
* [Unexpected issues arise] Refine or disable the rule to reduce negative impact. -> investigate_remaining_requests

== monitor_firewall ==
You monitor the rule for a few minutes and confirm it matches the expected attack throughput.  
WHAT DO YOU DO NEXT?  
* [Change the action to block] Block the attack using the firewall rule. -> share_with_security
* [Continue monitoring] Keep the rule in logging mode for now. -> monitor_traffic

== share_with_security ==
You share the new firewall rule with the security team for validation and documentation.  
WHAT DO YOU OBSERVE?  
* [Most attacks are blocked] The rule is effective. -> evaluate_results
* [Some requests still pass] Further investigation is needed. -> investigate_remaining_requests

== investigate_remaining_requests ==
You observe that some attack requests are bypassing the firewall rules.  
WHAT DO YOU DO NEXT?  
* [Refine the firewall rule] Update the rule to better match attack patterns. -> monitor_firewall
* [Investigate further in Cloudflare] Analyze security events for additional patterns. -> identify_attack_pattern

== evaluate_results ==
The majority of the attack has been mitigated. However, some requests still bypass the firewall rules.  
WHAT IS YOUR NEXT STEP?  
* [Continue refining security rules] Work on improving the rules to block remaining requests. -> DONE
* [Escalate to engineering/security] Share findings and collaborate on a long-term solution. -> DONE

== monitor_traffic ==
You decide to monitor the situation further without taking immediate action.  
WHAT DO YOU DO NEXT?  
* [Escalate the issue] Notify the security or engineering team for further support. -> identify_attack_pattern

== ignore_alert ==
Ignoring the alert could lead to severe consequences.  
ARE YOU SURE?  
+ [Go back and take action] -> start_investigation
* [Yes, ignore for now] -> DONE

== DONE ==
The playbook is complete. Ensure to:  
- Share findings in the post-incident report.  
- Collaborate with the security team for further analysis and prevention strategies.  

END OF PLAYBOOK.
-> END
