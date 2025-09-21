const https = require('https');

const url = 'https://sdfghjk2.onrender.com/';
const intervalInSeconds = 20;

function pingWebsite() {
    const startTime = new Date();
    console.log(`[${startTime.toLocaleTimeString()}] جاري زيارة الموقع...`);

    https.get(url, (res) => {
        console.log(`[${new Date().toLocaleTimeString()}] تمت الزيارة بنجاح! Status: ${res.statusCode}`);
    }).on('error', (err) => {
        console.error(`[${new Date().toLocaleTimeString()}] خطأ:`, err.message);
    });
}

// تشغيل الدالة مرة عند بداية البرنامج
pingWebsite();

// تشغيل الدالة كل 20 ثانية
setInterval(pingWebsite, intervalInSeconds * 1000);

console.log(`بدء تشغيل البرنامج - سيتم زيارة الموقع كل ${intervalInSeconds} ثانية`);