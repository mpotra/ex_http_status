defprotocol HttpStatus do
  @moduledoc """
  HttpStatus protocol implemented for `Integer`, `BitString` (strings) and `Atom`
  """

  @doc """
  Converts a protocol implementation to a HTTP status represented as an atom value.

  Implemented for `Integer` and `BitString` (`String`)

  ## Examples

      iex> HttpStatus.to_atom(200)
      :ok

      iex> HttpStatus.to_atom(404)
      :not_found

      iex> HttpStatus.to_atom("OK")
      :ok

      iex> HttpStatus.to_atom("Not Found")
      :not_found
  """
  @spec to_atom(t()) :: atom()
  def to_atom(status)

  @doc """
  Converts a protocol implementation to a HTTP status represented as an integer value.

  Implemented for `Atom` and `BitString` (`String`)

  ## Examples

      iex> HttpStatus.to_code(:ok)
      200

      iex> HttpStatus.to_code(:not_found)
      404

      iex> HttpStatus.to_code("OK")
      200

      iex> HttpStatus.to_code("Not Found")
      404
  """
  @spec to_code(t()) :: pos_integer()
  def to_code(status)

  @doc """
  Converts a protocol implementation to a HTTP status represented as a `String` value.

  Implemented for `Atom` and `Integer`

  ## Examples

      iex> HttpStatus.to_string(200)
      "OK"

      iex> HttpStatus.to_string(404)
      "Not Found"

      iex> HttpStatus.to_string(:ok)
      "OK"

      iex> HttpStatus.to_string(:not_found)
      "Not Found"
  """
  @spec to_string(t()) :: String.t()
  def to_string(status)
end
