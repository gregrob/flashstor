# Flashstor Server
<img src="./images/flashstor.png" width="10%" height="10%"> <br />
Structure to manage docker containers on a Asustor Flashstor NAS using compose .yaml files. <br /> <br />
For applications like Portainer and Jellyfin you can decide when and what version you update to.  You are not reliant on the application maintainer in ADM. <br />

## Setup
1. From App Central install `Docker Engine`, `Perl`, `Git`, and `nano`.
2. Create a share on the NAS called `server`.
3. Clone this git repository to the share called `server`.
4. To enable HW transcoding for apps such as Jellyfin or Frigate, make sure `Media Mode` is enabled. <br />
<img src="./images/mediamode.png" width="60%" height="60%">

## Docker Containers

All Flashstor server related scripts and configurations.
The following folder structure is used:
```
    .
    └── server
     └── containers         # common scripts for containers
      └── <container_name>  # container - call scripts to start / stop from here
       ├── data             # persistent volume
       |├── common          # persistent volume - common across all hosts
       |└── host            # persistent volume - specific to a host
       └── secrets          # passwords
```

## containers
