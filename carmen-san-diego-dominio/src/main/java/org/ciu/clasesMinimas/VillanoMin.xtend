package org.ciu.clasesMinimas

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class VillanoMin {
	Integer id
	String nombre
	List<String> senias
	List<String> hobbies
	
	new(){}
	
	new(Integer identificador, String unNombre){
		id = identificador
		nombre = unNombre
		senias = new ArrayList<String>
		hobbies = new ArrayList<String>		
	}
	
	def agregarSenia(String unaSenia){
		senias.add(unaSenia)
	}
	
	def agregarHobbie (String unHobbie){
		hobbies.add(unHobbie)
	}
	
}