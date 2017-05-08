package org.ciu.servidor.rest

import com.fasterxml.jackson.databind.exc.UnrecognizedPropertyException
import org.uqbar.commons.model.UserException
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Delete
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import org.ciu.clasesMinimas.CasoMin
import org.ciu.clasesMinimas.JuegoMin

/**
 * API Rest de la Carmen San Diego, implementada con XtRest.
 */
@Controller
class CarmenSanDiegoRestAPI {
    extension JSONUtils = new JSONUtils

	JuegoMin juego

    new(JuegoMin juego) {
        this.juego = juego
    }





 /**
     * Permite iniciarJuego que devuelve un caso 
     * Atiende requests de la forma POST /juegoNuevo con un caso en el body (en formato JSON).
     */
    @Post("/iniciarJuego")
    def createJuego(@Body String body) {
        response.contentType = ContentType.APPLICATION_JSON
        try {
	        val CasoMin caso = body.fromJson(CasoMin)
	        try {
				this.juego.setCaso(caso)
				ok()	        	
	        } 
	        catch (UserException exception) {
	        	badRequest(getErrorJson(exception.message))
	        }
        } 
        catch (UnrecognizedPropertyException exception) {
        	badRequest(getErrorJson("El body debe ser un Caso"))
        }
    }



    /**
     * pistaDelLugar que espera un lugar y un caso y devuelve la pista
     *  Permite buscar libros que contengan cierto string en su título, u obtener todos los libros.
     *  
     * Atiende requests de la forma GET /libros y GET /libros?string=xxx.
     */
    @Get("/pistaDelLugar")
    def getPista(String lugar, String caso) {
        response.contentType = ContentType.APPLICATION_JSON
       	ok(this.juego.searchPista(lugar, caso).toJson)
    }


/*--------------------------------------------------------------- */

    private def getErrorJson(String message) {
        '{ "error": "' + message + '" }'
    }

}
