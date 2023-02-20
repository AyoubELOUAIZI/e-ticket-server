import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();



const createAccount = async (data) => {
    return await prisma.account.create({ data });
};

const getAccountById = async (id) => {
    return await prisma.account.findUnique({
        where: { account_id: parseInt(id) },
        include: {
            Admin: true,
            Notifications: true,
            Organizer: true,
        }
    });
};

const getAccountByEmail = async (email) => {
    return await prisma.account.findUnique({
        where: { email }
    });
};

const loginToAccount = async (email, password) => {
    if (!email || !password) {
        throw new Error('Both email and password are required');
    }

    const account = await prisma.account.findUnique({
        where: { email },
        select: { account_id: true, password: true }
    });

    if (!account || account.password !== password) {
        throw new Error('Incorrect email or password');
    }

    return account.account_id;
};

const updateAccount = async (id, updates) => {
    return await prisma.account.update({
        where: { account_id: parseInt(id) },
        data: updates
    });
};

const deleteAccount = async (id) => {
    return await prisma.account.delete({
        where: { account_id: parseInt(id) },
    });
};

const getAllAccounts = async () => {
    return await prisma.account.findMany({
        include: {
            Admin: true,
            Notifications: true,
            Organizer: true,
        }
    });
};

export default {
    createAccount,
    getAccountById,
    getAccountByEmail,
    updateAccount,
    deleteAccount,
    getAllAccounts,
    loginToAccount,
};
