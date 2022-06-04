# install on test its

## Status:
* XaasNas: OK, problems with automatic deployment of day-2 forms (made manually)
* XaasK8s: OK
* XaasS3: pending, problem with Scality API

## Installing forms (automatic)
Use the REST_API project:
```bash
cd $REST_API/src
python form_tool.py ...
```

## Orchestrator:
1. define git repo -> check username, currently: maciek01170
2. git history -> pull
3. add the following variables in XaasGeneralConfigITServices (integrate in git/dev-mm)
    * sshHost
    * sshPassword - SecureString, value from SDDC KeePass (used to connect to the SSH host, must be specified explicitly)
    * srcAppliance - test-itservices (identifier of the appliance) 
4. workflow ch.epfl.xaas.install/Install all:
    * set variable cleanup to **false**
    * launch the workflow for the tenant ITServices -> answer 'yes' to import untrusted certificate
    * reset cleanup to **true**
5. test:
   * SSH + PS1: getBucketInfo('svc0166-0ef00e9ac34cc0bfed04319b306e7d4a') -> problem on the backend, SSH works
   * vRA REST API: - failed, vRA host incorrect (created by install workflow) -> create the vRA host BEFORE the workflow
     * host created for 

## Cloud Assembly

### Custom Resources:
1. create custom resources in CA user interface:
   * specify the workflows for Create + Destroy
   * activate the custom resource
   * define all Additional Actions (without forms), list in PROJECT/forms/<namespace>/day-2/README.md:
      * [XaasK8s](../forms/XaasK8s/day-2/README.md)
      * [XaasNas](../forms/XaasNas/day-2/README.md)
      * [XaasS3](../forms/XaasS3/day-2/README.md)
      * done: 
        * XaasNas
        * XaasK8s
2. install the forms using the python script from **REST_API** project /later/
```bash
cd $REST_API/src
python form_tool.py --tenant its --day 2 --type XaasNas.Volume
```

### Cloud templates
3. once Custom Resources are created, update the CA projects + git repos:
````shell
ssh vsissp-psh-svc-t-01@vsissp-psh-t-02.intranet.epfl.ch
.\admin-endpoint.ps1 -targetEnv test -targetTenant its -action delCatalogProject -name "S3 (Public)"
.\admin-endpoint.ps1 -targetEnv -dev -targetTenant its -action addCatalogProject -name " S3 (Public)" -privacy public
````
4. expose to Service Broker: for each cloud template installed:
    * Settings: Allow an administrator to share with any project in this organization
    * Version History: Release the latest version

## Service Broker
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
    * each form must be enabled in form editor via UI, otherwise not visible via REST
    * install the forms using the python script from **REST_API** project
5. Day-2 actions policies: 
   * add all day-2 actions but XXX.modify_deletion_policy to epfl_day2_members
   * add XXX.modify_deletion_policy to epfl_day2_admin
6. 
7.

### Installing forms
* XaasK8s:
```bash
python form_tool.py --tenant its --day 1 --type XaasK8s.Cluster
```

* XaasNAS:
```bash
python form_tool.py --tenant its --day 1 --type XaasNas.Volume --prefix app
```
