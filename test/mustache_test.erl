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
        fun variable_templating/0,
        fun enumeration/0
      ]
    }
  }.

variable_templating() ->
  Ctx = dict:from_list([{planet, "World!"}]),
  ?assertEqual("Hello World!", mustache:render(<<"Hello {{planet}}">>, Ctx)),
  passed.

enumeration() ->
  Ctx = dict:from_list([{name, "Todo"},{items, [dict:from_list([{'.', "code"}]),dict:from_list([{'.',"eat"}])]}]),
  ?assertEqual("Todo: <ul> <li>code</li><li>eat</li> </ul>", mustache:render(<<"{{name}}: <ul> {{#items}}<li>{{.}}</li>{{/items}} </ul>">>, Ctx)),
  passed.

