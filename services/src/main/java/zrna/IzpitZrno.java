package zrna;

import helpers.PrijavniPodatkiIzpit;
import izpit.*;
import student.PredmetStudent;
import student.PredmetStudentId;
import vloge.Student;
import vpis.VpisId;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.transaction.*;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.logging.Logger;

@ApplicationScoped
public class IzpitZrno {

    private final static Logger logger = Logger.getLogger(IzpitZrno.class.getName());

    @PersistenceContext
    private EntityManager em;

    @Inject
    private UserTransaction userTransaction;

    public void applyForExam(PrijavniPodatkiIzpit prijavniPodatki) throws Exception {

        // preveri število polaganj
        // celotno število polaganj (največ 6), polaganja v tekočem letu (največ 3)
        checkApplicationCount(prijavniPodatki);

        // prijava na izpit iz prejšnjega letnika

        // preveri roke (prijava po izteku)
        IzpitniRok izpitniRok = checkDates(prijavniPodatki);

        // preveri prijavo na že opravljen izpit
        checkForPassedExam(prijavniPodatki);
        // praveri za obstoječo prijavo
        // preveri za prijavo z nezaključeno oceno
        checkIfApplicationExistsOrNotClosed(prijavniPodatki);

        createApplication(izpitniRok, prijavniPodatki);
    }

    private void checkApplicationCount(PrijavniPodatkiIzpit prijavniPodatki) throws Exception {
        logger.info("Preverjam stevilo polaganj");
        Long countStudyYear = em.createNamedQuery("entitete.izpit.PrijavaIzpit.stejPrijaveStudijskoLeto", Long.class)
                .setParameter("student", prijavniPodatki.getStudent())
                .setParameter("studijskoLeto", prijavniPodatki.getStudijskoLeto())
                .setParameter("predmet", prijavniPodatki.getPredmet())
                .getSingleResult();
        Long countAll = em.createNamedQuery("entitete.izpit.PrijavaIzpit.stejPrijave", Long.class)
                .setParameter("student", prijavniPodatki.getStudent())
                .setParameter("predmet", prijavniPodatki.getPredmet())
                .getSingleResult();

        logger.info("Stevilo prijav na izpit za tekoce studijsko leto: " + countStudyYear);
        logger.info("Stevilo vseh prijav na izpit: " + countAll);
        if (countStudyYear >= 3) {
            logger.warning("Presezeno stevilo prijav za tekoce studijsko leto");
            throw new Exception("Za to študijsko leto je preseženo največje dovoljeno število prijav na izpit pri posameznem " +
                    "predmetu");
        }

        if (countAll >= 6) {
            logger.warning("Presezeno stevilo prijav na izpit");
            throw new Exception("Presegli ste največje dovoljeno število polaganj za izbrani izpit");
        }
    }

    private IzpitniRok checkDates(PrijavniPodatkiIzpit prijavniPodatki) throws Exception {
        IzpitniRok izpitniRok;
        try {
            izpitniRok = em.createQuery("SELECT i FROM IzpitniRok i WHERE " +
                    "i.izvajanjePredmeta.predmet.sifra = :predmet AND " +
                    "i.izvajanjePredmeta.studijskoLeto.id = :studijskoLeto AND " +
                    "i.datumCasIzvajanja = :datum", IzpitniRok.class)
                    .setParameter("predmet", prijavniPodatki.getPredmet())
                    .setParameter("studijskoLeto", prijavniPodatki.getStudijskoLeto())
                    .setParameter("datum", prijavniPodatki.getDatumIzvajanja())
                    .getSingleResult();
        } catch (NoResultException e) {
            throw new Exception("Ni razpisanega roka.");
        }

        LocalDateTime lastValidDate = izpitniRok
                .getDatumCasIzvajanja()
                .minusDays(2)
                .withHour(23)
                .withMinute(59)
                .withSecond(0);

        logger.info("Preverjam veljaven cas prijave na izpit. Zadnji rok za prijavo: " +
                "" + lastValidDate.format(DateTimeFormatter.ofPattern("hh:mm:ss dd-MM-yyyy")));
        LocalDateTime now = LocalDateTime.now();

        if (lastValidDate.isBefore(now)) {
            logger.info("Prepozna prijava na izpit");
            throw new Exception("Prepozna prijava na izpit! Rok za prijavo je potekel ob " +
            lastValidDate.format(DateTimeFormatter.ofPattern("hh:mm:ss dd-MM-yyyy")));
        }

        return izpitniRok;
    }

