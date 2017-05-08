package org.ciu.clases
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import java.util.List
import org.uqbar.commons.utils.TransactionalAndObservable

@TransactionalAndObservable
@Accessors
abstract class Ocupante {

	// Es un STRATEGY
	
	new() 
	{}
	
		
	def abstract String responderAlDetective(Caso caso, LugarDeInteres unLugar, Pais paisActual)
	
}
