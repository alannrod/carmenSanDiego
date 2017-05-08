package org.ciu.clases	
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.utils.TransactionalAndObservable
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.UserException
import java.util.Random
import org.ciu.excepciones.YaEstaAgregadaEsaConexion

@Accessors
@TransactionalAndObservable
class Pais  {
	
	String nombrePais
	List<String> caracteristicaPais
	List<LugarDeInteres> lugares
	List<Pais> paisesConexionAerea
	Ocupante ocupante
	
	new (){}
	
	new(String nombre) {
		nombrePais = nombre
		caracteristicaPais = new ArrayList<String>()
		lugares = new ArrayList<LugarDeInteres>()
		paisesConexionAerea = new ArrayList<Pais>()
	}
	
	def void setNombreLugares(List<LugarDeInteres> plugares) {}
	
	def void setNombreCaracteristica(List<String> pfeature) {}
	
	
	def tieneConexionAereaCon(Pais pais) {
		paisesConexionAerea.exists[p | p.nombrePais == pais.nombrePais]
	}
	
	def agregarConexionesAerea(Pais unPais) {
			paisesConexionAerea.add(unPais)
	}
	
	def agregarConexionSiPuede(Pais unPais) {
		if (! paisesConexionAerea.contains(unPais)) { // Returns true if this list contains the specified element.
			agregarConexionesAerea
		} else {
			throw new YaEstaAgregadaEsaConexion("Tenes un conexion/pais ya definida")
		}
	}
	
	def borrarConexionAerea(Pais unPais) {
		paisesConexionAerea.remove(unPais)
	}
	
	def esElFinalDelRecorrido(List<Pais> recorrido)
	{
		var Pais paisDestino = recorrido.get(recorrido.size - 1)
		this.esIgualA(paisDestino.nombrePais)
	}
	
	def esIgualA(String nombreAComparar) 
	{
		nombrePais == nombreAComparar
	}
	
	def estaDentroDelRecorrido(List<Pais> recorrido)
	{
		recorrido.exists[pais| pais.esIgualA(nombrePais)]
	}
	
	def estaFueraDelRecorrido (List<Pais> recorrido)
	{
		! estaDentroDelRecorrido(recorrido)
	}
	
	def perteneceAlRecorrido(List<Pais> recorrido)
	{
		val recorridoAux = recorrido
		var recorridoSinUltimoPais = recorrido.filter[pais| pais.noEsElUltimoDelRecorrido(recorridoAux)].toList
		estaDentroDelRecorrido(recorridoSinUltimoPais)
	}
	
	def noEsElUltimoDelRecorrido(List<Pais> recorrido) 
	{
		! esElFinalDelRecorrido(recorrido)
	}
	
	def validar() {
//		if(nombrePais == null) {
//			throw new UserException("El nombre no puede quedar vacion")
//		}
//		
//		if(caracteristicaPais.isEmpty) {
//			throw new UserException("Al menos debe tener 1 caracteristica")
//		}
//		
		if(lugares.size != 3) {
			throw new UserException("Te faltan agregar mas Lugar para visitar")
		}
		
	}
	
	def eliminarCaracteristicaSelecionada(String feature) {
		caracteristicaPais.remove(feature)
	}
	
	/**
	 * @PROPÓSITO: Retorna un lugar de los lugares de interes del país de manera aleatoria.
	 */
	def lugarDelVillano() 
	{
		var Random rnd = new Random
		var int lugar = rnd.nextInt(2)
		lugares.get(lugar)
	}
	
	def pistaDeSusCaracteristicas() 
	{
		var Random rnd = new Random
		var int caracteristica = rnd.nextInt(caracteristicaPais.size-1)
		caracteristicaPais.get(caracteristica)
	}
	
}
