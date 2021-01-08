local amqp = require("amqp")

-- Import the AMQP Client Library
local amqp = require("amqp")

-- Define the connection URL and Port 
local host = "jackal.rmq.cloudamqp.com/hsyhknbq"
local port = 5672

-- Pepare to connect to AMQP server
local ctx = amqp:new({
    role = 'producer',
    exchange = '',
    routing_key = 'xpto',
    ssl = false,
    user = 'hsyhknbq',
    password = 'X7yqd_FNDlGrBvCk1rqEac-lPacZVx4i'
})
local ok, err = ctx:connect(host, port)
print("Connection Created:", ok, "Errors:", err)

local ok, err = ctx:setup()
print("Connection setup:", ok, "Errors:", err)

local ok3, err3 = ctx:publish("Hello world!")