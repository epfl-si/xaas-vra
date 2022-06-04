## Cleanup
### Service Broker
Delete all content sources

### Cloud Assembly
* delete all projects in git integration
* delete all cloud templates (disconnected from git)
* delete all custom resources

## Installation
### Orchestrator
1. add SSH Host for vsissp-psh-svc-t-01@vsissp-psh-t-02.intranet.epfl.ch
2. add/modify the following variables in XaasGeneralConfigXXX (e.g. XaasGeneralConfigEPFL):
   * sshHost - the host created above
   * sshPassword - to connect to the SSH host (must be specified explicitly)
   * srcAppliance - identifier of the appliance, got from
3. launch the workflow ch.epfl.xaas.install/generate configuration in order to get correct Xaas configs + DT + DB. 
   **Caution** this workflow uses the database **xaas_test**, modify the **Create DB** variables if you want another DB
4. check if it works by launching e.g. getBucketInfo with dummy bucketName and have a look on the logs

### Cloud Assembly

#### custom resources:
1. create custom resources in CA user interface:
   * specify the workflows for Create + Destroy
   * activate the custom resource
   * define all Additional Actions (without forms), list in PROJECT/forms/<namespace>/day-2/README.md:
     * [XaasK8s](../forms/XaasK8s/day-2/README.md)
     * [XaasNas](../forms/XaasNas/day-2/README.md)
     * [XaasS3](../forms/XaasS3/day-2/README.md) - not yet!!!
2. install the forms using the python script from **REST_API** project
```bash
cd $REST_API/src
# launch python form_tool.py --tenant <tenant> dev --day 2 --type fullXaasDTName, e.g.
# the parameter --prefix is required for EPFL and indicates the type of volume col 
python form_tool.py --tenant dev --day 2 --type XaasNas.Volume --prefix col
```

#### Cloud templates
3. configure the git repository for cloud templates: for each Xaas service project (e.g. NAS (Public)) add the project to repo:
   * type: Cloud templates
   * repo: epfl-si/xaas-vra
   * branch: dev-mm|test
   * folder: CloudTemplates/Xaas service project, e.g. CloudTemplates/NAS (Public)

4. expose to Service Broker: for each cloud template installed:
   * Settings: Allow an administrator to share with any project in this organization
   * Version History: Release the latest version

### Service Broker
1. Import the cloud templates from CA:
   * Content & Policies 
   * &rarr; Content Sources 
   * &rarr; VMware Cloud Templates 
   * &rarr; specify Xaas service project as source (e.g. NAS (Public)) 
   * &rarr; Create & Import
2. Share the templates with _real_ project its_sddc
    * Content & Policies
    * &rarr; Content Sharing
    * &rarr; Specify the project you want to make the cloud templates available to
    * &rarr; Add items 
3. Customize content (as it will appear in the catalog). _Have a look on REST API for that?_ 
    * Content & Policies
    * &rarr; Content
    * &rarr; Configure Item
    * &rarr; Choose the icon [from in this project /icons](../icons)
4. add the custom resource additional actions to policies epfl_day2_admin + epfl_day2_members
5. Forms:
   * each form must be enabled (REST?) in form editor
   * manually uploaded the form for NAS Volume 
   * install the forms using the python script from **REST_API** project
```bash
cd $REST_API/src
# launch python form_tool.py --tenant <tenant> dev --day 2 --type fullXaasDTName, e.g.
# the parameter --prefix is required for EPFL and indicates the type of volume col 
python form_tool.py --tenant dev --day 2 --type XaasNas.Volume --prefix col
```


# install on test epfl
## Orchestrator:
1. merge xaas-vro: dev-mm -> test
2. define git repo -> check username, currently: maciek01170 
3. modify the following variables in XaasGeneralConfigEPFL (e.g. XaasGeneralConfigEPFL):
   * sshHost - already created
   * sshPassword - to connect to the SSH host (must be specified explicitly)
   * srcAppliance - identifier of the appliance, got from
4. workflow ch.epfl.xaas.install/Install all:
   * set variable cleanup to **false** 
   * launch the workflow for the tenant EPFL
   * reset cleanup to **true**
5. check if it works by launching e.g. getVolumeInfo with dummy bucketName and have a look on the logs

### Cloud Assembly

#### Custom Resources:
1. create custom resources in CA user interface:
   * specify the workflows for Create + Destroy
   * activate the custom resource
   * define all Additional Actions (without forms), list in PROJECT/forms/<namespace>/day-2/README.md:
      * [XaasK8s](../forms/XaasK8s/day-2/README.md)
      * [XaasNas](../forms/XaasNas/day-2/README.md)
      * [XaasS3](../forms/XaasS3/day-2/README.md) - not yet!!!

2. install the forms using the python script from **REST_API** project /later/
```bash
cd $REST_API/src
# launch python form_tool.py --tenant <tenant> dev --day 2 --type fullXaasDTName, e.g.
# the parameter --prefix is required for EPFL and indicates the type of volume col 
python form_tool.py --tenant dev --day 2 --type XaasNas.Volume --prefix col
```

#### Cloud templates
3. merge epfl-si/xaas-vra: dev-mm -> test
4. only on test-epfl **done on test-its**
   1. create catalog projects, e. g. NAS (Public) + git integration in GitHub-vRA **present on test-its**
   2. configure the git repository for cloud templates: for each Xaas service project (e.g. NAS (Public)) add the project to repo:
      * type: Cloud templates
      * repo: epfl-si/xaas-vra
      * branch: dev-mm|test
      * folder: CloudTemplates/Xaas service project, e.g. CloudTemplates/NAS (Public)
   
6. expose to Service Broker: for each cloud template installed:
   * Settings: Allow an administrator to share with any project in this organization
   * Version History: Release the latest version

### Service Broker
1. Import the cloud templates from CA:
   * Content & Policies
   * &rarr; Content Sources
   * &rarr; VMware Cloud Templates
   * &rarr; specify Xaas service project as source (e.g. NAS (Public))
   * &rarr; Create & Import
2. Share the templates with _real_ project:
   * Content & Policies
   * &rarr; Content Sharing
   * &rarr; Specify the project you want to make the cloud templates available to (e.g. epfl_vposi_itop_sddc)
   * &rarr; Add items
3. Customize content (as it will appear in the catalog). _Have a look on REST API for that?_
   * Content & Policies
   * &rarr; Content
   * &rarr; Configure Item
   * &rarr; Choose the icon [from in this project /icons](../icons)
4. Forms:
   * each form must be enabled (REST?) in form editor
   * install the forms using the python script from **REST_API** project
```bash
cd $REST_API/src
# launch python form_tool.py --tenant <tenant> dev --day 2 --type fullXaasDTName, e.g.
# the parameter --prefix is required for EPFL and indicates the type of volume col 
python form_tool.py --tenant dev --day 2 --type XaasNas.Volume --prefix col
```
