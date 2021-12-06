defmodule RabbitExample.Producer do

  # def send_message(message) do

  #   {:ok, conn} = AMQP.Connection.open("amqp://admin:password@localhost:5672")
  #   {:ok, channel} = AMQP.Channel.open(conn)
  #   AMQP.Queue.declare(channel, "my_queue", durable: true)

  #   Enum.each(1..5000, fn i ->
  #     AMQP.Basic.publish(channel, "", "my_queue", "#{i}")
  #   end)
  #   # AMQP.Connection.close(conn)
  # end
  # RabbitExample.Producer.send_message("my_queue", "my_message")
  def send_message(queue, message) do

    {:ok, chan} = AMQP.Application.get_channel(:mychan)
    :ok = AMQP.Basic.publish(chan, "", queue, message)

  end
end
