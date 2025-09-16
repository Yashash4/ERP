from odoo import models, fields

class ShopifySettings(models.TransientModel):
    _name = 'shopify.settings'
    _inherit = 'res.config.settings'

    api_key = fields.Char()
    api_secret = fields.Char()
    shop_domain = fields.Char(help='yourstore.myshopify.com')
    access_token = fields.Char()

