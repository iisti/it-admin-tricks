# How to schedule snapshots in AWS with DLM (Data Lifecycle Manager)
* Creation, retention and deletion
* Main source https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/snapshot-lifecycle.html

## Create Lifecycle Policy

| Option | Configured value
| - | - |
| Description | weekly-tuesday-friday-snapshot
| Select resource type | Instance
| Target with these tags | A tag **backup-vm-id** was created and used for the EC2 VMs
| Policy Tags | **Key**: snapshot-name, **Value**: weekly-tuesday-friday-snapshot
| IAM Role | Default role
| Schedule name | weekly-tuesday-friday-snapshot
| Frequency | Weekly, Tue and Fri checkboxes
| Starting at | 02:00 UTC (this is 01:00 in Wien)
| Retention type | Count
| Retain | 4
| Copy tags from source | check, so that the Name of the disk volume will be copied.
| Variable tags | Defaults: *Key*: timestamp, *Key*: instance-id
| Additional tags | default empty
| Enable fast snapshot restore | unchecked by default
| Enable cross region copy | unchecked by default
| Exclude snapshot of root volume | unchecked by default
| Policy status after creation  | Enable pocliy

* Policy summary
 
      This policy will create consistent set of snapshots of tagged instances based on the following 1 schedule(s):
      weekly-tuesday-friday-snapshot:
      Every Tuesday and Friday starting at 02:00 UTC. A maximum of 4 snapshots will be retained of a target instance

### Explanations of schedules and snapshot creation times
* The snapshot creation doesn't start immediately when the **Starting at** time has been reached.
* Quotes from https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/snapshot-lifecycle.html#dlm-lifecycle-policies
  * *Schedules—The start times and intervals for creating snapshots. The first snapshot is created by a policy within one hour after the specified start time. Subsequent snapshots are created within one hour of their scheduled time. A policy can have up to four schedules; one mandatory schedule and up to three optional schedules. For more information, see Policy schedules.*
  * *For example, you could create a policy that manages all EBS volumes that have a tag with a key of account and a value of finance, creates snapshots every 24 hours at 0900 UTC, and retains the five most recent snapshots. Snapshot creation would start by 0959 each day.*
