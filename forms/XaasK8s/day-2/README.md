## Additional Actions in custom resource XaasK8s.Cluster


| Number | automatic? | Workflow  Name                  | Name                     | Menu label                       | form                                | css                             |
|-------:|:----------:|:--------------------------------|--------------------------|----------------------------------|-------------------------------------|---------------------------------|
|     1. |            | [Xaas] Modify Deletion Policy   | Modify_Deletion_Policy   | [Cluster] Modify Deletion Policy | [yml](Modify_Deletion_Policy.yml)   | 
|     2. |            | [Xaas] Modify Object Data       | Modify_Object_Data       | [Cluster] Modify Object Data     | [yml](Modify_Object_Data.yml)       | 
|     3. |            | [Xaas] Request Support          | Request_Support          | [Cluster] Request Support        | [yml](Request_Support.yml)          |
|        |            | **Cluster**                     |
|     4. |     No     | K8s: [Cluster] Resize           | Cluster_Resize           | [Cluster] Resize                 | [yml](Cluster_Resize.yml)           |
|     5. |            | K8s: [Cluster] View Details     | Cluster_View_Details     | [Cluster] View Details           | [yml](Cluster_View_Details.yml)     | [css](Cluster_View_Details.css) |
|        |            | **Harbor Robot**                |
|     6. |            | K8s: [Harbor Robot] Add         | Harbor_Robot_Add         | [Harbor Robot] Add               | [yml](Harbor_Robot_Add.yml)         |
|        |            | **LoadBalancer**                |
|     7. |     No     | K8s: [LoadBalancer] Add         | Loadbalancer_Add         | [LoadBalancer] Add               | [yml](Loadbalancer_Add.yml)         |
|     8. |            | K8s: [LoadBalancer] Delete      | Loadbalancer_Delete      | [LoadBalancer] Delete            | [yml](Loadbalancer_Delete.yml)      |
|        |            | **Namespace**                   |
|     9. |     No     | K8s: [Namespace] Add            | Namespace_Add            | [Namespace] Add                  | [yml](Namespace_Add.yml)            |
|    10. |     No     | K8s: [Namespace] Delete         | Namespace_Delete         | [Namespace] Delete               | [yml](Namespace_Delete.yml)         |
|    11. |            | K8s: [Namespace] Details        | Namespace_Details        | [Namespace] Details              | [yml](Namespace_Details.yml)        | [css](Namespace_Details.css)    |
|    12. |     No     | K8s: [Namespace] Extend Storage | Namespace_Extend_Storage | [Namespace] Extend Storage       | [yml](Namespace_Extend_Storage.yml) |

### Installing forms:
Using the python script in **$REST_API** project:
```bash
cd $REST_API/src
# launch python form_tool.py --tenant <tenant> dev --day 2 --type fullXaasDTName, e.g.
# the parameter --prefix is required for EPFL and indicates the type of volume col 
python form_tool.py ...
```

#### day-1:
```bash
python form_tool.py --tenant its --day 1 --type XaasK8s.Cluster
```
#### day-2:
Does not work for several forms (table above). Workaround: download the form manually in CA/form editor
```bash
python form_tool.py --tenant its --day 2 --type XaasK8s.Cluster
```
