{Una tienda virtual necesita un programa para administrar la información de sus clientes. De cada cliente se lee: número,
 DNI, apellido y nombre, fecha de nacimiento (día, mes y año), nivel (1..5) y puntaje. 
 La lectura finaliza cuando se lee el cliente con DNI 33444555, que debe procesarse.

Se pide:

A) Generar una estructura que contenga número, apellido y nombre de aquellos clientes con DNI compuesto solamente por dígitos impares.

B) Informar los niveles con mayor y menor puntaje acumulado por los clientes nacidos antes del año 2000.

C) Implementar un módulo que elimine, de la estructura generada, la información relacionada a un número de cliente recibido por parámetro. 
Tener en cuenta que dicho número puede no existir en la estructura.}

 program tiendavirtual; 
 type
	rangonivel = 1..5; 
	rangodia = 1..31; 
	rangomes = 1..12; 
	fecha = record 
		dia: rangodia; 
		mes: rangomes; 
		anio: integer; 
	end;
	
	cliente = record 
		numero: integer;
		dni: integer; 
		apellido: string; 
		nombre: string; 
		nacimiento: fecha;
		nivel: rangonivel; 
		puntaje: integer; 
	end; 
	lista =^nodo; 
		nodo = record 
		dato: cliente; 
		sig: lista; 
	end; 
	nuevorecord = record 
		numeronuevo: integer; 
		nombrenuevo: string; 
		apellidonuevo: string;
	end; 
	lista2 =^nodo2; 
	nodo2 = record 
		dato: nuevorecord; 
		sig: lista2; 
	end; 
	
	vectorcontador = array [rangonivel] of integer; 
	
	procedure leer (var c: cliente); 
	begin 
		writeln ('numero de cliente:	'); 
		readln (c.numero); 
		writeln ('ingrese el dni:	'); 
		readln (c.dni); 
		writeln ('ingrese el apellido del cleinte	');
		readln (c.apellido); 
		writeln ('ingrese el nombre del cleinte:	');
		readln (c.nombre); 
		writeln ('ingrese el dia de nacimeinto:	');
		readln (c.nacimiento.dia); 
		writeln ('ingrese el mes de nacimeinto:	');
		readln (c.nacimiento.mes); 
		writeln ('ingrese el anio de nacimeinto:	');
		readln (c.nacimiento.anio); 
		writeln ('ingrese el nivel de 1 a 5:	');
		readln (c.nivel); 
		writeln ('ingrese el puntaje:	');
		readln (c.puntaje); 
	end; 
	
	procedure agregaradelante (var l: lista; c: cliente); 
	var 
		nue: lista; 
	begin 
		new(nue); 
		nue^.dato:= c; 
		nue^.sig:= l; 
		l:= nue; 
	end; 
	procedure cargarlista (var l:lista); 
	var
		c: cliente; 
	begin 
		repeat
		leer (c); 
		agregaradelante (l, c); 
		until (c.dni = 3); 
	end; 
	
	procedure inicializarvector (var vc: vectorcontador); 
	var 
		i: integer;
	begin 
		for i:= 1 to 5 do 
			vc[i]:= 0; 
	end; 
	
	function cumple (dni: integer): boolean; 
	var 
		dig: integer; 
		ok: boolean; 
	begin
		ok:= false; 
		while (dni<> 0) and (not ok) do begin 
			dig:= dni mod 10;
			if (dig <> 0) then 
				ok:= true; 
			dni:= dni div 10; 
		end; 
	cumple:= ok; 
	end; 
	
	procedure agregaradelante2 (var l2: lista2; c: cliente); 
	var
		nue: lista2; 
	begin 
		new(nue); 
		nue^.dato.numeronuevo:= c.numero; 
		nue^.dato.apellidonuevo:= c.apellido; 
		nue^.dato.nombrenuevo:= c.nombre; 
		nue^.sig:= l2;
		l2:= nue;
	end; 
	
	procedure maximo (vc: vectorcontador; var maxnivel: integer); 
	var 	
		max, i: integer; 
	begin 
		max:= -1; 
		for i:= 1 to 5 do begin 
			if (vc[i]> max) then begin 
				maxnivel:= i; 
				max:= vc[i]; 
			end; 
		end; 
	end; 
	
	procedure minimo (vc: vectorcontador; var nivelmin: integer); 
	var 	
		min, i: integer; 
	begin 
		min:= 9999; 
		for i:= 1 to 5 do begin 
			if (vc[i] < min) then begin 
				nivelmin:= i; 
				min:= vc[i]; 
			end; 
		end; 
	end; 
	
	procedure recorrer (l: Lista; var vc: vectorcontador; l2: lista2); 
	var 
		nivelmin, maxnivel: integer;
	begin 
		while (l<> nil) do begin 
			if (cumple(l^.dato.dni)) then 
				agregaradelante2(l2, l^.dato); 
			if (l^.dato.nacimiento.anio < 2000) then 
				vc[l^.dato.nivel] := vc[l^.dato.nivel] + l^.dato.puntaje; 
			l:= l^.sig; 
		end; 
		maximo (vc, maxnivel); 
		writeln ('el nivel que mas puntaje acumulo fue:	', maxnivel); 
		minimo (vc, nivelmin); 
		writeln ('el nivel que menos puntaje acumulo fue:	', nivelmin); 
	end; 
	
	procedure eliminar (var L: lista; num: integer; var exito: boolean); 
	var 
		ant, act: lista; 
	begin 
		exito:= false; 
		act:= l; 
		while (act <> nil) and (act^.dato.numero <> num) do begin 
			ant:= act; 
			act:= act^.sig; 
		end; 
		if (act <> nil) then begin 
			exito:= true; 
			if (act = l) then 
				l:= act^.sig
			else
				ant^.sig:= act^.sig; 
			dispose (act); 
		end; 
	end; 
	var 
		l: lista; 
		l2: lista2; 
		vc: vectorcontador; 
		numerocliente: integer;
		exito: boolean; 
	begin 
		l:= nil; 
		l2:= nil; 
		cargarlista(l); 
		inicializarvector (vc); 
		recorrer (l,vc,l2); 
		writeln ('ingrese un numero de cliente a eliminar:	'); 
		readln (numerocliente); 
		eliminar (l, numerocliente, exito); 
	end.
			
				
		
	


