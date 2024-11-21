-> start

=== start ===
# Incident 3: iPhone Errorpocalypse 🛠️📱

**You've received alerts that the error rate for iPhones has increased by 10%.

+ [Acknowledge the alert.] -> check_customer_impact
+ [No, I’m busy coding. it will recover soon] 
    -> incident_neglect

=== check_customer_impact ===
**Is there any order loss or poor customer experience?
+ [Yes, orders have dropped by 5%.] -> check_country_impact
+ [No need to check order loss; I’ll just stare at logs and hope for clarity.] 
    -> incident_neglect

=== check_country_impact ===
**Is the issue across all countries or specific?
+ [NewRelic Dashboard shows it's a global crisis! The Iphone error is affecting all countries.] -> create_incident
+ [Brace yourself and proceed to create the incident.] -> create_incident

=== create_incident ===
**Create an incident?
+ [Yes, let's document this like a true hero.] -> check_recent_release
+ [No need, I’ll fix it before anyone notices.] -> check_recent_release
+ [No, I'm allergic to post-mortems. Not again!] 
    -> incident_neglect

=== check_recent_release ===
**Was there a release during the day?
+ [Check tlb_production_deployments. Turns out, there was no release. It's not a release bug, it's just your lucky day!] -> check_endpoints
+ [Dig deeper. Contain the incident and dive in.] -> check_endpoints
+ [Close it. It's probably temp errors. (Spoiler: It's not.)] 
    -> incident_neglect

=== check_endpoints ===
**Is the high error rate across all endpoints or specific ones?
+ [Across all endpoints. Great, the mystery deepens.] -> check_fwf_flag

=== check_fwf_flag ===
**Is there an FWF flag just toggled today?
+ [Nope, not related. It's affecting all countries and all endpoints. Move along.] -> check_clusters
+ [Investigate further. This won't solve itself.] -> check_clusters

=== check_clusters ===
**Is the error rate increased across all clusters?
+ [Nope, just the main EKS cluster. ] -> check_pod_impact

=== check_pod_impact ===
**Is the error rate only for a specific pod/host?
+ [Yes, one pod is throwing error. (Typical for windows pods ;) )] -> update_monitoring_state

=== update_monitoring_state ===
**Update the incident to monitoring state?
+ [Yes, let's keep everyone in the loop.] -> restart_pods
+ [No, I’m busy. Let them guess what's happening.] 
    -> incident_neglect

=== restart_pods ===
**Restart all pods?
+ [No, that's overkill. Let’s just deal with the troublemaker.] -> kill_pod

=== kill_pod ===
**Kill the problematic pod?
+ [Yes. A new pod will be recreated] -> monitor_error_rate

=== monitor_error_rate ===
**Monitor the error rate after restarting the pod?
+ [Yes, and it’s reducing! Crisis mitigated!] -> resolve_incident
+ [No, I’m confident it’s fixed. What could possibly go wrong?] 
    -> incident_neglect

=== resolve_incident ===
**Update the incident to resolved state?
+ [Yes, declare victory and bask in the glory.] -> post_mortem
+ [No, I'm busy. Someone else can do it.] 
    -> incident_neglect

=== post_mortem ===
**Create a draft post-mortem with timelines and findings?
+ [Yes, document everything like the hero you are.] -> pair_with_team
+ [No, please not me.] 
    -> incident_neglect

=== pair_with_team ===
**Pair with the team to deep dive further?
+ [Yes, let’s analyze k8s events and logs from Grafana like detectives.] -> conclusion

=== conclusion ===
🎉 **Congratulations!** The Error has been resolved, and you've learned valuable lessons along the way. The team appreciates your efforts. Now go treat yourself to some well-deserved coffee (or tea)!
-> END

=== incident_neglect ===
🚨 **Oh no!** Your inaction made things worse. The team had to jump in, stakeholders are frustrated, and you’ve earned the *“Least Responsive On-Call”* award for today. Reflect and try again!
-> END
