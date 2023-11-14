# HttpStatus

`HttpStatus` is an Elixir protocol that allows you to convert HTTP status values from one type to another.

It is currently implemented for `Integer`, `String` (BitString) and `Atom`

Documentation can be found on [HexDocs](https://hexdocs.pm/ex_http_status)

## Installation

The package can be installed via [Hex](https://hex.pm)
by adding `ex_http_status` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_http_status, "~> 0.1.0"}
  ]
end
```

## Usage

#### From a string or integer, to an atom

```elixir
iex> HttpStatus.to_atom(200)
:ok

iex> HttpStatus.to_atom(404)
:not_found

iex> HttpStatus.to_atom("OK")
:ok

iex> HttpStatus.to_atom("Not Found")
:not_found
```

#### From an atom or string, to integer code

```elixir
iex> HttpStatus.to_code(:ok)
200

iex> HttpStatus.to_code(:not_found)
404

iex> HttpStatus.to_code("OK")
200

iex> HttpStatus.to_code("Not Found")
404
```

#### From an integer or atom, to string

```elixir
iex> HttpStatus.to_string(200)
"OK"

iex> HttpStatus.to_string(404)
"Not Found"

iex> HttpStatus.to_string(:ok)
"OK"

iex> HttpStatus.to_string(:not_found)
"Not Found"
```

License: MIT

