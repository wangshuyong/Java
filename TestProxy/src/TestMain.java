import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Proxy;


public class TestMain {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Moveable tank = new Tank();
		InvocationHandler handel = new TankProxy(tank);
		Moveable t = (Moveable)Proxy.newProxyInstance(tank.getClass().getClassLoader(), tank.getClass().getInterfaces(), handel);
		t.move();
		t.stop();
	}

}
