package APIdemoTests;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

public class TestRunner {
	
    @Test
    public void testParallel() {
        Results results = Runner.path("classpath:APIdemoTests").tags("~@skipme").parallel(6);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
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
