## Additional Actions in custom resource

* [Modify_Object_Data](Modify_Object_Data.yml) &rarr; [Cluster] Modify Object Data - generic
* [Modify_Deletion_Policy](Modify_Deletion_Policy.yml) &rarr; [Cluster] Modify Deletion Policy - generic
* [Request_Support] &rarr; [Support] Request

### Volume: all
* [View_Details](View_Details.yml) + [css](View_Details.css) &rarr; View Details

* **Request_Support** (Request Support) - generic
* **Resize** (Resize) - app/ and ... col
* **Modify_Access_Policy** (Modify Access Policy):
  * for col volumes only:
      ````yaml
    matchExpression:
    - or:
        - key: '${properties.access}'
          operator: eq
          value: nfs3
        - key: '${properties.volType}'
          operator: eq
          value: app
      ````
* **Modify_Snapshot_Policy** (Modify Snapshot Policy): for col volumes only
    ````yaml
  matchExpression:
  - and:
      - key: '${properties.volType}'
        operator: eq
        value: col
      ````

Obsolete 
* **Modify_Notification_Mail** (Modify Notification Mail)
