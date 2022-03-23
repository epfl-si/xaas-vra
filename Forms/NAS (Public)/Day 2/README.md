## Additional Actions in custom resource
* **Modify_Deletion_Policy** (Modify Deletion Policy)
* **Request_Support** (Request Support)
* **Resize** (Resize)
* **Modify_Access_Policy** (Modify Access Policy):
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
* **Modify_Snapshot_Policy** (Modify Snapshot Policy):
    ````yaml
  matchExpression:
  - and:
      - key: '${properties.volType}'
        operator: eq
        value: col
      ````
* **View_Details** (View Details)
* **Modify_Notification_Mail** (Modify Notification Mail)