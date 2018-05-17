# MWBigData
Data and Notebook for 2018 Midwest Big Data talk

Docker container for running the notebook is audris/jupyter-r

shell script runInDocker.sh helps run the container processes
as specified user (not root), please fix the username variable to 
what you need.

```
./runInDocker.sh bash
```

Once you get the shell prompt, run 
```
/bin/notebook.sh
```

In the browser you can edit the notebook via
localhost:8888
