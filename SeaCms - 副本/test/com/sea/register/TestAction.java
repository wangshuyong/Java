package com.sea.register;

import static org.junit.Assert.*;

import org.junit.Test;

import com.sea.action.RegisterAction;

public class TestAction {

	@Test
	public void test() {
		RegisterAction ra = new RegisterAction();
		
		assertEquals("success", ra.excute());
	}

}
