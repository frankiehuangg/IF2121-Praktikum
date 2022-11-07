/* Nama	: Frankie Huang */
/* NIM	: 13521092 */

/* Bagian 01 */

/* Deklarasi Fakta */
pria(gede).
pria(gojo).
pria(von_neumann).
pria(van_rossum).
pria(bambang).
pria(vito).
pria(ave).
pria(wesly).
pria(elon_musk).
pria(patrick).

wanita(indah).
wanita(lovelace).
wanita(khelli).
wanita(power).
wanita(aqua).
wanita(wulandari).
wanita(anya).

usia(gede, 96).
usia(indah, 92).
usia(gojo, 90).
usia(lovelace, 79).
usia(khelli, 89).
usia(von_neumann, 92).
usia(van_rossum, 65).
usia(bambang, 60).
usia(vito, 56).
usia(power, 50).
usia(ave, 54).
usia(aqua, 50).
usia(wulandari, 24).
usia(wesly, 26).
usia(elon_musk, 28).
usia(patrick, 24).
usia(anya, 4).

menikah(gede, indah).
menikah(indah, gede).
menikah(gojo, lovelace).
menikah(lovelace, gojo).
menikah(khelli, von_neumann).
menikah(von_neumann, khelli).
menikah(vito, power).
menikah(power, vito).
menikah(ave, aqua).
menikah(aqua, ave).
menikah(wulandari, wesly).
menikah(wesly, wulandari).

anak(van_rossum, gede).
anak(van_rossum, indah).
anak(bambang, gede).
anak(bambang, indah).
anak(vito, gede).
anak(vito, indah).
anak(power, gojo).
anak(power, lovelace).
anak(ave, gojo).
anak(ave, lovelace).
anak(aqua, khelli).
anak(aqua, von_neumann).
anak(wesly, vito).
anak(wesly, power).
anak(elon_musk, ave).
anak(elon_musk, aqua).
anak(patrick, ave).
anak(patrick, aqua).
anak(anya, wulandari).
anak(anya, wesly).

saudara(van_rossum, bambang).
saudara(bambang, van_rossum).
saudara(van_rossum, vito).
saudara(vito, van_rossum).
saudara(bambang, vito).
saudara(vito, bambang).
saudara(power, ave).
saudara(ave, power).
saudara(elon_musk, patrick).
saudara(patrick, elon_musk).

/* Deklarasi Rules */
kakak(X,Y) :-
	saudara(X,Y),
	usia(X,UmurX),
	usia(Y,UmurY),
	UmurX > UmurY.

keponakan(X,Y) :-
	anak(X,OrangTua),
	saudara(Y,OrangTua).

suami(X,Y) :-
	pria(X),
	menikah(X,Y).

sepupu(X,Y) :-
	anak(X,OrangTuaX),
	anak(Y,OrangTuaY),
	saudara(OrangTuaX,OrangTuaY).

menantu(X,Y) :-
	menikah(Pasangan,X),
	anak(Pasangan,Y).

orangtua(X,Y) :-
	anak(Y,X).

bibi(X,Y) :-
	wanita(X),
	saudara(X,OrangTua),
	anak(Y,OrangTua).

cucu(X,Y) :-
	anak(X,OrangTua),
	anak(OrangTua,Y).

keturunan(X,Y) :-
	anak(X,Y).
keturunan(X,Y) :-
	anak(X,OrangTua),
	keturunan(OrangTua,Y).

anaksulung(X) :-
	\+ saudara(_,X), !.
anaksulung(X) :-
 	pria(Ayah),
	menikah(Ayah,_),
	anak(X,Ayah),
	\+ kakak(_,X).

anakbungsu(X) :-
	\+ saudara(_,X), !.
anakbungsu(X) :- 
	pria(Ayah),
	menikah(Ayah,_),
	anak(X,Ayah),
	\+ kakak(X,_).



/* Bagian 02 */

/* Deklarasi Fakta */
factorial(1,1).
/* Deklarasi Rules */
factorial(X,Y):-
	Next is X-1,
	factorial(Next, R),
	Y is X * R.

/* Deklarasi Fakta */
combination(N,C,N) :-
	C =:= N-1.
combination(N,C,1) :-
	N =:= C.

/* Deklarasi Rules */
combination(N,C,X) :-
	factorial(N,R1),
	factorial(N-C,R2),
	factorial(C,R3),
	X is R1 / (R2 * R3).

/* Deklarasi Fakta */
change(0,0).
/* Deklarasi Rules */
change(X,Y) :-
	Y >= 5,
	Next is Y-5,
	change(R,Next),
	X is R + 1.
change(X,Y) :-
	Y >= 2,
	Next is Y-2,
	change(R,Next),
	X is R + 1.
change(X,Y) :-
	Y >= 1,
	Next is Y-1,
	change(R,Next),
	X is R + 1.

/* Deklarasi Fakta */
fpb(A,0,A).
/* Deklarasi Rules */
fpb(A,B,X) :-
	B > A,
	fpb(B,A,R),
	X is R.
fpb(A,B,X) :-
	mod(A,B,R1),
	fpb(B,R1,R2),
	X is R2.

/* Deklarasi Fakta */
mod(A,A,0).
/* Deklarasi Rules */
mod(A,B,X) :-
	A < B,
	X is A.
