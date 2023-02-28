import express from 'express';
import userController from '../controllers/user.controller.js';
import { verifyJwt } from '../middleware/authMiddleware.js';

const router = express.Router();

router.get('/profile',  userController.profile);
router.post('/register', userController.register);
router.post('/login', userController.login);
router.get('/logout',  userController.logout);

export default router;
