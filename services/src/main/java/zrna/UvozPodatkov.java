package zrna;

import orodja.GeneratorPodatkov;
import sifranti.StudijskiProgram;
import vpis.Kandidat;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.*;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@ApplicationScoped
public class UvozPodatkov {

    private String ERROR_IMPORT = "./kandidati/napaka_uvoz.txt";
    private final static int IME_L = 30;
    private final static int PRIIMEK_L = 30;
    private final static int PROGRAM_L = 7;
    private final static int EMAIL_L = 60;
    private static final Logger logger = Logger.getLogger(UvozPodatkov.class.getName());

    @PersistenceContext(name = "studis")
    private static EntityManager em;

    @Inject
    private GeneratorPodatkov generator;

    @Inject
    private UserTransaction ux;

    private List<Kandidat> kandidati = new ArrayList<>();

    public List<Kandidat> parseFile(File file) {
        String ime, priimek, program, email;

        BufferedReader br;
        BufferedWriter out;
        try {
            br = new BufferedReader(new InputStreamReader(new FileInputStream(file), "UTF8"));
            out = new BufferedWriter(new FileWriter(ERROR_IMPORT));

            String line = null;

            br.mark(1);
            if (br.read() != 0xFEFF)
                br.reset();

            while (br.ready()) {
                line = br.readLine();
                int length = line.length();
                if (length == 0)
                    break;

                ime = line.substring(0, IME_L).trim();
                priimek = line.substring(IME_L, IME_L + PRIIMEK_L).trim();
                program = line.substring(IME_L + PRIIMEK_L, IME_L + PRIIMEK_L + PROGRAM_L);
                email = line.substring(IME_L + PRIIMEK_L + PROGRAM_L, length).trim();

                logger.info(Integer.toString(length));
                Kandidat k;
                if ((k = createKandidat(ime, priimek, program, email, out)) != null) {
                    kandidati.add(k);
                }
            }

            br.close();
            out.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return kandidati;
    }

    private Kandidat createKandidat(String ime, String priimek, String program, String email, BufferedWriter out) throws IOException {
        Kandidat k = new Kandidat();
        k.setIme(ime);
        k.setPriimek(priimek);
        k.setEmail(email);
        k.setGeslo(generator.generirajGeslo());
        k.setVpisnaStevilka(generator.generirajVpisnoStevilko());

        try {
            Integer sifra = Integer.parseInt(program);
            StudijskiProgram studijskiProgram = em.find(StudijskiProgram.class, sifra);
            if (studijskiProgram == null) {
                throw new NotSupportedException("Studijski program s sifro " + sifra.toString() + " ne obstaja.");
            }

            k.setStudijskiProgram(studijskiProgram);
            ux.begin();
            em.persist(k);
            ux.commit();
            return k;
        } catch (NumberFormatException | NotSupportedException | RollbackException | HeuristicRollbackException | HeuristicMixedException | SystemException e) {
            logger.log(Level.WARNING, e.getMessage());

            StringBuilder sb = new StringBuilder();
            String newIme = String.format("%-" + IME_L + "." + IME_L + "s", ime);
            String newPriimek = String.format("%-" + PRIIMEK_L + "." + PRIIMEK_L + "s", priimek);
            String newProgram = String.format("%-" + PROGRAM_L + "." + PROGRAM_L + "s", program);
            String newEmail = String.format("%-" + EMAIL_L + "." + EMAIL_L + "s", email);

            out.write(newIme + newPriimek + newProgram + newEmail);
            return null;
        }
    }
}