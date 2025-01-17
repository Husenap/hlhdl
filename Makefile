.PHONY: install-prerequisites gen build repl clean test

install-prerequisites:
	apt-get update
	apt-get install build-essential ninja-build cmake ccache
	apt-get install flex bison

gen: 
	cmake . -Bbuild -GNinja -DCMAKE_BUILD_TYPE=Debug

gen-release: 
	cmake . -Bbuild -GNinja -DCMAKE_BUILD_TYPE=Release

build: 
	cmake --build build/

test:
	cd build && ctest --output-on-failure

clean:
	rm -rf build/
