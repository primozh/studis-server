package sifranti;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "vrsta_vpisa")
public class VrstaVpisa {

    @Id
    private Integer sifraVpisa;
    private String vrstaVpisa;
}
