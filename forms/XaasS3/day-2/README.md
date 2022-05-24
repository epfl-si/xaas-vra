## Additional Actions on XaasS3.Bucket

|   # | Workflow  Name                  | Name                     | Menu label                 | form                                | css                             |     |     |
|----:|:--------------------------------|--------------------------|----------------------------|-------------------------------------|---------------------------------|-----|-----|
|  1. | [Xaas] Modify Deletion Policy   | Modify_Deletion_Policy   | Modify Deletion Policy     | [yml](Modify_Deletion_Policy.yml)   |
|  2. | [Xaas] Modify Object Data       | Modify_Object_Data       | Modify Object Data         | [yml](Modify_Object_Data.yml)       |
|  3. | [Xaas] Request Support          | Request_Support          | Request Support            | [yml](Request_Support.yml)          | 
|     | S3: View Details                | View_Details             | View Details               | [yml](View_Details.yml)             | [css](View_Details.css)         |
|     | S3: Regenerate Keys             | Regenerate_Keys          | Regenerate Keys            | [yml](Regenerate_Keys.yml)          |
|     | S3: Modify Versioning           | Modify_Versioning        | Modify Versioning          | [yml]()                             | [css](Cluster_View_Details.css) |     |     |

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
