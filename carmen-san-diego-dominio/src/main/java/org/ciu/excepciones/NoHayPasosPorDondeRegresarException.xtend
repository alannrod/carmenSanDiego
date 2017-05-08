package org.ciu.excepciones

import org.omg.CORBA.UserException

class NoHayPasosPorDondeRegresarException extends UserException {
		new(String mensajeDeError) 
	{
		super (mensajeDeError)
	}
}
