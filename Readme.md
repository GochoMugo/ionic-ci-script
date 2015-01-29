
# ionic-ci-script

This simple script lets you prepare your CI server for building
 [ionic](http://ionicframework.com/) apps.


## getting started:

### [travis](http://travis-ci.org/):

Using Curl for get automatic updates:

```yaml
# ...

after_success:
- curl https://raw.githubusercontent.com/GochoMugo/ionic-ci-script/master/prepare-debian-ubuntu.sh | sudo sh

# ...
```

You may also download the script to your repository:

```yaml
# ...

after_success:
- sudo sh prepare-debian-ubuntu.sh

# ...
```


## license:

__The MIT License (MIT)__

Copyright (c) 2015 Gocho Mugo <mugo@forfuture.co.ke>
