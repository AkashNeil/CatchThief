permute([],[]).
permute([Head|Tail],List) :-
  permute(Tail,X),
  inserts(Head,X,List).

inserts(X,List,[X|List]).
inserts(X,[Y|List],[Y|Result]) :-
  inserts(X,List,Result).

main(Thief):-

	%list of suspects
	Suspects=[fred_alberts,larry_smith,brian_martin,marty_jones,bill_edison,john_fox],

	%permute suspects with weights
	permute([Pounds_150, Pounds_170, Pounds_180, Pounds_190, Pounds_210, _],Suspects),
	Pounds_210==larry_smith,
	Pounds_190\==marty_jones,

	%permute suspects with car colour
	permute([Car_black,Car_purple,Car_green,Car_white,_,_],Suspects),
	Car_green==Pounds_180,
	Car_white\==Pounds_170,
	Car_black=Thief,
	Car_green=brian_martin,

        %permute suspects with shoes colour
	permute([Shoes_tan,Shoes_blue,Shoes_black,Shoes_brown,_,_],Suspects),
	Pounds_150==Shoes_tan,
	Pounds_190==Shoes_blue,
	Car_purple==Shoes_tan,
	Car_black==Shoes_blue,
	Shoes_brown=bill_edison,

	%permute suspects with umbrella colour
	permute([Umbrella_purple,Umbrella_red,_,_,_,_],Suspects),
	Shoes_black\==Umbrella_red,
	Umbrella_purple=marty_jones,

	%permute suspects with hair colour
        permute([Hair_red,_,_,_,_,_],Suspects),
	Hair_red\==Pounds_190,
	Hair_red==john_fox,

        %"cut" used so that when one answer has been found, execution of program is stopped.
	Thief=Thief,!.
