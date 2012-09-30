chef_repo_path                      "/Users/dietrich/git/chef-repo" # the path to your chef-repo
ssh_user                            "d" # the ssh user you want Small Wonder and Salticid to use
application_deployment_attribute    "deployed_applications" # the attribute Small Wonder will save data back to chef using
config_template_working_directory   "/tmp/small_wonder" # the local directory temporary template work will be done in
remote_working_dir                  "/tmp/small_wonder_#{Time.now.to_i}" # the remote directory temporary template work will be done in
application_deployments_dir         "/Users/dietrich/git/chef-repo/application_deployments" # path to your role files
application_templates_dir           "/Users/dietrich/git/chef-repo/application_templates" # path to your template files
databag                             "apps" # the databag that contains application configuration data items

