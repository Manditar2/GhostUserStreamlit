import asyncio
from pyppeteer import launch

async def get_page_content(url):
    browser = await launch(headless=True)
    page = await browser.newPage()
    await page.goto(url)
    title = await page.title()
    content = await page.content()
    await browser.close()
    return title, content

# Ejecuta la función asincrónica
url = "http://localhost:8501/?execute_query=10"
title, content = asyncio.run(get_page_content(url))

print("Título de la página:", title)
print("Contenido de la página:", content)
