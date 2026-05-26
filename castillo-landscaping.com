<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Castillo Landscaping | Methuen & Lawrence, MA</title>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700;900&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet" />
  <style>
    :root {
      --green-deep: #1b3a1f;
      --green-mid: #2d5e34;
      --green-light: #4a8c52;
      --green-pale: #a8c9a0;
      --gold: #c8a84b;
      --gold-light: #e2c97a;
      --cream: #f5f0e8;
      --white: #ffffff;
      --dark: #111810;
      --gray: #5c6b5e;
    }

    * { margin: 0; padding: 0; box-sizing: border-box; }

    html { scroll-behavior: smooth; }

    body {
      font-family: 'DM Sans', sans-serif;
      background: var(--cream);
      color: var(--dark);
      overflow-x: hidden;
    }

    /* ── NAV ── */
    nav {
      position: fixed;
      top: 0; left: 0; right: 0;
      z-index: 100;
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 1.2rem 4vw;
      background: rgba(27, 58, 31, 0.96);
      backdrop-filter: blur(8px);
      border-bottom: 1px solid rgba(200,168,75,0.25);
    }

    .nav-logo {
      font-family: 'Playfair Display', serif;
      color: var(--gold);
      font-size: 1.45rem;
      letter-spacing: 0.02em;
      line-height: 1.1;
    }
    .nav-logo span { display: block; font-size: 0.65rem; color: var(--green-pale); font-family: 'DM Sans', sans-serif; letter-spacing: 0.2em; text-transform: uppercase; font-weight: 400; }

    .nav-links { display: flex; gap: 2.5rem; list-style: none; }
    .nav-links a { color: var(--cream); text-decoration: none; font-size: 0.88rem; letter-spacing: 0.08em; text-transform: uppercase; font-weight: 500; transition: color 0.2s; }
    .nav-links a:hover { color: var(--gold); }

    .nav-cta {
      background: var(--gold);
      color: var(--dark);
      padding: 0.6rem 1.4rem;
      border-radius: 2px;
      font-weight: 500;
      font-size: 0.85rem;
      text-decoration: none;
      letter-spacing: 0.06em;
      text-transform: uppercase;
      transition: background 0.2s, transform 0.15s;
    }
    .nav-cta:hover { background: var(--gold-light); transform: translateY(-1px); }

    /* ── HERO ── */
    #hero {
      min-height: 100vh;
      display: grid;
      grid-template-columns: 1fr 1fr;
      position: relative;
      overflow: hidden;
    }

    .hero-left {
      background: var(--green-deep);
      display: flex;
      flex-direction: column;
      justify-content: center;
      padding: 10rem 4vw 6rem 6vw;
      position: relative;
      z-index: 2;
    }
    .hero-left::after {
      content: '';
      position: absolute;
      right: -60px;
      top: 0; bottom: 0;
      width: 120px;
      background: var(--green-deep);
      clip-path: polygon(0 0, 0 100%, 100% 100%);
      z-index: 3;
    }

    .hero-tag {
      color: var(--gold);
      font-size: 0.78rem;
      letter-spacing: 0.3em;
      text-transform: uppercase;
      margin-bottom: 1.5rem;
      display: flex;
      align-items: center;
      gap: 0.8rem;
    }
    .hero-tag::before {
      content: '';
      display: inline-block;
      width: 32px; height: 1px;
      background: var(--gold);
    }

    .hero-h1 {
      font-family: 'Playfair Display', serif;
      color: var(--white);
      font-size: clamp(3rem, 5vw, 5.5rem);
      line-height: 1.05;
      margin-bottom: 1.8rem;
    }
    .hero-h1 em { color: var(--gold); font-style: normal; }

    .hero-desc {
      color: var(--green-pale);
      font-size: 1.05rem;
      line-height: 1.75;
      max-width: 440px;
      margin-bottom: 2.8rem;
      font-weight: 300;
    }

    .hero-actions { display: flex; gap: 1rem; flex-wrap: wrap; }

    .btn-primary {
      background: var(--gold);
      color: var(--dark);
      padding: 0.9rem 2rem;
      border-radius: 2px;
      font-weight: 500;
      font-size: 0.9rem;
      text-decoration: none;
      letter-spacing: 0.06em;
      text-transform: uppercase;
      transition: all 0.2s;
      display: inline-block;
    }
    .btn-primary:hover { background: var(--gold-light); transform: translateY(-2px); box-shadow: 0 6px 24px rgba(200,168,75,0.3); }

    .btn-outline {
      border: 1px solid rgba(255,255,255,0.35);
      color: var(--white);
      padding: 0.9rem 2rem;
      border-radius: 2px;
      font-weight: 400;
      font-size: 0.9rem;
      text-decoration: none;
      letter-spacing: 0.06em;
      text-transform: uppercase;
      transition: all 0.2s;
      display: inline-block;
    }
    .btn-outline:hover { border-color: var(--gold); color: var(--gold); }

    .hero-right {
      position: relative;
      overflow: hidden;
    }
    .hero-right img {
      width: 100%; height: 100%;
      object-fit: cover;
      filter: brightness(0.75) saturate(1.1);
      transition: transform 8s ease;
    }
    .hero-right:hover img { transform: scale(1.04); }

    .hero-badge {
      position: absolute;
      bottom: 3rem; left: 3rem;
      background: rgba(27,58,31,0.92);
      border: 1px solid var(--gold);
      padding: 1.2rem 1.6rem;
      border-radius: 2px;
      color: var(--white);
      font-size: 0.85rem;
      backdrop-filter: blur(6px);
    }
    .hero-badge strong { color: var(--gold); font-family: 'Playfair Display', serif; font-size: 1.6rem; display: block; }

    /* ── TRUST BAR ── */
    .trust-bar {
      background: var(--dark);
      padding: 1.2rem 6vw;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 4rem;
      flex-wrap: wrap;
    }
    .trust-item {
      color: var(--green-pale);
      font-size: 0.8rem;
      letter-spacing: 0.15em;
      text-transform: uppercase;
      display: flex;
      align-items: center;
      gap: 0.6rem;
    }
    .trust-item svg { color: var(--gold); flex-shrink: 0; }

    /* ── ABOUT ── */
    #about {
      display: grid;
      grid-template-columns: 1fr 1fr;
      min-height: 70vh;
    }

    .about-img {
      position: relative;
      overflow: hidden;
    }
    .about-img img { width: 100%; height: 100%; object-fit: cover; filter: brightness(0.85); }
    .about-img-overlay {
      position: absolute;
      inset: 0;
      background: linear-gradient(135deg, rgba(27,58,31,0.4) 0%, transparent 60%);
    }

    .about-content {
      background: var(--white);
      padding: 7rem 6vw 7rem 5vw;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }

    .section-tag {
      color: var(--green-mid);
      font-size: 0.75rem;
      letter-spacing: 0.3em;
      text-transform: uppercase;
      margin-bottom: 1rem;
      display: flex;
      align-items: center;
      gap: 0.8rem;
      font-weight: 500;
    }
    .section-tag::before {
      content: '';
      display: inline-block;
      width: 28px; height: 2px;
      background: var(--gold);
    }

    .section-h2 {
      font-family: 'Playfair Display', serif;
      font-size: clamp(2rem, 3.5vw, 3.2rem);
      line-height: 1.12;
      margin-bottom: 1.5rem;
      color: var(--green-deep);
    }

    .about-content p {
      color: var(--gray);
      line-height: 1.8;
      font-size: 1rem;
      margin-bottom: 1rem;
      font-weight: 300;
    }

    .about-stats {
      display: flex;
      gap: 2.5rem;
      margin-top: 2.5rem;
      padding-top: 2.5rem;
      border-top: 1px solid #e5e5e5;
      flex-wrap: wrap;
    }
    .stat-num {
      font-family: 'Playfair Display', serif;
      font-size: 2.8rem;
      color: var(--green-mid);
      line-height: 1;
    }
    .stat-label {
      font-size: 0.78rem;
      text-transform: uppercase;
      letter-spacing: 0.12em;
      color: var(--gray);
      margin-top: 0.3rem;
    }

    /* ── SERVICES ── */
    #services {
      background: var(--green-deep);
      padding: 8rem 6vw;
    }

    .services-header {
      text-align: center;
      margin-bottom: 5rem;
    }
    .services-header .section-tag { justify-content: center; color: var(--green-pale); }
    .services-header .section-tag::before { background: var(--gold); }
    .services-header .section-h2 { color: var(--white); }

    .services-grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 1.5px;
    }

    .service-card {
      background: rgba(255,255,255,0.04);
      border: 1px solid rgba(255,255,255,0.07);
      padding: 3rem 2.5rem;
      position: relative;
      overflow: hidden;
      transition: background 0.3s, transform 0.25s;
      cursor: default;
    }
    .service-card::before {
      content: '';
      position: absolute;
      bottom: 0; left: 0; right: 0;
      height: 2px;
      background: var(--gold);
      transform: scaleX(0);
      transition: transform 0.35s;
      transform-origin: left;
    }
    .service-card:hover { background: rgba(255,255,255,0.09); transform: translateY(-4px); }
    .service-card:hover::before { transform: scaleX(1); }

    .service-icon {
      width: 52px; height: 52px;
      background: rgba(200,168,75,0.12);
      border: 1px solid rgba(200,168,75,0.3);
      border-radius: 2px;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-bottom: 1.8rem;
      font-size: 1.5rem;
    }

    .service-card h3 {
      font-family: 'Playfair Display', serif;
      color: var(--white);
      font-size: 1.35rem;
      margin-bottom: 0.9rem;
    }
    .service-card p {
      color: var(--green-pale);
      font-size: 0.92rem;
      line-height: 1.72;
      font-weight: 300;
    }

    /* ── GALLERY ── */
    #gallery {
      padding: 8rem 6vw;
      background: var(--cream);
    }

    .gallery-header {
      display: flex;
      align-items: flex-end;
      justify-content: space-between;
      margin-bottom: 4rem;
      flex-wrap: wrap;
      gap: 2rem;
    }

    .gallery-grid {
      display: grid;
      grid-template-columns: 2fr 1fr 1fr;
      grid-template-rows: 280px 280px;
      gap: 12px;
    }

    .gallery-item {
      overflow: hidden;
      border-radius: 2px;
      position: relative;
    }
    .gallery-item:first-child { grid-row: 1 / 3; }

    .gallery-item img {
      width: 100%; height: 100%;
      object-fit: cover;
      transition: transform 0.5s ease, filter 0.4s;
      filter: saturate(0.9);
    }
    .gallery-item:hover img { transform: scale(1.06); filter: saturate(1.15); }

    .gallery-item-overlay {
      position: absolute;
      inset: 0;
      background: linear-gradient(to top, rgba(27,58,31,0.6) 0%, transparent 50%);
      opacity: 0;
      transition: opacity 0.3s;
      display: flex;
      align-items: flex-end;
      padding: 1.5rem;
    }
    .gallery-item:hover .gallery-item-overlay { opacity: 1; }
    .gallery-item-overlay span {
      color: var(--white);
      font-size: 0.82rem;
      text-transform: uppercase;
      letter-spacing: 0.12em;
      font-weight: 500;
    }

    /* ── REVIEWS ── */
    #reviews {
      background: var(--white);
      padding: 8rem 6vw;
    }

    .reviews-header { text-align: center; margin-bottom: 4.5rem; }
    .reviews-header .section-tag { justify-content: center; }

    .reviews-grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 2rem;
    }

    .review-card {
      background: var(--cream);
      padding: 2.5rem;
      border-radius: 2px;
      border-left: 3px solid var(--gold);
      transition: transform 0.25s, box-shadow 0.25s;
    }
    .review-card:hover { transform: translateY(-4px); box-shadow: 0 16px 40px rgba(0,0,0,0.08); }

    .stars { color: var(--gold); font-size: 1rem; margin-bottom: 1.2rem; letter-spacing: 0.05em; }

    .review-text {
      color: var(--gray);
      font-size: 0.95rem;
      line-height: 1.75;
      font-style: italic;
      margin-bottom: 1.5rem;
      font-weight: 300;
    }

    .reviewer {
      font-weight: 500;
      font-size: 0.85rem;
      color: var(--green-deep);
      text-transform: uppercase;
      letter-spacing: 0.1em;
    }

    /* ── SERVICE AREA ── */
    #area {
      background: var(--green-deep);
      padding: 6rem 6vw;
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 6rem;
      align-items: center;
    }

    .area-content .section-h2 { color: var(--white); }
    .area-content .section-tag { color: var(--green-pale); }
    .area-content .section-tag::before { background: var(--gold); }

    .area-content p {
      color: var(--green-pale);
      line-height: 1.8;
      font-size: 1rem;
      margin-top: 1.5rem;
      font-weight: 300;
    }

    .area-list {
      display: flex;
      flex-wrap: wrap;
      gap: 0.8rem;
      margin-top: 2rem;
    }
    .area-chip {
      border: 1px solid rgba(200,168,75,0.5);
      color: var(--gold-light);
      padding: 0.45rem 1.1rem;
      border-radius: 30px;
      font-size: 0.82rem;
      letter-spacing: 0.06em;
      text-transform: uppercase;
    }

    .area-map {
      background: rgba(255,255,255,0.05);
      border: 1px solid rgba(255,255,255,0.1);
      border-radius: 4px;
      padding: 2rem;
      height: 300px;
      display: flex;
      align-items: center;
      justify-content: center;
      position: relative;
      overflow: hidden;
    }
    .area-map svg { width: 100%; height: 100%; opacity: 0.7; }

    /* ── CONTACT ── */
    #contact {
      padding: 8rem 6vw;
      background: var(--cream);
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 8rem;
      align-items: start;
    }

    .contact-info .section-h2 { margin-bottom: 1.5rem; }
    .contact-info p {
      color: var(--gray);
      line-height: 1.8;
      font-size: 1rem;
      margin-bottom: 2.5rem;
      font-weight: 300;
    }

    .contact-detail {
      display: flex;
      align-items: center;
      gap: 1rem;
      margin-bottom: 1.4rem;
      color: var(--dark);
    }
    .contact-detail-icon {
      width: 44px; height: 44px;
      background: var(--green-deep);
      border-radius: 2px;
      display: flex;
      align-items: center;
      justify-content: center;
      flex-shrink: 0;
    }
    .contact-detail-icon svg { color: var(--gold); }
    .contact-detail-text strong { display: block; font-size: 0.78rem; text-transform: uppercase; letter-spacing: 0.1em; color: var(--gray); margin-bottom: 0.15rem; font-weight: 400; }
    .contact-detail-text span { font-size: 1rem; font-weight: 500; }

    .contact-form { background: var(--white); padding: 3rem; border-radius: 2px; box-shadow: 0 8px 40px rgba(0,0,0,0.06); }
    .contact-form h3 {
      font-family: 'Playfair Display', serif;
      font-size: 1.6rem;
      color: var(--green-deep);
      margin-bottom: 2rem;
    }

    .form-group { margin-bottom: 1.4rem; }
    .form-group label {
      display: block;
      font-size: 0.78rem;
      text-transform: uppercase;
      letter-spacing: 0.12em;
      color: var(--gray);
      margin-bottom: 0.5rem;
      font-weight: 500;
    }
    .form-group input,
    .form-group select,
    .form-group textarea {
      width: 100%;
      padding: 0.85rem 1rem;
      border: 1px solid #ddd;
      border-radius: 2px;
      font-family: 'DM Sans', sans-serif;
      font-size: 0.95rem;
      color: var(--dark);
      background: var(--cream);
      outline: none;
      transition: border-color 0.2s;
    }
    .form-group input:focus,
    .form-group select:focus,
    .form-group textarea:focus { border-color: var(--green-mid); background: var(--white); }
    .form-group textarea { resize: vertical; min-height: 110px; }

    .form-row { display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; }

    .form-submit {
      width: 100%;
      background: var(--green-deep);
      color: var(--white);
      border: none;
      padding: 1rem;
      font-family: 'DM Sans', sans-serif;
      font-size: 0.9rem;
      font-weight: 500;
      letter-spacing: 0.1em;
      text-transform: uppercase;
      border-radius: 2px;
      cursor: pointer;
      transition: background 0.2s, transform 0.15s;
      margin-top: 0.5rem;
    }
    .form-submit:hover { background: var(--green-mid); transform: translateY(-1px); }

    /* ── FOOTER ── */
    footer {
      background: var(--dark);
      padding: 4rem 6vw 2rem;
    }

    .footer-top {
      display: grid;
      grid-template-columns: 2fr 1fr 1fr;
      gap: 4rem;
      padding-bottom: 3rem;
      border-bottom: 1px solid rgba(255,255,255,0.08);
      margin-bottom: 2rem;
    }

    .footer-brand .nav-logo { margin-bottom: 1rem; font-size: 1.3rem; }
    .footer-brand p {
      color: rgba(255,255,255,0.45);
      font-size: 0.88rem;
      line-height: 1.7;
      font-weight: 300;
      max-width: 280px;
    }

    .footer-col h4 {
      color: var(--gold);
      font-size: 0.75rem;
      letter-spacing: 0.2em;
      text-transform: uppercase;
      margin-bottom: 1.2rem;
      font-weight: 500;
    }
    .footer-col ul { list-style: none; }
    .footer-col li { margin-bottom: 0.6rem; }
    .footer-col a {
      color: rgba(255,255,255,0.5);
      text-decoration: none;
      font-size: 0.88rem;
      transition: color 0.2s;
    }
    .footer-col a:hover { color: var(--white); }

    .footer-bottom {
      display: flex;
      justify-content: space-between;
      align-items: center;
      flex-wrap: wrap;
      gap: 1rem;
    }
    .footer-bottom p {
      color: rgba(255,255,255,0.3);
      font-size: 0.8rem;
    }

    /* ── SCROLL ANIMATIONS ── */
    .fade-up {
      opacity: 0;
      transform: translateY(30px);
      transition: opacity 0.7s ease, transform 0.7s ease;
    }
    .fade-up.visible { opacity: 1; transform: none; }

    /* ── RESPONSIVE ── */
    @media (max-width: 900px) {
      #hero { grid-template-columns: 1fr; }
      .hero-right { height: 45vh; }
      .hero-left::after { display: none; }
      #about { grid-template-columns: 1fr; }
      .services-grid { grid-template-columns: 1fr; }
      .reviews-grid { grid-template-columns: 1fr; }
      #area { grid-template-columns: 1fr; gap: 3rem; }
      #contact { grid-template-columns: 1fr; gap: 3rem; }
      .footer-top { grid-template-columns: 1fr; gap: 2rem; }
      .gallery-grid { grid-template-columns: 1fr 1fr; grid-template-rows: auto; }
      .gallery-item:first-child { grid-row: auto; }
      .nav-links { display: none; }
    }
  </style>
