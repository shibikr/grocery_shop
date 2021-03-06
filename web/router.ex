defmodule Groceryshop.Router do
  use Groceryshop.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Groceryshop do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/products", ProductController
    resources "/buyers", BuyerController
    resources "/carts", CartController
    resources "/cart_details", CartDetailController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Groceryshop do
  #   pipe_through :api
  # end
end
