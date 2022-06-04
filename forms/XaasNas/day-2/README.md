## Additional Actions in XaasNas
| Number | Condition | automatic? | Workflow  Name                | Name                    | Menu label             | form                                   | css |
|-------:|-----------|:----------:|:------------------------------|-------------------------|------------------------|----------------------------------------|-----|
|     1. |           | No submit  | [Xaas] Modify Deletion Policy | Modify_Deletion_Policy  | Modify Deletion Policy | [yml](Modify_Deletion_Policy.yml)      |
|     2. |           |            | [Xaas] Modify Object Data     | Modify_Object_Data      | Modify Object Data     | [yml](Modify_Object_Data.yml)          |
|     3. |           |            | [Xaas] Request Support        | Request_Support         | Request Support        | [yml](Request_Support.yml)             |
|        |           |            | **Volume: all**               |
|     4. |           |            | NAS: View Details             | View_Details            | View Details           | [yml](View_Details.yml)                |
|     5. | [^1]      | No submit  | NAS: Modify Access Policy     | Modify_Access_Policy    | Modify Access Policy   | [yml](Modify_Access_Policy.yml)        |
|        |           |            | **Volume: app**               |
|     6. |           |            | NAS: Resize                   | Resize                  | Resize                 | [yml](app/Resize.yml)...               |
|        |           |            | **Volume: col**               |
|     6. |           | No submit  | NAS: Resize                   | Resize                  | Resize                 | [yml](col/Resize.yml)...               |
|     7. |           | No submit  | NAS: Modify Snapshot Policy   | Modify_Snapshot_Policy  | Modify Snapshot Policy | [yml](col/Modify_Snapshot_Policy.yml)  |

[^1]: Modify_Access_Policy, for col volumes only
````yaml
matchExpression:
  - and:
    - key: properties.access
      operator: eq
      value: nfs3
````

### Installing forms:
Using the python script in **$REST_API** project:
```bash
cd $REST_API/src
# launch python form_tool.py --tenant <tenant> dev --day 2 --type fullXaasDTName, e.g.
# the parameter --prefix is required for EPFL and indicates the type of volume col 
python form_tool.py ...
```
No submit possible after such a first 
#### day-1:
```bash
python form_tool.py --tenant its --day 1 --type XaasNas.Volume --prefix app
```
#### day-2:
Does not work for several forms (table above). Workaround: download the form manually in CA/form editor
```bash
python form_tool.py --tenant its --day 2 --type XaasNas.Volume --prefix app
```
