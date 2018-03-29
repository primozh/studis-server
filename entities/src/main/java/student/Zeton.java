package student;

import sifranti.*;
import vloge.Student;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "zeton")
public class Zeton {

    @EmbeddedId
    private ZetonId zetonId;

    @ManyToOne
    @JoinColumn(name = "studijski_program")
    private StudijskiProgram studijskiProgram;

    @ManyToOne
    @JoinColumn(name = "letnik")
    private Letnik letnik;

    @ManyToOne
    @JoinColumn(name = "studijsko_leto")
    private StudijskoLeto studijskoLeto;

    @ManyToOne
    @JoinColumn(name = "nacin_studija")
    private NacinStudija nacinStudija;

    @ManyToOne
    @JoinColumn(name = "oblika_studija")
    private OblikaStudija oblikaStudija;

    @Column(name = "prosta_izbira")
    private boolean prostaIzbira;

    @Column(name = "izkoriscen")
    private boolean izkoriscen;

    public ZetonId getZetonId() {
        return zetonId;
    }

    public void setZetonId(ZetonId zetonId) {
        this.zetonId = zetonId;
    }

    public StudijskiProgram getStudijskiProgram() {
        return studijskiProgram;
    }

    public void setStudijskiProgram(StudijskiProgram studijskiProgram) {
        this.studijskiProgram = studijskiProgram;
    }

    public Letnik getLetnik() {
        return letnik;
    }

    public void setLetnik(Letnik letnik) {
        this.letnik = letnik;
    }

    public StudijskoLeto getStudijskoLeto() {
        return studijskoLeto;
    }

    public void setStudijskoLeto(StudijskoLeto studijskoLeto) {
        this.studijskoLeto = studijskoLeto;
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

    public boolean isProstaIzbira() {
        return prostaIzbira;
    }

    public void setProstaIzbira(boolean prostaIzbira) {
        this.prostaIzbira = prostaIzbira;
    }

    public boolean isIzkoriscen() {
        return izkoriscen;
    }

    public void setIzkoriscen(boolean izkoriscen) {
        this.izkoriscen = izkoriscen;
    }
}


@Embeddable
class ZetonId implements Serializable {

    @Column(name = "student")
    private Integer student;

    @Column(name = "vrsta_vpisa")
    private Integer vrstaVpisa;

    public Integer getStudent() {
        return student;
    }

    public void setStudent(Integer student) {
        this.student = student;
    }

    public Integer getVrstaVpisa() {
        return vrstaVpisa;
    }

    public void setVrstaVpisa(Integer vrstaVpisa) {
        this.vrstaVpisa = vrstaVpisa;
    }
}
