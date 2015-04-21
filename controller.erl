%% @author Zsolt
%% @doc @todo Add description to controller.


-module(controller).
-export([test/0]).

test() ->
	Test1 = spawn(fun converter:message_rec/0),
	Test2 = spawn(fun converter:message_rec/0),
	Test3 = spawn(fun converter:message_rec/0),
	Test4 = spawn(fun converter:message_rec/0),
	Test5 = spawn(fun converter:message_rec/0),

	Test1 ! {convertToCelsius , 34.00},
	Test2 ! {convertToFahrenheit, 59.00},
	Test3 ! {convertToFahrenheit, 0},
	Test4 ! {convertToFahrenheit, 100},
	Test5 ! {convertToCelsius, 0.5},
	Test4 ! {convertToFahrenheit, 20000},
	Test2 ! {convertToCelsius, -8000000.99999},
	Test3 ! "Test incorrect input".
