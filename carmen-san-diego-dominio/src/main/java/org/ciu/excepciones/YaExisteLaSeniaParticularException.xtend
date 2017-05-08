package org.ciu.excepciones

import org.omg.CORBA.UserException

class YaExisteLaSeniaParticularException extends UserException {
	new(String mensajeDeError) 
	{
		super (mensajeDeError)
	}		
}
