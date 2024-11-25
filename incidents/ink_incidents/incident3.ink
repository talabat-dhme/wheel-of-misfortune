# Incident 3: iPhone Errorpocalypse 🛠️📱
-> start


=== start ===
<b>You've received alerts that the error rate for iPhones has increased by 10%.</b>

+ [Acknowledge the alert.] -> check_customer_impact
* [No, I’m busy coding. it will recover soon]
    -> incident_neglect_start
    -> END

=== check_customer_impact ===
<b>Is there any order loss or poor customer experience?</b>

+ [Q: How to check if there is order impact ?] -> check_customer_impact_answer
* [No need to check order loss; I’ll just stare at logs and hope for clarity.]
    -> incident_neglect_check_customer_impact
    -> END
=== check_customer_impact_answer ===
<b>we can check impact on orders by checking <a target="_blank" href="https:\/\/onenr.io/0dQeqgG1rQe" style="color: blue;text-decoration: underline;" >NR Shopping Dashboard</a></b>

+ [Yes, orders have dropped by 5%.] -> check_country_impact


=== check_country_impact ===
<b>Is the issue across all countries or specific?</b>
+ [NewRelic Dashboard shows it's a global crisis! The Iphone error is affecting all countries.] -> create_incident
+ [Brace yourself and proceed to create the incident.] -> create_incident

=== create_incident ===
<b>Create an incident?</b>
+ [Yes, let's create incident using slack incident bot like a true hero.] -> check_recent_release_question
* [No need, I’ll fix it before anyone notices.] -> incident_neglect_create_incident -> END
* [No, I'm allergic to post-mortems. Not again!]
    -> incident_neglect_create_incident -> END

=== check_recent_release_question ===
<b>Was there a release during the day? </b>
+ [Q: How to check if there is a release correlated?] -> check_recent_release_answer

=== check_recent_release_answer ===
<b>We can check if there was a release today correlated with exceptions by </b>

Check <a target="_blank" href="https:\/\/deliveryhero.enterprise.slack.com/archives/C026LKZNDJB" style="color: blue;text-decoration: underline;" >tlb_production_deployments Slack Channel</a>
Check <a target="_blank" href="https:\/\/argo.dhhmena.com/applications/iphoneapi-failover?resource=" style="color: blue;text-decoration: underline;">Argo</a> . 
Turns out, there was no release. It's not a release bug, it's just your lucky day!

+ [Dig deeper. Contain the incident and dive in.] -> check_endpoints
* [Close it. It's probably temp errors. (Spoiler: It's not.)]
    -> incident_neglect_check_recent_release -> END

=== check_endpoints ===
<b>Is the high error rate across all endpoints or specific ones?</b>

hint: use <a target="_blank" href="https:\/\/onenr.io/0yw4PkO4Vw3" style="color: blue;text-decoration: underline;">NR Query</a>

+ [Across all endpoints. Great, the mystery deepens] -> check_fwf_flag_question

=== check_fwf_flag_question ===
<b>Is there an FWF flag just toggled today?</b>
+ [Q: How to check if there is FWF change correlated?] -> check_fwf_flag_answer

=== check_fwf_flag_answer ===

<b> FWF  <a target="_blank" href="https:\/\/deliveryhero.enterprise.slack.com/archives/C069FSDT9D3" style="color: blue;text-decoration: underline;" >Slack Channel</a> for all fwf updates</b>
+ [Nope, not related. It's affecting all countries and all endpoints. Move along.] -> check_clusters
+ [Investigate further. This won't solve itself.] -> check_clusters

=== check_clusters ===
<b>Is the error rate increased across all clusters?</b>
+ [Q: How to check errors from all clusters or specific cluster?] -> check_clusters_answer

=== check_clusters_answer ===
<b>We can use <a target="_blank" href="https:\/\/onenr.io/0Zw0qgxGERv" style="color: blue;text-decoration: underline;">NR Query</a> to correlate errors to specific cluster</b>
+ [Nope, just the main EKS cluster.] -> check_pod_impact


=== check_pod_impact ===
<b>Is the error rate only for a specific pod/host?</b>

+ [Q: How to check errors from specific pod/host?] -> check_pod_impact_answer

=== check_pod_impact_answer ===
<b>We can use <a target="_blank" href="https:\/\/onenr.io/0OQMMPbB9QG" style="color: blue;text-decoration: underline;">NR Query</a> to correlate errors to specific pod</b>

+ [Yes, one pod is throwing error. (Typical for windows pods ;) )] -> update_monitoring_state

=== update_monitoring_state ===
<b>Update the incident to monitoring state?</b>
+ [Yes, let's keep everyone in the loop.] -> restart_pods_question
* [No, I’m busy. Let them guess what's happening.]
    -> incident_neglect_update_monitoring_state -> END

=== restart_pods_question ===
<b>Restart all pods?</b>
+ [Q: Should we restart all pods in case one pod causing the issue?] -> restart_pods_answer

=== restart_pods_answer ===
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
<b> 🎉 **Congratulations!** The Error has been resolved, and you've learned valuable lessons along the way. The team appreciates your efforts. Now go treat yourself to some well-deserved coffee (or tea)!</b>
-> END

=== incident_neglect_start ===
<b> 🚨 **Oh no!** Your inaction made things worse. The team had to jump in, stakeholders are frustrated, and you’ve earned the *“Least Responsive On-Call”* award for today.</b>

* [Try again?] -> start

=== incident_neglect_check_customer_impact ===
<b> 🚨 **Oh no!** Your inaction made things worse. The team had to jump in, stakeholders are frustrated, and you’ve earned the *“Least Responsive On-Call”* award for today.</b>

* [Try again?] -> check_customer_impact

=== incident_neglect_create_incident ===
<b> 🚨 **Oh no!** Your inaction made things worse. The team had to jump in, stakeholders are frustrated, and you’ve earned the *“Least Responsive On-Call”* award for today.</b>

* [Try again?] -> create_incident

=== incident_neglect_check_recent_release ===
<b> 🚨 **Oh no!** Your inaction made things worse. The team had to jump in, stakeholders are frustrated, and you’ve earned the *“Least Responsive On-Call”* award for today.</b>

* [Try again?] -> check_recent_release_question

=== incident_neglect_update_monitoring_state ===
<b> 🚨 **Oh no!** Your inaction made things worse. The team had to jump in, stakeholders are frustrated, and you’ve earned the *“Least Responsive On-Call”* award for today.</b>

* [Try again?] -> update_monitoring_state

=== incident_neglect_monitor_error_rate ===
<b> 🚨 **Oh no!** Your inaction made things worse. The team had to jump in, stakeholders are frustrated, and you’ve earned the *“Least Responsive On-Call”* award for today.</b>

* [Try again?] -> monitor_error_rate

=== incident_neglect_resolve_incident ===
<b> 🚨 **Oh no!** Your inaction made things worse. The team had to jump in, stakeholders are frustrated, and you’ve earned the *“Least Responsive On-Call”* award for today.</b>

* [Try again?] -> resolve_incident

=== incident_neglect_post_mortem ===
<b> 🚨 **Oh no!** Your inaction made things worse. The team had to jump in, stakeholders are frustrated, and you’ve earned the *“Least Responsive On-Call”* award for today.</b>

* [Try again?] -> post_mortem