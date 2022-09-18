.PHONY: checkout-rvm setup-mmtk setup-java8 build

setup-java8:
	update-java-alternatives --set java-1.8.0-openjdk-amd64

checkout-rvm:
	git -C jikesrvm checkout `sed -n 's/^jikesrvm_version.=."\(.*\)"/\1/p' < mmtk-jikesrvm/mmtk/Cargo.toml`

setup-mmtk:
	sed -i 's/^mmtk = {.*}/mmtk = { path = "..\/..\/mmtk-core" }/g' mmtk-jikesrvm/mmtk/Cargo.toml

build:
	cd jikesrvm && ./bin/buildit localhost RBaseBaseSemiSpace --use-third-party-heap=../mmtk-jikesrvm --use-third-party-build-configs=../mmtk-jikesrvm/jikesrvm/build/configs/ --use-external-source=../mmtk-jikesrvm/jikesrvm/rvm/src --m32

setup-repo:
	git submodule update --init --recursive
