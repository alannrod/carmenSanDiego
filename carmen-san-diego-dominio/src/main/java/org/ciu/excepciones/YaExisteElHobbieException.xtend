package org.ciu.excepciones

import org.omg.CORBA.UserException

class YaExisteElHobbieException extends UserException {
	new(String mensajeDeError) 
	{
		super (mensajeDeError)
	}	
}
