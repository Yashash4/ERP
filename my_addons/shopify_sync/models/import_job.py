from odoo import models, api
import logging
_logger = logging.getLogger(__name__)

class ShopifyImportJob(models.Model):
    _name = 'shopify.import.job'
    _description = 'Shopify Import Job'

    @api.model
    def cron_import(self):
        try:
            _logger.info('Shopify import tick')
        except Exception as e:
            _logger.exception('Shopify import failed: %s', e)

