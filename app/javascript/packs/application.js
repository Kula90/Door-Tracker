// app/javascript/packs/application.js

// Main - CSS ===========================================\
// CSS - Global =========================================|
import "../stylesheets/application.css";
// CSS - Construction Site ==============================|
import "../stylesheets/construction_sites.css";
// CSS - Shared Forms ===================================|
import "../stylesheets/shared_forms.css";
// CSS - Deliveries and Door Installations ==============|
import "../stylesheets/deliveries_and_installations.css";
// CSS - Login ==========================================|
import "../stylesheets/login.scss";
// CSS - Password Reset =================================|
import "../stylesheets/password_reset.scss";
// CSS - Sign Up ========================================|
import "../stylesheets/sign_up.scss";
// CSS - Dropdown =======================================|
import "../stylesheets/dropdown.css";
//=======================================================/


// Modal ================================================\
// CSS - Modal ==========================================|
import "../stylesheets/modals.css";
// JS - Modal - Delete ==================================|
import './delete_modal';
// JS - Modal - Requested Deliveries ====================|
import './delete_modal_requested';
// JS - Modal - Delivered Deliveries ====================|
import './delete_modal_delivered';
// JS - Modal - Door Installations ======================|
import './delete_modal_door';
//=======================================================/


// Flash Messages =======================================\
import './flash_messages';
//=======================================================/


// Features =============================================\
// JS - Dropdown ========================================|
import './dropdown';
// JS - Accordian =======================================|
import './accordion';
//=======================================================/


import { Turbo } from "@hotwired/turbo-rails";
import Rails from "@rails/ujs";
import * as ActiveStorage from "@rails/activestorage";

if (!window.Rails) {
  Rails.start();
  window.Rails = Rails;
}

if (!window.Turbo) {
  Turbo.start();
  window.Turbo = Turbo;
}

ActiveStorage.start();
import "core-js/stable";
import "regenerator-runtime/runtime";
