package org.ciu.excepciones

import org.omg.CORBA.UserException

class ElVillanoYaEstaCargadoException extends UserException {
	new (String mensajeDeError)
	{
		super (mensajeDeError)
	}
}
