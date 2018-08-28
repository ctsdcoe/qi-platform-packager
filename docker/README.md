# Pre-requisites setting up QualityInsight solution in Docker and Docker compose environment 

-  Install Docker & Docker Compose

- For installation of Docker in RHEL Linux environment/Windows or MAC, please use below commands:
  Additionally check "https://docs.docker.com/compose/install/#install-compose" and 
  https://docs.docker.com/install/linux/docker-ce/ubuntu/
  
  Below are sample instructions 
 
 
        sudo yum install yum-utils
        
        sudo yum-config-manager --enable rhui-REGION-rhel-server-extras
        
        sudo yum install docker
        
        sudo groupadd docker
        
        sudo usermod -aG docker $(whoami)
        
        sudo service docker start
        
        sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
        
        sudo chmod +x /usr/local/bin/docker-compose
    
    
- Valid account in Docker Registry and qi-platform docker license.
  Please contact DCoE core-team for the account details.

- Please configure ‘DCoE Docker Registry’ as the insecure-registry in your docker environment.

- Login to DCoE Docker Registry 
    ```docker login -u <uname> -p <pwd> https://ec2-34-212-9-250.us-west-2.compute.amazonaws.com```


# Running the containers with demo project
   
   - clone this repo or copy 2 file under docker directory to ur local file ssytem where docker-compose and docker is installed
     
     - docker-compose.yml
     - start_docker-compose.sh
     
   - login into docker registry with valid credential
     ```
      docker login ec2-34-212-9-250.us-west-2.compute.amazonaws.com:443
      
      ```
   - execute the shell script to run the lastet containers 
     - with latest tag   
     
      ```
      
      ./qi_startcontainer.sh
      
      ```
     
     - with specific tag 
       
      ```
      
      ./start_docker-compose.sh <tag>
      
      ```
    
