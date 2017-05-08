package org.ciu.clases

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import org.uqbar.commons.utils.TransactionalAndObservable
import java.util.Random
import org.ciu.excepciones.YaExisteElHobbieException
import org.ciu.excepciones.YaExisteLaSeniaParticularException

@Accessors
@TransactionalAndObservable
class Villano extends Ocupante {
	// extends Entity
	// @TransactionalAndObservable deberia estar aca? 
	// 		creo q en principio si
	
	String nombre
	String sexo
	List<String> seniasParticulares
	List<String> hobbies
	
	new () {}
	
	/** PROPÓSITO: Crea un Villano con un nombre, sexo, señas particulares y hobbies. 
	 * 
	 * @param unNombre Es el nombre que tendrá el Villano.
	 * @param unSexo Es el sexo que tendrá el Villano.
	 * @param variasSenias Son las señas que caracterizan al Villanos.
	 * @param variosHobbies Son los hobbies que tendrá el Villano.
	 */
	new(String unNombre, String unSexo, ArrayList<String> variasSenias, ArrayList<String> variosHobbies) 
	{
		nombre = unNombre
		sexo = unSexo
		seniasParticulares = variasSenias
		hobbies = variosHobbies
	}
	
	/**
	 * PROPÓSITO: Pregunta si el Villano tiene el mismo nombre que se especifica por parámetro.
	 * 
	 * @param unNombre Es el nombre por el cual se hace la verificación
	 */
	def tieneElMismoNombreQue(String unNombre) 
	{
		nombre == unNombre
	}
	
	/** PROPÓSITO: Agrega un hobbie al villano.
	 * 
	 * @param hobbie Es el hobbie al que se le agrega al villano.
	 */
	def agregarHobbie (String hobbie)
	{
		hobbies.add(hobbie)
	}
	
	/** PROPÓSITO: Agrega un hobbie al Villano solo si no fue agregada anteriormente.
	 * @param hobbie Es el hobbie que se quiere intentar agregar.
	 * */
	def agregarHobbieSiPuede (String hobbie)
	{
		if (! tieneElHobbie(hobbie))
			agregarHobbie (hobbie)
		else
			throw new YaExisteElHobbieException ("El hobbie ya fue cargado anteriormente")
	}
	
	/** PROPÓSITO: Pregunta si el Villano ya tiene el hobbie especificada por parámetro.
	 * @param hobbie Es el hobbie por el que se hace la verificación.
	 */
	def tieneElHobbie(String hobbie) 
	{
		hobbies.contains(hobbie)
	}
	
	/** PROPÓSITO: Saca un hobbie al villano.
	 * 
	 * @param hobbie Es el hobbie al que se le quita al villano.
	 */
	def borrarHobbie (String hobbie)
	{
		hobbies.remove(hobbie)
	}
	
	/** PROPÓSITO: Borra una senia particular del villano.
	 * 
	 * @param senia Es la senia que se le agrega al villano.
	 */
	def borrarSenia(String senia)
	{
		seniasParticulares.remove(senia)
	}
	
	/** PROPÓSITO: Agrega una senia particular al villano.
	 * 
	 * @param senia Es la senia que se le quita al villano.
	 */
	def agregarSenia(String senia)
	{
		seniasParticulares.add (senia)
	}
	
	/** PROPÓSITO: Agrega una senia particular al Villano solo si no fue agregada anteriormente.
	 * @param senia Es la senia particular que se quiere intentar agregar.
	 * */
	def agregarSeniaSiPuede (String senia)
	{
		if (! existeLaSenia(senia))
			agregarSenia(senia)
		else
			throw new YaExisteLaSeniaParticularException("La seña particular ya se encuentra agregada")
	}
	
	/** PROPÓSITO: Pregunta si el Villano ya tiene la senia particular especificada por parámetro.
	 * @param senia Es la senia particular por la que se hace la verificación.
	 * 
	 */
	def existeLaSenia(String senia) 
	{
		seniasParticulares.contains(senia)
	}
	
	
	
	override responderAlDetective(Caso caso, LugarDeInteres unLugar, Pais paisActual)
	{
		if (seEncuentraElVillanoEnElLugar(caso, unLugar))
			"ALTO!! Detengase"
		else
			"CUIDADO DETECTIVE!! Ah estado a punto de caer en una trampa... La persona que busca está en la ciudad"
		
	}
	
	def seEncuentraElVillanoEnElLugar(Caso caso, LugarDeInteres interes) 
	{
		interes == caso.lugarDelVillano
	}
	
	/**
	 * PROPÓSITO: Devuelve un hobbie del Villano.
	 */
	def pistaDeHobbies() 
	{
		var Random rnd = new Random
		var int numeroPista = rnd.nextInt(hobbies.size-1)
		hobbies.get(numeroPista)
	}
	
	def pistaDeSeniasParticulares() 
	{
		var Random rnd = new Random
		var int numeroPista = rnd.nextInt(seniasParticulares.size-1)
		seniasParticulares.get(numeroPista)
	}
	
}
