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
import { verifyAdmin,   verifyOrganizerOrAdmin } from './middleware/authMiddleware.js';
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
app.use('/api/event-images',  eventImagesRoutes);
app.use('/api/event-reviews',  eventReviewRoutes);
app.use('/api/notifications',  notificationsRoutes);
app.use('/api/orders-cart',  ordersCartRoutes);
app.use('/api/organizers',   organizersRoutes);
app.use('/api/paid-tickets-orders',  paidTicketsOrdersRoutes);
app.use('/api/seat-categories',  seatCategoryRoutes);
app.use('/api/tickets', ticketRoutes);
app.use('/api/client-wait-lists',  clientWaitListRoutes);
app.use('/api/clients',  clientRoutes);
app.use('/api/admins',  adminRoutes);
app.use('/api/accounts',  accountRoutes);
app.use('/api/user', userRoutes);













app.get('/', (req, res) => {
  res.send('If you see this, you are the best person in the world! but go to /api instead :^)');
});


app.use(handleError);


const PORT = process.env.PORT || 8000;
app.listen(PORT, () => {
  console.log(`Application started on port ${PORT}!`);
});







// import express from 'express';
// import cors from 'cors';
// import bodyParser from 'body-parser';
// // import eventRoutes from './routes/event.routes.js';


// const app = express();

// app.use(express.json());
// app.use(cors());
// app.use(bodyParser.json());
// app.use(bodyParser.urlencoded({ extended: true }));

// // app.use('/api/events', eventRoutes);
// import { PrismaClient } from '@prisma/client';
// const prisma = new PrismaClient();


// app.post('/events', async (req, res) => {
//   console.log("\n\n\n\n--------------------------------")
//   console.log(req.body)
//   console.log("\n--------------------------------")
//   const {
//     org_id,
//     duration,
//     trailer_video_url,
//     description,
//     brand_url,
//     location,
//     start_time,
//     finish_time,
//     number_sold_tickets,
//     number_of_waiters,
//     max_number_attendants,
//     is_start_selling,
//     event_type,
//     is_review_enabled,
//     is_approved
//   } = req.body

//   try {
//     const newEvent = await prisma.event.create({
//       data: {
//         org_id,
//         duration,
//         trailer_video_url,
//         description,
//         brand_url,
//         location,
//         start_time,
//         finish_time,
//         number_sold_tickets,
//         number_of_waiters,
//         max_number_attendants,
//         is_start_selling,
//         event_type,
//         is_review_enabled,
//         is_approved
//       }
//     })
//     res.json(newEvent)
//   } catch (err) {
//     console.error(err)
//     res.status(500).json({ error: 'Failed to create event' })
//   }
// })



// // GET all events
// app.get('/events', async (req, res) => {
//   try {
//     const events = await prisma.event.findMany();
//     res.status(200).json(events);
//   } catch (err) {
//     console.error(err);
//     res.status(500).json({ error: 'Internal server error' });
//   }
// });

// //--------------------------------------------------------------------------//




// app.get('/', (req, res) => {
//   res.send('If you see this, you are the best person in the world! but go to /api instead :^)');
// });

// const PORT = process.env.PORT || 4000;
// app.listen(PORT, () => {
//   console.log(`Application started on port ${PORT}!`);
// });



//--------------------------------------------------------------------------//
//--------------------------------------------------------------------------//
//--------------------------------------------------------------------------//
// app.get('/events2', async (req, res) => {
//   const events = await prisma.event.findMany({
//     include: {
//       Event_Images: true,
//     },
//   });
//   res.json(events);
// });

// //--------------------------------------------------------------------------//

// // Define the endpoint to get an event with its associated records
// app.get('/events/:id', async (req, res) => {
//   // Get the event ID from the request parameters
//   const { id } = req.params;

//   try {
//     // Retrieve the event record with its associated records
//     const event = await prisma.event.findUnique({
//       where: { event_id: Number(id) },
//       include: {
//         Event_Images: true,
//         Event_Review: true,
//         SeatCategory: true,
//         Ticket: true,

//       }
//     });

//     // If the event record was found, return it with its associated records
//     if (event) {
//       res.status(200).json(event);
//     } else {
//       res.status(404).json({ message: 'Event not found' });
//     }
//   } catch (error) {
//     console.error(error);
//     res.status(500).json({ message: 'Server error' });
//   }
// });


// //--------------------------------------------------------------------------//

// app.post('/event_images', async (req, res) => {
//   const { event_id, img_url } = req.body

//   try {
//     const createdEventImage = await prisma.event_Images.create({
//       data: {
//         event_id,
//         img_url
//       }
//     })

//     res.json(createdEventImage)
//   } catch (error) {
//     res.json({ error: error.message })
//   }
// })
// //--------------------------------------------------------------------------//


// app.get('/event-images', async (req, res) => {
//   try {
//     const allEventImages = await prisma.event_Images.findMany();
//     res.json(allEventImages);
//   } catch (error) {
//     console.error(error);
//     res.status(500).json({ error: 'Unable to retrieve event images.' });
//   }
// });