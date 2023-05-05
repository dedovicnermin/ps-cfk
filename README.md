# ps-cfk

**BEFORE YOU BEGIN**:
     
1. [operator_base](ps-cfk-infra/bases/01_operator/kustomization.yml) expects file `license-secret.yml` to exist.
2. Paste your license into [license-secret_changeme_and_rename_to_license-secret.yml](ps-cfk-infra/bases/01_operator/license-secret_changeme_and_rename_to_license-secret.yml)
3. Rename the file to become `license-secret.yml` 


```
export TARGET="ps-cfk-infra/bases/01_operator/"
mv $TARGET/license-secret_changeme_and_rename_to_license-secret.yml $TARGET/license-secret.yml
```



## GKE Deployment (with prometheus)


### 1. Deploy gke with terraform 

  1. Ensure you have `gcloud` installed and authenticated (`gcloud auth login`)
  2. modify `terraform.tfvars`. Required changes: 
     - `cluster_name`
     - `owner_label`
  3. 


![tf_gke](assets/tf_gke.gif)


<br>
<br>
<br>
<br>
<hr>

### 2. Deploy pre-requisites (operator / ingress controller / ldap server / prometheus + grafana) 

![prereq_gke](assets/prereq_gke.gif)


<br>
<br>
<br>
<br>
<br>
<br>
<hr>

### 3. Deploy CFK components (Internal:MTLS | External: SASL_SSL/PLAIN (ldap supported))

![cfkinfra_gke](assets/cfkinfra_gke.gif)


<br>
<br>
<br>
<br>
<br>
<br>
<hr>

### 4. Deploy CFK CFRBs 

![cfkapp_gke](assets/cfkapp_gke.gif)


<br>
<br>
<br>
<br>
<br>
<br>
<hr>

## Misc: Inspect ldap entries with `ldapsearch` 

![ldapsearch](assets/ldapsearch.gif)