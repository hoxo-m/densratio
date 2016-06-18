context("uLSIF")

test_that("uLSIF", {
  set.seed(3)
  x <- rnorm(200, mean = 1, sd = 1/8)
  y <- rnorm(200, mean = 1, sd = 1/2)

  result <- uLSIF(x, y)

  alpha <- result$alpha
  sigma <- result$kernel_info$sigma
  lambda <- result$lambda

  expected_alpha <- c(0.404438506887284, 0.0479292203749822, 0.173606157877619, 0.125042526178644, 0.0597270012073941, 0.0966603261118248, 0.272404529705359, 0.287981057489667, 0.260610049757097, 0.106278157430805, 0.0829840080770411, 0.298178274456792, 0.510772998165055, 0.469607333880889, 0.314439002127609, 0.278337795855529, 0.331619241264206, 0.170054318854631, 0.205321130356657, 0.293778700956746, 0.270357021760922, 0.0552664460251111, 0.13196964979648, 0.363769875598833, 0.184256996291219, 0.137609652667155, 0.0847578696859158, 0.32005635102062, 0.219732410235939, 0.0997501176563409, 0.393489228923113, 0.357370823360959, 0.0806127510373266, 0.529227340304734, 0.059810696530967, 0.265310896954757, 0.260129661912768, 0.388001725321486, 0.0904385083880115, 0.218070452341649, 0.304531086885202, 0.341133344752911, 0.0877919626863925, 0.352734725618458, 0.18136671171543, 0.177269236897875, 0.286441936811215, 0.220534272633438, 0.0992526984070236, 0.204229708925053, 0.0965890394815905, 0.407103026497329, 0.529665294272533, 0.321732919141618, 0.117322516640944, 0.393949947111409, 0.376943564537773, 0.204873269244207, 0.195954074621517, 0.332356529428754, 0.19981155997285, 0.269049244357359, 0.306328967063322, 0.310666908293517, 0.147463574143442, 0.139386856654683, 0.31845158811646, 0.0535958181690033, 0.125694986863042, 0.247982186906922, 0.398899193256485, 0.271780379232907, 0.386773644350962, 0.405061241567732, 0.230749178740476, 0.379691967500355, 0.14822498635532, 0.398130683107783, 0.139329664337998, 0.240384893331041, 0.17581211444761, 0.0724416717597075, 0.334560609246938, 0.234046251185158, 0.523607632955095, 0.35709470884419, 0.130887248859899, 0.265689337117447, 0.379551225111785, 0.158379575619727, 0.404091364188986, 0.380222303793605, 0.0646382327573607, 0.340377888030049, 0.40542478984169, 0.320660496561861, 0.108071578735585, 0.258826598567493, 0.169361948873109, 0.196116462197673)

  expect_equal(alpha, expected_alpha)
  expect_equal(sigma, 0.1)
  expect_equal(lambda, 0.1)
})