defmodule MedCms.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      MedCmsWeb.Telemetry,
      # Start the Ecto repository
      MedCms.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: MedCms.PubSub},
      # Start Finch
      {Finch, name: MedCms.Finch},
      # Start the Endpoint (http/https)
      MedCmsWeb.Endpoint
      # Start a worker by calling: MedCms.Worker.start_link(arg)
      # {MedCms.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MedCms.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MedCmsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
