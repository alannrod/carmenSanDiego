package org.ciu.excepciones

import org.omg.CORBA.UserException

class YaEstaAgregadaEsaConexion extends UserException {
	new(String mensajeDeError) 
	{
		super (mensajeDeError)
	}	
}
