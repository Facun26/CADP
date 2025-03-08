{ Un comercio dispone de la informacion de sus clientes. De cada cliente se conoce su 
 DNI, fecha y monto de la compra. La informacion esta ordenada por el DNI del cliente.
 Se pide implementar un programa que genere una estructura de datos que contenga DNI del 
 dliente, la canidad de compras que realizo y el monto total de compras, solo con
 los clientes que realizaron mas de 5 compras.}
 
 program tussi; 
 type 
	rangodia= 1..31; 
	rangomes = 1..12; 
	fechas = record 
		dia: rangodia; 
		mes: rangomes; 
	end; 
	cliente = record 
		dni: integer; 
		fecha: fechas;
		monto: real; 
	end; 
	
	lista =^nodo; 
	nodo = record 
		dato: cliente; 
		sig: lista; 
	end;
	
	clientenuevos = record 
		dninuevo: integer; 
		totalcompras: integer; 
		montototal: real; 
	end; 
	
	lista2 = ^nodo; 
	nodo2 = record
		dato: clientenuevos; 
		sig: lista2; 
	end; 
	
	procedure Leer(var c: cliente);
begin
    write('Ingrese DNI: ');
    readln(c.dni);
    if (c.dni <> 0) then begin 
		write('Ingrese día de la fecha (1-31): ');
		readln(c.fecha.dia);
    
		write('Ingrese mes de la fecha (1-12): ');
		readln(c.fecha.mes);
    
		write('Ingrese monto: ');
		readln(c.monto);
	end;
end; 

procedure Insertar(var L: lista; c: cliente);
var
    nuevo, actual, anterior: lista;
begin
    new(nuevo);
    nuevo^.dato := c;
    nuevo^.sig := nil;
    
    actual := L;
    anterior := nil;
    
    // Buscar la posición correcta manteniendo el orden por DNI
    while (actual <> nil) and (actual^.dato.dni < c.dni) do
    begin
        anterior := actual;
        actual := actual^.sig;
    end;
    
    // Insertar el nodo en la posición correcta
    if anterior = nil then
        L := nuevo  // Insertar al principio
    else
        anterior^.sig := nuevo;  // Insertar en medio o final
        
    nuevo^.sig := actual;
end;

procedure cargarLista (var l: lista); 
var 
	c: cliente; 
begin 
	leer(c); 
	while (c.dni <> 0) do begin 
		leer(c); 
		insertar(l, c); 
	end; 
end; 

procedure agregarAdelante (var l2: lista2; c: cliente); 
var 
	nue: lista2; 
begin 
	new(nue);
	nue^.dato:= c; 
	nue^.sig:= l2; 
	l2:= nue; 
end; 
procedure recorrer (l: lista; var l2: lista2); 
var 
	compritas, actual: integer; 
	clientenuevo: clientenuevos;
begin 
	while (l <> nil) do begin 
		actual:= l^.dato.dni; 
		compritas:= 0; 
		while (l<> nil) and (actual = l^.dato.dni) do begin 
			compritas:= compritas + 1; 
	
			l:= l^.sig; 
		end; 
		if (compritas > 5) then begin 
			clientenuevo.dninuevo := l^.dato.dni;
			clientenuevo.montototal:= l^.dato.monto; 
			clientenuevo.totalcompras:= compritas;
			gregaradelante (l2, l^.dato); 
		end;
			
	end; 


end; 

var 
	l: lista; 
	l2: lista2; 
 begin 
	l:= nil; 
	l2:= nil; 
	cargarLista (l); 
	recorrer (l, l2); 
end.

	
	
 
