import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

const createOrganizer = async (data) => {
   return prisma.organizer.create({ data, });
};

const getOrganizerById = async (org_id) => {
    return prisma.organizer.findUnique({
        where: { org_id },
        include: {
            // Account: true,
            Events: true,
        }
    });
};

const getOrganizerByAcountId = async (account_id) => {
    return prisma.organizer.findUnique({
        where: { account_id: account_id },
    });
};

const getAllOrganizers = async () => {
    return prisma.organizer.findMany({
        include: {
            Events: true,
        }
    });
};


const deleteOrganizerById = async (id) => {
    return await prisma.organizer.delete({
        where: { org_id: id },
    });
};

const updateOrganizer = async (id, updates) => {
    return await prisma.organizer.update({
        where: { org_id: parseInt(id) },
        data: updates
    });
};

export default {
    createOrganizer,
    getOrganizerById,
    getOrganizerByAcountId,
    getAllOrganizers,
    deleteOrganizerById,
    updateOrganizer,
};
