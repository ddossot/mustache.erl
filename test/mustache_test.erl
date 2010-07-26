-module (mustache_test).
-include_lib("eunit/include/eunit.hrl").

setup() ->
  ok.
  
teardown(_X) ->
  ok.

starting_test_() ->
  {spawn,
    {setup,
      fun setup/0,
      fun teardown/1,
      [
        fun variable_templating/0
      ]
    }
  }.

variable_templating() ->
  Ctx = dict:from_list([{planet, "World!"}]),
  ?assertEqual("Hello World!", mustache:render("Hello {{planet}}", Ctx)),
  passed.