    private void checkForPassedExam(PrijavniPodatkiIzpit prijavniPodatki) throws Exception {
        logger.info("Preverjam, ce obstaja pozitivna ocena za izpit");
        Izpit izpit;
        try {
            izpit = em.createNamedQuery("entitete.izpit.PrijavaIzpit.preveriZaOpravljenIzpit", Izpit.class)
                    .setParameter("student", prijavniPodatki.getStudent())
                    .setParameter("predmet", prijavniPodatki.getPredmet())
                    .getSingleResult();
        } catch (NoResultException e) {
            izpit = null;
        }

        if (izpit != null) {
            logger.info("Ocena za predmet že obstaja");
            throw new Exception("Pozitivna ocena za ta predmet že obstaja!");
        }
        logger.info("Ocena za ta predmet še ne obstaja");
    }

    private void checkIfApplicationExistsOrNotClosed(PrijavniPodatkiIzpit prijavniPodatki) throws Exception {
        logger.info("Preverjam za obstoječe prijave...");
        PrijavaIzpit stored;
        try {
            stored = em.createNamedQuery("entitete.izpit.PrijavaIzpit.aktivnePrijave", PrijavaIzpit.class)
                    .setParameter("predmet", prijavniPodatki.getPredmet())
                    .setParameter("studijskoLeto", prijavniPodatki.getStudijskoLeto())
                    .setParameter("student", prijavniPodatki.getStudent())
                    .setParameter("datumCas", prijavniPodatki.getDatumIzvajanja())
                    .getSingleResult();
        } catch (NoResultException e) {
            stored = null;
        }

        if (stored != null) {
            logger.info("Prijava obstaja!");
            throw new Exception("Prijava že obstaja");
        }

    }

    private BigDecimal setPayment() {
        return null;
    }

    private void createApplication(IzpitniRok rok, PrijavniPodatkiIzpit prijavniPodatki) {
        BigDecimal cena = setPayment();
        PredmetStudent predmetStudent = getPredmetStudent(prijavniPodatki);

        PrijavaIzpit prijavaIzpit = new PrijavaIzpit();
        prijavaIzpit.setCasPrijave(LocalDateTime.now());
        prijavaIzpit.setRok(rok);
        prijavaIzpit.setPredmetStudent(predmetStudent);
        prijavaIzpit.setCena(cena);

        try {
            userTransaction.begin();
            em.persist(prijavaIzpit);
            userTransaction.commit();
        } catch (NotSupportedException e) {
            e.printStackTrace();
        } catch (SystemException e) {
            e.printStackTrace();
        } catch (HeuristicMixedException e) {
            e.printStackTrace();
        } catch (HeuristicRollbackException e) {
            e.printStackTrace();
        } catch (RollbackException e) {
            e.printStackTrace();
        }
    }

    private PredmetStudent getPredmetStudent(PrijavniPodatkiIzpit prijavniPodatkiIzpit) {
        VpisId vpis = new VpisId();
        vpis.setStudent(prijavniPodatkiIzpit.getStudent());
        vpis.setStudijskoLeto(prijavniPodatkiIzpit.getStudijskoLeto());

        PredmetStudentId id = new PredmetStudentId();
        id.setPredmet(prijavniPodatkiIzpit.getPredmet());
        id.setVpis(vpis);

        return em.find(PredmetStudent.class, id);
    }

    public List<IzpitniRok> vrniRokeZaPredmet(int sifraPredmeta) {
        return em.createNamedQuery("entities.izpit.IzpitniRok.vrniIzpitneRokeZaPredmet", IzpitniRok.class)
                .setParameter("sifraPredmeta", sifraPredmeta)
                .getResultList();
    }

