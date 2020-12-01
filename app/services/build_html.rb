class BuildHtml
	def self.params_check(*args)
		args[0] == args[0].to_i.to_s && !args[1].nil?
		end
	end