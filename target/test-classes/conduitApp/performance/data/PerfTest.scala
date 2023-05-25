package performance

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._

class PerfTest extends Simulation {
  val protocol = karateProtocol(
    "/api/articles/{articleID}" -> Nil
  )

//   protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")
   //protocol.runner.karateEnv("perf")

  val createArticle = scenario("create and delete article").exec(karateFeature("classpath:conduitApp/performance/data/createArticle.feature"))

  setUp(
    createArticle.inject(
        atOnceUsers(1),
        nothingFor(4 seconds),
        constantUsersPerSec(1) during (10 seconds),
        constantUsersPerSec(2) during (10 seconds),
        rampUsersPerSec(2) to 10 during (20 seconds),
        nothingFor(5 seconds),
        constantUsersPerSec(1) during (10 seconds)
        )
        .protocols(protocol)
  )

}