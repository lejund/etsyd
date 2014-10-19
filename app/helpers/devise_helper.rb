module DeviseHelper
	def devise_error_messages!
		return '' if resource.errors.empty?

		messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg)}.join
		sentence = I18n.t('errors.messages.not_saved', count: resource.errors.count, resource: resource.class.model_name.human.downcase)

		html = <<-HTML
		<div class="alert alert-danger alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			<h4>#{sentence}</h4>
			#{messages}
		</div>
		HTML

		html.html_safe
	end

	def resource_name
  	:user
	end

	def resource
  	@resource ||= User.new
	end

	def devise_mapping
	@devise_mapping ||= Devise.mappings[:user]
	end

end

