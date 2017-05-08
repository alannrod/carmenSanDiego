package org.ciu.clasesMinimas

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Conexion {
	String nombre
	Integer id
	/*las conexiones solo guardaran el nombre y el id del pais que conecta */
	new(){}
	
	new(String paisAConectar, Integer numeroDelPais){
		nombre = paisAConectar
		id = numeroDelPais
	}
}