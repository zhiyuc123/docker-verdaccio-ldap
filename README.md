# docker-verdaccio-ldap

## GUIDE

start the service

```bash
    V_PATH=/path/for/verdaccio; docker run -it --rm --name verdaccio \
        -p 4873:4873 \
        -v $V_PATH/conf:/verdaccio/conf \
        -v $V_PATH/storage:/verdaccio/storage \
        -v $V_PATH/plugins:/verdaccio/plugins \
        zhiyuc123/verdaccio-ldap:v6
```
