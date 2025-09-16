from odoo import models, fields, api
import logging
_logger = logging.getLogger(__name__)

class SaleOrder(models.Model):
    _inherit = "sale.order"

    cod_required = fields.Boolean(default=False)
    cod_status = fields.Selection([
        ("pending", "Pending"),
        ("confirmed", "Confirmed"),
        ("failed", "Failed"),
    ], default="pending")
    cod_phone = fields.Char("COD Phone")
    cod_attempts = fields.Integer(default=0)

    def action_cod_request(self):
        for order in self:
            if not order.cod_phone:
                raise ValueError("COD phone required")
            order.write({
                "cod_status": "pending",
                "cod_attempts": order.cod_attempts + 1
            })
            _logger.info(f"COD request sent for {order.name}")

    def action_cod_confirm(self):
        self.write({"cod_status": "confirmed"})

