defmodule HttpStatus.Builder do
  @moduledoc false

  defmacro __using__(options) when is_list(options) do
    fn_name = Keyword.get(options, :as)
    idx_from = option_to_symbol_idx(Keyword.get(options, :from))
    idx_to = option_to_symbol_idx(Keyword.get(options, :to))

    defs =
      Enum.map(symbols(), fn tuple ->
        param = elem(tuple, idx_from)
        value = elem(tuple, idx_to)

        quote do
          def unquote(fn_name)(unquote(param)), do: unquote(value)
        end
      end)

    quote do
      unquote(defs)
    end
  end

  @doc """
  Returns a list of tuples where each HTTP status is reppresented as
  `{numerical_value, string_value, atom_value}`
  """
  @spec symbols() :: list({code :: pos_integer(), string :: String.t(), atom :: atom()})
  def symbols() do
    [
      {100, "Continue", :continue},
      {101, "Switching Protocols", :switching_protocols},
      {102, "Processing", :processing},
      {103, "Early Hints", :early_hints},
      {200, "OK", :ok},
      {201, "Created", :created},
      {202, "Accepted", :accepted},
      {203, "Non-Authoritative Information", :non_authoritative_information},
      {204, "No Content", :no_content},
      {205, "Reset Content", :reset_content},
      {206, "Partial Content", :partial_content},
      {207, "Multi-Status", :multi_status},
      {208, "Already Reported", :already_reported},
      {226, "IM Used", :im_used},
      {300, "Multiple Choices", :multiple_choices},
      {301, "Moved Permanently", :moved_permanently},
      {302, "Found", :found},
      {303, "See Other", :see_other},
      {304, "Not Modified", :not_modified},
      {307, "Temporary Redirect", :temporary_redirect},
      {308, "Permanent Redirect", :permanent_redirect},
      {400, "Bad Request", :bad_request},
      {401, "Unauthorized", :unauthorized},
      {402, "Payment Required", :payment_required},
      {403, "Forbidden", :forbidden},
      {404, "Not Found", :not_found},
      {405, "Method Not Allowed", :method_not_allowed},
      {406, "Not Acceptable", :not_acceptable},
      {407, "Proxy Authentication Required", :proxy_authentication_required},
      {408, "Request Timeout", :request_timeout},
      {409, "Conflict", :conflict},
      {410, "Gone", :gone},
      {411, "Length Required", :length_required},
      {412, "Precondition Failed", :precondition_failed},
      {413, "Payload Too Large", :payload_too_large},
      {414, "URI Too Long", :uri_too_long},
      {415, "Unsupported Media Type", :unsupported_media_type},
      {416, "Range Not Satisfiable", :range_not_satisfiable},
      {417, "Expectation Failed", :expectation_failed},
      {418, "I'm a teapot", :im_a_teapot},
      {421, "Misdirected Request", :misdirected_request},
      {422, "Unprocessable Content", :unprocessable_content},
      {423, "Locked", :locked},
      {424, "Failed Dependency", :failed_dependency},
      {425, "Too Early", :too_early},
      {426, "Upgrade Required", :upgrade_required},
      {428, "Precondition Required", :precondition_required},
      {429, "Too Many Requests", :too_many_requests},
      {431, "Request Header Fields Too Large", :request_header_fields_too_large},
      {451, "Unavailable For Legal Reasons", :unavailable_for_legal_reasons},
      {500, "Internal Server Error", :internal_server_error},
      {501, "Not Implemented", :not_implemented},
      {502, "Bad Gateway", :bad_gateway},
      {503, "Service Unavailable", :service_unavailable},
      {504, "Gateway Timeout", :gateway_timeout},
      {505, "HTTP Version Not Supported", :http_version_not_supported},
      {506, "Variant Also Negotiates", :variant_also_negotiates},
      {507, "Insufficient Storage", :insufficient_storage},
      {508, "Loop Detected", :loop_detected},
      {510, "Not Extended", :not_extended},
      {511, "Network Authentication Required", :network_authentication_required}
    ]
  end

  defp option_to_symbol_idx(:atom), do: 2
  defp option_to_symbol_idx(:string), do: 1
  defp option_to_symbol_idx(:code), do: 0
end
