# Incident 5: The DH Data Drama 🚨
# https://deliveryhero.slack.com/archives/C03FHFH1NLX/p1728905492226789?thread_ts=1728903493.543469&cid=C03FHFH1NLX
-> start

=== start ===
You've received Manual escalation: Integration with DH is broken! Some updates of the delivery area stream for specific vendors is missing. Your heart skips a beat, your palms get sweaty, and your coffee suddenly tastes cold. It's another on-call adventure! 😱

+ [Acknowledge like a Hero engineer. (Time to save the day!)] -> check_customer_impact_question
* [No, I’m busy coding. Someone else will pick this up, right? (Don't be that person!)] -> incident_neglect_start
    -> END

=== check_customer_impact_question ===
Is there any order loss or poor customer experience? Are customers seeing blank screens? 🤯

+ [Q: How to check if there is order impact? (Quick, check the dashboards!)] -> check_customer_impact_answer
* [No need to check order loss.] -> incident_neglect_check_customer_impact
    -> END

=== check_customer_impact_answer ===
We can check the impact on orders by checking the <a target="_blank" href="https:\/\/onenr.io/0dQeqgG1rQe" style="color: blue;text-decoration: underline;">Shopping Dashboard</a>. (Fingers crossed!)

+ [No drop in orders, but customer experience might be impacted. Time to dig deeper.] -> create_incident

=== create_incident ===
Still create an incident?

+ [Yes, let's shed some light on this data darkness!] -> page_team
* [No, let's keep it our little secret. (But secrets have a way of getting out...)] -> create_incident_answer
* [No, I’ve had enough post-mortems for a lifetime.] -> incident_neglect_create_incident
    -> END

=== create_incident_answer ===
+ [It’s a customer-facing endpoint. Let’s document it. (Transparency is the best policy!)] -> page_team
* [No need. I’ll fix it before anyone even notices. (Are you sure you're not underestimating the problem?)] -> incident_neglect_create_incident
    -> END

=== page_team ===
You need more insights into the business logic and DH integration. (Time to phone a friend!)

+ [Page the team. Collaboration is key! (Two heads are better than one!)] -> team_response
* [I’ll figure it out on my own. Who needs a team?] -> incident_neglect_page_team
    -> END

=== team_response ===
The team mentions that DH calls their service through an API Gateway backed by a Lambda function. (Aha! A clue!)

+ [Acknowledge this valuable intel. (Knowledge is power!)] -> check_release_question
* [Ignore. I prefer to stay in the dark.] -> incident_neglect_team_response
    -> END

=== check_release_question ===
Was there a new release? (Did someone deploy a ticking time bomb? 💣)

+ [Q: How to check if there is a new release correlated?] -> check_release_answer
* [Not sure. Let me check the deployment logs later.] -> incident_neglect_check_release
    -> END

=== check_release_answer ===
We can check for a new release by:
<br>
- Checking <a target="_blank" href="https:\/\/deliveryhero.enterprise.slack.com/archives/C026LKZNDJB" style="color: blue;text-decoration: underline;">tlb_production_deployments Slack Channel</a> (Any deployment confessions?)
<br>
- Checking <a target="_blank" href="https:\/\/argo.dhhmena.com/applications/pro-api-failover?resource=" style="color: blue;text-decoration: underline;">ArgoCD</a> (Any rogue deployments?)
<br>
+ [Nope, no new releases today. (That's one less thing to worry about!)] -> check_fwf_question

=== check_fwf_question ===
Were any FWF flags recently enabled? (Did someone flip the wrong switch? 🎚️)

+ [Q: How to check FWF updates?] -> check_fwf_answer
* [I have no idea. FWF is a mystery to me.] -> incident_neglect_check_fwf
    -> END

=== check_fwf_answer ===
We can check FWF updates by looking at the <a target="_blank" href="https:\/\/deliveryhero.enterprise.slack.com/archives/C069FSDT9D3" style="color: blue;text-decoration: underline;">FWF Slack Channel</a>. (Hopefully, there are no surprises there!)

+ [Nope, all flags are unchanged. (That's a relief!)] -> check_cloudwatch

=== check_cloudwatch ===
<b>Check CloudWatch metrics for the API Gateway and Lambda logs with DH help?</b>

+ [We found there is increase in error rates from the client (DH) while calling our API.] -> check_client_response
* [Who has time for metrics? Let’s skip to conclusions.] -> incident_neglect_check_cloudwatch
    -> END

=== check_client_response ===
<b>The client (DH) response shows 5xx errors originating from Cloudflare.</b>

+ [Acknowledge. Time to dive into Cloudflare details.] -> check_cloudflare
* [Ignore. Maybe it will fix itself.] -> incident_neglect_check_client_response
    -> END

=== check_cloudflare ===
<b>Is the endpoint public and behind Cloudflare? (Is Cloudflare playing hide-and-seek?)</b>

+ [Yes, it’s public. Cloudflare might be the culprit.] -> analyze_cloudflare
* [Not sure. Let’s just keep guessing.] -> incident_neglect_check_cloudflare
    -> END

=== analyze_cloudflare ===
<b>Check the Cloudflare analysis dashboard. (Time to put on your Cloudflare detective hat!)</b>

+ [Yes, I’m on it. (The truth is out there!)] -> escalate_to_security
* [I don’t have access to Cloudflare. This is someone else’s problem.] -> incident_neglect_analyze_cloudflare
    -> END

=== escalate_to_security ===
<b>Increase in 5xx errors is related to Cloudflare rules. What’s next?</b>

+ [Escalate to Talabat Security and page them to assist.] -> monitor_whitelisting
* [Ignore. Security issues aren’t my problem.] -> incident_neglect_escalate_to_security
    -> END

=== monitor_whitelisting ===
<b>Monitor after the security team adds a whitelisting rule. (Fingers crossed it works!)</b>

+ [Yes, let’s ensure the errors subside. (Don't let your guard down yet!)] -> update_incident
* [Nope, I’m confident it’s resolved now.] -> incident_neglect_monitor_whitelisting
    -> END

=== update_incident ===
<b>Update the incident? (Let's keep everyone in the loop!)</b>

+ [Yes, keep stakeholders informed. (Communication is key!)] -> close_incident
* [No, I’m too busy enjoying my newfound peace.] -> incident_neglect_update_incident
    -> END

=== close_incident ===
<b>Close the incident? (Is it time to celebrate?)</b>

+ [Yes, DH integration is back on track. Job well done!] -> post_incident
* [No, I’ll leave it open for dramatic effect.] -> incident_neglect_close_incident
    -> END

=== post_incident ===
<b>🎉 **Victory!** You’ve resolved the DH integration issue and restored vendor data flow. Everyone applauds your engineering prowess. Take a bow! 🏆</b>
-> END

=== incident_neglect_start ===
💀 **Disaster strikes!** The issue escalates, stakeholders are panicking, and your inbox explodes with angry messages. Better luck next time.
+ [Try again? (Maybe this time you'll listen to the customers!)] -> start

=== incident_neglect_check_customer_impact ===
<b>💀 Oh no! Ignoring the customer impact was a grave mistake. Users are rioting on Twitter and your manager is breathing down your neck. Time to face the music!</b> 🎶

+ [Try again? (Maybe this time you'll listen to the customers!)] -> check_customer_impact_question

=== incident_neglect_create_incident ===
<b>💀 Oh dear! Hiding the incident didn't make it go away. Now it's a full-blown crisis, and everyone is pointing fingers. Transparency is key, my friend!</b> 🙈

+ [Try again? (Let's be open and honest this time!)] -> create_incident

=== incident_neglect_page_team ===
<b>💀 Going solo was a bad call! The issue escalated, and now you're lost in a maze of code with no escape. Remember, teamwork makes the dream work!</b> 🤝

+ [Try again? (Let's call in the reinforcements!)] -> page_team

=== incident_neglect_team_response ===
<b>💀 Ignoring the team's wisdom was a recipe for disaster. Now the API Gateway is throwing a tantrum, and the Lambda function is singing the blues. Time to listen to the experts!</b> 👂

+ [Try again? (Let's acknowledge the valuable intel!)] -> team_response

=== incident_neglect_check_release ===
<b>💀 The delayed release check caused chaos, and now the code is a tangled mess. Don't delay, act today!</b> ⏰

+ [Try again? (Let's check those logs right away!)] -> check_release_question

=== incident_neglect_check_fwf ===
<b>💀 Ignoring the FWF flags was a fatal flaw. Now the system is in a frenzy, and the data is dancing a chaotic jig. Time to face the FWF music!</b> 🕺

+ [Try again? (Let's unravel the FWF mystery!)] -> check_fwf_question

=== incident_neglect_check_cloudwatch ===
<b>💀 Skipping the metrics was a shortcut to disaster. Now the logs are overflowing, and the dashboards are flashing red. Time to embrace the power of metrics!</b> 📊

+ [Try again? (Let's dive into those CloudWatch logs!)] -> check_cloudwatch

=== incident_neglect_check_client_response ===
<b>💀 Ignoring the client response was a critical error. Now the 5xx errors are multiplying like rabbits, and the customers are hopping mad. Time to acknowledge the problem!</b> 🐇

+ [Try again? (Let's face the Cloudflare challenge!)] -> check_client_response

=== incident_neglect_check_cloudflare ===
<b>💀 Guessing is not a debugging strategy! Now the Cloudflare gremlins are wreaking havoc, and the data is lost in the cloud. Time to get some answers!</b> ☁️

+ [Try again? (Let's find out if Cloudflare is friend or foe!)] -> check_cloudflare

=== incident_neglect_analyze_cloudflare ===
<b>💀 Passing the buck to someone else won't solve the problem. Now the Cloudflare mystery remains unsolved, and the data is still missing. Time to take responsibility!</b>  detective

+ [Try again? (Let's put on our Cloudflare detective hats!)] -> analyze_cloudflare

=== incident_neglect_escalate_to_security ===
<b>💀 Ignoring security is like leaving the front door open. Now the data is vulnerable, and the hackers are having a field day. Time to call in the security experts!</b> 🚨

+ [Try again? (Let's escalate to Talabat Security!)] -> escalate_to_security

=== incident_neglect_monitor_whitelisting ===
<b>💀 Overconfidence strikes again! The whitelisting rule didn't quite do the trick, and the errors are back with a vengeance. Don't celebrate too early!</b> 🎉

+ [Try again? (Let's monitor those errors closely!)] -> monitor_whitelisting

=== incident_neglect_update_incident ===
<b>💀 Silence is not golden when it comes to incidents. Now the stakeholders are in the dark, and rumors are spreading like wildfire. Time to communicate!</b> 🔥

+ [Try again? (Let's keep everyone informed!)] -> update_incident

=== incident_neglect_close_incident ===
<b>💀 Prolonging the drama won't solve anything. Now the incident is dragging on, and everyone is losing patience. Time to close the curtain!</b> 🎭

+ [Try again? (Let's declare victory and move on!)] -> close_incident