import org.hibernate.Query;
import org.hibernate.Session;

import com.sea.model.Classes;
import com.sea.model.School;
import com.sea.util.DBUtil;


public class TestMain {
//	Session session = null;

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		TestMain t =new TestMain();
		
//		t.deleteSchool(18);
//		t.loadSchool();
//		t.updateSchool();
		t.getSchool();
//		t.getClasses();
//		t.addSchool("≥Ø—Ù“ª÷–", "yizhong", 0);
//		t.addClass("class1");
		DBUtil.getSessionFactory().close();
	}
	
	private void addSchool(String u,String p,int po){
		Session session = DBUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		School s = new School();
		s.setSchoolName(u);
		s.setNickName(p);
		s.setType(po);
		session.save(s);
		session.getTransaction().commit();
	}
	
	private void addClass(String name){
		School s = new School();
		s.setSchoolName("test");
		Classes c = new Classes();
		c.setSchool(s);
		c.setClassName(name);
		s.getClasses().add(c);
		Session session = DBUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.save(s);
		session.save(c);
		session.getTransaction().commit();
	}
	
	private void loadSchool(){
		Session session = DBUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		School s =	(School)session.load(School.class,2);
		System.out.println(s.getId()+":"+s.getNickName());
		session.getTransaction().commit();
	}
	
	private void getSchool(){
		Session session = DBUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		School s =	(School)session.get(School.class,3);		
		session.getTransaction().commit();
		System.out.println(s.getId()+":"+s.getNickName());
	}
	
	private void getClasses(){
		Session session = DBUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Classes s =	(Classes)session.get(Classes.class,3);		
		session.getTransaction().commit();
		System.out.println(s.getId()+":"+s.getClassName());
	}
	
	private void updateSchool(){
		Session s2 = DBUtil.getSessionFactory().getCurrentSession();
		s2.beginTransaction();
		School s = (School)s2.load(School.class,3);
		s.setNickName("test");		
		s2.update(s);
		s2.getTransaction().commit();
	}
	
	private void deleteSchool(int id){
		Session s2 = DBUtil.getSessionFactory().getCurrentSession();
		s2.beginTransaction();
		School s = (School)s2.get(School.class,id);		
//		s2.delete(s);
		s2.getTransaction().commit();
		Session s1 = DBUtil.getSessionFactory().getCurrentSession();
		s1.beginTransaction();
		s1.delete(s);
		s1.getTransaction().commit();
	}
	
	private void updateSchoolByHQL(){
		Session session = DBUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Query q = session.createQuery("update User u set u.username='111' where u.id = 6");
		q.executeUpdate();
		session.getTransaction().commit();
	}

}
