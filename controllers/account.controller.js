import accountService from '../services/account.service.js';

const createAccount = async (req, res) => {
    const { email, password, account_type, avatar, phone_number } = req.body;

    try {
        const newAccount = await accountService.createAccount({ email, password, account_type, avatar, phone_number });
        res.json(newAccount);
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Failed to create account may check if email is unique .' });
    }
};

const createManyAccount = async (req, res) => {
    const { AccountsData } = req.body;
    try {
        const newAccounts = await Promise.all(
            AccountsData.map(Account =>
                accountService.createAccount(Account)
            )
        );
        res.json(newAccounts);
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Failed to create Accounts' });
    }
};

const getAccountById = async (req, res) => {
    const id = req.params.id;

    try {
        const account = await accountService.getAccountById(id);

        if (account) {
            res.json(account);
        } else {
            res.status(404).json({ error: `Account with id ${id} not found` });
        }
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Internal server error' });
    }
};

const updateAccount = async (req, res) => {
    const id = req.params.id;
    const data = req.body;

    try {
        const updatedAccount = await accountService.updateAccount(id, data);

        if (updatedAccount) {
            res.json(updatedAccount);
        } else {
            res.status(404).json({ error: `Account with id ${id} not found` });
        }
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Internal server error' });
    }
};



const deleteAccount = async (req, res) => {
    const id = req.params.id;

    try {
        const deletedAccount = await accountService.deleteAccount(id);

        if (deletedAccount) {
            res.json(deletedAccount);
        } else {
            res.status(404).json({ error: `Account with id ${id} not found` });
        }
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Internal server error' });
    }
};

const getAllAccounts = async (req, res) => {
    try {
        const accounts = await accountService.getAllAccounts();
        res.status(200).json(accounts);
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Internal server error' });
    }
};


const loginToAccount = async (req, res) => {
    const { email, password } = req.body;
    try {
        const accountId = await accountService.loginToAccount(email, password);

        if (accountId) {
            res.json(accountId);
            // res.json({ message : `login to account ${accountId} successfully `})
        } else {
            res.status(404).json({ error: `Account not found` });
        }
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Internal server error' });
    }
}

export default {
    createAccount,
    createManyAccount,
    getAccountById,
    updateAccount,
    deleteAccount,
    getAllAccounts,
    loginToAccount,
};
