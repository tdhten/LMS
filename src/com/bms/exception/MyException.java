package com.bms.exception;

/**  
* @ClassName: UserException  
* @Description: 用户业务异常
*/
public class MyException extends Exception{

	private static final long serialVersionUID = 1L;

	public MyException() {
		super();
	}

	public MyException(String message, Throwable cause) {
		super(message, cause);
	}

	public MyException(String message) {
		super(message);
	}

	public MyException(Throwable cause) {
		super(cause);
	}
}


