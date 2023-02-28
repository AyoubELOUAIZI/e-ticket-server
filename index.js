import express from 'express';
import cors from 'cors';
import bodyParser from 'body-parser';
import eventRoutes from './routes/event.routes.js';
import eventImagesRoutes from './routes/event-images.routes.js';
import eventReviewRoutes from './routes/event-reviews.routes.js';
import notificationsRoutes from './routes/notifications.routes.js';
import ordersCartRoutes from './routes/orders-cart.routes.js';
import organizersRoutes from './routes/organizers.routes.js';
import paidTicketsOrdersRoutes from './routes/paid-tickets-orders.routes.js';
import seatCategoryRoutes from './routes/seat-category.routes.js';
import ticketRoutes from './routes/ticket.routes.js';
import clientWaitListRoutes from './routes/client-wait-list.routes.js';
import clientRoutes from './routes/client.routes.js';
import adminRoutes from './routes/admin.routes.js';
import accountRoutes from './routes/account.routes.js';
import userRoutes from './routes/user.routes.js';
import cookieParser from 'cookie-parser'
import { handleError } from './middleware/errorHandlers.js';











const app = express();

app.use(express.json());

// Set up CORS options
const corsOptions = {
  origin: ['http://localhost:8001', 'http://localhost:300', 'http://localhost:3001',], // replace with your frontend app URL
  credentials: true, // allow cookies and other credentials
};

// Enable CORS middleware with options
app.use(cors(corsOptions));


app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cookieParser());


app.use('/api/events', eventRoutes);
app.use('/api/event-images', eventImagesRoutes);
app.use('/api/event-reviews', eventReviewRoutes);
app.use('/api/notifications', notificationsRoutes);
app.use('/api/orders-cart', ordersCartRoutes);
app.use('/api/organizers', organizersRoutes);
app.use('/api/paid-tickets-orders', paidTicketsOrdersRoutes);
app.use('/api/seat-categories', seatCategoryRoutes);
app.use('/api/tickets', ticketRoutes);
app.use('/api/client-wait-lists', clientWaitListRoutes);
app.use('/api/clients', clientRoutes);
app.use('/api/admins', adminRoutes);
app.use('/api/accounts', accountRoutes);
app.use('/api/user', userRoutes);


app.get('/', (req, res) => {
  res.send('If you see this, you are the best person in the world! but go to /api instead :^)');
});


app.use(handleError);


const PORT = process.env.PORT || 8000;
app.listen(PORT, () => {
  console.log(`Application started on port ${PORT}!`);
});
