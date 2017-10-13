defmodule Citybuilder.Web.SessionController do
  use Citybuilder.Web, :controller
  # snip
  plug :scrub_params, "session" when action in ~w(create)


  def create(conn, %{"session" => %{"username" => username, "password" => password}}) do
    case Citybuilder.Session.authenticate(username, password) do
      {:ok, user} ->
        conn
        |> Guardian.Plug.sign_in(user)
        |> put_flash(:info, "Welcome to Citybuilder! You can click on Create Project now. Plz go ahead and build something awesome.  ") 
        |> redirect(to: "/")

      {:error, _err} ->
        conn
        |> put_flash(:info, "Sign Up failed. Try again.")
        |> redirect(to: "/users/signin")
    end
  end

  def unauthenticated(conn, params) do
    conn
    |> put_flash(:info, "Sorry! Sign Up failed.")
    |> redirect(to: "/")
  end

  def logout(conn, _params) do
    conn
    |> Guardian.Plug.sign_out
    |> put_flash(:info, "Logged out. CU later!")
    |> redirect(to: "/")
  end
end
