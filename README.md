# Nodbox

This docker container runs JavaScript code without having a dedicated docker image containing the codebase.
It takes the source code as the arguments of the docker container's `ENTRYPOINT`.

## Example

```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: nodbox
spec:
  template:
    spec:
      containers:
        - name: nodbox
          image: ghcr.io/junminahn/nodbox:latest
          imagePullPolicy: Always
          args:
            - |
              console.log("hello world!");
              return "200:Okay";
      restartPolicy: Never
  backoffLimit: 1
```
