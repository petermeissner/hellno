Package was rejected due to:

- usage of backticks for non standard English words --> used single quotes instead
- misspelled words --> all were corrected or escaped by single quotes
- non standard file at top level --> file was excluded from build

Furthermore, package was tested again on local Ubuntu 14.04.3 LTS machine --> successful with no warnings or notes 



Testing:

- tested successfully with Windows and Ubuntu 14 LTS 

- win_build: 	

    Your package hellno_0.0.1.tar.gz has been built (if working) and checked for Windows.
    Please check the log files and (if working) the binary package at:
    http://win-builder.r-project.org/Jaj22anCwyfw
    The files will be removed after roughly 72 hours.
    Installation time in seconds: 3
    Check time in seconds: 32
    Check result: OK
    R version 3.2.3 (2015-12-10)

- win_build:

    Your package hellno_0.0.1.tar.gz has been built (if working) and checked for Windows.
    Please check the log files and (if working) the binary package at:
    http://win-builder.r-project.org/M8Wq1JYBY4Ak
    The files will be removed after roughly 72 hours.
    Installation time in seconds: 2
    Check time in seconds: 29
    Check result: OK
    R Under development (unstable) (2015-12-13 r69768)

- Linux (Ubuntu 14.04.3 LTS):

    * using R version 3.2.3 (2015-12-10)
    * using platform: x86_64-pc-linux-gnu (64-bit)
    * using session charset: UTF-8
    * using option ‘--as-cran’
    ...
    Status: OK