    public int vrniSteviloVsehPolaganjPredmetaZaStudenta(int studentId, int sifraPredmeta) {
        return em.createNamedQuery("entities.izpit.Izpit.vrniSteviloVsehPolaganj", Izpit.class)
                .setParameter("sifraPredmeta", sifraPredmeta)
                .setParameter("studentId", studentId)
                .getResultList().size();
    }

    public Izpit vrniIzpitZaLeto(int sifraPredmeta, int studentId, int studijskoLeto) {
        return em.createNamedQuery("entities.izpit.Izpit.vrniIzpitZaLeto", Izpit.class)
                 .setParameter("sifraPredmeta", sifraPredmeta)
                 .setParameter("studentId", studentId)
                 .setParameter("studijskoLeto", studijskoLeto)
                 .getSingleResult();
    }

    public PrijavaIzpit vrniZadnjoPrijavoZaPredmet(int sifraPredmeta, int studentId) {
        return em.createNamedQuery("entities.izpit.PrijavaIzpit.vrniZadnjoPrijavo", PrijavaIzpit.class)
                 .setParameter("sifraPredmeta", sifraPredmeta)
                 .setParameter("studentId", studentId)
                 .getSingleResult();
    }

//    public void returnApplication(PrijavniPodatki prijavniPodatki) throws Exception {
//
//        IzpitniRok izpitniRok = odjava.getPrijavaIzpit().getRok();
//        em.refresh(izpitniRok);
//
//        LocalDateTime lastValidDate = izpitniRok
//                .getDatumCasIzvajanja()
//                .minusDays(2)
//                .withHour(23)
//                .withMinute(59)
//                .withSecond(0);
//
//        if (lastValidDate.isBefore(LocalDateTime.now())) {
//            throw new Exception("");
//        }
//
//        OdjavaIzpit odjavaIzpit = new OdjavaIzpit();
//        odjavaIzpit.setCasOdjave(LocalDateTime.now());
//        odjavaIzpit.setOdjavitelj(odjava.getOdjavitelj());
//        odjavaIzpit.setPrijavaIzpit(odjava.getPrijavaIzpit());
//
//        em.persist(odjavaIzpit);
//        em.refresh(odjavaIzpit);
//
//        logger.info("Označujem prijavo kot brisano...");
//        PrijavaIzpit prijavaIzpit = odjavaIzpit.getPrijavaIzpit();
//        prijavaIzpit.setBrisana(true);
//
//        em.persist(prijavaIzpit);
//        logger.info("Prijava uspešno vrnjena");
//    }

//    public boolean vrniPrijavoZaPredmet(int sifraPredmeta, int studentId, int studijskoLeto) {
//        logger.info("Vracanje prijave");
//
//        PrijavaIzpit prijavaIzpit =  em.createNamedQuery("entities.izpit.PrijavaIzpit.vrniPrijavo", PrijavaIzpit.class)
//                 .setParameter("sifraPredmeta", sifraPredmeta)
//                 .setParameter("studentId", studentId)
//                 .setParameter("studijskoLeto", studijskoLeto)
//                 .getSingleResult();
//
//        if (prijavaIzpit == null) return false;
//
//        long casIzvajanjaIzpita = prijavaIzpit.getRok().getDatumCasIzvajanja().atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
//        long trenutniCas = System.currentTimeMillis();
//        if (trenutniCas + 24 * 60 * 60 * 1000 >= casIzvajanjaIzpita) return false;
//        prijavaIzpit.setBrisana(true);
//        em.merge(prijavaIzpit);
//        OdjavaIzpit odjavaIzpit = new OdjavaIzpit();
//        odjavaIzpit.setCasOdjave(LocalDateTime.now());
//        odjavaIzpit.setPrijavaIzpit(prijavaIzpit);
//        odjavaIzpit.setOdjavitelj(prijavaIzpit.getPredmetStudent().getVpis().getStudent());
//        em.merge(odjavaIzpit);
//        return true;
//    }

    public List<Student> vrniPrijavljeneStudente(int sifraPredmeta, int studentId, int studijskoLeto) {
        return   em.createNamedQuery("entities.izpit.Izpit.vrniPrijavljeneStudente", Student.class)
                                       .setParameter("sifraPredmeta", sifraPredmeta)
                                       .setParameter("studijskoLeto", studijskoLeto)
                                       .getResultList();
    }
}
