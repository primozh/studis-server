package sifranti;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "letnik")
public class Letnik {

    @Id
    private Integer letnik;

    public Integer getLetnik() {
        return letnik;
    }

    public void setLetnik(Integer letnik) {
        this.letnik = letnik;
    }
}
