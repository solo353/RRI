const PROXIED_IMAGES = {
  '/images/hero.png': 'https://danielr685.sg-host.com/wp-content/uploads/2026/04/RRI-Construction-Hi-Vis-Fall-1200x800-1.png',
  '/images/shopper.png': 'https://danielr685.sg-host.com/wp-content/uploads/2026/04/Direct-Store-Procurement-Shopper-Man.png',
};

export default {
  async fetch(request, env) {
    const url = new URL(request.url);

    if (PROXIED_IMAGES[url.pathname]) {
      const res = await fetch(PROXIED_IMAGES[url.pathname], {
        headers: {
          'Referer': 'https://danielr685.sg-host.com/',
          'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/120.0.0.0 Safari/537.36',
        }
      });
      return new Response(res.body, {
        headers: {
          'Content-Type': res.headers.get('Content-Type') || 'image/png',
          'Cache-Control': 'public, max-age=86400',
        }
      });
    }

    return env.ASSETS.fetch(request);
  }
};
