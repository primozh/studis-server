package zrna;

import com.kumuluz.ee.rest.beans.QueryParameters;
import com.kumuluz.ee.rest.utils.JPAUtils;
import vloge.Student;

import javax.enterprise.context.ApplicationScoped;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;

@ApplicationScoped
public class StudentZrno {

    @PersistenceContext(name = "studis")
    private EntityManager em;

    public Student getStudent(Integer id) {
        return em.find(Student.class, id);
    }

    /***
     * Returns list of Students that match given criteria
     * @param queryParameters
     * @return
     */
    public List<Student> getStudenti(QueryParameters queryParameters) {
        return JPAUtils.queryEntities(em, Student.class, queryParameters);
    }

    @Transactional
    public void createStudent() {
        Student student = new Student("janez@novak.si", "12345", 63180001, "Janez", "Novak", new Date(),
                "070123123");
        em.persist(student);
    }
}