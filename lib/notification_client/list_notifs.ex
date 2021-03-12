defmodule NotificationClient.ListNotifs do

  def check_noti(title, sender, postORcomment, group, postnumber) do

    action_map = %{

      "like" => "#{sender} liked your #{postORcomment}",
      "comment" => "#{sender} commented on your #{postORcomment}",
      "post" => "#{sender} your post has been posted successfully",
      "share" => "#{sender} shares your #{postORcomment}",
      "verification" => "#{sender} kindly confirm your email",
      "react" => "#{sender} reacted to your #{postORcomment}",
      "reply" => "#{sender} replied to your #{postORcomment}",
      "follow" => "#{sender} started following you",
      "request_follow" => "#{sender} has requested to follow you",
      "report" => "#{postnumber} posts Reported in #{group}"

    }
    action_map[title]


  end
end
