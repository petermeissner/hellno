
Testing:

- tested successfully with Windows (dev) and Ubuntu 14 LTS (stable, old)



- win_build: 	

    Your package hellno_0.2.0.tar.gz has been built (if working) and checked for Windows.
    Please check the log files and (if working) the binary package at:
    http://win-builder.r-project.org/9ng6AJ9AqGaT
    The files will be removed after roughly 72 hours.
    Installation time in seconds: 3
    Check time in seconds: 55
    Status: 1 NOTE
    R Under development (unstable) (2016-05-14 r70617)

    - -> The note complaints about a non-canonical link - I have changed that without another rebuild




- local Linux (Ubuntu 14.04.4 LTS):
    
    * using log directory ‘/home/peter/Dropbox/RPackages/hellno.Rcheck’
    * using R version 3.3.0 (2016-05-03)
    * using platform: x86_64-pc-linux-gnu (64-bit)
    * using session charset: UTF-8
    * using options ‘--no-manual --as-cran’
    
    ...

    R CMD check results
    0 errors | 0 warnings | 0 notes
    
    R CMD check succeeded
    
    
- Travis-CI Linux: https://travis-ci.org/petermeissner/hellno

    +R CMD check hellno_0.2.0.tar.gz --no-build-vignettes --no-manual --as-cran
    * using log directory ‘/home/travis/build/petermeissner/hellno/hellno.Rcheck’
    * using R version 3.2.5 (2016-04-14)
    * using platform: x86_64-pc-linux-gnu (64-bit)
    
    ...
    
    * checking top-level files ... NOTE
    Non-standard files/directories found at top level:
      ‘fig’ ‘pkg-build.sh’
      
    OK
    * DONE
    Status: 1 NOTE
    
    - --> The note complaints about non-standard files - but those should be excluded anyways and that note does not show up on WinBuild - os it should be a false positive.

    
