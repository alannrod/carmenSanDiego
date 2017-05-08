package org.ciu.clasesMinimas

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class CasoMin {
	Integer id
	VillanoMin villano
	List<PaisMin> ruta
	
	new(){}
	
	new(Integer identificador, VillanoMin malechor){
		id = identificador
		villano = malechor
		ruta = new ArrayList<PaisMin>
	}
	
	new(Integer identificador, VillanoMin malechor,List<PaisMin> porAqui){
		new CasoMin(identificador, malechor)
		ruta = porAqui
	}
	
	def agregarPaisMin(PaisMin parteDeLaRuta){
		ruta.add(parteDeLaRuta)
	}
	
	def devolverPista(String lugar){
		/*
		 * lugar.devolverPista
		 */
		 val String retorno ="solo se que no se nada"
		 retorno
	}
}