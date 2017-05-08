package org.ciu.excepciones

import org.omg.CORBA.UserException

class ElPaisYaFueAgregadoException extends UserException {
	new (String mensajeDeError)
	{
		super (mensajeDeError)
	}
}
