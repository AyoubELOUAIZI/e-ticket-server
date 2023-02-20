import eventService from '../services/event.service.js';

const eventController = {

    getAllEvents: async (req, res) => {
        try {
            const events = await eventService.getAllEvents();
            res.status(200).json(events);
        } catch (err) {
            console.error(err);
            res.status(500).json({ error: 'Internal server error to get all event ' });
        }
    },

    createEvent: async (req, res) => {
        const eventData = req.body;
        try {
            const newEvent = await eventService.createEvent(eventData);
            res.json(newEvent);
        } catch (err) {
            console.error(err);
            res.status(500).json({ error: 'Failed to create event' });
        }
    },
    createManyEvent: async (req, res) => {
        const { EventsData } = req.body;
        try {
            const newEvents = await Promise.all(
                EventsData.map(Event =>
                    eventService.createEvent(Event)
                )
            );
            res.json(newEvents);
        } catch (err) {
            console.error(err);
            res.status(500).json({ error: 'Failed to create many Event' });
        }
    },


    getEventById: async (req, res) => {
        const eventId = Number(req.params.id);
        try {
            const event = await eventService.getEventById(eventId);
            if (event) {
                res.status(200).json(event);
            } else {
                res.status(404).json({ error: `Event with ID ${eventId} not found` });
            }
        } catch (err) {
            console.error(err);
            res.status(500).json({ error: 'Internal server error' });
        }
    },


    deleteEventById: async (req, res) => {
        const id = req.params.id;
        try {
            const deletedEvent = await eventService.deleteEventById(parseInt(id));
            if (deletedEvent) {
                res.json(deletedEvent);
            } else {
                res.status(404).json({ error: `Event with id ${id} not found` });
            }
        } catch (err) {
            console.error(err);
            res.status(500).json({ error: 'Internal server error' });
        }
    },


    updateEvent: async (req, res) => {
        const id = req.params.id;
        const eventData = req.body;

        try {
            const updatedEvent = await eventService.updateEvent(id, eventData);

            if (updatedEvent) {
                res.json(updatedEvent);
            } else {
                res.status(404).json({ error: `Event with id ${id} not found` });
            }
        } catch (err) {
            console.error(err);
            res.status(500).json({ error: 'Internal server error' });
        }
    },



    searchEvents: async (req, res) => {
        try {
            const keyword = req.query.keyword;
            const events = await eventService.searchEvents(keyword);
            res.status(200).json(events);
        } catch (error) {
            console.error(error);
            res.status(500).send('Internal Server Error ???');
        }
    },

};

export default eventController;




















// import {eventService} from '../services/event.service.js';

// export const createEvent = async (req, res) => {
//     try {
//         const {
//             org_id,
//             duration,
//             trailer_video_url,
//             description,
//             brand_url,
//             location,
//             start_time,
//             finish_time,
//             number_sold_tickets,
//             number_of_waiters,
//             max_number_attendants,
//             is_start_selling,
//             event_type,
//             is_review_enabled,
//             is_approved
//         } = req.body;

//         const newEvent = await eventService.createEvent(
//             org_id,
//             duration,
//             trailer_video_url,
//             description,
//             brand_url,
//             location,
//             start_time,
//             finish_time,
//             number_sold_tickets,
//             number_of_waiters,
//             max_number_attendants,
//             is_start_selling,
//             event_type,
//             is_review_enabled,
//             is_approved
//         );

//         res.status(200).json({ data: newEvent });
//     } catch (error) {
//         res.status(500).json({ error: error.message });
//     }
// };



// module.exports = {
//     createEvent,
// };





































// //1--Get all events
// const getAllevents = async (req, res) => {
//     try {
//         // Attempt to fetch all event documents from the database and sort them by the createdAt field in descending order
//         const events = await eventModel.find().sort({ createdAt: -1 });
//         // If the fetch is successful, return a response with a 200 status code and the events as the body
//         res.status(200).json(events);
//     } catch (error) {
//         // If an error occurs during the process, return a response with a 400 status code and the error message
//         res.status(400).json({ error: error.message });
//     }
// };


// //2--Get single event
// const getevent = async (req, res) => {
//     if (!mongoose.Types.ObjectId.isValid(req.params.id)) {
//         return res.status(400).json({ error: 'Invalid event id' });
//     }
//     try {
//         const event = await eventModel.findById(req.params.id);
//         if (!event) return res.status(404).json({ error: 'event not found' });
//         res.status(200).json(event);
//     } catch (error) {
//         res.status(400).json({ error: error.message });
//     }
// };


// //3--post a new event
// const createevent = async (req, res) => { // listen to post request on '/'

//     const { title, load, reps } = req.body // destructuring the request body to extract the title, load, and reps


//     let emptyFields = []

//     if (!title) {
//         emptyFields.push('title')
//     }
//     if (!load) {
//         emptyFields.push('load')
//     }
//     if (!reps) {
//         emptyFields.push('reps')
//     }
//     if (emptyFields.length > 0) {
//         return res.status(400).json({ error: 'Please fill in all fields', emptyFields })
//     }


//     //add doc to db
//     try {
//         const event = await eventModel.create({ title, load, reps }) // create new event using the destructured data //i did the change from event to eventModel
//         res.status(200).json(event) // send a json response with the created event
//     } catch (error) {
//         res.status(400).json({ error: error.message }) // if there is an error during the creation, send a json response with the error message
//     }
// }

// //4-- Delete event from the database
// const deleteevent = async (req, res) => {
//     if (!mongoose.Types.ObjectId.isValid(req.params.id)) {
//         return res.status(400).json({ error: 'Invalid event id' });
//     }
//     try {
//         const event = await eventModel.findByIdAndDelete(req.params.id);
//         if (!event) return res.status(404).json({ error: 'event not found' });
//         res.status(200).json({ message: 'event deleted successfully' });
//     } catch (error) {
//         res.status(400).json({ error: error.message });
//     }
// };


// //5-- Update event in the database
// const updateevent = async (req, res) => {
//     // Check if the event id passed in the request is a valid MongoDB ObjectId
//     if (!mongoose.Types.ObjectId.isValid(req.params.id)) {
//         // If it's not a valid id, return a response with a 400 status code and an error message
//         return res.status(400).json({ error: 'Invalid event id' });
//     }
//     try {
//         // Attempt to find and update the event document in the database using the id and data from the request
//         const event = await eventModel.findByIdAndUpdate(req.params.id, req.body, { new: true });
//         // If the event is not found, return a response with a 404 status code and an error message
//         if (!event) return res.status(404).json({ error: 'event not found' });
//         // If the update is successful, return a response with a 200 status code and the updated event as the body
//         res.status(200).json(event);
//     } catch (error) {
//         // If an error occurs during the process, return a response with a 400 status code and the error message
//         res.status(400).json({ error: error.message });
//     }
// };

// module.exports = {
//     getAllevents,
//     createEvent,
//     getevent,
//     deleteevent,
//     updateevent
// };