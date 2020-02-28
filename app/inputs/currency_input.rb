class CurrencyInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    wrapper_options[:type] = 'number'
    currency = options.delete(:currency) || default_currency
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
    content_tag(:div, input_group(currency, merged_input_options), class: "input-group")
  end

  private

  def input_group(currency, merged_input_options)
    "#{currency_addon(currency)} #{@builder.text_field(attribute_name, merged_input_options)}".html_safe
  end

  def currency_addon(currency)
    span = content_tag(:span, currency, class: "input-group-text")
    content_tag(:div, span, class: "input-group-prepend")
  end

  def default_currency
    "¥"
  end
end
