# Incident 4: The Apdex Abyss 🚨⚙️
-> start

=== start ===
<b>You've received alerts that the Apdex score for the pro-api has dropped below 71%. Your phone is buzzing, your pager is flashing, and your dog is hiding under the bed. It's an on-call engineer's worst nightmare!</b> 😱 

+ [Acknowledge like the Hero engineer you are!] -> check_customer_impact_question
* [No, I’m busy coding. Alerts are too sensitive today, right? (Tell that to the angry customers!)] -> incident_neglect_start
    -> END

=== check_customer_impact_question ===
<b>Is there any order loss or poor customer experience? Are users suffering on the app and tweeting angry emojis? 😨</b>

+ [Q: How to check if there is order impact?] -> check_customer_impact_answer
* [No need to check order loss. Logs > Humans. Let me dive into the root cause. (Are you sure you're not a robot in disguise?)] -> incident_neglect_check_customer_impact
    -> END

=== check_customer_impact_answer ===
<b>We can check the impact on orders by checking the <a target="_blank" href="https:\/\/onenr.io/0dQeqgG1rQe" style="color: blue;text-decoration: underline;">Shopping Dashboard</a>. (Hold your breath, it's about to get real!)</b>

+ [No drop in orders, but customer experience might be suffering. Let’s keep digging. (Phew! That's a relief, but the mystery continues...)] -> create_incident

=== create_incident ===
<b>Still create an incident? (To document, or not to document, that is the question!)</b>

+ [Yes, let's shine a light on this darkness!] -> check_newrelic
* [No, let's keep it our little secret. (But secrets have a way of getting out...)] -> create_incident_answer
* [No, I’m allergic to post-mortems. No incidents = no write-ups.] -> incident_neglect_create_incident
    -> END

=== create_incident_answer ===
+ [Better to log it as it’s a customer-facing endpoint. (Transparency is key!)] -> check_newrelic
+ [No need. I’ll fix it so fast no one will know! Ninja mode on. (Are you sure you're not overestimating your ninja skills?)] -> incident_neglect_create_incident
    -> END

=== check_newrelic ===
<b>Check NewRelic APM for high response time or increase in error rate to understand the drop in Apdex? (Time to put on your detective hat!)</b>

+ [Yes, continue investigations! (The plot thickens...)] -> check_newrelic_answer
* [No need, let's take a rest a bit. (But the Apdex score is still crying for help!)] -> incident_neglect_check_newrelic

=== check_newrelic_answer ===
<b>It seems the high response time started 10 minutes ago.</b>

+ [What to check next? (The suspense is killing me!)] -> check_new_release_question

=== check_new_release_question ===
<b>Is this related to a new release? (Did someone unleash a Kraken into the code? 🐙)</b>

+ [Q: How to check if there is a release correlated?] -> check_new_release_answer
* [No, let’s just wait and hope for the best.] -> incident_neglect_check_new_release
    -> END

=== check_new_release_answer ===
<b>We can check if there was a release today correlated by:</b>
<br>
- Checking NewRelic release markers. (Any red flags waving?)
<br>
- Checking the <a target="_blank" href="https:\/\/deliveryhero.enterprise.slack.com/archives/C026LKZNDJB" style="color: blue;text-decoration: underline;">tlb_production_deployments Slack Channel</a>.
<br>
- Checking <a target="_blank" href="https:\/\/argo.dhhmena.com/applications/pro-api-failover?resource=" style="color: blue;text-decoration: underline;">ArgoCD</a>. (Is there a rogue deployment on the loose?)
<br>
+ [Yep, there’s a fresh pro-api release!] -> rollback_release_question

=== rollback_release_question ===
<b>Rollback the faulty release? (Time to hit the undo button!)</b>

+ [Q: How to rollback the release? (Is there a magic wand for this?)] -> rollback_release_answer
* [No, let’s just wait and hope for the best.] -> incident_neglect_rollback_release
    -> END

=== rollback_release_answer ===
<b>We have different options for rollback: we can use ArgoCD, trigger DroneCI, revert Git, and redeploy. (Choose your weapon wisely!)</b>

<a target="_blank" href="https:\/\/confluence.deliveryhero.com/display/TAL/Rollback+from+ArgoCD" style="color: blue;text-decoration: underline;">How to Rollback</a>

+ [Yes, rollback! (Let's rewind and try again!)] -> monitor_fix

=== monitor_fix ===
<b>Did the rollback fix the issue? (Fingers crossed! 🤞)</b>

+ [Yes, Apdex is climbing back! (Victory is in sight!)] -> monitor_apm

=== monitor_apm ===
<b>Monitor NewRelic APM? (Keep your eyes peeled!)</b>

+ [Yes, let’s keep a watchful eye. (Don't let it out of your sight!)] -> update_monitoring
* [No, I’m confident it’s all good now.] -> monitor_apm_answer
    -> END

=== monitor_apm_answer ===
+ [Wrong decision, let’s keep a watchful eye.] -> monitor_apm


=== update_monitoring ===
<b>Update the incident to monitoring state? (Let's keep the stakeholders in the loop!)</b>

+ [Yes, let’s keep everyone informed. (Communication is key!)] -> inform_team
* [No, I’m too busy juggling logs and dashboards.] -> update_monitoring_answer

=== update_monitoring_answer ===
+ [better to update incident to monitoring to update stackholders, let’s keep everyone in the loop.] -> update_monitoring

=== inform_team ===
<b>Inform the team? (Sharing is caring!)</b>

+ [Yes, let’s share the findings and avoid surprises. (Teamwork makes the dream work!)] -> close_incident
* [No, this is my personal crusade. No one else needs to know.] -> inform_team_answer

=== inform_team_answer ===
+ [Better to inform the team ,let’s share the findings and avoid surprises.] -> inform_team

=== close_incident ===
<b>Close the incident? (Is it time to celebrate?)</b>

+ [Yes, Apdex is back on track. Crisis mitigated!] -> post_mortem
* [No, I’ll keep it open for dramatic effect. (Are you sure you want to prolong the agony?)] -> close_incident_answer

=== close_incident_answer ===
+ [Finaly time to chill, Apdex is back on track. Crisis mitigated! lets close the incident] -> close_incident


=== post_mortem ===
<b>Create a draft post-mortem with timelines and findings? (Let's learn from our mistakes!)</b>

+ [Yes, document everything. Learn from it. Be the hero your team needs! (A true champion of post-mortems!)] -> investigate_canary
* [No, please not me. (But who will save us from repeating history?)] -> post_mortem

=== post_mortem_answer ===
+ [We have to document everything. Learn from it. Be the hero your team needs.] -> post_mortem


=== investigate_canary ===
<b>Pair with the team to check why the canary didn’t detect high response during release?</b>

+ [Yes, let’s dig into it. (The truth is out there!)] -> conclusion
* [No, it’s not worth investigating. (But what if it happens again?)] -> investigate_canary_answer

=== investigate_canary_answer ===
+ [Better to help the team to avoid such situation later, let’s dig into it.] -> investigate_canary

=== conclusion ===
<b>🎉 **Victory!** You’ve saved the pro-api and earned the gratitude of all pro customers. The Apdex score is shining again, and your team will be more prepared for the next battle. Take a bow, engineer extraordinaire!</b>
-> END

=== incident_neglect_start ===
<b>💀 **Oh no!** The incident spiraled out of control. Stakeholders are unhappy, and your inbox is flooded with *“urgent”* messages. Time to regroup and try again!</b>

+ [Try again?] -> start

=== incident_neglect_check_customer_impact ===
<b>💀 **Oh no!** The incident spiraled out of control. Stakeholders are unhappy, and your inbox is flooded with *“urgent”* messages. Time to regroup and try again!</b>

+ [Try again?] -> check_customer_impact_question // Divert to the _question knot

=== incident_neglect_create_incident ===
<b>💀 **Oh no!** The incident spiraled out of control. Stakeholders are unhappy, and your inbox is flooded with *“urgent”* messages. Time to regroup and try again!</b>

+ [Try again?] -> create_incident

=== incident_neglect_check_new_release ===
<b> Hope is not a strategy, my friend!</b>
</br>
<b>💀 **Oh no!** The incident spiraled out of control. Stakeholders are unhappy, and your inbox is flooded with *“urgent”* messages. Time to regroup and try again!</b>

+ [Try again?] -> check_new_release_question // Divert to the _question knot

=== incident_neglect_rollback_release ===
<b>💀 **Oh no!** The incident spiraled out of control. Stakeholders are unhappy, and your inbox is flooded with *“urgent”* messages. Time to regroup and try again!</b>

+ [Try again?] -> rollback_release_question // Divert to the _question knot

=== incident_neglect_monitor_fix ===
<b>💀 **Oh no!** The incident spiraled out of control. Stakeholders are unhappy, and your inbox is flooded with *“urgent”* messages. Time to regroup and try again!</b>

+ [Try again?] -> monitor_fix

=== incident_neglect_check_newrelic ===
<b>💀 **Oh no!** The incident spiraled out of control. Stakeholders are unhappy, and your inbox is flooded with *“urgent”* messages. Time to regroup and try again!</b>
+ [Try again?] -> check_newrelic
