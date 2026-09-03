<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ShopVerse — E-Commerce</title>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,400;14..32,500;14..32,600;14..32,700;14..32,800&display=swap" rel="stylesheet" />

    <style>
        /* ===== RESET & BASE (same as before) ===== */
        *, *::before, *::after { margin:0; padding:0; box-sizing:border-box; }
        :root {
            --primary: #6c3ef4; --primary-dark: #5228c9; --primary-light: #eee9ff;
            --accent: #f97316; --bg: #f8f9fc; --surface: #ffffff;
            --text: #1e1b2e; --text-muted: #6b6a7a; --border: #e4e4ed;
            --shadow: 0 8px 30px rgba(0,0,0,0.06);
            --shadow-hover: 0 12px 40px rgba(108,62,244,0.15);
            --radius: 16px; --radius-sm: 10px; --transition: 0.25s ease;
        }
        body { font-family: 'Inter', sans-serif; background: var(--bg); color: var(--text); line-height:1.5; min-height:100vh; display:flex; flex-direction:column; }
        ::-webkit-scrollbar { width:6px; }
        ::-webkit-scrollbar-track { background:var(--bg); }
        ::-webkit-scrollbar-thumb { background:var(--primary); border-radius:10px; }

        /* HEADER */
        header { background:var(--surface); border-bottom:1px solid var(--border); padding:16px 24px; position:sticky; top:0; z-index:100; backdrop-filter:blur(12px); background:rgba(255,255,255,0.85); }
        .header-inner { max-width:1280px; margin:0 auto; display:flex; align-items:center; justify-content:space-between; gap:20px; flex-wrap:wrap; }
        .logo { display:flex; align-items:center; gap:10px; font-size:1.6rem; font-weight:800; letter-spacing:-0.5px; color:var(--text); text-decoration:none; }
        .logo i { color:var(--primary); font-size:1.8rem; }
        .logo span { color:var(--primary); }
        .search-bar { flex:1; max-width:460px; display:flex; background:var(--bg); border-radius:50px; padding:4px 4px 4px 18px; border:1px solid var(--border); transition:var(--transition); }
        .search-bar:focus-within { border-color:var(--primary); box-shadow:0 0 0 4px rgba(108,62,244,0.12); }
        .search-bar input { flex:1; border:none; background:transparent; padding:10px 0; font-size:0.95rem; outline:none; font-family:inherit; color:var(--text); }
        .search-bar input::placeholder { color:var(--text-muted); }
        .search-bar button { background:var(--primary); border:none; color:#fff; padding:10px 20px; border-radius:50px; font-size:0.95rem; font-weight:600; cursor:pointer; transition:var(--transition); display:flex; align-items:center; gap:6px; white-space:nowrap; }
        .search-bar button:hover { background:var(--primary-dark); transform:scale(1.02); }
        .header-actions { display:flex; align-items:center; gap:16px; flex-shrink:0; }
        .cart-btn { position:relative; background:var(--primary-light); border:none; color:var(--primary); width:48px; height:48px; border-radius:50%; font-size:1.3rem; cursor:pointer; transition:var(--transition); display:flex; align-items:center; justify-content:center; }
        .cart-btn:hover { background:var(--primary); color:#fff; transform:scale(1.05); }
        .cart-badge { position:absolute; top:-4px; right:-4px; background:var(--accent); color:#fff; font-size:0.7rem; font-weight:700; width:22px; height:22px; border-radius:50%; display:flex; align-items:center; justify-content:center; transition:var(--transition); }
        .cart-btn:hover .cart-badge { background:#fff; color:var(--primary); }

        /* MAIN */
        main { flex:1; max-width:1280px; margin:0 auto; padding:32px 24px 60px; width:100%; }

        /* HERO */
        .hero { background:linear-gradient(135deg, var(--primary-light), #f3f0ff); border-radius:var(--radius); padding:48px 40px; margin-bottom:40px; display:flex; align-items:center; justify-content:space-between; flex-wrap:wrap; gap:24px; position:relative; overflow:hidden; }
        .hero-text { position:relative; z-index:1; }
        .hero-text h1 { font-size:2.2rem; font-weight:800; letter-spacing:-0.5px; line-height:1.2; }
        .hero-text h1 span { color:var(--primary); }
        .hero-text p { color:var(--text-muted); font-size:1.05rem; margin-top:6px; max-width:420px; }
        .hero-cta { background:var(--primary); color:#fff; border:none; padding:14px 32px; border-radius:50px; font-size:1rem; font-weight:600; cursor:pointer; transition:var(--transition); display:inline-flex; align-items:center; gap:8px; margin-top:14px; }
        .hero-cta:hover { background:var(--primary-dark); transform:translateY(-2px); box-shadow:0 8px 25px rgba(108,62,244,0.35); }
        .hero-icon { font-size:4rem; color:var(--primary); opacity:0.25; position:relative; z-index:1; }

        /* STATS BAR */
        .stats-bar { display:flex; flex-wrap:wrap; gap:20px 40px; padding:16px 20px; background:var(--surface); border-radius:var(--radius); border:1px solid var(--border); margin-bottom:28px; box-shadow:var(--shadow); }
        .stats-bar .stat-item { display:flex; align-items:center; gap:10px; font-size:0.9rem; }
        .stats-bar .stat-item i { color:var(--primary); font-size:1.1rem; width:20px; text-align:center; }
        .stats-bar .stat-item strong { font-weight:700; color:var(--text); }
        .stats-bar .stat-item .stat-value { color:var(--text-muted); }

        /* FILTER BAR */
        .filter-bar { display:flex; flex-wrap:wrap; align-items:center; gap:12px; margin-bottom:32px; background:var(--surface); padding:14px 20px; border-radius:var(--radius); box-shadow:var(--shadow); border:1px solid var(--border); }
        .filter-bar .label { font-weight:600; font-size:0.9rem; color:var(--text-muted); margin-right:4px; display:flex; align-items:center; gap:6px; }
        .filter-btn { background:transparent; border:1px solid var(--border); padding:8px 20px; border-radius:50px; font-size:0.85rem; font-weight:500; cursor:pointer; transition:var(--transition); font-family:inherit; color:var(--text); }
        .filter-btn:hover { border-color:var(--primary); color:var(--primary); background:var(--primary-light); }
        .filter-btn.active { background:var(--primary); color:#fff; border-color:var(--primary); }
        .filter-bar .sort-wrap { margin-left:auto; display:flex; align-items:center; gap:8px; }
        .filter-bar .sort-wrap select { padding:8px 14px; border-radius:50px; border:1px solid var(--border); background:var(--surface); font-family:inherit; font-size:0.85rem; color:var(--text); outline:none; cursor:pointer; transition:var(--transition); }
        .filter-bar .sort-wrap select:focus { border-color:var(--primary); }

        /* PRODUCT GRID */
        .product-grid { display:grid; grid-template-columns:repeat(auto-fill, minmax(260px,1fr)); gap:24px; }
        .product-card { background:var(--surface); border-radius:var(--radius); overflow:hidden; box-shadow:var(--shadow); transition:var(--transition); border:1px solid var(--border); display:flex; flex-direction:column; animation:fadeIn 0.4s ease; }
        .product-card:hover { transform:translateY(-6px); box-shadow:var(--shadow-hover); border-color:var(--primary); }
        @keyframes fadeIn { from { opacity:0; transform:translateY(12px); } to { opacity:1; transform:translateY(0); } }

        .product-image { width:100%; aspect-ratio:1/1; display:flex; align-items:center; justify-content:center; font-size:4.5rem; color:#fff; position:relative; overflow:hidden; background:linear-gradient(135deg, #6c3ef4, #a78bfa); }
        .product-image .emoji-icon { filter:drop-shadow(0 4px 12px rgba(0,0,0,0.15)); line-height:1; user-select:none; transition:transform 0.3s ease; }
        .product-card:hover .product-image .emoji-icon { transform:scale(1.08) rotate(-2deg); }
        .product-badge { position:absolute; top:12px; left:12px; background:var(--accent); color:#fff; font-size:0.7rem; font-weight:700; padding:4px 12px; border-radius:50px; text-transform:uppercase; letter-spacing:0.3px; z-index:2; }

        .product-info { padding:18px 20px 20px; flex:1; display:flex; flex-direction:column; }
        .product-info .name { font-weight:600; font-size:1rem; margin-bottom:4px; display:-webkit-box; -webkit-line-clamp:2; -webkit-box-orient:vertical; overflow:hidden; line-height:1.3; }
        .product-info .category { font-size:0.75rem; color:var(--text-muted); text-transform:uppercase; letter-spacing:0.3px; margin-bottom:6px; }
        .product-info .rating { display:flex; align-items:center; gap:4px; font-size:0.8rem; color:#f59e0b; margin-bottom:8px; }
        .product-info .rating span { color:var(--text-muted); margin-left:4px; }
        .product-info .price-row { display:flex; align-items:center; gap:12px; margin-bottom:14px; flex-wrap:wrap; }
        .product-info .price { font-size:1.25rem; font-weight:700; color:var(--text); }
        .product-info .price-old { font-size:0.9rem; color:var(--text-muted); text-decoration:line-through; }
        .product-info .add-btn { margin-top:auto; background:var(--primary); color:#fff; border:none; padding:12px; border-radius:var(--radius-sm); font-weight:600; font-size:0.9rem; cursor:pointer; transition:var(--transition); font-family:inherit; display:flex; align-items:center; justify-content:center; gap:8px; }
        .product-info .add-btn:hover { background:var(--primary-dark); transform:scale(1.02); }
        .product-info .add-btn.in-cart { background:#22c55e; }
        .product-info .add-btn.in-cart:hover { background:#16a34a; }

        /* EMPTY STATE */
        .empty-state { text-align:center; padding:60px 20px; color:var(--text-muted); grid-column:1 / -1; }
        .empty-state i { font-size:3.5rem; color:var(--border); margin-bottom:16px; }
        .empty-state h3 { color:var(--text); font-size:1.3rem; margin-bottom:4px; }

        /* CART SIDEBAR */
        .cart-overlay { position:fixed; inset:0; background:rgba(0,0,0,0.3); backdrop-filter:blur(4px); z-index:200; opacity:0; visibility:hidden; transition:var(--transition); }
        .cart-overlay.open { opacity:1; visibility:visible; }
        .cart-sidebar { position:fixed; top:0; right:0; width:100%; max-width:420px; height:100%; background:var(--surface); z-index:300; transform:translateX(100%); transition:transform 0.35s cubic-bezier(0.22,1,0.36,1); display:flex; flex-direction:column; box-shadow:-8px 0 40px rgba(0,0,0,0.08); }
        .cart-sidebar.open { transform:translateX(0); }
        .cart-header { display:flex; align-items:center; justify-content:space-between; padding:20px 24px; border-bottom:1px solid var(--border); flex-shrink:0; }
        .cart-header h2 { font-size:1.2rem; font-weight:700; display:flex; align-items:center; gap:8px; }
        .cart-header h2 i { color:var(--primary); }
        .cart-close { background:var(--bg); border:none; width:36px; height:36px; border-radius:50%; font-size:1.1rem; cursor:pointer; transition:var(--transition); color:var(--text); display:flex; align-items:center; justify-content:center; }
        .cart-close:hover { background:var(--border); }
        .cart-items { flex:1; overflow-y:auto; padding:16px 20px; }
        .cart-items .empty-cart { text-align:center; padding:40px 0; color:var(--text-muted); }
        .cart-items .empty-cart i { font-size:3rem; color:var(--border); margin-bottom:12px; }
        .cart-item { display:flex; gap:14px; padding:14px 0; border-bottom:1px solid var(--border); align-items:center; animation:fadeIn 0.3s ease; }
        .cart-item:last-child { border-bottom:none; }
        .cart-item .item-img { width:56px; height:56px; border-radius:var(--radius-sm); display:flex; align-items:center; justify-content:center; font-size:2rem; flex-shrink:0; overflow:hidden; background:linear-gradient(135deg, #6c3ef4, #a78bfa); color:#fff; }
        .cart-item .item-img .emoji { filter:drop-shadow(0 2px 6px rgba(0,0,0,0.1)); }
        .cart-item .item-details { flex:1; min-width:0; }
        .cart-item .item-details .item-name { font-weight:600; font-size:0.9rem; white-space:nowrap; overflow:hidden; text-overflow:ellipsis; }
        .cart-item .item-details .item-price { font-size:0.85rem; color:var(--text-muted); }
        .cart-item .item-qty { display:flex; align-items:center; gap:6px; margin-top:4px; }
        .cart-item .item-qty button { background:var(--bg); border:1px solid var(--border); width:28px; height:28px; border-radius:50%; font-size:0.9rem; cursor:pointer; transition:var(--transition); display:flex; align-items:center; justify-content:center; font-weight:600; color:var(--text); }
        .cart-item .item-qty button:hover { background:var(--primary); color:#fff; border-color:var(--primary); }
        .cart-item .item-qty .qty-num { font-weight:600; min-width:20px; text-align:center; font-size:0.9rem; }
        .cart-item .item-remove { background:none; border:none; color:var(--text-muted); font-size:1rem; cursor:pointer; transition:var(--transition); padding:4px; }
        .cart-item .item-remove:hover { color:#ef4444; }

        .cart-footer { border-top:1px solid var(--border); padding:20px 24px; flex-shrink:0; background:var(--surface); }
        .cart-footer .cart-total { display:flex; justify-content:space-between; font-size:1.1rem; font-weight:700; margin-bottom:14px; }
        .cart-footer .cart-total .total-price { color:var(--primary); }
        .cart-footer .checkout-btn { width:100%; background:var(--primary); color:#fff; border:none; padding:14px; border-radius:var(--radius-sm); font-weight:700; font-size:1rem; cursor:pointer; transition:var(--transition); font-family:inherit; display:flex; align-items:center; justify-content:center; gap:8px; }
        .cart-footer .checkout-btn:hover:not(:disabled) { background:var(--primary-dark); transform:scale(1.01); }
        .cart-footer .checkout-btn:disabled { opacity:0.4; cursor:not-allowed; transform:none; }

        /* TOAST */
        .toast-container { position:fixed; bottom:24px; right:24px; z-index:500; display:flex; flex-direction:column; gap:10px; max-width:340px; width:100%; }
        .toast { background:var(--text); color:#fff; padding:14px 20px; border-radius:var(--radius-sm); box-shadow:0 8px 30px rgba(0,0,0,0.2); display:flex; align-items:center; gap:12px; animation:slideUp 0.4s ease; font-size:0.9rem; font-weight:500; }
        .toast i { font-size:1.2rem; }
        .toast.success i { color:#22c55e; }
        .toast.error i { color:#ef4444; }
        .toast.info i { color:#3b82f6; }
        @keyframes slideUp { from { opacity:0; transform:translateY(20px); } to { opacity:1; transform:translateY(0); } }

        /* CHECKOUT MODAL */
        .checkout-modal { position:fixed; inset:0; z-index:400; display:flex; align-items:center; justify-content:center; padding:20px; opacity:0; visibility:hidden; transition:var(--transition); }
        .checkout-modal.open { opacity:1; visibility:visible; }
        .checkout-modal .modal-overlay { position:absolute; inset:0; background:rgba(0,0,0,0.4); backdrop-filter:blur(4px); }
        .checkout-modal .modal-box { position:relative; background:var(--surface); border-radius:var(--radius); max-width:480px; width:100%; padding:32px 28px; box-shadow:0 24px 60px rgba(0,0,0,0.2); transform:scale(0.95); transition:var(--transition); }
        .checkout-modal.open .modal-box { transform:scale(1); }
        .checkout-modal .modal-box h2 { font-size:1.3rem; font-weight:700; margin-bottom:6px; display:flex; align-items:center; gap:10px; }
        .checkout-modal .modal-box h2 i { color:#22c55e; }
        .checkout-modal .modal-box p { color:var(--text-muted); font-size:0.95rem; margin-bottom:20px; }
        .checkout-modal .modal-box .order-summary { background:var(--bg); padding:16px 18px; border-radius:var(--radius-sm); margin-bottom:20px; font-size:0.95rem; }
        .checkout-modal .modal-box .order-summary .row { display:flex; justify-content:space-between; padding:4px 0; }
        .checkout-modal .modal-box .order-summary .row.total { font-weight:700; border-top:1px solid var(--border); padding-top:10px; margin-top:6px; font-size:1.05rem; }
        .checkout-modal .modal-box .order-summary .items-list { margin-top:12px; font-size:0.85rem; color:var(--text-muted); border-top:1px solid var(--border); padding-top:10px; }
        .checkout-modal .modal-close { position:absolute; top:16px; right:16px; background:var(--bg); border:none; width:36px; height:36px; border-radius:50%; font-size:1rem; cursor:pointer; transition:var(--transition); display:flex; align-items:center; justify-content:center; }
        .checkout-modal .modal-close:hover { background:var(--border); }
        .checkout-modal .confirm-btn { width:100%; background:#22c55e; color:#fff; border:none; padding:14px; border-radius:var(--radius-sm); font-weight:700; font-size:1rem; cursor:pointer; transition:var(--transition); font-family:inherit; display:flex; align-items:center; justify-content:center; gap:8px; }
        .checkout-modal .confirm-btn:hover { background:#16a34a; transform:scale(1.01); }

        /* RESPONSIVE */
        @media (max-width:992px) { .product-grid { grid-template-columns:repeat(auto-fill, minmax(220px,1fr)); } }
        @media (max-width:768px) {
            .header-inner { flex-wrap:wrap; gap:12px; }
            .search-bar { order:3; flex:1 1 100%; max-width:100%; }
            .hero { padding:32px 24px; flex-direction:column; text-align:center; }
            .hero-text p { max-width:100%; }
            .hero-icon { display:none; }
            .product-grid { grid-template-columns:repeat(auto-fill, minmax(180px,1fr)); gap:16px; }
            .product-info { padding:14px 14px 16px; }
            .product-info .name { font-size:0.9rem; }
            .product-info .price { font-size:1.05rem; }
            .cart-sidebar { max-width:100%; }
            .filter-bar .sort-wrap { margin-left:0; width:100%; }
            .filter-bar .sort-wrap select { flex:1; }
            .filter-bar { padding:12px 16px; }
            .stats-bar { gap:12px 24px; padding:12px 16px; }
            .stats-bar .stat-item { font-size:0.8rem; }
            .hero-text h1 { font-size:1.8rem; }
        }
        @media (max-width:480px) {
            header { padding:12px 16px; }
            main { padding:20px 16px 40px; }
            .product-grid { grid-template-columns:repeat(auto-fill, minmax(150px,1fr)); gap:12px; }
            .hero h1 { font-size:1.5rem; }
            .hero { padding:24px 18px; }
            .cart-item .item-img { width:44px; height:44px; font-size:1.6rem; }
            .filter-btn { padding:6px 14px; font-size:0.75rem; }
            .search-bar button { padding:8px 14px; font-size:0.85rem; }
            .search-bar button span { display:none; }
            .logo { font-size:1.3rem; }
            .logo i { font-size:1.4rem; }
            .cart-btn { width:42px; height:42px; font-size:1.1rem; }
        }
    </style>
</head>
<body>

    <!-- ============================================================ -->
    <!--  SCRIPTLET: Build product data and expose to EL                -->
    <!-- ============================================================ -->
    <%
        // Build product list in Java for use in JSTL
        java.util.List<java.util.Map<String, Object>> productList = new java.util.ArrayList<java.util.Map<String, Object>>();

        java.util.Map<String, Object> p1 = new java.util.HashMap<>();
        p1.put("id", 1); p1.put("name", "Smartphone Pro Max"); p1.put("category", "electronics");
        p1.put("price", 999.99); p1.put("oldPrice", 1199.99); p1.put("rating", 4.9);
        p1.put("reviews", 512); p1.put("emoji", "📱"); p1.put("badge", "Bestseller");
        productList.add(p1);

        java.util.Map<String, Object> p2 = new java.util.HashMap<>();
        p2.put("id", 2); p2.put("name", "Ultrabook Laptop 16\""); p2.put("category", "electronics");
        p2.put("price", 1499.99); p2.put("oldPrice", 1799.99); p2.put("rating", 4.8);
        p2.put("reviews", 284); p2.put("emoji", "💻"); p2.put("badge", "New");
        productList.add(p2);

        java.util.Map<String, Object> p3 = new java.util.HashMap<>();
        p3.put("id", 3); p3.put("name", "Wireless Noise-Canceling Headphones"); p3.put("category", "electronics");
        p3.put("price", 149.99); p3.put("oldPrice", 199.99); p3.put("rating", 4.7);
        p3.put("reviews", 342); p3.put("emoji", "🎧"); p3.put("badge", "Sale");
        productList.add(p3);

        java.util.Map<String, Object> p4 = new java.util.HashMap<>();
        p4.put("id", 4); p4.put("name", "Premium Cotton T-Shirt (Pack of 3)"); p4.put("category", "clothing");
        p4.put("price", 39.99); p4.put("oldPrice", null); p4.put("rating", 4.5);
        p4.put("reviews", 187); p4.put("emoji", "👕"); p4.put("badge", null);
        productList.add(p4);

        java.util.Map<String, Object> p5 = new java.util.HashMap<>();
        p5.put("id", 5); p5.put("name", "Smart LED Desk Lamp with Qi Charger"); p5.put("category", "electronics");
        p5.put("price", 79.99); p5.put("oldPrice", 99.99); p5.put("rating", 4.6);
        p5.put("reviews", 93); p5.put("emoji", "💡"); p5.put("badge", null);
        productList.add(p5);

        java.util.Map<String, Object> p6 = new java.util.HashMap<>();
        p6.put("id", 6); p6.put("name", "Minimalist Ceramic Coffee Mug Set"); p6.put("category", "home");
        p6.put("price", 24.99); p6.put("oldPrice", null); p6.put("rating", 4.3);
        p6.put("reviews", 215); p6.put("emoji", "☕"); p6.put("badge", null);
        productList.add(p6);

        java.util.Map<String, Object> p7 = new java.util.HashMap<>();
        p7.put("id", 7); p7.put("name", "Hydrating Face Serum with Vitamin C"); p7.put("category", "beauty");
        p7.put("price", 54.99); p7.put("oldPrice", 69.99); p7.put("rating", 4.9);
        p7.put("reviews", 412); p7.put("emoji", "🧴"); p7.put("badge", "Bestseller");
        productList.add(p7);

        java.util.Map<String, Object> p8 = new java.util.HashMap<>();
        p8.put("id", 8); p8.put("name", "Slim Fit Jeans (Stretch Denim)"); p8.put("category", "clothing");
        p8.put("price", 59.99); p8.put("oldPrice", null); p8.put("rating", 4.4);
        p8.put("reviews", 108); p8.put("emoji", "👖"); p8.put("badge", null);
        productList.add(p8);

        java.util.Map<String, Object> p9 = new java.util.HashMap<>();
        p9.put("id", 9); p9.put("name", "Portable Bluetooth Speaker, 20W"); p9.put("category", "electronics");
        p9.put("price", 89.99); p9.put("oldPrice", 119.99); p9.put("rating", 4.6);
        p9.put("reviews", 276); p9.put("emoji", "🔊"); p9.put("badge", "Sale");
        productList.add(p9);

        java.util.Map<String, Object> p10 = new java.util.HashMap<>();
        p10.put("id", 10); p10.put("name", "Bamboo Cutting Board Set (3-Piece)"); p10.put("category", "home");
        p10.put("price", 34.99); p10.put("oldPrice", null); p10.put("rating", 4.2);
        p10.put("reviews", 89); p10.put("emoji", "🪵"); p10.put("badge", null);
        productList.add(p10);

        java.util.Map<String, Object> p11 = new java.util.HashMap<>();
        p11.put("id", 11); p11.put("name", "Organic Rose Water Toner 200ml"); p11.put("category", "beauty");
        p11.put("price", 19.99); p11.put("oldPrice", 26.99); p11.put("rating", 4.7);
        p11.put("reviews", 334); p11.put("emoji", "🌹"); p11.put("badge", null);
        productList.add(p11);

        java.util.Map<String, Object> p12 = new java.util.HashMap<>();
        p12.put("id", 12); p12.put("name", "Classic Leather Backpack 15\""); p12.put("category", "clothing");
        p12.put("price", 74.99); p12.put("oldPrice", 89.99); p12.put("rating", 4.8);
        p12.put("reviews", 156); p12.put("emoji", "🎒"); p12.put("badge", "New");
        productList.add(p12);

        java.util.Map<String, Object> p13 = new java.util.HashMap<>();
        p13.put("id", 13); p13.put("name", "Scented Soy Candle Jar (Lavender)"); p13.put("category", "home");
        p13.put("price", 16.99); p13.put("oldPrice", null); p13.put("rating", 4.1);
        p13.put("reviews", 67); p13.put("emoji", "🕯️"); p13.put("badge", null);
        productList.add(p13);

        java.util.Map<String, Object> p14 = new java.util.HashMap<>();
        p14.put("id", 14); p14.put("name", "Wireless Charging Pad (Fast Charge)"); p14.put("category", "electronics");
        p14.put("price", 29.99); p14.put("oldPrice", 44.99); p14.put("rating", 4.4);
        p14.put("reviews", 203); p14.put("emoji", "🔋"); p14.put("badge", "Sale");
        productList.add(p14);

        java.util.Map<String, Object> p15 = new java.util.HashMap<>();
        p15.put("id", 15); p15.put("name", "4K Action Camera Waterproof"); p15.put("category", "electronics");
        p15.put("price", 199.99); p15.put("oldPrice", 249.99); p15.put("rating", 4.7);
        p15.put("reviews", 128); p15.put("emoji", "📷"); p15.put("badge", null);
        productList.add(p15);

        // Make it available to EL (Expression Language)
        pageContext.setAttribute("productList", productList);
        request.setAttribute("productList", productList);

        // Debug: print to server log so you can confirm it's built
        System.out.println(">>> ShopVerse JSP: productList size = " + productList.size());
    %>

    <!-- ===== HEADER ===== -->
    <header>
        <div class="header-inner">
            <a href="#" class="logo">
                <i class="fas fa-cube"></i>
                Shop<span>Verse</span>
            </a>
            <div class="search-bar">
                <input type="text" id="searchInput" placeholder="Search for products..." />
                <button id="searchBtn"><i class="fas fa-search"></i> <span>Search</span></button>
            </div>
            <div class="header-actions">
                <button class="cart-btn" id="cartToggle" aria-label="Open cart">
                    <i class="fas fa-shopping-bag"></i>
                    <span class="cart-badge" id="cartBadge">0</span>
                </button>
            </div>
        </div>
    </header>

    <!-- ===== MAIN ===== -->
    <main>
        <!-- Hero -->
        <section class="hero">
            <div class="hero-text">
                <h1>Discover <span>Premium</span> Products</h1>
                <p>Curated essentials for your lifestyle — quality, style, and value.</p>
                <button class="hero-cta" id="heroCta">
                    <i class="fas fa-rocket"></i> Start Shopping
                </button>
            </div>
            <div class="hero-icon"><i class="fas fa-shopping-bag"></i></div>
        </section>

        <!-- Stats Bar -->
        <div class="stats-bar">
            <div class="stat-item">
                <i class="fas fa-box"></i>
                <span><strong>${fn:length(productList)}</strong> <span class="stat-value">Products</span></span>
            </div>
            <div class="stat-item">
                <i class="fas fa-tags"></i>
                <span><strong>4</strong> <span class="stat-value">Categories</span></span>
            </div>
            <div class="stat-item">
                <i class="fas fa-star"></i>
                <span><strong>4.6</strong> <span class="stat-value">Avg. Rating</span></span>
            </div>
            <div class="stat-item">
                <i class="fas fa-shopping-cart"></i>
                <span><strong id="cartItemCount">0</strong> <span class="stat-value">In Cart</span></span>
            </div>
        </div>

        <!-- Filter Bar -->
        <div class="filter-bar">
            <span class="label"><i class="fas fa-tag"></i> Category:</span>
            <button class="filter-btn active" data-category="all">All</button>
            <button class="filter-btn" data-category="electronics">Electronics</button>
            <button class="filter-btn" data-category="clothing">Clothing</button>
            <button class="filter-btn" data-category="home">Home & Living</button>
            <button class="filter-btn" data-category="beauty">Beauty</button>
            <div class="sort-wrap">
                <label for="sortSelect"><i class="fas fa-arrow-up-wide-short"></i></label>
                <select id="sortSelect">
                    <option value="default">Sort by</option>
                    <option value="price-asc">Price: Low → High</option>
                    <option value="price-desc">Price: High → Low</option>
                    <option value="name">Name A → Z</option>
                </select>
            </div>
        </div>

        <!-- Product Grid (Server‑side rendered) -->
        <div class="product-grid" id="productGrid">
            <c:forEach var="p" items="${productList}">
                <div class="product-card" data-id="${p.id}" data-category="${p.category}"
                     data-price="${p.price}" data-name="${p.name}">
                    <div class="product-image" style="background: ${p.category eq 'electronics' ? 'linear-gradient(135deg, #3b82f6, #8b5cf6)' :
                                                              p.category eq 'clothing' ? 'linear-gradient(135deg, #ec4899, #f43f5e)' :
                                                              p.category eq 'home' ? 'linear-gradient(135deg, #f59e0b, #f97316)' :
                                                              p.category eq 'beauty' ? 'linear-gradient(135deg, #ec4899, #a855f7)' :
                                                              'linear-gradient(135deg, #6c3ef4, #a78bfa)'};">
                        <span class="emoji-icon">${p.emoji}</span>
                        <c:if test="${not empty p.badge}">
                            <span class="product-badge">${p.badge}</span>
                        </c:if>
                    </div>
                    <div class="product-info">
                        <div class="category">${p.category}</div>
                        <div class="name">${p.name}</div>
                        <div class="rating">
                            <c:forEach begin="1" end="${p.rating - (p.rating % 1)}">★</c:forEach>
                            <c:if test="${p.rating % 1 >= 0.5}">★</c:if>
                            <span>(${p.reviews})</span>
                        </div>
                        <div class="price-row">
                            <span class="price">$${p.price}</span>
                            <c:if test="${not empty p.oldPrice}">
                                <span class="price-old">$${p.oldPrice}</span>
                            </c:if>
                        </div>
                        <button class="add-btn" data-id="${p.id}">
                            <i class="fas fa-plus"></i> Add to Cart
                        </button>
                    </div>
                </div>
            </c:forEach>
        </div>
    </main>

    <!-- ===== CART SIDEBAR ===== -->
    <div class="cart-overlay" id="cartOverlay"></div>
    <div class="cart-sidebar" id="cartSidebar">
        <div class="cart-header">
            <h2><i class="fas fa-shopping-bag"></i> Your Cart</h2>
            <button class="cart-close" id="cartClose"><i class="fas fa-times"></i></button>
        </div>
        <div class="cart-items" id="cartItems">
            <!-- Rendered by JS -->
        </div>
        <div class="cart-footer">
            <div class="cart-total">
                <span>Total</span>
                <span class="total-price" id="cartTotal">$0.00</span>
            </div>
            <button class="checkout-btn" id="checkoutBtn" disabled>
                <i class="fas fa-lock"></i> Proceed to Checkout
            </button>
        </div>
    </div>

    <!-- ===== CHECKOUT MODAL ===== -->
    <div class="checkout-modal" id="checkoutModal">
        <div class="modal-overlay" id="modalOverlay"></div>
        <div class="modal-box">
            <button class="modal-close" id="modalClose"><i class="fas fa-times"></i></button>
            <h2><i class="fas fa-check-circle"></i> Order Confirmed</h2>
            <p>Thank you for your purchase! Your order has been placed successfully.</p>
            <div class="order-summary" id="orderSummary"></div>
            <button class="confirm-btn" id="modalConfirm">
                <i class="fas fa-thumbs-up"></i> Continue Shopping
            </button>
        </div>
    </div>

    <!-- ===== TOAST CONTAINER ===== -->
    <div class="toast-container" id="toastContainer"></div>

    <!-- ============================================================ -->
    <!-- JAVASCRIPT (Client‑side logic for cart, filter, sort, search) -->
    <!-- ============================================================ -->
    <script>
        // ============================================================
        // 1. PRODUCT DATA – read from the rendered DOM
        // ============================================================
        const productCards = document.querySelectorAll('.product-card');
        const products = Array.from(productCards).map(card => ({
            id: parseInt(card.dataset.id),
            name: card.dataset.name,
            category: card.dataset.category,
            price: parseFloat(card.dataset.price),
            emoji: card.querySelector('.emoji-icon').textContent,
            badge: card.querySelector('.product-badge')?.textContent || null,
        }));

        // ============================================================
        // 2. STATE
        // ============================================================
        let cart = JSON.parse(localStorage.getItem('shopverse_cart')) || [];
        let currentCategory = 'all';
        let currentSort = 'default';
        let searchQuery = '';

        // ============================================================
        // 3. DOM REFS
        // ============================================================
        const grid = document.getElementById('productGrid');
        const cartItemsEl = document.getElementById('cartItems');
        const cartTotalEl = document.getElementById('cartTotal');
        const cartBadge = document.getElementById('cartBadge');
        const cartItemCount = document.getElementById('cartItemCount');
        const cartToggle = document.getElementById('cartToggle');
        const cartClose = document.getElementById('cartClose');
        const cartOverlay = document.getElementById('cartOverlay');
        const cartSidebar = document.getElementById('cartSidebar');
        const checkoutBtn = document.getElementById('checkoutBtn');
        const checkoutModal = document.getElementById('checkoutModal');
        const modalOverlay = document.getElementById('modalOverlay');
        const modalClose = document.getElementById('modalClose');
        const modalConfirm = document.getElementById('modalConfirm');
        const orderSummary = document.getElementById('orderSummary');
        const searchInput = document.getElementById('searchInput');
        const searchBtn = document.getElementById('searchBtn');
        const heroCta = document.getElementById('heroCta');
        const sortSelect = document.getElementById('sortSelect');
        const filterBtns = document.querySelectorAll('.filter-btn');

        // ============================================================
        // 4. TOAST
        // ============================================================
        function showToast(message, type = 'success') {
            const container = document.getElementById('toastContainer');
            const toast = document.createElement('div');
            toast.className = `toast ${type}`;
            const iconMap = { success: 'fa-check-circle', error: 'fa-exclamation-circle', info: 'fa-info-circle' };
            toast.innerHTML = `<i class="fas ${iconMap[type] || iconMap.info}"></i><span>${message}</span>`;
            container.appendChild(toast);
            setTimeout(() => {
                toast.style.opacity = '0';
                toast.style.transform = 'translateX(20px)';
                setTimeout(() => toast.remove(), 300);
            }, 2800);
        }

        // ============================================================
        // 5. CART HELPERS
        // ============================================================
        function saveCart() {
            localStorage.setItem('shopverse_cart', JSON.stringify(cart));
            renderCart();
            updateBadge();
            updateCheckoutBtn();
            updateStats();
        }

        function updateBadge() {
            const count = cart.reduce((sum, item) => sum + item.qty, 0);
            cartBadge.textContent = count;
            cartBadge.style.display = count > 0 ? 'flex' : 'none';
        }

        function updateStats() {
            const count = cart.reduce((sum, item) => sum + item.qty, 0);
            if (cartItemCount) cartItemCount.textContent = count;
        }

        function updateCheckoutBtn() {
            const total = cart.reduce((sum, item) => sum + item.price * item.qty, 0);
            checkoutBtn.disabled = cart.length === 0;
            checkoutBtn.innerHTML = cart.length === 0 ?
                'Cart is empty' :
                `<i class="fas fa-lock"></i> Checkout · $${total.toFixed(2)}`;
        }

        function getProductById(id) {
            return products.find(p => p.id === id);
        }

        function addToCart(productId) {
            const existing = cart.find(item => item.id === productId);
            if (existing) {
                existing.qty += 1;
                showToast(`Added another "${getProductById(productId).name}"`, 'info');
            } else {
                const product = getProductById(productId);
                cart.push({ id: product.id, name: product.name, price: product.price, qty: 1, emoji: product.emoji });
                showToast(`Added "${product.name}" to cart`, 'success');
            }
            saveCart();
            updateAddButtons();
        }

        function removeFromCart(productId) {
            cart = cart.filter(item => item.id !== productId);
            saveCart();
            showToast('Item removed from cart', 'error');
            updateAddButtons();
        }

        function updateQty(productId, delta) {
            const item = cart.find(i => i.id === productId);
            if (!item) return;
            item.qty += delta;
            if (item.qty <= 0) {
                removeFromCart(productId);
                return;
            }
            saveCart();
        }

        function clearCart() {
            cart = [];
            saveCart();
            updateAddButtons();
        }

        // ============================================================
        // 6. UPDATE "ADD TO CART" BUTTONS
        // ============================================================
        function updateAddButtons() {
            document.querySelectorAll('.add-btn').forEach(btn => {
                const id = parseInt(btn.dataset.id);
                const inCart = cart.some(item => item.id === id);
                if (inCart) {
                    btn.classList.add('in-cart');
                    btn.innerHTML = '<i class="fas fa-check"></i> In Cart';
                } else {
                    btn.classList.remove('in-cart');
                    btn.innerHTML = '<i class="fas fa-plus"></i> Add to Cart';
                }
            });
        }

        // ============================================================
        // 7. RENDER: CART
        // ============================================================
        function renderCart() {
            if (cart.length === 0) {
                cartItemsEl.innerHTML = `
                    <div class="empty-cart">
                        <i class="fas fa-shopping-bag"></i>
                        <p>Your cart is empty.</p>
                        <small style="color: var(--text-muted);">Start adding some great products!</small>
                    </div>
                `;
                cartTotalEl.textContent = '$0.00';
                updateCheckoutBtn();
                return;
            }

            let html = '';
            let total = 0;
            cart.forEach(item => {
                const subtotal = item.price * item.qty;
                total += subtotal;
                const card = document.querySelector(`.product-card[data-id="${item.id}"]`);
                let gradient = 'linear-gradient(135deg, #6c3ef4, #a78bfa)';
                if (card) {
                    const bg = card.querySelector('.product-image')?.style.background;
                    if (bg) gradient = bg;
                }
                html += `
                    <div class="cart-item" data-id="${item.id}">
                        <div class="item-img" style="background: ${gradient};">
                            <span class="emoji">${item.emoji || '📦'}</span>
                        </div>
                        <div class="item-details">
                            <div class="item-name">${item.name}</div>
                            <div class="item-price">$${item.price.toFixed(2)}</div>
                            <div class="item-qty">
                                <button class="qty-dec" data-id="${item.id}">−</button>
                                <span class="qty-num">${item.qty}</span>
                                <button class="qty-inc" data-id="${item.id}">+</button>
                            </div>
                        </div>
                        <button class="item-remove" data-id="${item.id}" title="Remove">
                            <i class="fas fa-trash-alt"></i>
                        </button>
                    </div>
                `;
            });

            cartItemsEl.innerHTML = html;
            cartTotalEl.textContent = `$${total.toFixed(2)}`;

            cartItemsEl.querySelectorAll('.qty-dec').forEach(btn => {
                btn.addEventListener('click', () => {
                    const id = parseInt(btn.dataset.id);
                    updateQty(id, -1);
                });
            });
            cartItemsEl.querySelectorAll('.qty-inc').forEach(btn => {
                btn.addEventListener('click', () => {
                    const id = parseInt(btn.dataset.id);
                    updateQty(id, 1);
                });
            });
            cartItemsEl.querySelectorAll('.item-remove').forEach(btn => {
                btn.addEventListener('click', () => {
                    const id = parseInt(btn.dataset.id);
                    removeFromCart(id);
                });
            });

            updateCheckoutBtn();
            updateBadge();
            updateStats();
        }

        // ============================================================
        // 8. FILTER, SORT, SEARCH
        // ============================================================
        function filterAndSort() {
            const cards = document.querySelectorAll('.product-card');
            let visible = Array.from(cards);

            if (currentCategory !== 'all') {
                visible = visible.filter(card => card.dataset.category === currentCategory);
            }

            if (searchQuery.trim()) {
                const q = searchQuery.trim().toLowerCase();
                visible = visible.filter(card => {
                    const name = card.dataset.name.toLowerCase();
                    const category = card.dataset.category.toLowerCase();
                    return name.includes(q) || category.includes(q);
                });
            }

            switch (currentSort) {
                case 'price-asc':
                    visible.sort((a, b) => parseFloat(a.dataset.price) - parseFloat(b.dataset.price));
                    break;
                case 'price-desc':
                    visible.sort((a, b) => parseFloat(b.dataset.price) - parseFloat(a.dataset.price));
                    break;
                case 'name':
                    visible.sort((a, b) => a.dataset.name.localeCompare(b.dataset.name));
                    break;
                default:
                    break;
            }

            cards.forEach(card => card.style.display = 'none');
            visible.forEach(card => card.style.display = '');

            const grid = document.getElementById('productGrid');
            const empty = grid.querySelector('.empty-state');
            if (visible.length === 0) {
                if (!empty) {
                    const div = document.createElement('div');
                    div.className = 'empty-state';
                    div.innerHTML = `
                        <i class="fas fa-search"></i>
                        <h3>No products found</h3>
                        <p>Try adjusting your filters or search.</p>
                    `;
                    grid.appendChild(div);
                }
            } else {
                if (empty) empty.remove();
            }
        }

        // ============================================================
        // 9. CART SIDEBAR
        // ============================================================
        function openCart() {
            cartSidebar.classList.add('open');
            cartOverlay.classList.add('open');
            document.body.style.overflow = 'hidden';
            renderCart();
        }

        function closeCart() {
            cartSidebar.classList.remove('open');
            cartOverlay.classList.remove('open');
            document.body.style.overflow = '';
        }

        cartToggle.addEventListener('click', openCart);
        cartClose.addEventListener('click', closeCart);
        cartOverlay.addEventListener('click', closeCart);

        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape') {
                closeCart();
                closeCheckout();
            }
        });

        // ============================================================
        // 10. CHECKOUT
        // ============================================================
        function openCheckout() {
            if (cart.length === 0) return;
            const total = cart.reduce((sum, item) => sum + item.price * item.qty, 0);
            const totalItems = cart.reduce((s, i) => s + i.qty, 0);
            const itemsList = cart.map(item =>
                `${item.emoji || '📦'} ${item.name} × ${item.qty} — $${(item.price * item.qty).toFixed(2)}`
            ).join('<br/>');

            orderSummary.innerHTML = `
                <div class="row"><span>Items (${totalItems})</span><span>$${total.toFixed(2)}</span></div>
                <div class="row"><span>Shipping</span><span>Free</span></div>
                <div class="row total"><span>Total</span><span>$${total.toFixed(2)}</span></div>
                <div class="items-list">${itemsList}</div>
            `;

            checkoutModal.classList.add('open');
            document.body.style.overflow = 'hidden';
        }

        function closeCheckout() {
            checkoutModal.classList.remove('open');
            document.body.style.overflow = '';
        }

        checkoutBtn.addEventListener('click', openCheckout);
        modalOverlay.addEventListener('click', closeCheckout);
        modalClose.addEventListener('click', closeCheckout);

        modalConfirm.addEventListener('click', () => {
            closeCheckout();
            if (cart.length > 0) {
                showToast('🎉 Order placed successfully! Thank you.', 'success');
                clearCart();
                updateAddButtons();
                closeCart();
            }
        });

        // ============================================================
        // 11. FILTER EVENTS
        // ============================================================
        filterBtns.forEach(btn => {
            btn.addEventListener('click', () => {
                filterBtns.forEach(b => b.classList.remove('active'));
                btn.classList.add('active');
                currentCategory = btn.dataset.category;
                filterAndSort();
            });
        });

        sortSelect.addEventListener('change', (e) => {
            currentSort = e.target.value;
            filterAndSort();
        });

        function performSearch() {
            searchQuery = searchInput.value;
            filterAndSort();
        }

        searchBtn.addEventListener('click', performSearch);
        searchInput.addEventListener('keydown', (e) => {
            if (e.key === 'Enter') performSearch();
        });

        heroCta.addEventListener('click', () => {
            document.querySelector('.filter-bar').scrollIntoView({ behavior: 'smooth', block: 'start' });
        });

        // ============================================================
        // 12. ADD BUTTONS (delegated)
        // ============================================================
        document.addEventListener('click', (e) => {
            const btn = e.target.closest('.add-btn');
            if (!btn) return;
            const id = parseInt(btn.dataset.id);
            if (btn.classList.contains('in-cart')) {
                openCart();
                return;
            }
            addToCart(id);
        });

        // ============================================================
        // 13. INIT
        // ============================================================
        updateAddButtons();
        renderCart();
        updateBadge();
        updateCheckoutBtn();
        updateStats();

        console.log('🚀 ShopVerse JSP (final) loaded with ' + products.length + ' products.');
        console.log('📦 ' + cart.length + ' items in cart.');
    </script>

</body>
</html>
