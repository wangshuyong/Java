import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;


public class TankProxy implements InvocationHandler{
	
	private Object target;

	public TankProxy(Object target) {
		super();
		this.target = target;
	}
	
	public void startLog(){
		System.out.println("Log starting...");
	}

	@Override
	public Object invoke(Object proxy, Method m, Object[] args)
			throws Throwable {
		startLog();
		m.invoke(target);
		endLog();
		return null;
	}

	private void endLog() {
		System.out.println("Log endding...");		
	}
     
}