mod(A,B,X) :-
	A > B,
	Next is A - B,
	mod(Next,B,R),
	X is R.

/* Deklarasi Fakta */
deret(1,1).
/* Deklarasi Rules */
deret(X,Y) :-
	mod(X,2,R1),
	R1 =:= 0,
	Next is X - 1,
	deret(Next,R2),
	Y is R2 + 1.
deret(X,Y) :-
	mod(X,2,R1),
	R1 =:= 1,
	Next is X - 1,
	deret(Next,R2),
	Y is R2 * 2.



/* Bagian 03 */

/* Deklarasi Fakta*/
comparemin(X,Y,X) :- 
	X < Y.
comparemin(Y,X,X) :- 
	X < Y.
comparemin(X,X,X).
/* Deklarasi Rules */
min([Min],Min).
min([U|V],Min) :-
	min(V,W),
	comparemin(U,W,R),
	Min is R.

/* Deklarasi Fakta */
comparemax(X,Y,X) :- 
	X > Y.
comparemax(Y,X,X) :- 
	X > Y.
comparemax(X,X,X).
/* Deklarasi Rules */
max([Max],Max).
max([U|V],Max) :-
	max(V,W),
	comparemax(U,W,R),
	Max is R.

/* Deklarasi Rules */
range(X,Range) :-
	max(X,Max),
	min(X,Min),
	Range is Max-Min.

/* Deklarasi Fakta */
count([],0).
count([_],1).
/* Deklarasi Rules */
count([_|V],Count) :-
	count(V,R),
	Count is R+1.

/* Deklarasi Fakta */
sum([X],X).
/* Deklarasi Rules */
sum([U|V],Sum) :-
	sum(V,R),
	Sum is U+R.

/* Deklarasi Rules */
getIndex([U|_],Elmt,R) :-
	U =:= Elmt,
	R is 1.
getIndex([_|V],Elmt,R) :-
	getIndex(V,Elmt,X),
	R is X+1.

/* Deklarasi Rules */
insert([],Elmt,1,[Elmt]).
insert([U|V],Elmt,1,[Elmt|[U|V]]).
insert([U|V],Elmt,Idx,R) :-
	Next is Idx-1,
	insert(V,Elmt,Next,Del),
	insert(Del,U,1,R).

delete([Elmt],1,Elmt,[]).
delete([U|V],1,U,V).
delete([U|V],Idx,Elmt,R) :-
	Next is Idx-1,
	delete(V,Next,Elmt,Res),
	insert(Res,U,1,R).

swap(L,Idx,Idx,L).
swap(L1,Idx1,Idx2,R) :-
	Idx1 < Idx2,
	swap(L1,Idx2,Idx1,R).
swap(L1,Idx1,Idx2,R) :-
	Idx1 > Idx2,
	delete(L1,Idx1,Elmt1,L2),
	insert(L2,Elmt1,Idx2,L3),
	delete(L3,Idx2+1,Elmt2,L4),
	insert(L4,Elmt2,Idx1,R).

/* Deklarasi Rules */
splitList([X],[],Genap) :-
	mod(X,2,R), 
	R =:= 0,
	insert([],X,1,Genap).

splitList([X],Ganjil,[]) :-
	mod(X,2,R),
	R =:= 1,
	insert([],X,1,Ganjil).

splitList([U|V],Ganjil,Genap) :-
	mod(U,2,R),
	R =:= 0,
	splitList(V,Ganjil,RGenap),
	insert(RGenap,U,1,Genap).

splitList([U|V],Ganjil,Genap) :-
	mod(U,2,R),
	R =:= 1,
	splitList(V,RGanjil,Genap),
	insert(RGanjil,U,1,Ganjil).

/* BONUS */
:- dynamic(value/2).

value(0,0).

startCalculator :- 
	retractall(value(_,_)),
	assertz(value(0,1)),
	write('Selamat Datang di Kalkulator Prolog!'),
	write('\nCurrently Saved Value is 0').

add(X) :-
	value(V,1),
	NewVal is V + X,
	retractall(value(_,_)),
	assertz(value(NewVal,1)),
	write('Old Saved Value is '), write(V),
	write('\nNew Saved Value is '), write(NewVal).

subtract(X) :-
	value(V,1),
	NewVal is V - X,
	retractall(value(_,_)),
	assertz(value(NewVal,1)),
	write('Old Saved Value is '), write(V),
	write('\nNew Saved Value is '), write(NewVal).

multiply(X) :-
	value(V,1),
	NewVal is V * X,
	retractall(value(_,_)),
	assertz(value(NewVal,1)),
	write('Old Saved Value is '), write(V),
	write('\nNew Saved Value is '), write(NewVal).

divide(X) :-
	value(V,1),
	NewVal is V / X,
	retractall(value(_,_)),
	assertz(value(NewVal,1)),
	write('Old Saved Value is '), write(V),
	write('\nNew Saved Value is '), write(NewVal).

clearCalculator :-
	value(V,1),
	retractall(value(_,_)),
	assertz(value(0,1)),
	write('Old Saved Value is '), write(V),
	write('\nNew Saved Value is 0').

getValue :-
	value(V,1),
	write('Currently Saved Value is '), write(V).

exitCalculator :-
	value(V,1),
	retractall(value(_,_)),
	assertz(value(V,0)),
	write('Terima Kasih telah menggunakan Kalkulator Prolog').