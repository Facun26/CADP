{Redictado de CADP 2024 - TURNO 2

Parcial 29/10-TEMA 2

Una escuela primaria necesita un programa para administrar la información de preinscripciones al ciclo lectivo 2025. Para ello, dispone de una estructura de datos con la información de las preinscripciones realizadas entre julio y octubre. De cada preinscripción se conoce: fecha (día y mes), DNI del alumno, apellido y nombre del alumno, teléfono de contacto y horario

de preferencia (1: Mañana, 2: Tarde, 3: Jornada extendida, 4: Jornada completa).

A) Generar una nueva estructura que contenga solamente las preinscripciones realizadas en jullo y agosto.

Se pide:

B) A partir de la nueva estructura generada, calcular e informar:

1. Los dos horarios menos requeridos. 2.

Apellido, nombre y teléfono de aquellos alumnos con ONI compuesto sciamente por dígitos pares.

3. Cantidad de preinscripciones al horario Jornada extendida.}

program parcial; 
type 
	rangohorario = 1..4; 
	rangodia = 1..31; 
	rangomes = 7..10; 
	fecha = record 
		dia: rangodia; 
		mes: rangomes;
	end; 
	preinscripcion = record 
		fechains: fecha; 
		dni: integer; 
		apellido: string; 
		nombre: string; 
		telefono: integer; 
		horario: rangohorario; 
	end; 
	vectorcontador = array [rangohorario] of integer; 
	lista =^nodo; 
	nodo = record 
		dato: preinscripcion;
		 sig: lista; 
	end; 
	
	{procedure leer (var p: preinscripcion); 
	begin 
		writeln ('dni:	'); 
		readln (p.dni); 
		if (p.dni <> 0) then begin 
			writeln ('fecha dia y mes:	'); 
			readln (p.fechains.dia); 
			readln (p.fechains.dia); 
			writeln ('apellido:	'); 
			readln (p.apellido); 
			writeln ('nombre:	'); 
			readln (p.nombre); 
			writeln ('telefono:	'); 
			readln (p.telefono); 
			writeln ('horario de 1 a 4:	'); 
			readln (p.horario); 
		end; 
	end; 
	
	procedure agregar (var l: lista; p: preinscripcion);
	var 
		nue: lista; 
	begin 
		new(nue); 
		nue^.dato:= p; 
		nue^.sig:= l; 
		l:= nue; 
	end; 
	
	procedure cargarlista (var l: lista); 
	var 
		p: preinscripcion; 
	begin 
		leer(p); 
		while (p.dni <> 0) do begin 
			agregar(l,p); 
			leer(p); 
		end; 
	end; } {se dispone}
	
	procedure inicializarvector (var vc: vectorcontador); 
	var 	
		i: integer; 
	begin 
		for i:= 1 to 4 do 
			vc[i]:= 0; 
	end; 
	
	procedure agregaradelante (var l2: lista; p: preinscripcion);
	var 
		nue: lista; 
	begin 
		new(nue); 
		nue^.dato:= p; 
		nue^.sig:= l2; 
		l2:= nue; 
	end; 
	
	procedure recorrer (l: lista; var l2: lista); 
	begin 
		while (l<> nil) do begin 
			if (l^.dato.fechains.mes = 7) or (l^.dato.fechains.mes = 8) then 
				agregaradelante (l2, l^.dato); 
			l:= l^.sig; 
		end; 
	end; 
	
	procedure minimo (vc: vectorcontador; var minhora1: integer; var minhora2: integer); 
	var 
		min1, min2, i: integer; 
	begin 
		min1:= 999; 
		min2:= 999; 
		for i:= 1 to 4 do begin 
			if (vc[i] < min1) then begin 
				minhora2:= minhora1; 
				minhora1:= i; 
				min2:= min1; 
				min1:= vc[i]; 
			end
			else 
				if (vc[i] < min2) then begin 
					minhora2:= i; 
					min2:= vc[i]; 
				end; 
		end; 
	end; 
	
	function cumple (dni: integer):boolean; 
	var 
		dig: integer; 
		ok: boolean; 
	begin 
		ok:= false; 
		while (dni <> 0) do begin 
			dig:= dni mod 10; 
			if (dig mod 2= 0) then 
				ok:= true; 
			dni:= dni div 10; 
		end; 
	cumple:= ok; 
	end; 
	
	procedure procesar (l2: lista; var vc: vectorcontador); 
	var 
		cantpre, minhora1, minhora2: integer; 
	begin 
		cantpre:= 0; 
		while (l2<> nil) do begin 
			vc[l2^.dato.horario]:= vc[l2^.dato.horario] + 1; 
			if (l2^.dato.horario = 3) then 
				cantpre:= cantpre + 1; 
			if (cumple (l2^.dato.dni)) then begin 
				writeln ('si cumple', l2^.dato.apellido); 
				writeln ('si cumple',l2^.dato.nombre); 
				writeln ('si cumple', l2^.dato.telefono); 
			end; 
			l2:= l2^.sig; 
		end; 
		writeln ('la cantidad de presincripciones al horario extendido es de:	', cantpre); 
		minimo (vc, minhora1, minhora2); 
		writeln ('los horarios menos requeridos son:	', minhora1, 'y', minhora2); 
	end; 
	
	var 
		l, l2:lista; 
		vc: vectorcontador; 
	begin 
		l:= nil; 
		l2:= nil; 
		cargarlista (l); 
		inicializarvector (vc); 
		recorrer (l, l2); 
		procesar (l2, vc);
	end.
