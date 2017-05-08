package org.ciu.clases

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.ciu.excepciones.ElPaisYaFueAgregadoException

@Accessors
@Observable
class Mapamundi {
	
	List<Pais> paises
	//Pais paisSeleccionado
	
	new() {}	
	
	def buscarPais(String nombreDelPaisABuscar) {
		
		/*
		 * como diferencias un pais de otros?
		 * solo por el nombre
		 */
		paises.filter[pais | pais.nombrePais == nombreDelPaisABuscar].toList
		// (PREGUNTAR) Otra manera de hacerlo...
		//paises.findFirst[pais | pais.nombrePais == nombreDelPaisABuscar]
		
	}
	
	
	def borrarPais(Pais paisABorrar) {
		paises.remove(paisABorrar)
	}
	
	def agregarPais(Pais paisAgregar) {
		paises.add(paisAgregar)
	}
	
	def agregarPaisSiPuede(Pais paisAgregar)
	{
		if (! elPaisYaEstaAgregado(paisAgregar))
			agregarPais(paisAgregar)
		else
			// ¿Por qué ocurrio una excepción? Porque...
			throw new ElPaisYaFueAgregadoException("No se puede agregar el mismo pais dos veces")
	}
	
	private def elPaisYaEstaAgregado(Pais paisAgregar) {
		paises.exists[pais | pais.nombrePais == paisAgregar.nombrePais]
	}
	
}
