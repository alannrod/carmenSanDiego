package org.ciu.clasesMinimas

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.ciu.clases.Pais

@Accessors
class PaisMin {
	Integer id
	String nombre
	List <String> lugares
	List <Conexion> conexiones
	
	new(){}
	
	new (Integer identificador, String unNombre){
		id = identificador
		nombre = unNombre
		lugares = new ArrayList<String>
		conexiones = new ArrayList <Conexion>
	}
	
	def conectarPais (PaisMin pais){
		val nuevaConexion = new Conexion(pais.getNombre, pais.getId)
		conexiones.add(nuevaConexion)
	}
	
	def agregarLugar(String nuevoLugar){
		lugares.add(nuevoLugar)
	}
	
	def convertirAPaisMin (Integer identif,Pais paisCompleto){
		new PaisMin(identif,paisCompleto.nombrePais)
		
	}
	
}