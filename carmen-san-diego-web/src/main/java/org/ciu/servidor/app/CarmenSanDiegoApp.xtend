package org.ciu.servidor.app

import org.ciu.clasesMinimas.JuegoMin
import org.ciu.clasesMinimas.VillanoMin
import org.ciu.clasesMinimas.CasoMin
import org.ciu.servidor.rest.CarmenSanDiegoRestAPI
import org.uqbar.xtrest.api.XTRest

class CarmenSanDiegoApp {
	
	def static void main(String[] args) {
		var juego = new JuegoMin
		var neurus = new VillanoMin (10,"Neurus")
		var cachavacha = new VillanoMin (20,"Cachavacha")
		var pucho = new VillanoMin (30,"Pucho")
		var serrucho = new VillanoMin (40,"Serrucho")
		
		juego.setCaso(new CasoMin(1, neurus))
		juego.setCaso(new CasoMin(2, cachavacha))
		juego.setCaso(new CasoMin(1, pucho))
		juego.setCaso(new CasoMin(1, serrucho))
		

        XTRest.startInstance(new CarmenSanDiegoRestAPI(juego), 9000)
        
        }
}