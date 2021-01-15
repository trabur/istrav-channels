defmodule DemoWeb.VehiclesChannel do
  use Phoenix.Channel

  def join("vehicles:lobby", _payload, socket) do
    {:ok, socket}
  end
  # for example "room:12", "room:34"
  def join("vehicles:" <> _private_room_id, _params, socket) do
    {:ok, socket}
  end

  def chan() do
    {:ok, conn} = AMQP.Connection.open("amqp://eogqfdef:Z7sQOuxd2cRIogSBgD0TZtMXfMjUY5og@owl.rmq.cloudamqp.com/eogqfdef")
    {:ok, chan} = AMQP.Channel.open(conn)
    _chan = chan
  end

  ########
  # vehicles
  ########
  def handle_in("allVehicles", %{"respondIn" => respondIn, "message" => message}, socket) do
    AMQP.Queue.declare(chan(), "allVehiclesQueue")
    AMQP.Exchange.declare(chan(), "allVehiclesExchange")
    AMQP.Queue.bind(chan(), "allVehiclesQueue", "allVehiclesExchange")

    {:ok, payload} = JSON.encode(%{ respondIn: respondIn, message: message })
    AMQP.Basic.publish(chan(), "allVehiclesExchange", "", payload)
    {:noreply, socket}
  end
  def handle_in("vehicleById", %{"respondIn" => respondIn, "message" => message}, socket) do
    AMQP.Queue.declare(chan(), "vehicleByIdQueue")
    AMQP.Exchange.declare(chan(), "vehicleByIdExchange")
    AMQP.Queue.bind(chan(), "vehicleByIdQueue", "vehicleByIdExchange")

    {:ok, payload} = JSON.encode(%{ respondIn: respondIn, message: message })
    AMQP.Basic.publish(chan(), "vehicleByIdExchange", "", payload)
    {:noreply, socket}
  end
  def handle_in("saveVehicle", %{"respondIn" => respondIn, "message" => message}, socket) do
    AMQP.Queue.declare(chan(), "saveVehicleQueue")
    AMQP.Exchange.declare(chan(), "saveVehicleExchange")
    AMQP.Queue.bind(chan(), "saveVehicleQueue", "saveVehicleExchange")

    {:ok, payload} = JSON.encode(%{ respondIn: respondIn, message: message })
    AMQP.Basic.publish(chan(), "saveVehicleExchange", "", payload)
    {:noreply, socket}
  end
  def handle_in("updateVehicle", %{"respondIn" => respondIn, "message" => message}, socket) do
    AMQP.Queue.declare(chan(), "updateVehicleQueue")
    AMQP.Exchange.declare(chan(), "updateVehicleExchange")
    AMQP.Queue.bind(chan(), "updateVehicleQueue", "updateVehicleExchange")

    {:ok, payload} = JSON.encode(%{ respondIn: respondIn, message: message })
    AMQP.Basic.publish(chan(), "updateVehicleExchange", "", payload)
    {:noreply, socket}
  end
  def handle_in("deleteVehicle", %{"respondIn" => respondIn, "message" => message}, socket) do
    AMQP.Queue.declare(chan(), "deleteVehicleueue")
    AMQP.Exchange.declare(chan(), "deleteVehicleExchange")
    AMQP.Queue.bind(chan(), "deleteVehicleueue", "deleteVehicleExchange")

    {:ok, payload} = JSON.encode(%{ respondIn: respondIn, message: message })
    AMQP.Basic.publish(chan(), "deleteVehicleExchange", "", payload)
    {:noreply, socket}
  end
end
