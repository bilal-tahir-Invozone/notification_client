defmodule NotificationClient.GraphQL.Schema do

  use Absinthe.Schema

  alias NotificationClient.ListNotifs

  alias NotificationClient.Client

  object :notifs do

    field :description, :string
    field :status, :boolean
    field :sender, :string
    field :receiver, :string
    field :on_react, :string

  end

  object :get_comments do

    field :description, :string
    field :status, :boolean
    field :sender, :string
    field :receiver, :string
    field :on_react, :string

  end

  query do
    field :get_comments, list_of(:get_comments) do
      resolve fn(_arg, _context) ->
        comments = "helo"
        {:ok, comments}
      end
    end
  end

  mutation do

    field :notification, :notifs do
      arg :title, non_null(:string)
      arg :type, non_null(:string)
      arg :sender, non_null(:string)
      arg :receiver, non_null(:string)
      arg :on_react, :string, default_value: " "
      arg :group, :string, default_value: " "
      arg :postnumber, :string, default_value: " "

      resolve fn(%{title: title, type: type, sender: sender, receiver: receiver, on_react: onReact, group: group, postnumber: postnumber}, _context) ->

        description = NotificationClient.ListNotifs.check_noti(title,sender, onReact, group, postnumber)
        {:ok , result} = NotificationClient.Client.get_notification( title, type, sender, receiver, onReact, group, postnumber)
        case result do
          [] ->
            {:ok, %{description: description, status: false, sender: sender, receiver: receiver, on_react: onReact }}
          _ ->
            {:ok, %{description: description, status: true, sender: sender, receiver: receiver, on_react: onReact }}
        end
      end
    end
  end
end
