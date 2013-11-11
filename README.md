# lantern-avian

## Objective

lantern-avian is a utility project that supports building compact standalone
executables of Lantern and related projects, using a combination of
[Avian](https://github.com/ReadyTalk/avian), [OpenJDK](http://openjdk.java.net/)
and [ProGuard](http://proguard.sourceforge.net/).

The build file used by lantern-avian is based on the one provided by
[avian-swt-examples](https://github.com/ReadyTalk/avian-swt-examples).

## Prerequisites

Note - all projects should be checked out to the same base folder

### lantern-avian

`git clone https://github.com/getlantern/lantern-avian.git`

### Avian (Lantern Fork)

We're using a fork right now to work around a bug in the Avian makefile.
The fix has been pull requested to Avian.

`git clone https://github.com/getlantern/avian.git`

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
- In `/opt/openjdk7-source/jdk/src/solaris/native/java/net/net_util_md.c`, change lines 117 and 119 to say `CHECK_NULL_RETURN(c, NULL)` instead of `CHECK_NULL(c)`

#### On Ubuntu

```
sudo apt-get install openjdk-7-jdk
sudo apt-get source openjdk-7-jdk
sudo apt-get build-dep openjdk-7-jdk
(cd openjdk-7-7u25-2.3.10 && dpkg-buildpackage)
make openjdk=/usr/lib/jvm/java-7-openjdk \
     openjdk-src=$(pwd)/openjdk-7-7~b147-2.0/build/openjdk/jdk/src \
     test
cd ..
sudo mv openjdk-7-7u25-2.3.10 /usr/lib/jvm/java-7-openjdk-amd64-source/build/openjdk/jdk/src
```

## Usage

Add a new target to `makefile`.  You can pattern this after the target
LittleProxy.

`make full-platform=<platform> <target_name>`

<platform> is one of:

| platform               |
|:---------------------- |
| linux-x86_64           |
| darwin-x86_64-cocoa    |
| windows-i386           |

For a debug build:

`make mode=debug <target_name>`

Note - the builds use project-specific ProGuard configurations like
`LittleProxy.pro`.  These configurations may be auto-generated as a result of
running the project's tests, in which case you'll want to make sure to run the
tests before building a standalone executable with lantern-avian.
