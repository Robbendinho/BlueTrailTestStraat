package APIdemoTests;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
	
	@Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }
}


























// Code for junit4
//package APIdemoTests;
//
//import org.junit.BeforeClass;
//import org.junit.runner.RunWith;
//
//import com.intuit.karate.junit4.Karate;
//
//@RunWith(Karate.class) 
//public class TestRunner {
//	
////	@BeforeClass
////	public static void before() {
////		//System.setProperty("karate.env", "qa");
////	}
//
//}
