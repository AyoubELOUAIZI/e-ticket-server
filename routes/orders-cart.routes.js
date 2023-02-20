import express from 'express';
import ordersCartController from '../controllers/orders-cart.controller.js';

const router = express.Router();

router.post('/', ordersCartController.createOrder);
router.post('/many', ordersCartController.createManyOrder);
router.get('/', ordersCartController.getAllOrders);
router.get('/:orders_Cart_id', ordersCartController.getOrderById);
router.delete('/:id', ordersCartController.deleteOrdersCarttById);
router.put('/:order_id', ordersCartController.updateOrdersCart);

export default router;
