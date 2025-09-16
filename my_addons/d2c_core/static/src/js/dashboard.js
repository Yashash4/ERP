/** @odoo-module */
import { registry } from "@web/core/registry";
import { Component } from "@odoo/owl";

class D2CDashboard extends Component {}
D2CDashboard.template = "d2c_core.Dashboard";

registry.category("actions").add("d2c_dashboard", D2CDashboard);

