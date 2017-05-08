package org.ciu.clases

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.Random
import org.ciu.excepciones.ElPaisYaEstaIncluidoException

@Observable
@Accessors
class Caso 
{
	Villano responsable;
	List<Pais> planDeEscape;
	String reporteDelActoCriminal;
	String objetoDelRobo;
	Pais paisDelRobo;
	LugarDeInteres lugarDelVillano;
	
	new () {}
	
	/**
	 * @Propósito Crea un Caso nuevo con unCriminal, unPlanDeEscape, un reporte, el objetoRobado y un Pais.
	 * @param unCriminal Es el Villano que produjo el crimen.
	 * @param unPlanDeEscape Es una lista de paises por las que el Villano escapó despues de cometer el robo.
	 * @param reporte Es un reporte con los acontecimientos del robo.
	 * @param objetoRobado Es el objeto que el Villano robó.
	 * @param unPais Es el Pais en el que se cometio el robo.
	 */
	new (Villano unCriminal, List<Pais> unPlanDeEscape, String reporte, String objetoRobado, Pais unPais) 
	{
		responsable = unCriminal
		planDeEscape = unPlanDeEscape
		reporteDelActoCriminal = reporte
		objetoDelRobo = objetoRobado
		paisDelRobo = unPais
		lugarDelVillano = lugarDondeSeEncuentraElVillano
	}
	
	def lugarDondeSeEncuentraElVillano() 
	{
		ultimoPaisDelRecorrido.lugarDelVillano
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
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	/**
	 * @Propósito Agrega un paisDeEscape al caso.
	 * @param paisDeEscape Es el Pais que se le agrega al plan de escape. 
	 */
	def agregarPaisDeEscape (Pais paisDeEscape)
	{
		planDeEscape.add (paisDeEscape)
	}
	
	/**
	 * @Propósito Agrega un paisDeEscape al caso solo si no existe ya en el plan de escape.
	 * @param paisDeEscape Es el Pais que se intenta agregar al plan de escape. 
	 */
	def agregarPaisDeEscapeSiPuede (Pais paisDeEscape)
	{
		if (! estaIncluidoEnElPlanDeEscape(paisDeEscape))
			planDeEscape.add (paisDeEscape)
		else 
			throw new ElPaisYaEstaIncluidoException ("El pais ya está incluido en el plan de escape")
	}
	
	/**
	 * @Propósito Pregunta si pais ya está incluido en el plan de escape.
	 * @param pais Es el Pais que se quiere verificar.
	 */
	def estaIncluidoEnElPlanDeEscape(Pais pais) 
	{
		planDeEscape.exists[p | p.nombrePais == pais.nombrePais]
	}
	
	def esElFinDelCaso (Pais paisActual) 
	{
		paisActual.esElFinalDelRecorrido(planDeEscape)
	}
	
	def ultimoPaisDelRecorrido()
	{
		planDeEscape.get(planDeEscape.size-1)
	}
	
	def proximoDestino(Pais pais) 
	{
		val posicionPaisActual = planDeEscape.indexOf(pais)
		planDeEscape.get(posicionPaisActual+1)
	}
	
	
}
