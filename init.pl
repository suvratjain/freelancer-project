:- use_module(library(http/json)).
:- use_module(library(http/json_convert)).
:- use_module(library(option)).

checkRules(JsonFile):-
	open(JsonFile, read, Str),
	json_read_dict(Str,A),
	close(Str),
	A=[_,D1,D2,D3,D4,D5],

	dict_options(D1,O1),
	dict_options(D2,O2),
	dict_options(D3,O3),
	dict_options(D4,O4),
	dict_options(D5,O5),

	option(from(Pt1),O1),
	option(from(Pt2),O2),
	option(from(Pt3),O3),
	option(from(Pt4),O4),
	option(from(Pt5),O5),
	option(to(Pt6),O5),

	dict_options(Pt1,PT1),%
	dict_options(Pt2,PT2),
	dict_options(Pt3,PT3),
	dict_options(Pt4,PT4),
	dict_options(Pt5,PT5),
	dict_options(Pt6,PT6),
	
	option(p(Pt1p),PT1),
	option(p(Pt2p),PT2),
	option(p(Pt3p),PT3),
	option(p(Pt4p),PT4),
	option(p(Pt5p),PT5),
	option(p(Pt6p),PT6),

	rule1(Pt1p,Pt3p),
	rule2(Pt1p,Pt2p,Pt3p,Pt4p,Pt5p,Pt6p),
	rule3(Pt2p,Pt4p,Pt5p).

rule1(Pt1p,Pt3p):-
	Pt1p<Pt3p,
	write('Rule 1 is followed'),
	nl.

rule1(Pt1p,Pt3p):-
	\+(Pt1p<Pt3p),
	write('Rule 1 is not followed'),
	nl.

rule2(Pt1p,Pt2p,Pt3p,Pt4p,Pt5p,Pt6p):-
	(((Pt2p-Pt1p) < (Pt4p-Pt3p));((Pt6p-Pt5p) < (Pt4p-Pt3p))),
	write('Rule 2 is followed'),
	nl.

rule2(Pt1p,Pt2p,Pt3p,Pt4p,Pt5p,Pt6p):-
	\+(((Pt2p-Pt1p) < (Pt4p-Pt3p));((Pt6p-Pt5p) < (Pt4p-Pt3p))),
	write('Rule 2 is not followed'),
	nl.

rule3(Pt2p,Pt4p,Pt5p):-
	((Pt2p < Pt4p),(Pt2p < Pt5p)),
	write('Rule 3 is followed').

rule3(Pt2p,Pt4p,Pt5p):-
	\+(((Pt2p < Pt4p),(Pt2p < Pt5p))),
	write('Rule 3 is not followed').
