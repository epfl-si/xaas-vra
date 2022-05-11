## Additional Actions in custom resource

* [Modify_Object_Data](Modify_Object_Data.yml) &rarr; Modify Object Data - generic ([Xaas] Modify Object Data)
* [Modify_Deletion_Policy](Modify_Deletion_Policy.yml) &rarr; Modify Deletion Policy - generic
* [Request_Support](Request_Support.yml) &rarr; Request Support - generic

### Volume: all
* [View_Details](View_Details.yml) + [css](View_Details.css) &rarr; View Details (NAS: View Details)
* [Resize](Resize.yml) &rarr; Resize (NAS: Resize)
* [Modify_Access_Policy](Modify_Access_Policy.yml) &rarr; Modify Access Policy (NAS: Modify Access Policy)
  * for col volumes only:
````yaml
matchExpression:
- and:
  - key: properties.access
    operator: eq
    value: nfs3
````

### Volume: col
* [Modify_Snapshot_Policy](col/Modify_Snapshot_Policy.yml) &rarr; Modify Snapshot Policy (NAS: Modify Snapshot Policy )
* [Resize](Resize.yml) &rarr; Resize specific form
