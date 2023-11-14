defimpl HttpStatus, for: Integer do
  use HttpStatus.Builder, from: :code, to: :atom, as: :to_atom
  use HttpStatus.Builder, from: :code, to: :string, as: :to_string

  @spec to_code(integer()) :: pos_integer()
  def to_code(status), do: status
end
