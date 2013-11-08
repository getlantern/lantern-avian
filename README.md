# lantern-avian

## Objective

lantern-avian is a utility project that supports building compact standalone
executables of Lantern and related projects, using a combination of
[Avian](https://github.com/ReadyTalk/avian), [OpenJDK](http://openjdk.java.net/)
and [ProGuard](http://proguard.sourceforge.net/).

The build file used by lantern-avian is based on the one provided by
[avian-swt-examples](https://github.com/ReadyTalk/avian-swt-examples).

## Prerequisites

### lantern-avian

```
mkdir work
cd work
git clone https://github.com/getlantern/lantern-avian.git
``` 

### Avian

```
cd work
git clone https://github.com/ReadyTalk/avian.git
cd avian
git checkout "v0.7.1"
```

### UPX (on Ubuntu)

`sudo apt-get install upx`

### OpenJDK 7

#### On OS X

The Mac OS X build uses the
[unofficial OpenJDK builds from Alex Kasko](https://github.com/alexkasko/openjdk-unofficial-builds)

- Download OpenJDK 7 update 40 build 43 from
  [here](https://bitbucket.org/alexkasko/openjdk-unofficial-builds/downloads/openjdk-1.7.0-u40-unofficial-macosx-x86_64-image.zip)
  and put it at `/opt/openjdk7-image`
- Download the corresponding source from [here](http://www.java.net/download/openjdk/jdk7u40/promoted/b43/openjdk-7u40-fcs-src-b43-26_aug_2013.zip)
  and put it at `/opt/openjdk7-source`
- In jdk/src/solaris/native/java/net/net_util_md.c, change lines 117 and 119 to say `CHECK_NULL_RETURN(c, NULL)` instead of `CHECK_NULL(c)`

## Usage

Add a new target to `makefile`.  You can pattern this after the target
LittleProxy.

`make <target_name>`
