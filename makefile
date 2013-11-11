# Always use LZMA compression (comment to disable)
lzma          = ../lantern-avian/lzma-920
export lzma

ifndef full-platform
    $(error full-platform is undefined, select an appropriate value from the list in https://github.com/ReadyTalk/avian-swt-examples/blob/master/README.md)
endif

# Always use openjdk, use sensible default paths based on platform
ifeq ($(openjdk),)
    ifeq ($(full-platform), darwin-x86_64-cocoa)
		openjdk       = "/opt/openjdk7-image/"
	endif
	ifeq ($(full-platform), linux-x86_64)
		openjdk       = "/usr/lib/jvm/java-7-openjdk-amd64/"
	endif
endif

ifeq ($(openjdk-src),)
    ifeq ($(full-platform), darwin-x86_64-cocoa)
		openjdk-src   = "/opt/openjdk7-source/jdk/src"
	endif
	ifeq ($(full-platform), linux-x86_64)
		openjdk-src   = "/usr/lib/jvm/java-7-openjdk-amd64-source/build/openjdk/jdk/src"
	endif
endif

export full-platform
export openjdk
export openjdk-src

JAVA_HOME     = $(openjdk)
export JAVA_HOME

.PHONY: build
build: Lantern

.PHONY: Lantern
Lantern:
	make -f app.mk \
		name="Lantern" \
		extra-proguard-flags="-include ../lantern/Lantern.pro.$(full-platform)" \
		shaded-jar="../lantern/target/lantern-1.0.0-beta8-SNAPSHOT.jar" \
		main-class="org.lantern.Launcher"
		
.PHONY: LittleProxy
LittleProxy:
	make -f app.mk \
		name="LittleProxy" \
		extra-proguard-flags="-include ../LittleProxy/LittleProxy.pro" \
		shaded-jar="../LittleProxy/target/littleproxy-1.0.0-beta4-SNAPSHOT-littleproxy-shade.jar" \
		main-class="org.littleshoot.proxy.Launcher"		

.PHONY: clean
clean:
	rm -rf build
