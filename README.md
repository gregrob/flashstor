# flashstor server

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
