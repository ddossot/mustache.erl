PACKAGE_NAME = mustache

.PHONY: deps compile rel test

all: deps compile

compile:
	@./rebar compile

deps:
	@./rebar get-deps

clean:
	@./rebar clean


rel_erlang:
	@./rebar generate force=1

test: deps compile
	@./rebar skip_deps=true eunit