// Imports
const cds = require("@sap/cds");

/**
  * The service implementation with all service handlers
  */
module.exports = cds.service.impl(async function () {
    
    const { Leagues, Teams } = this.entities();

    
    this.before("DELETE", Leagues, async (req) => {
        const teamsInLeague = await SELECT.from(Teams).where({ league_idLeague: req.data.idLeague });
    
        if (teamsInLeague.length >0) {
           return req.reject( `No se puede eliminar la liga porque tiene equipos asociados.`);
        }
    });

})