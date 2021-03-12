
defmodule NotificationClient.Client do

  alias Notificationapi.Notification.Stub

  # 5. alias proto generated modules that were going to use
  alias Notificationapi.{

    GetNotificationRequest,
    GetNotificationResponse

  }

  @server_repo_url "localhost:8080"

  def get_notification(title, type, sender, receiver, onReact, group, postnumber) do

    with {:ok, channel} <- GRPC.Stub.connect(@server_repo_url),
         {:ok, %GetNotificationRequest{} = request} <- build_request_get_notification( title, type, sender, receiver, onReact, group, postnumber),

         {:ok, %GetNotificationResponse{} = data} <- Stub.get_notification(channel, request) do
        {:ok, data}
    end
  end

  defp build_request_get_notification( title, type, sender, receiver, onReact, group, postnumber) do
  {:ok,  GetNotificationRequest.new(title: title, type: type, sender: sender, receiver: receiver, onReact: onReact, group: group, postnumber: postnumber) }
  end

end
