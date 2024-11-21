-> start

=== start ===
# Incident 4: The Apdex Abyss 🚨⚙️

**You've received alerts that the Apdex score for the pro-api has dropped below 70%.

+ [Acknowledge like a Hero engineer.] -> check_customer_impact
+ [No, I’m busy coding. Alerts are too sensitive today, right?] -> incident_neglect

=== check_customer_impact ===
**Is there any order loss or poor customer experience?
+ [No drop in orders, but customer experience might be suffering. Let’s keep digging.] -> create_incident
+ [No need to check order loss. Logs > Humans. Let me dive into the root cause.] -> incident_neglect

=== create_incident ===
**Still create an incident?
+ [Yes, better to log it as it’s a customer-facing endpoint.] -> check_newrelic
+ [No need. I’ll fix it so fast no one will know! Ninja mode on.] -> check_newrelic
+ [No, I’m allergic to post-mortems. No incidents = no write-ups.] -> incident_neglect

=== check_newrelic ===
**Check NewRelic APM for high response times?
+ [Yes, and it seems the high response time started 15 minutes ago.] -> check_new_release

=== check_new_release ===
**Is this related to a new release?
+ [Check NewRelic release markers. Nothing unusual there.] -> update_monitoring
+ [Check tlb_production_deployments. Yep, there’s a fresh pro-api release!] -> rollback_release
+ [Check argoCD for new deployment. Yep, there’s a fresh pro-api release!] -> rollback_release

=== rollback_release ===
**Rollback the faulty release?
+ [Yes, rollback using ArgoCD. Trigger DroneCI, revert Git, and redeploy.] -> monitor_fix
+ [No, let’s just wait and hope for the best.] -> incident_neglect

=== monitor_fix ===
**Did the rollback fix the issue?
+ [Yes, Apdex is climbing back.] -> monitor_apm
+ [No, something else is at play. Time to investigate further.] -> incident_neglect

=== monitor_apm ===
**Monitor NewRelic APM?
+ [Yes, let’s keep a watchful eye.] -> update_monitoring
+ [No, I’m confident it’s all good now.] -> incident_neglect

=== update_monitoring ===
**Update the incident to monitoring state?
+ [Yes, let’s keep everyone in the loop.] -> inform_team
+ [No, I’m too busy juggling logs and dashboards.] -> incident_neglect

=== inform_team ===
**Inform the team?
+ [Yes, let’s share the findings and avoid surprises.] -> close_incident
+ [No, this is my personal crusade. No one else needs to know.] -> incident_neglect

=== close_incident ===
**Close the incident?
+ [Yes, Apdex is back on track. Crisis mitigated!] -> post_mortem
+ [No, I’ll keep it open for dramatic effect.] -> incident_neglect

=== post_mortem ===
**Create a draft post-mortem with timelines and findings?
+ [Yes, document everything. Learn from it. Be the hero your team needs.] -> investigate_canary
+ [No, please not me. ] -> incident_neglect

=== investigate_canary ===
**Pair with the team to check why the canary didn’t detect high response during release?
+ [Yes, let’s dig into it. ] -> conclusion
+ [No, it’s not worth investigating. ] -> incident_neglect

=== conclusion ===
🎉 **Victory!** You’ve saved the pro-api and earned the gratitude of all who use it. The Apdex score is shining again, and your team will be more prepared for the next battle. Take a bow, engineer extraordinaire!
-> END

=== incident_neglect ===
💀 **Oh no!** The incident spiraled out of control. Stakeholders are unhappy, and your inbox is flooded with *“urgent”* messages. Time to regroup and try again!
-> END
