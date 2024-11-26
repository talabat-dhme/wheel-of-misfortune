-> start

=== start ===
# Incident: Increase in Response Time

You're on call when suddenly, alerts fire off about an increase in response time for a critical service. 

+ [What do you do next?] -> choices_1

=== choices_1 ===
+ [Acknowledge the alert.] -> check_customer_impact
+ [No, I'll just finish this one line of code...] -> incident_neglect_1

=== check_customer_impact ===
Okay, alerts acknowledged. But are customers actually affected?

+ [What do you do next?] -> choices_2

=== choices_2 ===
+ [Check for order loss or poor customer experience.] -> create_incident
+ [Assume there's no customer impact for now.] -> create_incident 

=== create_incident ===
Time to create an incident to track this investigation.

+ [What do you do next?] -> choices_3

=== choices_3 ===
+ [Yes, create an incident.] -> page_team
+ [No, it's probably nothing.] -> incident_neglect_2 

=== page_team ===
Do you need to bring in the TEAM right away?

+ [What do you do next?] -> choices_4

=== choices_4 ===
+ [Yes, page the team.] -> keep_incident_updated 
+ [No, I can handle this myself.] -> keep_incident_updated

=== keep_incident_updated ===
Keep stakeholders in the loop.  Communication is key!

+ [What do you do next?] -> choices_5

=== choices_5 ===
+ [Yes, provide regular updates to the incident.] -> check_recent_release
+ [No, I'll update them later.] -> incident_neglect_3

=== check_recent_release ===
Was there a recent release that could have caused this?

+ [What do you do next?] -> choices_6

=== choices_6 ===
+ [Check the release history] -> check_newrelic_dashboard 
+ [No, there were no recent releases.] -> check_newrelic_dashboard

=== check_newrelic_dashboard ===
Let's dive into NewRelic to see what's going on.

+ [What do you do next?] -> choices_7

=== choices_7 ===
+ [Open the NewRelic Dashboard and investigate traces.] -> investigate_resource_utilization

=== investigate_resource_utilization ===
The traces show high response times across middleware .net and all external services. Could it be a resource issue?

+ [What do you do next?] -> choices_8

=== choices_8 ===
+ [Investigate resource utilization.] -> check_grafana_dashboard

=== check_grafana_dashboard ===
Time to check Grafana for a broader view of resource usage.

+ [What do you do next?] -> choices_9

=== choices_9 ===
+ [Check the average resource utilization across all pods in Grafana.] -> view_grafana_dashboard

=== view_grafana_dashboard ===
Hmm, the average resource utilization looks normal.

+ [What do you do next?] -> choices_10

=== choices_10 ===
+ [Go back and check NewRelic for per-pod details.] -> view_newrelic_per_pod_details

=== view_newrelic_per_pod_details ===
Aha! NewRelic shows high response times per pod.  Could it be a CPU limit issue?

+ [What do you do next?] -> choices_11

=== choices_11 ===
+ [Page the team with your updated findings.] -> continue_monitoring

=== continue_monitoring ===
The team is now aware and fixing.  Keep an eye on things!

+ [Continue monitoring dashboards and trace logs.] -> END


=== incident_neglect_1 ===
The response time continues to increase, and you miss valuable time to mitigate the issue.
-> END

=== incident_neglect_2 ===
Without an incident, it's harder to track progress and coordinate efforts. 
-> END

=== incident_neglect_3 ===
Stakeholders are left in the dark, and communication suffers. 
-> END