# encoding: utf-8
class Plan < ActiveRecord::Base
	
	def type_title
		return ""
	end

	def general_description
		return ""
	end

end

class VisitsPlan < Plan

	def type_title
		return "Plan por cantidad de visitas"
	end

	def general_description
		return "Un plan ideal que le brinda la posibilidad de ofrecer todos los datos de tus cursos para lograr un mayor alcance."
	end

end

class RegistrationsPlan < Plan

	def type_title
		return "Plan por cantidad de inscripciones"
	end

	def general_description
		return "Un plan recomendado para aquellos que desean lograr un mayor alcance a cambio de un mayor control de sus datos.
El vitante del curso no podrá ver los datos sensibles como la dirección exacta del lugar del dictado del curso hasta el momento de inscripción."
	end

end