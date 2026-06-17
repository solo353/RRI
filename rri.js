/* ═══════════════════════════════════════════════
   RRI Global Scripts — rri.js
   ═══════════════════════════════════════════════ */

document.addEventListener('DOMContentLoaded', () => {

  /* ─── MOBILE NAV TOGGLE ─── */
  const hamburger = document.querySelector('.hamburger');
  const navLinks  = document.querySelector('.nav-links');
  if (hamburger && navLinks) {
    hamburger.addEventListener('click', () => {
      navLinks.classList.toggle('open');
      hamburger.setAttribute('aria-expanded', navLinks.classList.contains('open'));
    });
  }

  /* ─── MOBILE DROPDOWN TOGGLE ─── */
  document.querySelectorAll('.nav-links > li > a').forEach(link => {
    link.addEventListener('click', e => {
      if (window.innerWidth > 1100) return;
      const li = link.parentElement;
      const drop = li.querySelector('.dropdown, .mega-drop');
      if (!drop) return;
      e.preventDefault();
      li.classList.toggle('open');
    });
  });

  /* ─── FAQ ACCORDION ─── */
  document.querySelectorAll('.faq-toggle').forEach(btn => {
    btn.addEventListener('click', () => {
      const item = btn.closest('.faq-item');
      const isOpen = item.classList.contains('open');
      // close all
      document.querySelectorAll('.faq-item').forEach(el => el.classList.remove('open'));
      if (!isOpen) item.classList.add('open');
    });
  });

  /* ─── SCROLL FADE-IN ─── */
  const observer = new IntersectionObserver(entries => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
        observer.unobserve(entry.target);
      }
    });
  }, { threshold: 0.12 });

  document.querySelectorAll('.fade-up').forEach(el => observer.observe(el));

  /* ─── BRAND MARQUEE DUPLICATE ─── */
  const track = document.querySelector('.marquee-track');
  if (track) {
    // Clone children for seamless loop
    const clone = track.innerHTML;
    track.innerHTML += clone;
  }

  /* ─── FOOTER SEARCH (redirect to catalog) ─── */
  document.querySelectorAll('.footer-search button').forEach(btn => {
    btn.addEventListener('click', () => {
      const input = btn.previousElementSibling;
      const q = input ? input.value.trim() : '';
      if (q) {
        window.location.href = `https://danielr685.sg-host.com/?s=${encodeURIComponent(q)}`;
      }
    });
  });
  document.querySelectorAll('.footer-search input').forEach(input => {
    input.addEventListener('keydown', e => {
      if (e.key === 'Enter') {
        const q = input.value.trim();
        if (q) window.location.href = `https://danielr685.sg-host.com/?s=${encodeURIComponent(q)}`;
      }
    });
  });

});
