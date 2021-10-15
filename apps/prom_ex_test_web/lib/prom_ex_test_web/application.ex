defmodule PromExTestWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      PromExTestWeb.PromEx,
      # Start the Telemetry supervisor
      PromExTestWeb.Telemetry,
      # Start the Endpoint (http/https)
      PromExTestWeb.Endpoint
      # Start a worker by calling: PromExTestWeb.Worker.start_link(arg)
      # {PromExTestWeb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PromExTestWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PromExTestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
