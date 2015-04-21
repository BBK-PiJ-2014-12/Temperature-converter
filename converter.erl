%% @author Zsolt
%% @doc @todo Add description to converter.


-module(converter).
-export([message_rec/0]).

message_rec() ->
	DispID = spawn(fun display:show/0),
	receive
		{convertToCelsius, Fahr} ->		
			Cel = (Fahr - 32.00) * 5 / 9,	
			DispID ! {showFtoC, Cel, Fahr},
			message_rec();
		{convertToFahrenheit, Cel} ->
			Fahr = Cel * 9 / 5 + 32.00,
			DispID ! {showCtoF, Cel, Fahr},
			message_rec();
		_ -> 
			io:format("~s~n",["Invalid data."])
	end.
		
