package vpis;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import sifranti.StudijskiProgram;
import vloge.Uporabnik;

@Entity
@Table(name = "kandidat")
@NamedQueries(value = {
        @NamedQuery(name = "entitete.vloge.Kandidat.vrniNajvisjoZaporednoVpisnoStevilko", query = "SELECT k FROM Kandidat k WHERE CONCAT(k.vpisnaStevilka, '') LIKE :vpisnaStevilka ORDER BY k.vpisnaStevilka DESC")
})
public class Kandidat extends Uporabnik {

    @Column(name = "vpisna_stevilka")
    private Integer vpisnaStevilka;

    @ManyToOne
    @JoinColumn(name = "studijski_program", referencedColumnName = "sifra_evs")
    private StudijskiProgram studijskiProgram;

    @Column(name = "izkoriscen")
    private boolean izkoriscen;

    public Integer getVpisnaStevilka() {
        return vpisnaStevilka;
    }

    public void setVpisnaStevilka(Integer vpisnaStevilka) {
        this.vpisnaStevilka = vpisnaStevilka;
    }

    public StudijskiProgram getStudijskiProgram() {
        return studijskiProgram;
    }

    public void setStudijskiProgram(StudijskiProgram studijskiProgram) {
        this.studijskiProgram = studijskiProgram;
    }

    public boolean isIzkoriscen() {
        return izkoriscen;
    }

    public void setIzkoriscen(boolean izkoriscen) {
        this.izkoriscen = izkoriscen;
    }
}
