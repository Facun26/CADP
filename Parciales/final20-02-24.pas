{Una empresa dispone de una estructura de datos con los clientes de su comercio (500 a lo sumo).
De cada cliente conoce el numero de cliente, numero de DNI y monto que paga. Se pide implementar
un programa que informe la cantidad de clientes cuyo numero de DNI es capicua (es igual leerlo
de izquierda a derecha que de derecha a izquierda.}

 program capicua; 
 const 
	dimf = 500; 
 type
 cliente = record 
	numero: integer; 
	dni: integer; 
	monto: real; 
 end; 

 vector = array [1..dimf] of cliente; 
 
 procedure leer (var c: cliente); 
 begin 
	writeln ('numero de cliente: '); 
	readln (c.numero); 
	if (c.numero <> -1) then begin 
		writeln (' dni del cliente: '); 
		readln (c.dni); 
		writeln ('monto a pagar: '); 
		readln (c.monto); 
	end; 
 end;
 
 procedure cargarvector (var v: vector; var diml: integer); 
 var
	c: cliente; 
 begin 
    diml:= 0; 
	leer (c); 
	while (diml < dimf) and (c.numero <> -1) do begin 
		diml:= diml + 1; 
		v[diml]:= c; 
		leer (c); 
	end; 
 end; 	
 
 function cumple (num: integer): boolean; 
 var 
	dig, original, invertido: integer; 
 begin 
	original:= num; // Guardo el numero original para compararlo despues
	invertido:= 0; // Inicializo la variable donde voy a construir el numero invertido
	while (num <> 0) do begin 
		dig:= num mod 10;  // Ultimo digito del numero
		invertido:= invertido * 10 + dig; //Agregarmos el digito al numero invertido (desplazando los anteriores) // Al multiplicar por 10 desplazamos hacia la derecha, al contrario de si dividimos por diez que desplazamos a la izquierda
		num:= num div 10; // Sigo descomponiendo el numero
	
	
	end; 
	cumple := (invertido = original); 
 end;
 procedure recorrer (v: vector; dimL: integer); 
 var 
	cantidadcapicuas, i: integer; 
 begin 
	cantidadcapicuas:= 0; 
	for i:= 1 to diml do begin 
		if(cumple(v[i].numero)) then 
			cantidadcapicuas:= cantidadcapicuas + 1; 
	end; 
	writeln (' la cantidad de numero capicuas fue de: ', cantidadcapicuas); 
 end; 
 
 var 
	v: vector; 
	diml: integer; 
 begin 
	cargarvector (v, diml); 
	recorrer (v, diml); 
 end.
