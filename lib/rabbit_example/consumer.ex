defmodule RabbitExample.Consumer do
  use Broadway

  alias Broadway.Message

  @spec start_link(any) :: :ignore | {:error, any} | {:ok, pid}
  def start_link(_opts) do
    Broadway.start_link(__MODULE__,
      name: MyBroadway,
      producer: [
        module: {BroadwayRabbitMQ.Producer,
          queue: "my_queue",
          connection: [
            host: "localhost",
            username: "admin",
            password: "password",
            port: "5672",
          ],
          qos: [
            prefetch_count: 50,
          ]
        },
        concurrency: 1
      ],
      processors: [
        default: [
          concurrency: 50
        ]
      ],
      batchers: [
        default: [
          batch_size: 10,
          batch_timeout: 1500,
          concurrency: 5
        ]
      ]
    )
  end


  @impl true
  def handle_message(_, message, _) do
    IO.inspect message
    # message
    # |> Message.update_data(fn data -> {data, String.to_integer(data) * 2} end)
  end

  @impl true
  def handle_batch(_, messages, _, _) do
    list = messages |> Enum.map(fn e -> e.data end)
    IO.inspect(list, label: "Got batch")
    messages
  end
end
