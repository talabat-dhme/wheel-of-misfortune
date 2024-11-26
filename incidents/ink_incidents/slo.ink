-> start

=== start ===
# Incident 2: Checkout Screen SLO Drop

You're an engineer on call. You've received alerts that the checkout screen SLO has dropped by 20%. Your heart races a bit – time to investigate!

+ [What do you do next?] -> choices_1

=== choices_1 ===
+ [Acknowledge the alert and start investigating.] -> check_customer_impact
+ [Ignore it; it's probably just a blip.] -> incident_neglect_1 

=== check_customer_impact ===
First things first: is this actually affecting customers? Are orders failing, or are people having a frustrating checkout experience? Time to check the metrics.

+ [What do you do next?] -> choices_2

=== choices_2 ===
+ [Dive into the order metrics and customer experience dashboards.] -> check_country_impact
+ [Assume the worst and skip straight to investigating the root cause.] -> incident_neglect_2

=== check_country_impact ===
Okay, there's definitely an impact. But is it everyone, or just users in a specific region? Let's check the NewRelic dashboard.

+ [What do you do next?] -> choices_3

=== choices_3 ===
+ [Filter the NewRelic dashboard by country.] -> update_stakeholders
+ [Panic and immediately escalate to stakeholders.] -> update_stakeholders 

=== update_stakeholders ===
Now that you have some initial information, it's time to loop in the key stakeholders.  

+ [What do you do next?] -> choices_4

=== choices_4 ===
+ [Yes, update stakeholders] -> create_incident
+ [No, I'll wait until I have more information.] -> create_incident 

=== create_incident ===
To keep track of the investigation and for better coordination, it's important to create an incident.

+ [What do you do next?] -> choices_5

=== choices_5 ===
+ [Create an incident using incident slack Bot] -> check_recent_release
+ [No need, I'll just fix it quickly.] -> check_recent_release
+ [Ugh, creating incidents is such a hassle.] -> incident_neglect_3

=== check_recent_release ===
Could a recent release be the culprit? Let's check the deployment history.

+ [What do you do next?] -> choices_6

=== choices_6 ===
+ [Check the tlb_production_deployments Slack channel for recent releases.] -> check_fwf_flag
+ [Skip this step and go straight to damage control.] -> check_fwf_flag 

=== check_fwf_flag ===
Maybe a feature flag was toggled recently?  

+ [What do you do next?] -> choices_7

=== choices_7 ===
+ [Investigate recent feature flag changes in the fwf-status-talabat channel.] -> toggle_fwf_flag
+ [No, feature flags are never the problem.] -> monitor_state

=== toggle_fwf_flag ===
If a faulty feature flag is the cause, you might need to toggle it.

+ [What do you do next?] -> choices_8

=== choices_8 ===
+ [Yes, toggle the flag after confirming with the team ] -> monitor_state 

=== monitor_state ===
After taking action (toggling a flag), it's crucial to monitor the situation.

+ [What do you do next?] -> choices_9

=== choices_9 ===
+ [Closely monitor the NewRelic dashboard for any changes.] -> update_incident

=== update_incident ===
Keep the incident updated with your findings and the current state.

+ [What do you do next?] -> choices_10

=== choices_10 ===
+ [Yes, provide regular updates to the incident.] -> resolve_incident
+ [No, I'm too busy firefighting.] -> incident_neglect_4

=== resolve_incident ===
Once the SLO recovers and the issue is resolved, it's time to close the incident.

+ [What do you do next?] -> choices_11

=== choices_11 ===
+ [Yes, resolve the incident and mark it as closed.] -> post_mortem
+ [No, let's just leave it open.] -> incident_neglect_5 

=== post_mortem ===
A post-mortem helps document the incident, identify root causes, and prevent similar incidents in the future.

+ [What do you do next?] -> choices_12

=== choices_12 ===
+ [Yes, write a draft post-mortem.] -> END

=== incident_neglect_1 ===
The SLO continues to plummet, and you miss a critical window for early mitigation. Your manager is not happy. 
-> END

=== incident_neglect_2 ===
You spend hours chasing the wrong lead, and the incident escalates unnecessarily.  Always check for customer impact first!
-> END

=== incident_neglect_3 ===
Failing to create an incident leads to confusion and poor coordination.  Incident management systems are your friend!
-> END

=== incident_neglect_4 ===
The situation worsens without updates, and stakeholders are left in the dark. Communication is key during an incident.
-> END

=== incident_neglect_5 ===
Leaving the incident open causes confusion and might delay important follow-up actions. Always close resolved incidents.
-> END