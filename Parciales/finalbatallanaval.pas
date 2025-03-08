program hundido; 
 const 
	filas = 20; 
	columnas = 15;
 type 
    rangofila = 1..filas; 
    rangocolumna = 1..columnas;
	vectornaval = array [1..filas, 1..columnas] of boolean; //matriz de 20 x 15 
	vectornaval2 = array [1..filas, 1..columnas] of boolean;
		
 procedure cargarvector (var v: vectornaval); 
 var 
	i, j, pepe: integer; 
	ok: boolean;
 begin 
	for i:= 1 to filas do 
		for j:= 1 to columnas do begin 
		repeat
			writeln (' posicion fila  ', i, '  columna  ', j, ' si hay un barquito ahi escribi 1 y si no hay escribi 0 '); 
			readln (pepe); 
		until (pepe =0) or (pepe = 1); //valido con el repeat por si ingresan numero que no sean 0 o 1
			if (pepe = 1) then 
				ok:= true
			else
				ok:= false;
			v[i,j]:= ok; 
		end; 
 end; 
 
 function dameNumeroFila(): integer;
 var 
	num: integer; 
 begin 
	writeln (' ingrese numero de fila: '); 
	readln (num); 
	dameNumeroFila:= num; 
 end; 
 
 function dameNumeroColumna (): integer; 
 var 
	numero: integer; 
 begin
	writeln ('ingrese numero de columna: '); 
	readln (numero); 
	dameNumeroColumna:= numero; 
 end;
 
 procedure juego (var v2: vectornaval2; fila: integer; columna: integer; var contador: integer); 
 begin 
	if ((v2[fila,columna])=true) then begin 
		contador:= contador + 1; 
		writeln (' su barquinho se ha hundido jodeeer');
		v2[fila,columna] := false;
	end
	else
		writeln (' no has hundido el barco idiota ');
	
 end; 
 procedure rondas (v1: vectornaval; v2: vectornaval2); 
 var 
	i, contadorjugador1, contadorjugador2: integer; 
	fila: rangofila;
	columna: rangocolumna;
 begin 
	contadorjugador1:= 0; 
	contadorjugador2:= 0; 
	for i:= 1 to 10 do begin //son 10 rondas pero me da pajitaaaa
		writeln (' turno jugador 1 uwuuuuu: '); 
		fila:= dameNumeroFila(); 
		writeln ('----------------');
		{writeln (fila);}
		columna:= dameNumeroColumna (); 
		writeln ('----------');
		{writeln (columna);} 
		juego (v2, fila, columna, contadorjugador1); 
		writeln ('-------------'); 
		writeln (' turno del jugador 2: '); 
		fila:= dameNumeroFila(); 
		writeln ('----------------');
		{writeln (fila);}
		columna:= dameNumeroColumna (); 
		writeln ('----------');
		{writeln (columna);} 
		juego (v1, fila, columna, contadorjugador2); 
 
 
 
	end; 
 
 writeln (' el puntaje del jugador 1 fue de: ', contadorjugador1); 
 writeln (' el puntaje del jugador 2 fue de: ', contadorjugador2); 
 end;
 
 
 procedure imprimir (v: vectornaval); 
 var 
	i, j: integer; 
 begin 
	for i:= 1 to filas do 
		for j:= 1 to columnas do 
			writeln (v[i,j]); 
 end; 
 
 
 var 
	v: vectornaval; 
	v2: vectornaval2; 
 begin 
	writeln ('pone los primeros barquitos: '); 
	cargarVector (v); 
	writeln ('pone los segundos barquitos: '); 
	cargarVector (v2); 
	rondas (v, v2); 
	writeln ('imprimir el primer: ');
	imprimir(v); 
	writeln (' imprimir el segundo: '); 
	imprimir (v2); 
 end.
 
			
