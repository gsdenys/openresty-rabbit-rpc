local uuid = require("uuid")
ngx.header["pid"] = uuid()

ngx.log(ngx.NOTICE, "Rewrite phase")