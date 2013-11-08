# Always use LZMA compression (comment to disable)
lzma          = ../lantern-avian/lzma-920
export lzma

# Change platform to appropriate platform based on what's listed in
# https://github.com/ReadyTalk/avian-swt-examples/blob/master/README.md
full-platform = darwin-x86_64-cocoa
export full-platform

# Always use openjdk, adjust paths as necessary on your system
openjdk       = "/opt/openjdk7-image/"
openjdk-src   = "/opt/openjdk7-source/jdk/src/"
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
		extra-proguard-flags="-include ../Lantern/Lantern.pro" \
		shaded-jar="../Lantern/target/lantern-1.0.0-beta8-SNAPSHOT.jar" \
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
