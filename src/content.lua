ngx.log(ngx.NOTICE, "Content phase")

ngx.say('Hello,world! '..ngx.header['pid'])