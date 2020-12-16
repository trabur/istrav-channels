CHANNELS
========
## start
```bash
# run phoenix server
$ mix phx.server
```

## hosting
from gigalixir.com:
```bash
$ git remote add gigalixir https://travis.burandt%40gmail.com:d042f000-a2da-4e1f-bd8a-4612c63c5e8a@git.gigalixir.com/printedbasics.git
$ git push gigalixir master
```
> After a minute, visit https://printedbasics.gigalixirapp.com/


## init
bootstrap from phoenix website:
```bash
$ mix archive.install hex phx_new
$ mix phx.new demo --live
```

## demo

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
