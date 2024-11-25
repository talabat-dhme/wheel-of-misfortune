# Incident 3: iPhone Errorpocalypse 🛠️📱
-> start


=== start ===
You've received alerts that the error rate for iPhones has increased by 10%.

+ [Acknowledge the alert.] -> check_customer_impact
* [No, I’m busy coding. it will recover soon]
    -> incident_neglect_start
    -> END 

=== check_customer_impact ===
<b>Is there any order loss or poor customer experience?</b>
+ [Yes, orders have dropped by 5%.] -> check_country_impact
* [No need to check order loss; I’ll just stare at logs and hope for clarity.]
    -> incident_neglect_check_customer_impact 
    -> END 

=== check_country_impact ===
<b>Is the issue across all countries or specific?</b>
+ [NewRelic Dashboard shows it's a global crisis! The Iphone error is affecting all countries.] -> create_incident
+ [Brace yourself and proceed to create the incident.] -> create_incident

=== create_incident ===
<b>Create an incident?</b>
+ [Yes, let's document this like a true hero.] -> check_recent_release
+ [No need, I’ll fix it before anyone notices.] -> check_recent_release
* [No, I'm allergic to post-mortems. Not again!]
    -> incident_neglect_create_incident -> END 

=== check_recent_release ===
<b>Was there a release during the day?</b>
+ [Check tlb_production_deployments. Turns out, there was no release. It's not a release bug, it's just your lucky day!] -> check_endpoints
+ [Dig deeper. Contain the incident and dive in.] -> check_endpoints
* [Close it. It's probably temp errors. (Spoiler: It's not.)]
    -> incident_neglect_check_recent_release -> END 

=== check_endpoints ===
<b>Is the high error rate across all endpoints or specific ones?</b>
+ [Across all endpoints. Great, the mystery deepens.] -> check_fwf_flag

=== check_fwf_flag ===
<b>Is there an FWF flag just toggled today?</b>
+ [Nope, not related. It's affecting all countries and all endpoints. Move along.] -> check_clusters
+ [Investigate further. This won't solve itself.] -> check_clusters

=== check_clusters ===
<b>Is the error rate increased across all clusters?</b>
+ [Nope, just the main EKS cluster. ] -> check_pod_impact

=== check_pod_impact ===
<b>Is the error rate only for a specific pod/host?</b>
+ [Yes, one pod is throwing error. (Typical for windows pods ;) )] -> update_monitoring_state

=== update_monitoring_state ===
<b>Update the incident to monitoring state?</b>
+ [Yes, let's keep everyone in the loop.] -> restart_pods
* [No, I’m busy. Let them guess what's happening.]
    -> incident_neglect_update_monitoring_state -> END 

=== restart_pods ===
<b>Restart all pods?</b>
+ [No, that's overkill. Let’s just deal with the troublemaker.] -> kill_pod

=== kill_pod ===
<b>Kill the problematic pod?</b>
+ [Yes. A new pod will be recreated] -> monitor_error_rate

=== monitor_error_rate ===
<b>Monitor the error rate after restarting the pod?</b>
+ [Yes, and it’s reducing! Crisis mitigated!] -> resolve_incident
* [No, I’m confident it’s fixed. What could possibly go wrong?]
    -> incident_neglect_monitor_error_rate -> END 

=== resolve_incident ===
<b>Update the incident to resolved state?</b>
+ [Yes, declare victory and bask in the glory.] -> post_mortem
* [No, I'm busy. Someone else can do it.]
    -> incident_neglect_resolve_incident -> END 

=== post_mortem ===
<b>Create a draft post-mortem with timelines and findings?</b>
+ [Yes, document everything like the hero you are.] -> pair_with_team
* [No, please not me.]
    -> incident_neglect_post_mortem -> END 

=== pair_with_team ===
<b>Pair with the team to deep dive further?</b>
+ [Yes, let’s analyze k8s events and logs from Grafana like detectives.] -> conclusion

=== conclusion ===
🎉 **Congratulations!** The Error has been resolved, and you've learned valuable lessons along the way. The team appreciates your efforts. Now go treat yourself to some well-deserved coffee (or tea)!
-> END

=== incident_neglect_start ===
🚨 **Oh no!** Your inaction made things worse. The team had to jump in, stakeholders are frustrated, and you’ve earned the *“Least Responsive On-Call”* award for today. 

* [Try again?] -> start

=== incident_neglect_check_customer_impact ===
🚨 **Oh no!** Your inaction made things worse. The team had to jump in, stakeholders are frustrated, and you’ve earned the *“Least Responsive On-Call”* award for today. 

* [Try again?] -> check_customer_impact

=== incident_neglect_create_incident ===
🚨 **Oh no!** Your inaction made things worse. The team had to jump in, stakeholders are frustrated, and you’ve earned the *“Least Responsive On-Call”* award for today. 

* [Try again?] -> create_incident

=== incident_neglect_check_recent_release ===
🚨 **Oh no!** Your inaction made things worse. The team had to jump in, stakeholders are frustrated, and you’ve earned the *“Least Responsive On-Call”* award for today. 

* [Try again?] -> check_recent_release

=== incident_neglect_update_monitoring_state ===
🚨 **Oh no!** Your inaction made things worse. The team had to jump in, stakeholders are frustrated, and you’ve earned the *“Least Responsive On-Call”* award for today. 

* [Try again?] -> update_monitoring_state

=== incident_neglect_monitor_error_rate ===
🚨 **Oh no!** Your inaction made things worse. The team had to jump in, stakeholders are frustrated, and you’ve earned the *“Least Responsive On-Call”* award for today. 

* [Try again?] -> monitor_error_rate

=== incident_neglect_resolve_incident ===
🚨 **Oh no!** Your inaction made things worse. The team had to jump in, stakeholders are frustrated, and you’ve earned the *“Least Responsive On-Call”* award for today. 

* [Try again?] -> resolve_incident

=== incident_neglect_post_mortem ===
🚨 **Oh no!** Your inaction made things worse. The team had to jump in, stakeholders are frustrated, and you’ve earned the *“Least Responsive On-Call”* award for today. 

* [Try again?] -> post_mortem