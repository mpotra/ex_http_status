defimpl HttpStatus, for: Atom do
  use HttpStatus.Builder, from: :atom, to: :code, as: :to_code
  @spec to_atom(atom()) :: atom()
  def to_atom(status), do: status

  @spec to_string(atom()) :: String.t()
  def to_string(status), do: status |> to_code() |> @protocol.to_string()
end
