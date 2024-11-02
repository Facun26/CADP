//Una revista deportiva dispone de información de los jugadores de básquet participantes de la liga profesional 2022. 
//De cada jugador se conoce código de jugador, apellido y nombres, código de equipo (1.20), safio de nacimiento y 
//la calificación obtenida para cada una de las 18 fechas del torneo ya finalizado. La calificación es numérica de 0 a 10,
// donde el valor 0 significa que el jugador no ha participado de la fecha. 

//Se solicita:

//a. Informar para cada equipo la cantidad de jugadores menores de 30 años.
// b. Informar los códigos de los 2 jugadores con menor calificación promedio en los partidos en los que participă. 
//Solo deben considerarse a los jugadores que participaron en más de 9 fechas.

//c. (COMPLETO) Implementar e invocar a un módulo que genere una lista con los jugadores cuyo código posee exactamente 2 
//digitos pares y haya nacido entre 1987 y 1991. La lista debe estar ordenada por código de jugador.

program basquetbolas; 

type
rangopuntaje = 0.. 10;
vectorcalificaciones = array [1.. 18] of rangopuntaje 
vectorcontador = array [rangoequipo] of integer;
rangoequipo = 1..20; 
jugador = record
	codigojugador: integer;
	apellidoynombre: string; 
	codigoequipo: rangoequipo; 
	anionacimineto: integer; 
	calificion : vectorcalificaiones; 
end; 

lista =^nodo; 
nodo= record 
	dato: jugador; 
	sig: lista; 
end; 

procedure cargarvector (var v: vectorcalificaiones); // se dispone 

procedure cargarlista (var l: lista); // se dispone 

procedure inicializarvector (var vc: vectorcontador); 
var 
	i: integer;
begin 
	for i := 1 to 10 do 
		vc[i]:= 0; 
end; 





procedure promedio (v: vectorcalificaciones; var cantfechas: integer; var prom: real): 
var
i: integer 
prom: real 
begin 
	for i := 1 to 18 do 
		if (v[i] <> 0) then begin 
			cantfechas:= cantfechas + 1; 
			puntaje := puntaje + v[i]; 
		end; 
	prom := puntaje / fechas; 
end;

procedure minimo (v: vectorcalificaciones; min1, min2: integer; var codmin1, codmin2: integer); 
begin 
	for i:= 1 to 18 do 
		if (v[i] < min1) then begin 
			min2:= min1; 
			min1:= v[i];
			codmin2:= codmin1;
			codmin1:= l^.dato.codigo;
		else 
			if (v[i] < min2) then begin 
				codmin2:= l^.dato.codigo;
				min2:= v[i];
			end;
		end; 
	end; 
	
procedure imprimir (vc: vectorcontador); 
begin 
	for i:= 1 to 20 do 
		writeln ('para la posicion' i, 'la cantidad de jugadores con menos de 30 anios son :', vc[i]); 
	end; 

procedure insertarordenado(var l2:lista; j: jugador);
var
	nue: lista;
	act,ant: lista; {punteros auxiliares para recorrido}
begin
	new(nue);
	nue^.dato:= j;
	act:= l2; {ubico act y ant al inicio de la lista}
	ant:= l2;
	while (act <> nil) and (j.codigo > act^.dato.codigo) do
	begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = ant) then {al inicio o lista vacia}
		l:= nue;
	else {al medio o al final}
		ant^.sig:= nue;
	nue^.sig:= act;
end;

procedure procesar (l: lista; var l2: lista; var vc: vectorcontador; v: vectorcalificaiones); 
var
 codmin1, codmin2, cantfechas: integer;
min1, min2, promedio: real;
begin 
	min1:= 9999;
	min2:= 9999; 
	while (l <> nil) do begin 
	if (2023 - l^.dato.anionacimiento < 30) then 
		vc[l^.dato.codigoequipo]:= vc[l^.dato.codigoequipo] + 1; // A
		promedio(l^.dato.calificacion, cantfechas, prom); 
			if (cantfechas > 9) then 
				minimo (l^.dato.calificacion, min1, min2, codmin1, codmin2);
		if (cumple (l^.dato.codigo)) and (l^.dato.anionacimiento >= 1987) and (l^.dato.anionacimiento <= 1991) then 
			insertar (l2, l^.dato)
			
		
		l:= l^.sig;
	end; 
	imprimir (vc); // A
	writeln ('los codigos de los jugadores que menor calificacion promedio tuvieron son', codmin1, 'y', codmin2); 
end;

var
l, l2: lista;
v: vector;
vc: vectorcontador; 
begin 
cargarlista (l); // se dispone
cargarvector (v); // se dispone
inicializarvector (vc); 
procesar (l, l2, vc, v); 
end.
