from odoo import models, fields, api

class SaleOrder(models.Model):
    _inherit = "sale.order"

    cod_required = fields.Boolean(default=False)
    cod_status = fields.Selection([
        ("pending", "Pending Confirmation"),
        ("confirmed", "Confirmed"),
        ("failed", "Failed"),
    ], default="pending")

    def action_cod_request(self):
        for order in self:
            order.cod_status = "pending"

    def action_cod_confirm(self):
        self.write({"cod_status": "confirmed"})

