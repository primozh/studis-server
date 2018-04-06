package vpis;

import sifranti.*;
import vloge.Student;

import javax.persistence.*;

@Entity
@Table(name = "vpis")
@NamedQueries(value = {
        @NamedQuery(name = "entitete.vpis.Vpis.zadnjiVpisZaStudenta", query = "SELECT v FROM Vpis v WHERE v.student.id = :studentId" +
                " ORDER BY v.studijskoLeto.id DESC")
})
public class Vpis {

    @Id
    @ManyToOne
    @JoinColumn(name = "student")
    private Student student;

    @Id
    @ManyToOne
    @JoinColumn(name = "studijsko_leto")
    private StudijskoLeto studijskoLeto;

    @ManyToOne(targetEntity = StudijskiProgram.class)
    @JoinColumn(name = "studijski_program")
    private StudijskiProgram studijskiProgram;
    @ManyToOne(targetEntity = VrstaVpisa.class)
    @JoinColumn(name = "vrsta_vpisa", nullable = false)
    private VrstaVpisa vrstaVpisa;
    @ManyToOne(targetEntity = NacinStudija.class)
    @JoinColumn(name = "nacin_studija")
    private NacinStudija nacinStudija;

    @ManyToOne(targetEntity = OblikaStudija.class)
    @JoinColumn(name = "oblika_studija")
    private OblikaStudija oblikaStudija;
    @ManyToOne(targetEntity = Letnik.class)
    @JoinColumn(name = "letnik")
    private Letnik letnik;


    public Vpis() { }

    public Vpis(Student student, StudijskoLeto studijskoLeto, StudijskiProgram studijskiProgram, VrstaVpisa vrstaVpisa, NacinStudija nacinStudija, OblikaStudija oblikaStudija, Letnik letnik) {
        this.student = student;
        this.studijskoLeto = studijskoLeto;
        this.studijskiProgram = studijskiProgram;
        this.vrstaVpisa = vrstaVpisa;
        this.nacinStudija = nacinStudija;
        this.oblikaStudija = oblikaStudija;
        this.letnik = letnik;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student studentId) {
        this.student = studentId;
    }

    public StudijskoLeto getStudijskoLeto() {
        return studijskoLeto;
    }

    public void setStudijskoLeto(StudijskoLeto studijskoLetoId) {
        this.studijskoLeto = studijskoLetoId;
    }

    public StudijskiProgram getStudijskiProgram() {
        return studijskiProgram;
    }

    public void setStudijskiProgram(StudijskiProgram studijskiProgram) {
        this.studijskiProgram = studijskiProgram;
    }

    public VrstaVpisa getVrstaVpisa() {
        return vrstaVpisa;
    }

    public void setVrstaVpisa(VrstaVpisa vrstaVpisa) {
        this.vrstaVpisa = vrstaVpisa;
    }

    public NacinStudija getNacinStudija() {
        return nacinStudija;
    }

    public void setNacinStudija(NacinStudija nacinStudija) {
        this.nacinStudija = nacinStudija;
    }

    public OblikaStudija getOblikaStudija() {
        return oblikaStudija;
    }

    public void setOblikaStudija(OblikaStudija oblikaStudija) {
        this.oblikaStudija = oblikaStudija;
    }

    public Letnik getLetnik() {
        return letnik;
    }

    public void setLetnik(Letnik letnik) {
        this.letnik = letnik;
    }
}