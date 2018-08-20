## Scripts

One-off scripts available to sudoers.

* `admin-create-user`  
    Arguments: username, ssh key  
    Creates a new ssh user. Requires username and ssh key string
* `admin-assert-group`  
    Arguments: _None_  
    Creates required groups and sets up directory links.

## Server Jobs

Maintenance jobs run from the game server account.

* `server-restart-job`  
    Arguments: String[] of LGSM server names  
    Daily job force-restarting the server(s) and removing old mission files
* `server-keepalive-job`  
    Arguments: String[] of LGSM server names  
    Frequent job restarting dead servers
* `server-log-backup-job`  
    Arguments: _None_  
    Daily job which backs up the logs
* `server-data-backup-job`  
    Arguments: _None_  
    Weekly job for asset backup (mods, config scripts)
