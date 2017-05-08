package org.ciu.clasesMinimas

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class JuegoMin {
	List<CasoMin> caso
	
	new(){}
	
	new(CasoMin elCaso){
		setCaso(elCaso)
	}
	
	def setCaso(CasoMin unCaso){
		caso.add(unCaso)
	}
	
	def searchPista(String lugar, String unCaso) {
		/*deberia tener una lista de casos y buscar el caso
		 * que me mandan por parametro
		 */
		this.caso.findFirst[].devolverPista(lugar)
	}
	
	
	}
	
