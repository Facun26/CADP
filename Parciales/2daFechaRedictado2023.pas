//Redictado de CADP 2023 - PARCIAL 2DA FECHA (24/11)

//TEMA 1

//Un salón de eventos necesita un programa para administrar la información de las reservas de diciembre de 2023. 
//Se dispone de una estructura con la información de las reservas. 
//De cada reserva se conoce: número de reserva, DNI del cliente, día del evento (1..31), hora de inicio, 
//hora de fin y categoría de servicio (1..4). Además, se dispone de una tabla con
//el precio por hora de reserva de acuerdo a cada categoría de servicio.

//Se pide:

//A) Generar una nueva estructura con número y precio total de cada reserva. Esta estructura debe generarse ordenada por
//número de reserva.

//B) Informar los dos días del mes con mayor cantidad de reservas de clientes con DNI par.

//C) Informar el porcentaje de reservas de eventos que inicien antes de las 12 hs y se produzcan en la primera quincena.

program salon; 

type 
rangodia = 1..31; 
rangocat= 1..4; 
reserva= record 
	numero: integer; 
	dni: integer; 
	dia: rangodia; 
	horainicio: integer; 
	horafin: integer; 
	categoria: rangocat; 
end; 
veccontador = array [rangodia] of integer 

vector = array [rangocat] of real // se dispone {esta cargado} 

lista = ^nodo; 
	nodo = record 
	dato: reserva; 
	sig: lista; 
end; 

registronuevo = record 
	numero2: integer; 
	precio: real; 
end; 

lista2 = ^nodo; 
	nodo= record 
	dato: registronuevo; 
	sig: lista2;
end; 
procedure cargarlista (var l: lista);// se dispone 

procedure cargarvec (var v: vector); // se dispone 


procedure leerregistronuevo (var r: registronuevo); 
begin 
readln (r.numero); 
readln (r.precio); 
end; 

procedure insertarordenado(var l2:lista2; r: reserva);
var
	nue: lista2;
	act,ant: lista2; {punteros auxiliares para recorrido}
begin
	new(nue);
	nue^.dato:= r;
	act:= l2; {ubico act y ant al inicio de la lista}
	ant:= l2;
	while (act <> nil) and (l2.^dato.numero2 < r.numero) do 
	begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = ant) then {al inicio o lista vacia}
		l2:= nue;
	else {al medio o al final}
		ant^.sig:= nue;
	nue^.sig:= act;
end;


procedure maximo (vc: veccontador; max1, max2: integer; var maxdia1, maxdia2); 
var
i: integer; 
begin 
for i:= 1 to 31 do begin
if (v[i] > max1) then begin 
	max2:= max1; 
	max1:= v[i]; 
	maxdia2:= maxdia1; 
	maxdia1:= i; 
end
else 
if (v[i] > max2) then begin 
	max2:= v[i]; 
	maxdia2:= i; 
end; 
end; 


procedure recorrer (l: lista; var l2: lista2; var vc: veccontador; var r: registronuevo, v: vector); 
var
precio: real
actual: integer 
max1,max2,maxdia1,maxdia2, cantreserva, cantreservaespcial: integer; 
begin 
max1:= -1; 
max2:= -1; 
preciototal:= 0; 
cantreservaespecial:= 0;
cantreserva:= 0;

while (l <> nil) do begin 
	cantreserva:= cantreserva + 1; 
	 if (l^.dato.dni mod 2 = 0) then {sin el begin solo se ejecuta la instruccion de abajo}
		vc [l^.dato.dia] := vc[l^.dato.dia] + 1; 
		preciototal:= v[l^.dato.categoria]* l^.dato.horafin - l^.dato.horainicio ; 
		r.numero := l^.dato.numero; 
		r.precio:= preciototal; 
		insertarordenado (l2, l^.dato);
	
		if(l^.dato.horarioinicio<12) and  (l^.dato.dia <=15) then {cuando es solo una isntruccion abajo no va begin} 
		   cantreservaespecial:= cantreservaespecial + 1; 
	l:= l^sig;
	end; 
end; 

maximo (vc,max1, max2, maxdia1, maxdia2); // B
writeln ('los dos dias con mas reservas son:', maxdia1, maxdia2);
writeln('porcenteje de reservas es:', cantreservaespecial*100/cantreserva);// C

end; 





var
l: lista; 
l2: lista2; 
vc: veccontador; 

begin 
l:= nil; 
l2:= nil; 
cargarlista (l); // se dispone 
cargarvector (v); // se dispone 
inicializarvec (vc); 
recorrer (l, l2, vc, v); 
end. 
