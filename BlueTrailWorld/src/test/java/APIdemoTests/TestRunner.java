package APIdemoTests;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class TestRunner {

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] { "json" }, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"),
                "BlueTrailWorld");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }

    @Test
    public void testParallel() {
        Results results = Runner.path("classpath:APIdemoTests")
                .tags("~@skipme")
                .outputCucumberJson(true)
                .parallel(6);
        generateReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}

// Code for junit4
// package APIdemoTests;
//
// import org.junit.BeforeClass;
// import org.junit.runner.RunWith;
//
// import com.intuit.karate.junit4.Karate;
//
// @RunWith(Karate.class)
// public class TestRunner {
//
//// @BeforeClass
//// public static void before() {
//// //System.setProperty("karate.env", "qa");
//// }
//
// }
