// Import and register all your controllers from the importmap under controllers/*

import { application } from "./application"

// Import controllers
import RoleSelectController from "./role_select_controller"
import QuestionFormController from "./question_form_controller"

// Register controllers
application.register("role-select", RoleSelectController)
application.register("question-form", QuestionFormController) 