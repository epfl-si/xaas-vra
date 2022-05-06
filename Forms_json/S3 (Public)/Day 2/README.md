## Additional Actions in custom resource
* **Modify_Object_Data** (Modify Object Data)
* **Request_Support** (Request Support)
* **View_Details** (View Details)
* **Regenerate_Keys** (Regenerate Keys)

* **Modify_Deletion_Policy** (Modify Deletion Policy)
* **Modify_Notification_Mail** (Modify Notification Mail)

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
