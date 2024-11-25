# Incident 4: The Apdex Abyss 🚨⚙️
-> start

=== start ===
<b>You've received alerts that the Apdex score for the pro-api has dropped below 71%.</b>

+ [Acknowledge like a Hero engineer.] -> check_customer_impact_question
* [No, I’m busy coding. Alerts are too sensitive today, right?] -> incident_neglect_start
    -> END

=== check_customer_impact_question ===
<b>Is there any order loss or poor customer experience?</b>

+ [Q: How to check if there is order impact?] -> check_customer_impact_answer
* [No need to check order loss. Logs > Humans. Let me dive into the root cause.] -> incident_neglect_check_customer_impact
    -> END

=== check_customer_impact_answer ===
<b>We can check the impact on orders by checking <a target="_blank" href="https:\/\/onenr.io/0dQeqgG1rQe" style="color: blue;text-decoration: underline;">Shopping Dashboard</a></b>

+ [No drop in orders, but customer experience might be suffering. Let’s keep digging.] -> create_incident

=== create_incident ===
<b>Still create an incident?</b>

+ [Yes] -> check_newrelic
* [No] -> create_incident_answer
* [No, I’m allergic to post-mortems. No incidents = no write-ups.] -> incident_neglect_create_incident 
    -> END

=== create_incident_answer ===
+ [better to log it as it’s a customer-facing endpoint.] -> check_newrelic
+ [No need. I’ll fix it so fast no one will know! Ninja mode on.] -> incident_neglect_create_incident 
    -> END

=== check_newrelic ===
<b>Check NewRelic APM for high response time or increase in error rate to understand drop in Apdex?</b>

+ [Yes continue investigations] -> check_newrelic_answer
* [No need ,lets take a rest a bit] -> incident_neglect_check_newrelic

=== check_newrelic_answer ===
<b>it seems the high response time and started 10 minutes ago.</b>

+ [ What to check next?] -> check_new_release_question

=== check_new_release_question ===
<b>Is this related to a new release?</b>

+ [Q: How to check if there is a release correlated?] -> check_new_release_answer
* [No, let’s just wait and hope for the best.] -> incident_neglect_check_new_release
    -> END

=== check_new_release_answer ===
<b>We can check if there was a release today correlated by:</b>
<br>
Check NewRelic release markers. Nothing unusual there.
<br>
- Checking <a target="_blank" href="https:\/\/deliveryhero.enterprise.slack.com/archives/C026LKZNDJB" style="color: blue;text-decoration: underline;">tlb_production_deployments Slack Channel</a>
<br>
- Checking <a target="_blank" href="https:\/\/argo.dhhmena.com/applications/pro-api-failover?resource=" style="color: blue;text-decoration: underline;">ArgoCD</a>
<br>
+ [Yep, there’s a fresh pro-api release!] -> rollback_release_question

=== rollback_release_question ===
<b>Rollback the faulty release?</b>

+ [Q: How to rollback the release?] -> rollback_release_answer
* [No, let’s just wait and hope for the best.] -> incident_neglect_rollback_release
    -> END

=== rollback_release_answer ===
<b>We have differrent options for rollback we can use ArgoCD or trigger DroneCI or revert Git, and redeploy.</b>


<a target="_blank" href="https:\/\/confluence.deliveryhero.com/display/TAL/Rollback+from+ArgoCD" style="color: blue;text-decoration: underline;">How to Rollback</a>

+ [Yes, rollback.] -> monitor_fix

=== monitor_fix ===
Did the rollback fix the issue?
* [Yes, Apdex is climbing back.] -> monitor_apm


=== monitor_apm ===
Monitor NewRelic APM?

+ [Yes] -> update_monitoring
* [No] -> monitor_apm_answer

=== monitor_apm_answer ===
+ [Wrong decision, let’s keep a watchful eye.] -> monitor_apm

=== update_monitoring ===
Update the incident to monitoring state?

+ [Yes] -> inform_team
* [No] -> update_monitoring_answer

=== update_monitoring_answer ===
+ [better to update incident to monitoring to update stackholders, let’s keep everyone in the loop.] -> update_monitoring

=== inform_team ===
Inform the team?

+ [Yes] -> close_incident
* [No] -> inform_team_answer

=== inform_team_answer ===
+ [Better to inform the team ,let’s share the findings and avoid surprises.] -> inform_team

=== close_incident ===
Close the incident?

+ [Yes] -> post_mortem
* [No] -> close_incident_answer

=== close_incident_answer ===
+ [Finaly time to chill, Apdex is back on track. Crisis mitigated! lets close the incident] -> close_incident

=== post_mortem ===
Create a draft post-mortem with timelines and findings?

+ [Yes] -> investigate_canary
* [No] -> post_mortem_answer

=== post_mortem_answer ===
+ [We have to document everything. Learn from it. Be the hero your team needs.] -> post_mortem

=== investigate_canary ===
Pair with the team to check why the canary didn’t detect high response during release?

+ [Yes] -> conclusion
* [No] -> investigate_canary_answer

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

