package viri;

import java.util.logging.Logger;

import javax.enterprise.context.ApplicationScoped;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import prijava.Prijava;
import vloge.Uporabnik;

@Path("prijava")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
@ApplicationScoped
public class PrijavaVir {

    @PersistenceContext(unitName = "studis")
    private EntityManager em;

    Logger logger = Logger.getLogger(PrijavaVir.class.getSimpleName());

    @POST
    public Response preveriPrijavo(Prijava prijava) {
        logger.info("preveriPrijavo");
        // Preveri, ce oseba obstaja v bazi
        Uporabnik osebaVBazi = (Uporabnik) this.em.createNamedQuery("entities.vloge.Uporabnik.prijava")
                                          .setParameter("email", prijava.getElektronskaPosta()).getSingleResult();
        if (osebaVBazi == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        // Preveri, ce se geslo jema z uporabnikovim geslom iz baze
        // Todo: hashiraj geslo za prijavo
        if (prijava.getGeslo().equals(osebaVBazi.getGeslo())) {
            return Response.status(Response.Status.OK).build();
        } else {
            return Response.status(Response.Status.UNAUTHORIZED).build();
        }
    }
}
