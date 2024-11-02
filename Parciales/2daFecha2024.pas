//Un supermercado está procesando las compras que realizaron sus clientes. 
//Para ello, dispone de una estructura de datos con todas las compras realizadas, sin ningún orden en particular. 
//De cada compra se conoce: código, año (entre 1980 y 2024), monto y DNI del cliente. Un cliente puede haber realizado más de una compra.

//Realizar un programa procese la información de las compras y:

// a. Almacene en otra estructura de datos las compras realizadas entre los años 2010 y 2020. Esta
//estructura debe quedar ordenada por el DNI del cliente.

//b. Una vez almacenada la estructura del inciso a, procesar estos datos e informar: 

//1. El año con menor facturación.

//2. Los dos DNI de los clientes que realizaron mayor cantidad de compras.

//3. COMPLETO: El monto total facturado de compras con código múltiplo de 10.

program parcialdelorto; 

type 
rangoanio = 1980 .. 2024;
compra = record 
	codigo: integer; 
	anio: ranoganio; 
	monto: real; 
	dnicliente: integer; 
end; 

lista= ^nodo; 
nodo = record 
	dato: cliente 
	sig: lista; 
end; 

vectorcontador = array [2010 to 2020] of integer; 

procedure cargarlista (var l: lista); //se dispone 

procedure inicializar (var v: vectorcontador); 
var 
i: integer; 
begin 
for i := 2010 to 2020 do 
	v[i] := 0;
end; 

procedure insertar(var l2:lista; c: compra);
var
	nue: lista;
	act,ant: lista; {punteros auxiliares para recorrido}
begin
	new(nue);
	nue^.dato:= c;
	act:= l2; {ubico act y ant al inicio de la lista}
	ant:= l2;
	while (act <> nil) and (c.dni > act^.dato.dni) do
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



procedure recorrerlista (l: lista; var l2: lista); 

begin 
while (l <> nil) do begin 
	if (l^.dato.anio >= 2010) and (l^.dato.anio < = 2020) then 
		insertar (l2, l^.dato); 
end; 
end; 

procedure maximo (cantcompras, max1, max2: integer; var dnimax1, dnimax2: integer); 
begin 
	if (cantcompras > max1) then begin 
		max2:= max1;
		max1:= cantcompras; 
		dnimax2:= dnimax1; 
		dnimax1;= l^.dato.dni; 
	else 
		if (cantcompras > max2) then begin 
			dnimax2:= l^.dato.dni;
			max2:= cantcompras; 
		end; 
	end; 
end; 

procedure aniominimo (v: vectorcontador; var aniomin: integer); 
var 
min, i: integer; 
begin 
min:= 99999; 
for i:= 2010 to 2020 do 
	if (v[i] < min) then begin 
		min:= v[i]; 
		aniomin:= i; 
	end; 
end; 

procedure recorrerlista2 (l2: lista; var v: vectorcontador); 
var
actual, max1, max2, dnimax1, dnimax2, cantcompras, aniomin: integer; 
montototal: real; 
begin
montototal:= 0; 
cantcompras:= 0; 
max1:= -1; 
max2:= -1; 
while (l <> nil) do begin 
	actual := l^.dato.dni; 
	while (l <> nil) and (actual = l^.dato.dni) do begin 
		v[l^.dato.anio]:= v[l^.dato.anio] + l^.dato.monto; 
		cantcompras:= cantcompras + 1; 
		if (l^.dato.codigo mod 10 = 0) then 
			montototal := montototal + l^.dato.monto; 
		
		l:= l^.sig; 
		maximo (cantcompras, max1, max2, dnimax1, dnimax2); 
	end; 
	
end; 
aniominimo (l^.dato.anio, aniomin); 
writeln (' el anio con menor facturacion fue', aniomin)
writeln ('el monto total facturado para las compras con codigo multiplo de 10 fue', montototal); 
writeln (' los dni de los clientes que mayor cantidad de compras realizaron son', dnimax1, 'y', dnimax2); 
end; 

var
l, l2: lista; 
v: vectorcontador;
begin 
cargarlista (l); // se dispone
l2:= nil 
inicializar (v); 
recorrerlista (l, l2);
recorrerlista2 (l2, v); 
end.
