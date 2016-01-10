SWIFTC=swiftc

TEST_DEP_LIBS = http4swift swiftra

ifeq ($(shell uname), Linux)
	SWIFTC_OPTS="-lswiftGlibc"
else
	LPATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/lib/swift/macosx/
	SWIFTC_OPTS=-sdk $(shell xcrun --show-sdk-path) -target x86_64-apple-macosx$(shell xcrun --show-sdk-version) -L$(LPATH) -lswiftDarwin
endif

clean:
	swift build --clean

build:
	swift build --configuration debug
	$(foreach lib,$(TEST_DEP_LIBS), cp .build/debug/$(lib).a .build/debug/lib$(lib).a;)

test: build
	$(SWIFTC) $(SWIFTC_OPTS) -I.build/debug Tests/*.swift -o .build/test -v -L.build/debug $(foreach lib,$(TEST_DEP_LIBS),-l$(lib))
	.build/test
