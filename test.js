const puppeteer = require('puppeteer');

async function fetchStreamlitData() {
  const browser = await puppeteer.launch({
    headless: "new",
    executablePath: process.env.PUPPETEER_EXECUTABLE_PATH || '/usr/bin/chromium',
    args: [
      '--no-sandbox',
      '--disable-setuid-sandbox',
    ],
  });

  const page = await browser.newPage();
  const url = 'http://172.27.249.1:8501?execute_query=10';
  await page.goto(url, { waitUntil: 'networkidle0' });
  const content = await page.content();
  console.log('Contenido de Streamlit:', content);
  await browser.close();
}

fetchStreamlitData().catch(error => {
  console.error('Error al ejecutar Puppeteer:', error);
});
