defmodule Citybuilder.Web.Controller.Helpers do
  def format_datetime(datetime) do
    datetime
    |> DateTime.from_naive!("Etc/UTC")
    # format sample: May 26, 2:32pm, 2017
    # formatters: https://github.com/bitwalker/timex/blob/master/lib/format/datetime/formatters/default.ex
    |> Timex.format!("{Mfull} {D}, {h12}:{m}{am}, {YYYY}")
  end

  def can_modify?(nil, _comment), do: false
  def can_modify?(user, comment) do
    user.admin ||
    user.moderator ||
    (user.id == comment.user_id)
  end
end
