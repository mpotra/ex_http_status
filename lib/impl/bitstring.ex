defimpl HttpStatus, for: BitString do
  use HttpStatus.Builder, from: :string, to: :code, as: :to_code

  @spec to_atom(binary()) :: atom()
  def to_atom(status), do: status |> to_code() |> @protocol.to_atom()

  @spec to_string(binary()) :: String.t()
  def to_string(status), do: status
end
