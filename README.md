Running CoRB jobs as a gradle task, so all dependencies are managed for you.

To run:
```
./gradlew runCorb -DURIS-MODULE.forest=Documents -DXCC-USERNAME=admin -DXCC-PASSWORD=admin -DXCC-PORT=8000 -DXCC-HOSTNAME=localhost
```

Or edit the `job.properties` file with appropriate values, and then run:
 
```
./gradlew runCorb
```