</head>
<body>

  <!-- NAV -->
  <nav>
    <div class="nav-logo">
      Castillo Landscaping
      <span>Methuen &amp; Lawrence, MA</span>
    </div>
    <ul class="nav-links">
      <li><a href="#about">About</a></li>
      <li><a href="#services">Services</a></li>
      <li><a href="#gallery">Gallery</a></li>
      <li><a href="#reviews">Reviews</a></li>
      <li><a href="#contact">Contact</a></li>
    </ul>
    <a href="tel:8574988412" class="nav-cta">Call Now</a>
  </nav>

  <!-- HERO -->
  <section id="hero">
    <div class="hero-left">
      <p class="hero-tag">Locally Owned &amp; Operated</p>
      <h1 class="hero-h1">
        Your Lawn,<br/>
        <em>Perfected.</em>
      </h1>
      <p class="hero-desc">
        Professional landscaping and lawn care for residential and commercial properties throughout Methuen, Lawrence, and the Greater Merrimack Valley.
      </p>
      <div class="hero-actions">
        <a href="#contact" class="btn-primary">Get a Free Quote</a>
        <a href="#services" class="btn-outline">Our Services</a>
      </div>
    </div>
    <div class="hero-right">
      <img
        src="https://images.unsplash.com/photo-1558904541-efa843a96f01?w=1200&q=80"
        alt="Beautiful green lawn professionally maintained"
      />
      <div class="hero-badge">
        <strong>5★</strong>
        Rated by Local Homeowners
      </div>
    </div>
  </section>

  <!-- TRUST BAR -->
  <div class="trust-bar">
    <div class="trust-item">
      <svg width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg>
      Licensed &amp; Insured
    </div>
    <div class="trust-item">
      <svg width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg>
      Free Estimates
    </div>
    <div class="trust-item">
      <svg width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg>
      Residential &amp; Commercial
    </div>
    <div class="trust-item">
      <svg width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg>
      Serving the Merrimack Valley
    </div>
  </div>

  <!-- ABOUT -->
  <section id="about">
    <div class="about-img">
      <img
        src="https://images.unsplash.com/photo-1599629954294-14df9f8291a4?w=900&q=80"
        alt="Landscaping crew at work"
      />
      <div class="about-img-overlay"></div>
    </div>
    <div class="about-content">
      <p class="section-tag fade-up">Who We Are</p>
      <h2 class="section-h2 fade-up">Built on Hard Work &amp; Honest Service</h2>
      <p class="fade-up">
        Castillo Landscaping is a trusted, locally owned lawn care company serving Methuen, Massachusetts and the surrounding communities. We bring skilled expertise and a strong work ethic to every property we touch.
      </p>
      <p class="fade-up">
        Whether you need weekly mowing, sod installation, seasonal cleanups, or custom landscape enhancements, our team is committed to delivering reliable, high-quality results with attention to detail on every job. We take pride in keeping your property clean, well-maintained, and looking its best — all at fair, competitive prices.
      </p>
      <div class="about-stats fade-up">
        <div>
          <div class="stat-num">500+</div>
          <div class="stat-label">Happy Clients</div>
        </div>
        <div>
          <div class="stat-num">10+</div>
          <div class="stat-label">Years Experience</div>
        </div>
        <div>
          <div class="stat-num">5★</div>
          <div class="stat-label">Local Reputation</div>
        </div>
      </div>
    </div>
  </section>

  <!-- SERVICES -->
  <section id="services">
    <div class="services-header">
      <p class="section-tag">What We Offer</p>
      <h2 class="section-h2">Comprehensive Lawn &amp; Landscape Services</h2>
    </div>
    <div class="services-grid">
      <div class="service-card fade-up">
        <div class="service-icon">🌿</div>
        <h3>Lawn Mowing &amp; Edging</h3>
        <p>Weekly or bi-weekly mowing, crisp edging along walkways and driveways, and thorough cleanup — keeping your lawn neat and healthy all season long.</p>
      </div>
      <div class="service-card fade-up">
        <div class="service-icon">🌱</div>
        <h3>Sod Installation</h3>
        <p>Professional sod laying for new lawns or bare patches. We prepare the ground properly and install premium sod for a thick, lush result that takes root fast.</p>
      </div>
      <div class="service-card fade-up">
        <div class="service-icon">🍂</div>
        <h3>Seasonal Cleanups</h3>
        <p>Spring and fall cleanup services including leaf removal, debris clearing, and property prep — so your yard is ready for every season.</p>
      </div>
      <div class="service-card fade-up">
        <div class="service-icon">🪴</div>
        <h3>Mulching &amp; Flowerbeds</h3>
        <p>Custom flowerbed creation and fresh mulch installation that suppresses weeds, retains moisture, and gives your landscape a polished, finished look.</p>
      </div>
      <div class="service-card fade-up">
        <div class="service-icon">✂️</div>
        <h3>Bush &amp; Tree Trimming</h3>
        <p>Precise pruning and trimming of shrubs, hedges, and trees to maintain shape, promote healthy growth, and enhance your property's curb appeal.</p>
      </div>
      <div class="service-card fade-up">
        <div class="service-icon">🏡</div>
        <h3>Property Maintenance</h3>
        <p>Full-service yard upkeep for residential and commercial clients, including debris removal, general groundskeeping, and ongoing property care contracts.</p>
      </div>
    </div>
  </section>

  <!-- GALLERY -->
  <section id="gallery">
    <div class="gallery-header">
      <div>
        <p class="section-tag">Our Work</p>
        <h2 class="section-h2">Results That Speak for Themselves</h2>
      </div>
    </div>
    <div class="gallery-grid">
      <div class="gallery-item">
        <img src="https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=900&q=80" alt="Lawn care result" />
        <div class="gallery-item-overlay"><span>Lawn Maintenance</span></div>
      </div>
      <div class="gallery-item">
        <img src="https://images.unsplash.com/photo-1591840473199-438a0979e7a8?w=600&q=80" alt="Sod installation" />
        <div class="gallery-item-overlay"><span>Sod Installation</span></div>
      </div>
      <div class="gallery-item">
        <img src="https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=600&q=80" alt="Garden beds" />
        <div class="gallery-item-overlay"><span>Flower Beds</span></div>
      </div>
      <div class="gallery-item">
        <img src="https://images.unsplash.com/photo-1504280390367-361c6d9f38f4?w=600&q=80" alt="Yard cleanup" />
        <div class="gallery-item-overlay"><span>Yard Cleanup</span></div>
      </div>
      <div class="gallery-item">
        <img src="https://images.unsplash.com/photo-1523301343968-6a6ebf63c672?w=600&q=80" alt="Mulching" />
        <div class="gallery-item-overlay"><span>Mulching</span></div>
      </div>
    </div>
  </section>

  <!-- REVIEWS -->
  <section id="reviews">
    <div class="reviews-header">
      <p class="section-tag">Client Reviews</p>
      <h2 class="section-h2">What Our Customers Say</h2>
    </div>
    <div class="reviews-grid">
      <div class="review-card fade-up">
        <div class="stars">★★★★★</div>
        <p class="review-text">"Castillo Landscaping transformed my yard completely. They showed up on time, worked efficiently, and the result was beyond what I expected. Highly recommend to anyone in the Methuen area."</p>
        <div class="reviewer">Maria T. — Methuen, MA</div>
      </div>
      <div class="review-card fade-up">
        <div class="stars">★★★★★</div>
        <p class="review-text">"Got a quote back within hours and they were at my house the next day. Incredible crew — professional, fast, and the lawn looks absolutely pristine. Best price I found in the area."</p>
        <div class="reviewer">James R. — Lawrence, MA</div>
      </div>
      <div class="review-card fade-up">
        <div class="stars">★★★★★</div>
        <p class="review-text">"We hired them for a full fall cleanup and mulching job. They didn't cut corners anywhere. The property looked brand new. We've already signed up for their weekly maintenance plan."</p>
        <div class="reviewer">Sandra L. — Haverhill, MA</div>
      </div>
    </div>
  </section>

  <!-- SERVICE AREA -->
  <section id="area">
    <div class="area-content fade-up">
      <p class="section-tag">Coverage</p>
      <h2 class="section-h2">Serving the Greater Merrimack Valley</h2>
      <p>Based in Methuen, we proudly serve homeowners and businesses throughout the surrounding communities. Not sure if we cover your area? Give us a call — we're always looking to help local neighbors.</p>
      <div class="area-list">
        <span class="area-chip">Methuen</span>
        <span class="area-chip">Lawrence</span>
        <span class="area-chip">Haverhill</span>
        <span class="area-chip">Andover</span>
        <span class="area-chip">North Andover</span>
        <span class="area-chip">Lowell</span>
        <span class="area-chip">Salem, NH</span>
        <span class="area-chip">&amp; Surrounding Areas</span>
      </div>
    </div>
    <div class="area-map fade-up">
      <!-- Decorative map SVG -->
      <svg viewBox="0 0 400 300" xmlns="http://www.w3.org/2000/svg">
        <defs>
          <radialGradient id="glow" cx="50%" cy="50%" r="50%">
            <stop offset="0%" stop-color="#4a8c52" stop-opacity="0.4"/>
            <stop offset="100%" stop-color="#4a8c52" stop-opacity="0"/>
          </radialGradient>
        </defs>
        <circle cx="200" cy="150" r="120" fill="url(#glow)"/>
        <circle cx="200" cy="150" r="80" fill="none" stroke="rgba(200,168,75,0.2)" stroke-width="1" stroke-dasharray="6 4"/>
        <circle cx="200" cy="150" r="40" fill="none" stroke="rgba(200,168,75,0.4)" stroke-width="1" stroke-dasharray="4 3"/>
        <!-- dots -->
        <circle cx="200" cy="150" r="7" fill="#c8a84b"/>
        <circle cx="200" cy="150" r="3" fill="#fff"/>
        <circle cx="230" cy="120" r="4" fill="rgba(200,168,75,0.7)"/>
        <circle cx="170" cy="130" r="4" fill="rgba(200,168,75,0.7)"/>
        <circle cx="220" cy="180" r="4" fill="rgba(200,168,75,0.7)"/>
        <circle cx="155" cy="170" r="4" fill="rgba(200,168,75,0.7)"/>
        <circle cx="250" cy="155" r="4" fill="rgba(200,168,75,0.7)"/>
        <circle cx="185" cy="200" r="3" fill="rgba(200,168,75,0.5)"/>
        <circle cx="240" cy="200" r="3" fill="rgba(200,168,75,0.5)"/>
        <!-- Lines from center -->
        <line x1="200" y1="150" x2="230" y2="120" stroke="rgba(200,168,75,0.25)" stroke-width="1"/>
        <line x1="200" y1="150" x2="170" y2="130" stroke="rgba(200,168,75,0.25)" stroke-width="1"/>
        <line x1="200" y1="150" x2="220" y2="180" stroke="rgba(200,168,75,0.25)" stroke-width="1"/>
        <line x1="200" y1="150" x2="155" y2="170" stroke="rgba(200,168,75,0.25)" stroke-width="1"/>
        <line x1="200" y1="150" x2="250" y2="155" stroke="rgba(200,168,75,0.25)" stroke-width="1"/>
        <!-- Labels -->
        <text x="200" y="168" text-anchor="middle" fill="rgba(255,255,255,0.8)" font-size="9" font-family="DM Sans, sans-serif">Methuen</text>
        <text x="234" y="115" text-anchor="middle" fill="rgba(255,255,255,0.55)" font-size="8" font-family="DM Sans, sans-serif">Haverhill</text>
        <text x="155" y="125" text-anchor="middle" fill="rgba(255,255,255,0.55)" font-size="8" font-family="DM Sans, sans-serif">Lawrence</text>
        <text x="222" y="195" text-anchor="middle" fill="rgba(255,255,255,0.55)" font-size="8" font-family="DM Sans, sans-serif">Andover</text>
        <text x="140" y="185" text-anchor="middle" fill="rgba(255,255,255,0.55)" font-size="8" font-family="DM Sans, sans-serif">Lowell</text>
        <text x="262" y="170" text-anchor="middle" fill="rgba(255,255,255,0.55)" font-size="8" font-family="DM Sans, sans-serif">Salem</text>
      </svg>
    </div>
  </section>

  <!-- CONTACT -->
  <section id="contact">
    <div class="contact-info">
      <p class="section-tag">Get in Touch</p>
      <h2 class="section-h2">Request Your Free Quote Today</h2>
      <p>We respond to all quote requests quickly. Give us a call or fill out the form and we'll be in touch to schedule a time that works for you.</p>

      <div class="contact-detail">
        <div class="contact-detail-icon">
          <svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07A19.5 19.5 0 0 1 4.99 13a19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 3.9 2.18h3a2 2 0 0 1 2 1.72c.127.96.362 1.903.7 2.81a2 2 0 0 1-.45 2.11L8.09 9.91A16 16 0 0 0 14 15.82l1.09-1.06a2 2 0 0 1 2.11-.45c.907.338 1.85.573 2.81.7A2 2 0 0 1 22 16.92z"/></svg>
        </div>
        <div class="contact-detail-text">
          <strong>Phone</strong>
          <span><a href="tel:8574988412" style="color:inherit;text-decoration:none;">(857) 498-8412</a></span>
        </div>
      </div>

      <div class="contact-detail">
        <div class="contact-detail-icon">
          <svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"/><circle cx="12" cy="10" r="3"/></svg>
        </div>
        <div class="contact-detail-text">
          <strong>Service Area</strong>
          <span>Methuen, Lawrence &amp; Merrimack Valley</span>
        </div>
      </div>

      <div class="contact-detail">
        <div class="contact-detail-icon">
          <svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
        </div>
        <div class="contact-detail-text">
          <strong>Hours</strong>
          <span>Mon–Sat: 7:00 AM – 6:00 PM</span>
        </div>
      </div>
    </div>

    <div class="contact-form fade-up">
      <h3>Send Us a Message</h3>
      <div class="form-row">
        <div class="form-group">
          <label>First Name</label>
          <input type="text" placeholder="John" />
        </div>
        <div class="form-group">
          <label>Last Name</label>
          <input type="text" placeholder="Smith" />
        </div>
      </div>
      <div class="form-group">
        <label>Phone Number</label>
        <input type="tel" placeholder="(978) 555-0100" />
      </div>
      <div class="form-group">
        <label>Email Address</label>
        <input type="email" placeholder="john@example.com" />
      </div>
      <div class="form-group">
        <label>Service Needed</label>
        <select>
          <option value="">Select a service...</option>
          <option>Lawn Mowing &amp; Edging</option>
          <option>Sod Installation</option>
          <option>Seasonal Cleanup</option>
          <option>Mulching &amp; Flowerbeds</option>
          <option>Bush &amp; Tree Trimming</option>
          <option>General Property Maintenance</option>
          <option>Other</option>
        </select>
      </div>
      <div class="form-group">
        <label>Message</label>
        <textarea placeholder="Tell us about your property and what you need..."></textarea>
      </div>
      <button class="form-submit" onclick="alert('Thank you! We will be in touch shortly.')">Request Free Quote →</button>
    </div>
  </section>

  <!-- FOOTER -->
  <footer>
    <div class="footer-top">
      <div class="footer-brand">
        <div class="nav-logo">
          Castillo Landscaping
          <span>Methuen &amp; Lawrence, MA</span>
        </div>
        <p>A trusted, locally owned lawn care and landscaping company serving the Merrimack Valley with skilled expertise and a strong work ethic.</p>
      </div>
      <div class="footer-col">
        <h4>Services</h4>
        <ul>
          <li><a href="#services">Lawn Mowing &amp; Edging</a></li>
          <li><a href="#services">Sod Installation</a></li>
          <li><a href="#services">Seasonal Cleanups</a></li>
          <li><a href="#services">Mulching &amp; Flowerbeds</a></li>
          <li><a href="#services">Bush &amp; Tree Trimming</a></li>
          <li><a href="#services">Property Maintenance</a></li>
        </ul>
      </div>
      <div class="footer-col">
        <h4>Contact</h4>
        <ul>
          <li><a href="tel:8574988412">(857) 498-8412</a></li>
          <li><a href="#contact">Request a Quote</a></li>
          <li><a href="#area">Service Areas</a></li>
          <li><a href="#reviews">Reviews</a></li>
        </ul>
      </div>
    </div>
    <div class="footer-bottom">
      <p>© 2025 Castillo Landscaping LLC. All rights reserved.</p>
      <p>Serving Methuen, Lawrence &amp; the Merrimack Valley</p>
    </div>
  </footer>

  <script>
    // Scroll fade-in
    const observer = new IntersectionObserver((entries) => {
      entries.forEach(e => {
        if (e.isIntersecting) {
          e.target.classList.add('visible');
          // stagger siblings
          const siblings = e.target.parentElement.querySelectorAll('.fade-up');
          siblings.forEach((s, i) => {
            setTimeout(() => s.classList.add('visible'), i * 100);
          });
        }
      });
    }, { threshold: 0.12 });

    document.querySelectorAll('.fade-up').forEach(el => observer.observe(el));

    // Nav active highlight on scroll
    const sections = document.querySelectorAll('section[id]');
    const navLinks = document.querySelectorAll('.nav-links a');
    window.addEventListener('scroll', () => {
      let current = '';
      sections.forEach(sec => {
        if (window.scrollY >= sec.offsetTop - 100) current = sec.id;
      });
      navLinks.forEach(a => {
        a.style.color = a.getAttribute('href') === '#' + current ? 'var(--gold)' : '';
      });
    });
  </script>
</body>
</html>
