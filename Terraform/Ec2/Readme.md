 This project employs Gitops. By using Jenkins as a CI/CD pipeline
 that recieves weebhoks from the git repo when code changes are detected.
 It relies on terraform to provision an Ec2 instance in its own vpc in Aws.
 Jenkins pulls the jenkinsfile from the repo when changes are detected and applies the same changes.