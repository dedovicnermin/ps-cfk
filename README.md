# PS-CFK [![Build status](https://badge.buildkite.com/4c4c630f4155155b3572bfc322659731a1548b8758fb56f770.svg)](https://buildkite.com/nerm/ps-cfk)

##  what it does, and when and how you should use it…

This repository allows PS to configure/build/deploy and deliver environment-specific CFK clusters for customers on GKE/EKS/AKS K8-clusters. Use this repository as a reference for a kustomized-approach to a secure RBAC-enabled CFK environment that customers can depend on. One should use this repository using `kustomize` to build specific external dependencies, environment scoped CFK infra / resources (CRDs).  


**BEFORE YOU BEGIN**:
     
1. [operator_base](ps-cfk-infra/bases/01_operator/kustomization.yml) expects file `license-secret.yml` to exist
2. Paste your license into [license-secret_changeme_and_rename_to_license-secret.yml](ps-cfk-infra/bases/01_operator/license-secret_changeme_and_rename_to_license-secret.yml)
3. Rename the file to become `license-secret.yml` 

```
export TARGET="ps-cfk-infra/bases/01_operator/"
mv $TARGET/license-secret_changeme_and_rename_to_license-secret.yml $TARGET/license-secret.yml
```

> **NOTE**: If you don't have a license, comment out `license.secretRef` line within operator config [values.yml](ps-cfk-infra/bases/01_operator/values.yml). Additionally, one can either comment out kustomization resource `license-secret.yml` in [operator kustomization definition](ps-cfk-infra/bases/01_operator/kustomization.yml) or follow the #3 step above.  


## GKE Deployment (with prometheus)


### 1. Deploy gke with terraform 

  1. Ensure you have `gcloud` installed and authenticated (`gcloud auth login`)
  2. modify `terraform.tfvars`. Required changes: 
     - `cluster_name`
     - `owner_label`
  3. 


![tf_gke](assets/tf_gke.gif)

<br>

> **NOTE:** `terraform init` will not work if you have not authenticated with `gcloud` cli or if your accound does not have the required APIs enabled to deploy GKE.

<br>
<br>
<br>
<hr>

### 2. Deploy pre-requisites (operator / ingress controller / ldap server / prometheus + grafana) 

![prereq_gke](assets/prereq_gke.gif)


<br>





<br>
<br>
<hr>

### 3. Deploy CFK components (Internal:MTLS | External: SASL_SSL/PLAIN (ldap supported))

![cfkinfra_gke](assets/cfkinfra_gke.gif)


<br>
<br>


> **NOTE:** Pasting the output of [output_hosts.sh](ps-cfk-infra/output_hosts.sh) into `/etc/hosts` enables communication with cfk-components / observability-related resources from your local machine. To verify connectivity, `ping` each endpoint. Additionally, in web browser, navigate to `http://grafana.confluentps.io` or `http://prometheus.confluentps.io`. Credentials to access grafana : `pscfk` / `pscfk-secret`. Dashboards are created automatically.    


<br>
<br>

<hr>




### 4. Deploy CFK CFRBs 

![cfkapp_gke](assets/cfkapp_gke.gif)


<br>
<br>

> **NOTE:** At this point, you can head over to browser and navigate to `https://c3.<env>.<site>.confluentps.io`. If you've been following 1-3 above, the endpoint is `https://c3.dev.gke.confluentps.io` (`admin1` / `admin1-secret`)

<br>
<br>
<br>
<hr>




## Misc: Inspect ldap entries with `ldapsearch`


![ldapsearch](assets/ldapsearch.gif)

<br>
<br>
<br>
<br>
<hr>

## Misc: Datagen connectors

![datagen](assets/connectors_datagen.gif)


<br>
<br>
<br>
<hr>


> **NOTE:** [avro](ps-cfk-app/bases/connectors/datagen/avro/kustomization.yml) and [protobuf](ps-cfk-app/bases/connectors/datagen/protobuf/kustomization.yml) can be modified to include/exclude connectors that get deployed. Connectors deployed determined by values listed under `resources`   
