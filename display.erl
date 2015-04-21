%% @author Zsolt
%% @doc @todo Add description to display.


-module(display).
-export([show/0]).


show() ->
	receive
		{showFtoC, Cel, Fahr} ->
			io:format("~w ~s ~w ~s ~n", [Fahr, "Fahrenheit is", Cel, "Celsius."]),
			show();
		{showCtoF, Cel, Fahr} ->
			io:format("~w ~s ~w ~s ~n", [Cel, "Celsius is", Fahr, "Fahrenheit."]),
			show();
		_ -> 
			io:format("~s~n", ["Invalid data."]),
			show()
	end.

