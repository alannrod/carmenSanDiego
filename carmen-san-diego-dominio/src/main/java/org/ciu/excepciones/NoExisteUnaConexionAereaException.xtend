package org.ciu.excepciones

import org.omg.CORBA.UserException

class NoExisteUnaConexionAereaException extends UserException {
	new(String mensajeDeError) 
	{
		super (mensajeDeError)
	}
}
