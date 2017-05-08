package org.ciu.clases

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Random
import org.ciu.clases.Caso

@Observable
@Accessors
class Informante extends Ocupante {
	

	override responderAlDetective(Caso caso, LugarDeInteres unLugar, Pais paisActual) 
	{	
//		switch(unLugar)
//		{
//			case LugarDeInteres.BANCO : responderAlBanco(caso, paisActual)
//			case LugarDeInteres.BIBLIOTECA : responderALaBiblioteca(caso, paisActual)
//			case LugarDeInteres.CLUB : responderAlClub(caso)
//			case LugarDeInteres.EMBAJADA : responderALaEmbajada(caso, paisActual)
//		}
	}
	
	def responderALaEmbajada(Caso caso, Pais paisActual)
	{
		// 2 pistas del destino del villano
		pistaSobrePaisDestino(caso, paisActual) +
		pistaSobrePaisDestino(caso, paisActual)
	}
	
	def responderAlClub(Caso caso)
	{
		// 2 señas particulares
		pistaSobreSeniaParticular(caso.responsable) +
		pistaSobreSeniaParticular(caso.responsable) +
		// 70% 1 hobbie
		informacionAdicional(caso, 70)
	}
	
	
	def responderALaBiblioteca(Caso caso,Pais paisActual) 
	{
		// lo mismo del banco
		responderAlBanco(caso, paisActual) + 
		// 50% 1 hobbies
		informacionAdicional(caso, 50)
	}
	
	def responderAlBanco(Caso caso, Pais paisActual)
	{
		// 1 pais destino
		pistaSobrePaisDestino(caso, paisActual)
		// 1 señas particulares
		pistaSobreSeniaParticular(caso.responsable)
	}
	
	
	def pistaSobreSeniaParticular(Villano villano) 
	{
		villano.pistaDeSeniasParticulares()
	}
	
	def String pistaSobrePaisDestino(Caso caso, Pais paisActual) 
	{
		val proximoPais = caso.proximoDestino(paisActual)
		proximoPais.pistaDeSusCaracteristicas
	}
	
	def informacionAdicional(Caso caso, int porcentaje) 
	{
		var Random rnd = new Random
		var int adicional = rnd.nextInt(99)
		if (adicional > (porcentaje-1))
		{
			pistaSobreHobbie(caso.responsable)
		}
	}
	
	def pistaSobreHobbie(Villano villano) 
	{
		villano.pistaDeHobbies()
	}
	
}
