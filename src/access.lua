local amqp = require("amqp")

-- Import the AMQP Client Library
local amqp = require("amqp")

-- Define the connection URL and Port 
local host = "192.168.15.10"
local port = 5672

function listen()

  --  local inspect = require('inspect')

    -- Connect to AMQP server
    local ctxc = amqp:new({
        role = 'consumer',
        exchange = '',
        queue = 'test',
        ssl = false,
        user = 'guest',
        password = 'guest',
        no_ack = true,
        durable = true,
        auto_delete = false,
        consumer_tag = '',
        exclusive = false,
        properties = {}
    })
    local ok, err = ctxc:connect(host, port)

    -- Define a callback for consumer
    ctxc.opts.callback = function(f)
      --  print(inspect(f))
        ctxc:teardown()
        ctxc:close()
    end

    -- Start consume loop
    ok, err = ctxc:consume()
end





-- Pepare to connect to AMQP server
local ctx = amqp:new({
    role = 'producer',
    exchange = '',
    routing_key = 'xpto',
    ssl = false,
    user = 'guest',
    password = 'guest'
})
local ok, err = ctx:connect(host, port)
print("Connection Created:", ok, "Errors:", err)

local ok, err = ctx:setup()
print("Connection setup:", ok, "Errors:", err)

local ok3, err3 = ctx:publish("Hello world!")
print("Publish:", ok3, "Errors:", err3)

listen()

