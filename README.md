# RabbitExample

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `rabbit_example` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:rabbit_example, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/rabbit_example](https://hexdocs.pm/rabbit_example).


{:ok, conn} = AMQP.Connection.open("amqp://admin:password@localhost:5672")
{:ok, channel} = AMQP.Channel.open(conn)
AMQP.Queue.declare(channel, "my_queue", durable: true)

Enum.each(1..5000, fn i ->
  AMQP.Basic.publish(channel, "", "my_queue", "#{i}")
end)
AMQP.Connection.close(connection)


:ok = AMQP.Basic.publish(chan, "", "my_queue", "Hello")
https://itnext.io/using-broadway-and-rabbitmq-to-create-a-data-pipeline-in-elixir-900ddff57c7d
http://www.thinkingincrowd.me/2021/03/30/broadway-source-reading-entry-and-architecture/
https://akoutmos.com/post/broadway-rabbitmq-and-the-rise-of-elixir/
https://www.section.io/engineering-education/dockerize-a-rabbitmq-instance/
https://www.rabbitmq.com/tutorials/tutorial-one-elixir.html
https://woojiahao.github.io/blog/posts/open-source-deep-dive-broadway-part-2
https://dockyard.com/blog/2019/10/16/batching-for-operations-with-elixir-and-broadway
https://medium.com/@andreichernykh/elixir-a-few-things-about-genstage-id-wish-to-knew-some-time-ago-b826ca7d48ba
