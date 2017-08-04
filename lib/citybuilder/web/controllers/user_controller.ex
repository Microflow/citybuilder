defmodule Citybuilder.Web.UserController do
  use Citybuilder.Web, :controller

  alias Citybuilder.Auths

  def index(conn, _params) do
    users = Auths.list_users()
    render(conn, "index.html", users: users)
  end

  def new(conn, _params) do
    changeset = Auths.change_user(%Citybuilder.Auths.User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Auths.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome! Happy writing :)")
        |> redirect(to: "/users/signin")
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def signin(conn, _params) do
    render(conn, "signin.html")
  end

#   def show(conn, %{"id" => id}) do
#     user = Auths.get_user!(id)
#     render(conn, "show.html", user: user)
#   end

#   def edit(conn, %{"id" => id}) do
#     user = Auths.get_user!(id)
#     changeset = Auths.change_user(user)
#     render(conn, "edit.html", user: user, changeset: changeset)
#   end

#   def update(conn, %{"id" => id, "user" => user_params}) do
#     user = Auths.get_user!(id)

#     case Auths.update_user(user, user_params) do
#       {:ok, user} ->
#         conn
#         |> put_flash(:info, "User updated successfully.")
#         |> redirect(to: user_path(conn, :show, user))
#       {:error, %Ecto.Changeset{} = changeset} ->
#         render(conn, "edit.html", user: user, changeset: changeset)
#     end
#   end

#   def delete(conn, %{"id" => id}) do
#     user = Auths.get_user!(id)
#     {:ok, _user} = Auths.delete_user(user)

#     conn
#     |> put_flash(:info, "User deleted successfully.")
#     |> redirect(to: user_path(conn, :index))
#   end
end
