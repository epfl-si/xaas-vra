## Additional Actions in custom resource
* **Modify_Object_Data** (Modify Object Data) - generic
* **Modify_Deletion_Policy** (Modify Deletion Policy)
* **View_Details** (View Details)
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
