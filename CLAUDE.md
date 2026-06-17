# RRI Website — Project Memory

## Company
- **Name:** R & R Industries (RRI)
- **Domain:** rrind.com (production) / danielr685.sg-host.com (staging/dev)
- **Direct Store platform:** rri-direct.com
- **Phone:** (800) 234-5611
- **Email:** service@rrind.com

## Site Structure
All pages are static HTML. Each section is a folder with its own `index.html`.

```
/                        → index.html (homepage)
/contact-rri/            → contact page
/corporate-apparel/      → category page
/direct-store/           → Direct Store landing
/industries/             → industries hub
/promos/                 → branded promos category
/resources/              → resources page
/safety-apparel/         → safety apparel category
/terms-and-conditions/   → T&C page
/images/                 → shared image assets
```

## Brand & Design
- **Primary dark:** `#2C3E50`
- **Accent green:** `#84cc16`
- **Hover green (darker):** `#6aac0e`
- **Background gray:** `#E6E8EB`
- **Font:** Segoe UI, Arial, sans-serif
- Nav is sticky, white background, box-shadow
- Buttons: `.btn-main` (green), `.btn-dark` (dark)

## Product Categories
Corporate Apparel, Branded Promos, Safety Apparel, Workwear, Accessories, Bags, Headwear

## Industries Served
Aviation, Construction, Energy & Utilities, Food & Beverage, Government, Hospitality

## Key Value Props
- Custom Direct Store (controlled ordering, pre-approved gear)
- In-house decoration/branding team
- ANSI-compliant safety apparel
- Low minimums, fast turnaround
- One vendor for all gear needs

## Testimonial
- Dean B, Bernal Construction Safety Services

## Notes
- Nav links point to staging host (`danielr685.sg-host.com`) — update to `rrind.com` for production
- Images live in `/images/` folder; a `download-images.ps1` script exists for bulk image management
- A separate draft exists: `2026-06-15-rri-website.html`
