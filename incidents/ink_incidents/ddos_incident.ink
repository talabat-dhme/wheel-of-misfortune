# High Error Rate in Android API 🚨
-> start_investigation

=== start_investigation ===
<b>It's 3 AM, and your phone is screaming with alerts! 😱 High error rate in the Android API! Your heart races, your eyes blur. It's incident response time!</b> ☕

+ [Check the Android API APM. (Time to investigate!)] -> analyze_apm
* [Ignore the alert for now. (But the app might be on fire!)] -> incident_neglect_start_investigation
    -> END

=== analyze_apm ===
<b>You check the Android API APM. Throughput is unusually high compared to the previous day/week. (Something's fishy!)</b>

+ [It’s a potential DDoS attack! (Uh oh, incoming traffic tsunami!)] -> check_order_dashboard_question
* [It’s a transient spike. (Are you sure you want to gamble with the app's stability?)] -> incident_neglect_analyze_apm
    -> END

=== check_order_dashboard_question ===
<b>You check the order dashboard to see if order placement is impacted. (Are customers getting hangry?)</b>

+ [Q: How to check if there is order impact? (Where's the order panic button?)] -> check_order_dashboard_answer

=== check_order_dashboard_answer ===
<b>We can check the impact on orders by checking the <a target="_blank" href="https:\/\/onenr.io/0dQeqgG1rQe" style="color: blue;text-decoration: underline;">Shopping Dashboard</a>. (Hold your breath!)</b>

+ [Impact on orders detected!] -> create_incident
+ [No impact on orders or customer experience affected.] -> identify_attack_pattern

=== create_incident ===
<b>You determine that the high error rate impacts order placement. (Time to sound the alarm!)</b>

+ [Identify Attack Pattern. (Let's hunt down the culprit!)] -> identify_attack_pattern

=== identify_attack_pattern ===
<b>You begin identifying the attack pattern using New Relic Transaction Queries and Cloudflare Security Analytics. (Time to put on your detective hat!)</b>

HINT: Use these references:
- <a target="_blank" href="https:\/\/one.newrelic.com/alerts/issue?account=938958&state=ab6c5acf-c9d7-2e32-68f7-63e49703a82c" style="color: blue;text-decoration: underline;">New Relic Alert</a>
- <a target="_blank" href="https:\/\/dash.cloudflare.com/a24d979a90c8bac120ac9b36256f0d41/talabat.com/security/analytics" style="color: blue;text-decoration: underline;">Cloudflare Security Analytics</a>

+ [Attack on `/apiAndroid/v1/AuthToken`! (The AuthToken is under attack!)] -> investigate_ja3
* [No clear pattern. (But the chaos continues!)] -> incident_neglect_identify_attack_pattern
    -> END

=== investigate_ja3 ===
<b>You identify that most of the attacks share the same JA3 fingerprint. (Aha! A digital fingerprint!)</b>

WHAT IS JA3?
JA3 is a method of creating a unique fingerprint for SSL/TLS clients based on the parameters they use during a connection.
HINT: Learn more <a target="_blank" href="https:\/\/dash.cloudflare.com/a24d979a90c8bac120ac9b36256f0d41/talabat.com/security/analytics" style="color: blue;text-decoration: underline;">here</a>

+ [Investigate JA3 across the last week/month. (Let's track down this digital bandit!)] -> create_firewall_rule
* [No need to check JA3 analysis; I’ll just stare at CF and hope for clarity. (Hope is not a strategy, my friend!)] -> incident_neglect_investigate_ja3
    -> END

=== create_firewall_rule ===
<b>Now you need to create a new Cloudflare firewall rule to match requests with the same JA3 causing the attack. (Time to build a digital fortress!)</b>

HINT: Use this reference for creating rules:
<a href="https:\/\/dash.cloudflare.com/a24d979a90c8bac120ac9b36256f0d41/talabat.com/security/waf/firewall-rules" style="color: blue;text-decoration: underline;">rule</a>

+ [Set the rule to log only. (Let's be cautious and observe first!)] -> monitor_firewall
* [Immediately block traffic. (But what if you block legitimate users?)] -> incident_neglect_create_firewall_rule
    -> END

=== monitor_firewall ===
<b>You monitor the rule for a few minutes and confirm it matches the expected attack throughput. (Looking good so far!)</b>

+ [Change the action to block. (Time to unleash the firewall!)] -> share_with_security
* [Continue monitoring. (But the attackers are still slipping through!)] -> incident_neglect_monitor_firewall
    -> END

=== share_with_security ===
<b>You share the new firewall rule with the security team for validation and documentation. (Teamwork makes the dream work!)</b>

+ [Most attacks are blocked.] -> evaluate_results
* [Some requests still pass. (Uh oh, the attackers are finding loopholes!)] -> investigate_remaining_requests

=== investigate_remaining_requests ===
<b>You observe that some attack requests are bypassing the firewall rules. (The attackers are evolving!)</b>

+ [Refine the firewall rule. (Time to strengthen the defenses!)] -> share_with_security

=== evaluate_results ===
<b>The majority of the attack has been mitigated. (Victory is in sight!)</b>

+ [Monitor & Escalate to engineering/security. (Let's keep an eye on things and plan for the future!)] -> DONE

=== monitor_traffic ===
<b>You decide to monitor the situation further without taking immediate action. (But the app is still under siege!)</b>

+ [Escalate the issue. (Time to call in the reinforcements!)] -> identify_attack_pattern

=== ignore_alert ===
<b>Ignoring the alert could lead to severe consequences. (Are you sure you want to risk it?)</b>

+ [Go back and take action. (Let's be responsible!)] -> start_investigation
* [Yes, ignore for now. (You're playing a dangerous game!)] -> DONE

=== DONE ===
<b>The playbook is complete. Ensure to:</b>
- Share findings in the post-incident report.
- Collaborate with the security team for further analysis and prevention strategies.

<b>END OF PLAYBOOK.</b>
-> END

=== incident_neglect_start_investigation ===
💀 **Oh no! Ignoring the alert was a critical error. The app is crashing, users are panicking, and the CEO is calling. Time to wake up and smell the coffee!** ☕

+ [Try again? (Let's not hit the snooze button on this one!)] -> start_investigation

=== incident_neglect_analyze_apm ===
💀 **Oh dear! Assuming it was a transient spike was a miscalculation. The error rate skyrocketed, and the app is now a digital wasteland. Time to face the consequences!** 💥

+ [Try again? (Let's not underestimate the power of spikes!)] -> analyze_apm

=== incident_neglect_identify_attack_pattern ===
💀 **Oh no! Ignoring the attack pattern was a grave mistake. The attackers are now having a party on your servers, and the data is doing the conga line out the door. Time to take charge!** 🎉

+ [Try again? (Let's identify those sneaky attackers!)] -> identify_attack_pattern

=== incident_neglect_investigate_ja3 ===
💀 **Oh dear! Ignoring the JA3 fingerprint was a missed opportunity. The attackers are now morphing their digital disguises, and the firewall is powerless. Time to embrace the power of JA3!** 🕵️‍♀️

+ [Try again? (Let's track down those digital chameleons!)] -> investigate_ja3

=== incident_neglect_create_firewall_rule ===
💀 **Oh no! Blocking traffic without caution was a disaster. Legitimate users are locked out, and the app is a ghost town. Time to refine your firewall strategy!** 👻

+ [Try again? (Let's be more strategic with our blocks!)] -> create_firewall_rule

=== incident_neglect_monitor_firewall ===
💀 **Oh dear! Continuing to monitor without action was a costly mistake. The attackers are now sipping cocktails on your servers, and the data is doing the limbo under the firewall. Time to take action!** 🍹

+ [Try again? (Let's block those party crashers!)] -> monitor_firewall