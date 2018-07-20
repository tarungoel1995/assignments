Docker Day5 Assignment

Assignment

Signup on dockerhub. 
Login on dockerhub and create a repository by providing repo name "mytestrepo" and a little description about the same. 

![repo](https://github.com/tarungoel1995/assignments/blob/master/docker/day5/media/dockerrepo.png)

Search for "centos" image on docker using commandline. 

```
#docker search centos:7
```
![search](https://github.com/tarungoel1995/assignments/blob/master/docker/day5/media/centos7search.png)

Limit out search result to 10 entries only. 

```
#docker search centos --limit 10
```
![searchlimit](https://github.com/tarungoel1995/assignments/blob/master/docker/day5/media/limit10search.png)

Apply a filter on search result to show entries for images having 3 stars. 

```

```

Format the search result to get output containing only name,description and is_official values. 

```
docker search centos --format "{{.Name}}: {{.Description}}: {{.IsOfficial}}"
```

![format](https://github.com/tarungoel1995/assignments/blob/master/docker/day5/media/format.png)

Pull an image named "centos" from dockerhub. 

```
docker pull centos:7
```
Tag "centos" image with name "mycentos" in your repository with version 1.1 

```
docker image tag centos:7 tarungoel1995/mycentos:v1.1
```
![tag](https://github.com/tarungoel1995/assignments/blob/master/docker/day5/media/tagandpush.png)

Push that image to your repo "mytestrepo" on your dockerhub. 

```
#docker push tarungoel1995/mycentos:v1.1

```
![push](https://github.com/tarungoel1995/assignments/blob/master/docker/day5/media/tagandpush.png)


Verification

![verification](https://github.com/tarungoel1995/assignments/blob/master/docker/day5/media/pushediamge.png)

Do commandline logout on dockerhub. 

```
#docker logout
```
![logout](https://github.com/tarungoel1995/assignments/blob/master/docker/day5/media/logout.png)
