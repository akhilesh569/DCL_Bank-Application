<%@page import="com.bank.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Banking — Home Page</title>
  
  <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
  
  <style>
    body {
      font-family: 'Public Sans', sans-serif;
    }
    .brand-bg-solid { background-color: #971B4E; }
    .brand-text-solid { color: #971B4E; }
    .brand-border-solid { border-color: #971B4E; }
    .brand-light-bg { background-color: rgba(151, 27, 78, 0.05); }
    
    .no-scrollbar::-webkit-scrollbar { display: none; }
    .no-scrollbar { -ms-overflow-style: none; scrollbar-width: none; }
    
    .hero-mask {
      background: linear-gradient(105deg, #ffffff 50%, rgba(255,255,255,0.85) 70%, rgba(151,27,78,0.05) 100%);
    }

    @keyframes fadeInUp {
      from { opacity: 0; transform: translateY(16px); }
      to { opacity: 1; transform: translateY(0); }
    }
    .animate-fade-up {
      animation: fadeInUp 0.6s cubic-bezier(0.16, 1, 0.3, 1) forwards;
    }

    @keyframes infiniteScroll {
      0% { transform: translateX(0); }
      100% { transform: translateX(calc(-50% - 12px)); } /* Adjusts for exactly half the list + gap fraction */
    }
    .animate-marquee-infinite {
      display: flex;
      width: max-content;
      animation: infiniteScroll 25s linear infinite;
    }
    .animate-marquee-infinite:hover {
      animation-play-state: paused;
    }
  </style>
</head>

<body class="bg-[#f4f6f9] text-slate-800 min-h-screen flex flex-col antialiased">

  <% User u = (User) session.getAttribute("user"); %>

  <header class="bg-white border-b border-slate-200 shadow-sm sticky top-0 z-40 px-6 lg:px-16 py-4 flex items-center justify-between">
    <div class="flex items-center gap-12">
      <!-- Brand Engine Box -->
      <div class="flex items-center gap-3">
        <div class="w-10 h-10 rounded-lg brand-bg-solid flex items-center justify-center shadow-md shadow-maroon-900/10">
          <i class="fa-solid fa-building-columns text-white text-lg"></i>
        </div>
        <div class="leading-none">
          <span class="text-xl font-black text-slate-900 tracking-tight block">DCL <span class="brand-text-solid">BANK</span></span>
        </div>
      </div>

      <nav class="hidden lg:flex items-center gap-2 text-sm font-bold text-slate-600">
        <a href="#" class="px-4 py-2 brand-text-solid border-b-2 brand-border-solid bg-purple-50/40 rounded-t-md">Personal</a>
        <a href="#" class="px-4 py-2 hover:text-slate-900 hover:bg-slate-50 rounded-t-md transition-all">Corporate</a>
        <a href="#" class="px-4 py-2 hover:text-slate-900 hover:bg-slate-50 rounded-t-md transition-all">NRI</a>
        <a href="#" class="px-4 py-2 hover:text-slate-900 hover:bg-slate-50 rounded-t-md transition-all">Agricultural</a>
      </nav>
    </div>

    <div>
      <% if(u == null) { %>
        <a href="login.jsp" class="brand-bg-solid text-white text-sm font-bold px-6 py-3 rounded-md hover:brightness-110 active:scale-[0.98] transition-all flex items-center gap-2 shadow-sm">
          <i class="fa-solid fa-lock text-xs"></i> Login 
        </a>
      <% } else { %>
        <div class="relative group">
          <button class="flex items-center gap-3 border border-slate-200 bg-slate-50/80 hover:bg-white px-4 py-2 rounded-lg transition-all text-left">
            <div class="w-8 h-8 rounded bg-slate-200 flex items-center justify-center text-slate-600 font-bold text-sm shadow-inner">
              <i class="fa-solid fa-circle-user text-base brand-text-solid"></i>
            </div>
            <div>
              <p class="text-sm font-bold text-slate-800 leading-tight"><%= u.getUser_name() %></p>
              <p class="text-[10px] text-slate-400 uppercase font-bold tracking-wider mt-0.5"><%= u.getRole() %></p>
            </div>
            <i class="fa-solid fa-chevron-down text-xs text-slate-400 ml-1 transition-transform duration-200 group-hover:rotate-180"></i>
          </button>
          
          <div class="absolute right-0 top-full w-56 bg-white border border-slate-200 rounded-lg shadow-xl hidden group-hover:block overflow-hidden z-50">
            <%if(u.getRole().equalsIgnoreCase("customer")){%>
            <a href="user_db.jsp" class="flex items-center gap-2.5 px-4 py-2.5 text-slate-700 hover:bg-slate-50 font-medium text-sm transition-colors"><i class="fa-solid fa-chart-pie text-slate-400 w-4"></i> Dashboard</a>
            <%} else {%>
            <a href="admin.jsp" class="flex items-center gap-2.5 px-4 py-2.5 text-slate-700 hover:bg-slate-50 font-medium text-sm transition-colors"><i class="fa-solid fa-chart-pie text-slate-400 w-4"></i> Dashboard</a>
            <%}%>
            <a href="Logout" class="flex items-center gap-2.5 px-4 py-3 bg-rose-50 text-rose-600 hover:bg-rose-100/70 font-bold text-sm border-t border-slate-100 transition-colors"><i class="fa-solid fa-power-off w-4"></i> Logout</a>
          </div>
        </div>
      <% } %>
    </div>
  </header>

  <main class="flex-grow max-w-[1440px] w-full mx-auto p-6 lg:p-12 space-y-12 animate-fade-up">
    
    <div class="bg-white border border-slate-200 rounded-xl overflow-hidden shadow-sm grid grid-cols-1 md:grid-cols-12 min-h-[340px] relative">
      <div class="md:col-span-7 p-8 lg:p-12 flex flex-col justify-center items-start z-10 hero-mask">
        <% if(u != null) { %>
          <div class="bg-emerald-50 border border-emerald-200 text-emerald-800 text-xs font-bold px-3 py-1 rounded-md mb-4 flex items-center gap-2">
            <span class="w-2 h-2 rounded-full bg-emerald-500 animate-pulse"></span>Welcome Back, <%= u.getUser_name() %>
          </div>
        <% } else { %>
          <div class="brand-light-bg border border-purple-100 brand-text-solid text-xs font-bold px-3 py-1 rounded-md mb-4">
            Banking Portal
          </div>
        <% } %>

        <h1 class="text-3xl lg:text-5xl font-extrabold tracking-tight text-slate-900 leading-tight">
          Banking designed around <br><span class="brand-text-solid">your financial priorities.</span>
        </h1>
        <p class="text-slate-500 text-sm mt-4 leading-relaxed max-w-2xl">
          Secure processing channels, institutional-grade data transparency layers, and high-performance liquid structural frameworks engineered for immediate transfer execution execution.
        </p>

        <div class="mt-8 flex flex-wrap items-center gap-4 w-full sm:w-auto">
          <% if(u != null) { %>
            <a href="account_request.jsp" class="brand-bg-solid text-white text-sm font-bold px-8 py-3.5 rounded-md shadow-md shadow-maroon-900/10 hover:brightness-110 active:scale-95 transition-all text-center w-full sm:w-auto">
              Open New Account
            </a>
          <% } else { %>
            <a href="login.jsp" class="brand-bg-solid text-white text-sm font-bold px-8 py-3.5 rounded-md shadow-md shadow-maroon-900/10 hover:brightness-110 active:scale-95 transition-all text-center w-full sm:w-auto">
              Access Internet Banking Account
            </a>
          <% } %>
          <a href="#" class="text-slate-700 hover:text-slate-900 font-bold text-sm tracking-wide py-2 flex items-center gap-1.5 text-center mx-auto sm:mx-0 transition-colors">
            View Current Interest Tariffs <i class="fa-solid fa-chevron-right text-[10px] ml-0.5"></i>
          </a>
        </div>
      </div>

      <div class="md:col-span-5 relative bg-slate-950 min-h-[240px] md:min-h-auto">
        <img src="DCL/bank.png" class="absolute inset-0 w-full h-full object-cover opacity-75">
        <div class="absolute inset-0 bg-gradient-to-t md:bg-gradient-to-r from-white via-transparent to-transparent md:from-white md:via-transparent"></div>
        
        <!-- Live Monitor Widget -->
        <div class="absolute bottom-6 right-6 bg-slate-900/90 backdrop-blur border border-slate-700/60 p-4 rounded-lg text-white text-right shadow-lg">
          <p class="text-[10px] uppercase tracking-wider text-slate-400 font-bold">Consolidated Core Vault</p>
          <p class="text-xl font-extrabold tracking-tight mt-0.5 text-emerald-400">$614,924.50</p>
        </div>
      </div>
    </div>

    <div class="brand-bg-solid text-white rounded-xl shadow-md p-6 grid grid-cols-2 md:grid-cols-5 divide-y md:divide-y-0 md:divide-x divide-white/10 text-center items-center gap-y-4 md:gap-y-0">
      <div class="space-y-1 p-2">
        <div class="flex items-center justify-center gap-2.5 text-xl font-bold"><i class="fa-solid fa-users text-white/80"></i> 2.5M+</div>
        <p class="text-xs font-bold text-purple-100">Happy Customers</p>
        <p class="text-[10px] text-purple-200/70">Trusted by millions</p>
      </div>
      <div class="space-y-1 p-2">
        <div class="flex items-center justify-center gap-2.5 text-xl font-bold"><i class="fa-solid fa-shield-halved text-white/80"></i> 100%</div>
        <p class="text-xs font-bold text-purple-100">Secure Banking</p>
        <p class="text-[10px] text-purple-200/70">Your security, our priority</p>
      </div>
      <div class="space-y-1 p-2">
        <div class="flex items-center justify-center gap-2.5 text-xl font-bold"><i class="fa-solid fa-clock text-white/80"></i> 24/7</div>
        <p class="text-xs font-bold text-purple-100">Banking Support</p>
        <p class="text-[10px] text-purple-200/70">We are here for you</p>
      </div>
      <div class="space-y-1 p-2">
        <div class="flex items-center justify-center gap-2.5 text-xl font-bold"><i class="fa-solid fa-building-columns text-white/80"></i> 500+</div>
        <p class="text-xs font-bold text-purple-100">Branches</p>
        <p class="text-[10px] text-purple-200/70">Across the country</p>
      </div>
      <div class="space-y-1 p-2 col-span-2 md:col-span-1">
        <div class="flex items-center justify-center gap-2.5 text-xl font-bold"><i class="fa-solid fa-star text-amber-300"></i> 4.8/5</div>
        <p class="text-xs font-bold text-purple-100">Customer Rating</p>
        <p class="text-[10px] text-purple-200/70">Your trust drives us</p>
      </div>
    </div>

    <div class="bg-purple-50/80 border border-purple-100/60 rounded-lg py-3 px-6 text-xs font-semibold brand-text-solid shadow-inner overflow-hidden">
      <marquee behavior="scroll" direction="left" scrollamount="5" class="w-full">
        <span class="inline-flex items-center"><i class="fa-solid fa-bullhorn text-xs mr-2"></i> <strong>SYSTEM UPDATE:</strong> 24x7 Digital Channels & Transfer Desks are fully functional.</span>
        <span class="mx-8 text-slate-300">|</span>
        <span class="inline-flex items-center"><i class="fa-solid fa-percent text-xs mr-2"></i> <strong>PROMO RATES:</strong> Earn up to 7.85% p.a. on newly deposited 1-Year Senior Fixed Reserves.</span>
        <span class="mx-8 text-slate-300">|</span>
        <span class="inline-flex items-center"><i class="fa-solid fa-shield text-xs mr-2"></i> <strong>SECURITY ADVISORY:</strong> DCL Bank will never ask for your authentication parameters via text or phone calls.</span>
        <span class="mx-8 text-slate-300">|</span>
        <span class="inline-flex items-center"><i class="fa-solid fa-award text-xs mr-2"></i> ★ Trusted by over 2.5 Million retail and enterprise customers nationwide.</span>
      </marquee>
    </div>

    <div class="space-y-6">
      <div class="flex items-center justify-between border-b border-slate-200 pb-2">
        <h2 class="brand-text-solid text-sm font-black uppercase tracking-widest">Why Choose DCL Bank?</h2>
        <span class="text-slate-300 text-xs uppercase font-bold tracking-wider hidden sm:inline">Platform Standards</span>
      </div>
      
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-6">
        <!-- Card 1 -->
        <div class="bg-slate-900 border border-slate-800 p-6 rounded-2xl shadow-xl relative overflow-hidden group transition-all duration-300 hover:-translate-y-2 hover:border-[#971B4E] hover:shadow-2xl hover:shadow-maroon-950/20 text-left">
          <div class="absolute -right-4 -bottom-4 text-slate-800/20 text-7xl font-black select-none pointer-events-none group-hover:scale-110 transition-transform">01</div>
          <div class="w-12 h-12 rounded-xl brand-bg-solid text-white flex items-center justify-center text-lg mb-6 shadow-lg shadow-maroon-950/50">
            <i class="fa-solid fa-shield-halved"></i>
          </div>
          <h4 class="font-extrabold text-white text-sm tracking-wide">Bank-Level Security</h4>
          <p class="text-slate-400 text-xs mt-3 leading-relaxed">Advanced biometric schemas to seamlessly protect your liquid capital balance portfolios.</p>
        </div>
        <!-- Card 2 -->
        <div class="bg-slate-900 border border-slate-800 p-6 rounded-2xl shadow-xl relative overflow-hidden group transition-all duration-300 hover:-translate-y-2 hover:border-[#971B4E] hover:shadow-2xl hover:shadow-maroon-950/20 text-left">
          <div class="absolute -right-4 -bottom-4 text-slate-800/20 text-7xl font-black select-none pointer-events-none group-hover:scale-110 transition-transform">02</div>
          <div class="w-12 h-12 rounded-xl brand-bg-solid text-white flex items-center justify-center text-lg mb-6 shadow-lg shadow-maroon-950/50">
            <i class="fa-solid fa-bolt"></i>
          </div>
          <h4 class="font-extrabold text-white text-sm tracking-wide">Instant Processing</h4>
          <p class="text-slate-400 text-xs mt-3 leading-relaxed">Experience high-performance, real-time clearing speeds across standard nodes.</p>
        </div>
        <!-- Card 3 -->
        <div class="bg-slate-900 border border-slate-800 p-6 rounded-2xl shadow-xl relative overflow-hidden group transition-all duration-300 hover:-translate-y-2 hover:border-[#971B4E] hover:shadow-2xl hover:shadow-maroon-950/20 text-left">
          <div class="absolute -right-4 -bottom-4 text-slate-800/20 text-7xl font-black select-none pointer-events-none group-hover:scale-110 transition-transform">03</div>
          <div class="w-12 h-12 rounded-xl brand-bg-solid text-white flex items-center justify-center text-lg mb-6 shadow-lg shadow-maroon-950/50">
            <i class="fa-solid fa-earth-americas"></i>
          </div>
          <h4 class="font-extrabold text-white text-sm tracking-wide">Banking Anywhere</h4>
          <p class="text-slate-400 text-xs mt-3 leading-relaxed">Access your encrypted dashboard metrics instantly from any endpoint worldwide.</p>
        </div>
        <!-- Card 4 -->
        <div class="bg-slate-900 border border-slate-800 p-6 rounded-2xl shadow-xl relative overflow-hidden group transition-all duration-300 hover:-translate-y-2 hover:border-[#971B4E] hover:shadow-2xl hover:shadow-maroon-950/20 text-left">
          <div class="absolute -right-4 -bottom-4 text-slate-800/20 text-7xl font-black select-none pointer-events-none group-hover:scale-110 transition-transform">04</div>
          <div class="w-12 h-12 rounded-xl brand-bg-solid text-white flex items-center justify-center text-lg mb-6 shadow-lg shadow-maroon-950/50">
            <i class="fa-solid fa-percent"></i>
          </div>
          <h4 class="font-extrabold text-white text-sm tracking-wide">Yield Maximization</h4>
          <p class="text-slate-400 text-xs mt-3 leading-relaxed">Secure higher performance yields with premium tier investment packages.</p>
        </div>
        <!-- Card 5 -->
        <div class="bg-slate-900 border border-slate-800 p-6 rounded-2xl shadow-xl relative overflow-hidden group transition-all duration-300 hover:-translate-y-2 hover:border-[#971B4E] hover:shadow-2xl hover:shadow-maroon-950/20 text-left col-span-1 sm:col-span-2 lg:col-span-1">
          <div class="absolute -right-4 -bottom-4 text-slate-800/20 text-7xl font-black select-none pointer-events-none group-hover:scale-110 transition-transform">05</div>
          <div class="w-12 h-12 rounded-xl brand-bg-solid text-white flex items-center justify-center text-lg mb-6 shadow-lg shadow-maroon-950/50">
            <i class="fa-solid fa-headset"></i>
          </div>
          <h4 class="font-extrabold text-white text-sm tracking-wide">24×7 Live Desk</h4>
          <p class="text-slate-400 text-xs mt-3 leading-relaxed">Our institutional client support lines monitor channels continuously.</p>
        </div>
      </div>
    </div>

    <% if(u != null && u.getRole().equalsIgnoreCase("customer")) { %>
      <div class="space-y-5">
        <h3 class="text-slate-400 text-[10px] uppercase tracking-widest font-black px-1">Authorized Operations Hub</h3>
        <div class="grid grid-cols-2 md:grid-cols-4 gap-6">
          <a href="account_request.jsp" class="bg-white border border-slate-200/80 p-6 rounded-xl shadow-sm hover:border-purple-400 hover:shadow-md transition-all duration-300 hover:-translate-y-0.5 group text-left block">
            <div class="w-11 h-11 rounded-lg brand-light-bg brand-text-solid flex items-center justify-center text-base shadow-inner group-hover:scale-105 transition-transform">
              <i class="fa-solid fa-user-plus"></i>
            </div>
            <h4 class="font-bold text-slate-900 text-sm mt-4 tracking-wide">Open Account</h4>
            <p class="text-slate-400 text-xs mt-1 leading-normal">Create and deploy a dynamic liquid balance matrix.</p>
          </a>
          <a href="moneytransfer.jsp" class="bg-white border border-slate-200/80 p-6 rounded-xl shadow-sm hover:border-purple-400 hover:shadow-md transition-all duration-300 hover:-translate-y-0.5 group text-left block">
            <div class="w-11 h-11 rounded-lg brand-light-bg brand-text-solid flex items-center justify-center text-base shadow-inner group-hover:scale-105 transition-transform">
              <i class="fa-solid fa-money-bill-transfer"></i>
            </div>
            <h4 class="font-bold text-slate-900 text-sm mt-4 tracking-wide">Fund Transfer</h4>
            <p class="text-slate-400 text-xs mt-1 leading-normal">Safely dispatch liquidity across institutional clearing lines.</p>
          </a>
          <a href="my_accounts.jsp" class="bg-white border border-slate-200/80 p-6 rounded-xl shadow-sm hover:border-purple-400 hover:shadow-md transition-all duration-300 hover:-translate-y-0.5 group text-left block">
            <div class="w-11 h-11 rounded-lg brand-light-bg brand-text-solid flex items-center justify-center text-base shadow-inner group-hover:scale-105 transition-transform">
              <i class="fa-solid fa-receipt"></i>
            </div>
            <h4 class="font-bold text-slate-900 text-sm mt-4 tracking-wide">Check Balance</h4>
            <p class="text-slate-400 text-xs mt-1 leading-normal">Audit secure transactional account balance statement logs.</p>
          </a>
          <a href="user_db.jsp" class="bg-white border border-slate-200/80 p-6 rounded-xl shadow-sm hover:border-purple-400 hover:shadow-md transition-all duration-300 hover:-translate-y-0.5 group text-left block">
            <div class="w-11 h-11 rounded-lg brand-light-bg brand-text-solid flex items-center justify-center text-base shadow-inner group-hover:scale-105 transition-transform">
              <i class="fa-solid fa-table-columns"></i>
            </div>
            <h4 class="font-bold text-slate-900 text-sm mt-4 tracking-wide">User Dashboard</h4>
            <p class="text-slate-400 text-xs mt-1 leading-normal">Configure centralized banking profiles and platform settings.</p>
          </a>
        </div>
      </div>
    <% } %>

    <div class="space-y-4 overflow-hidden relative">
      <div class="flex justify-between items-center px-1">
        <h3 class="text-slate-400 text-[10px] uppercase tracking-widest font-black">Strategic Product Portfolio</h3>
        <span class="brand-text-solid text-xs"><i class="fa-solid fa-circle-nodes animate-pulse"></i></span>
      </div>
      
      <div class="w-full overflow-hidden [mask-image:linear-gradient(to_right,transparent,white_10%,white_90%,transparent)]">
        <div class="animate-marquee-infinite gap-6 py-2">
          <!-- ORIGINAL SET OF CARDS -->
          <div class="w-[320px] md:w-[360px] bg-white border border-slate-200 rounded-xl overflow-hidden shadow-sm shrink-0 transition-all duration-300 hover:border-purple-300 hover:shadow-md">
            <img src="DCL/bankk.png" class="w-full h-40 object-cover border-b border-slate-100">
            <div class="p-4"><h4 class="font-bold text-sm text-slate-800">Advanced Digital Vault</h4><p class="text-xs text-slate-400 mt-1">Multi-factor transaction confirmation security channels.</p></div>
          </div>
          <div class="w-[320px] md:w-[360px] bg-white border border-slate-200 rounded-xl overflow-hidden shadow-sm shrink-0 transition-all duration-300 hover:border-purple-300 hover:shadow-md">
            <img src="DCL/education.png" class="w-full h-40 object-cover border-b border-slate-100">
            <div class="p-4"><h4 class="font-bold text-sm text-slate-800">Knowledge Capital Financing</h4><p class="text-xs text-slate-400 mt-1">Structured educational liquidity loan parameters.</p></div>
          </div>
          <div class="w-[320px] md:w-[360px] bg-white border border-slate-200 rounded-xl overflow-hidden shadow-sm shrink-0 transition-all duration-300 hover:border-purple-300 hover:shadow-md">
            <img src="DCL/agri.png" class="w-full h-40 object-cover border-b border-slate-100">
            <div class="p-4"><h4 class="font-bold text-sm text-slate-800">Agricultural Infrastructure</h4><p class="text-xs text-slate-400 mt-1">Empowering regional primary supply chains.</p></div>
          </div>
          <div class="w-[320px] md:w-[360px] bg-white border border-slate-200 rounded-xl overflow-hidden shadow-sm shrink-0 transition-all duration-300 hover:border-purple-300 hover:shadow-md">
            <img src="DCL/insurance.png" class="w-full h-40 object-cover border-b border-slate-100">
            <div class="p-4"><h4 class="font-bold text-sm text-slate-800">Enterprise Risk Shield</h4><p class="text-xs text-slate-400 mt-1">Comprehensive tier capital asset protection models.</p></div>
          </div>

          <!-- DUPLICATED CLONE SET FOR SEAMLESS CONTINUOUS LOOP -->
          <div class="w-[320px] md:w-[360px] bg-white border border-slate-200 rounded-xl overflow-hidden shadow-sm shrink-0 transition-all duration-300 hover:border-purple-300 hover:shadow-md">
            <img src="DCL/bankk.png" class="w-full h-40 object-cover border-b border-slate-100">
            <div class="p-4"><h4 class="font-bold text-sm text-slate-800">Advanced Digital Vault</h4><p class="text-xs text-slate-400 mt-1">Multi-factor transaction confirmation security channels.</p></div>
          </div>
          <div class="w-[320px] md:w-[360px] bg-white border border-slate-200 rounded-xl overflow-hidden shadow-sm shrink-0 transition-all duration-300 hover:border-purple-300 hover:shadow-md">
            <img src="DCL/education.png" class="w-full h-40 object-cover border-b border-slate-100">
            <div class="p-4"><h4 class="font-bold text-sm text-slate-800">Knowledge Capital Financing</h4><p class="text-xs text-slate-400 mt-1">Structured educational liquidity loan parameters.</p></div>
          </div>
          <div class="w-[320px] md:w-[360px] bg-white border border-slate-200 rounded-xl overflow-hidden shadow-sm shrink-0 transition-all duration-300 hover:border-purple-300 hover:shadow-md">
            <img src="DCL/agri.png" class="w-full h-40 object-cover border-b border-slate-100">
            <div class="p-4"><h4 class="font-bold text-sm text-slate-800">Agricultural Infrastructure</h4><p class="text-xs text-slate-400 mt-1">Empowering regional primary supply chains.</p></div>
          </div>
          <div class="w-[320px] md:w-[360px] bg-white border border-slate-200 rounded-xl overflow-hidden shadow-sm shrink-0 transition-all duration-300 hover:border-purple-300 hover:shadow-md">
            <img src="DCL/insurance.png" class="w-full h-40 object-cover border-b border-slate-100">
            <div class="p-4"><h4 class="font-bold text-sm text-slate-800">Enterprise Risk Shield</h4><p class="text-xs text-slate-400 mt-1">Comprehensive tier capital asset protection models.</p></div>
          </div>
        </div>
      </div>
    </div>

    <!-- NEW SECTION: DCL UTTHAN COMMUNITY ENGAGEMENT (Inspired by image_8712bc.jpg) -->
    <div class="bg-white border border-slate-200 rounded-2xl overflow-hidden shadow-sm grid grid-cols-1 md:grid-cols-12 min-h-[380px] relative">
      <!-- Graphical Classroom Context Zone (Left Panel) -->
      <div class="md:col-span-5 relative min-h-[260px] md:min-h-auto bg-slate-100">
        <!-- High-quality matching classroom photography asset -->
        <img src="https://images.unsplash.com/photo-1546410531-bb4caa6b424d?auto=format&fit=crop&w=800&q=80" 
             alt="DCL Utthan Community Impact" 
             class="absolute inset-0 w-full h-full object-cover">
        <!-- Blending gradient mask pulling into the clean background content side -->
        <div class="absolute inset-0 bg-gradient-to-t md:bg-gradient-to-r from-transparent via-white/40 to-white md:via-white/20"></div>
      </div>

      <!-- Impact Metrics Dashboard (Right Panel) -->
      <div class="md:col-span-7 p-8 lg:p-12 flex flex-col justify-center items-start bg-gradient-to-br from-white to-purple-50/20 z-10">
        <!-- Program Heading Metadata -->
        <div class="flex items-center gap-2.5 mb-3">
          <div class="w-6 h-6 rounded bg-[#971B4E]/10 flex items-center justify-center text-[#971B4E] text-xs font-bold">
            <i class="fa-solid fa-leaf"></i>
          </div>
          <span class="text-[11px] font-black uppercase tracking-widest text-slate-400">DCL UTTHAN INITIATIVE</span>
        </div>

        <h2 class="text-2xl lg:text-3xl font-extrabold tracking-tight text-slate-900 leading-tight">
          Building a better tomorrow — <br><span class="brand-text-solid">one sustainable step at a time.</span>
        </h2>
        <p class="text-slate-500 text-xs mt-3 leading-relaxed max-w-xl">
          From rural tech literacy foundations to clean energy micro-credits and localized primary education support infrastructures—DCL Utthan is driving structural development across emerging sectors.
        </p>

        <!-- Stat Metrics Grid Block matching layout patterns from image_8712bc.jpg -->
        <div class="grid grid-cols-2 gap-4 mt-6 w-full max-w-lg">
          <div class="bg-white p-4 rounded-xl border border-slate-100 shadow-xs">
            <h4 class="text-xl font-extrabold text-slate-900 tracking-tight">12+ Lakh</h4>
            <p class="text-[10px] font-medium text-slate-400 mt-0.5">Households Assisted</p>
          </div>
          <div class="bg-white p-4 rounded-xl border border-slate-100 shadow-xs">
            <h4 class="text-xl font-extrabold text-slate-900 tracking-tight">10+ Crore</h4>
            <p class="text-[10px] font-medium text-slate-400 mt-0.5">Total Contributions Transferred</p>
          </div>
          <div class="bg-white p-4 rounded-xl border border-slate-100 shadow-xs">
            <h4 class="text-xl font-extrabold text-slate-900 tracking-tight">20+ Lakh</h4>
            <p class="text-[10px] font-medium text-slate-400 mt-0.5">Rural Educators Funded</p>
          </div>
          <div class="bg-white p-4 rounded-xl border border-slate-100 shadow-xs">
            <h4 class="text-xl font-extrabold text-slate-900 tracking-tight">9K+</h4>
            <p class="text-[10px] font-medium text-slate-400 mt-0.5">Regional Districts Reached</p>
          </div>
        </div>

        <div class="mt-6">
          <a href="#" class="brand-bg-solid text-white text-xs font-bold px-6 py-3 rounded-md hover:brightness-110 shadow-sm transition-all inline-flex items-center gap-2">
            Explore Initiatives <i class="fa-solid fa-arrow-right text-[10px]"></i>
          </a>
        </div>
      </div>
    </div>

  </main>

  <!-- FOOTER ARCHITECTURE -->
  <footer class="bg-slate-900 border-t-4 brand-border-solid text-slate-400 text-xs mt-auto">
    <div class="max-w-[1440px] mx-auto px-6 lg:px-16 py-4 border-b border-slate-800 flex flex-wrap gap-x-6 gap-y-2 text-[10px] uppercase tracking-wider font-bold text-slate-500 justify-center lg:justify-start">
      <a href="#" class="hover:text-slate-300 transition-colors">Corporate Directory</a>
      <span>|</span>
      <a href="#" class="hover:text-slate-300 transition-colors">Media Center</a>
      <span>|</span>
      <a href="#" class="hover:text-slate-300 transition-colors">Investor Relations</a>
      <span>|</span>
      <a href="#" class="hover:text-slate-300 transition-colors">Vigilance Policy</a>
    </div>

    <div class="max-w-[1440px] mx-auto px-6 lg:px-16 py-12 grid grid-cols-2 md:grid-cols-4 lg:grid-cols-5 gap-8">
      <div class="space-y-3">
        <h4 class="text-slate-200 text-xs font-bold tracking-wider uppercase">Deposit Matrices</h4>
        <ul class="space-y-2 text-[11px] text-slate-400">
          <li><a href="#" class="hover:text-white transition-colors">Digital Savings Account</a></li>
          <li><a href="#" class="hover:text-white transition-colors">Premium Salary Checking</a></li>
          <li><a href="#" class="hover:text-white transition-colors">Tax Saver Fixed Deposits</a></li>
        </ul>
      </div>

      <div class="space-y-3">
        <h4 class="text-slate-200 text-xs font-bold tracking-wider uppercase">Clearing Desk</h4>
        <ul class="space-y-2 text-[11px] text-slate-400">
          <li><a href="transfer.jsp" class="hover:text-white transition-colors">Instant Fund Transfer</a></li>
          <li><a href="#" class="hover:text-white transition-colors">NEFT Settlement Hub</a></li>
          <li><a href="#" class="hover:text-white transition-colors">RTGS High-Value Grid</a></li>
        </ul>
      </div>

      <div class="space-y-3">
        <h4 class="text-slate-200 text-xs font-bold tracking-wider uppercase">Support Framework</h4>
        <ul class="space-y-2 text-[11px] text-slate-400">
          <li><a href="account_request.jsp" class="hover:text-white transition-colors">New Asset Registration</a></li>
          <li><a href="my_accounts.jsp" class="hover:text-white transition-colors">Real-time Balance Audits</a></li>
          <li><a href="#" class="hover:text-white transition-colors">Report Electronic Fraud</a></li>
        </ul>
      </div>

      <div class="space-y-3">
        <h4 class="text-slate-200 text-xs font-bold tracking-wider uppercase">Security & Legal</h4>
        <ul class="space-y-2 text-[11px] text-slate-400">
          <li><a href="#" class="hover:text-white transition-colors">Anti-Phishing Shield Advisories</a></li>
          <li><a href="#" class="hover:text-white transition-colors">Privacy Framework Policies</a></li>
          <li><a href="#" class="hover:text-white transition-colors">Terms of Platform Carriage</a></li>
        </ul>
      </div>

      <div class="col-span-2 md:col-span-4 lg:col-span-1 space-y-3 bg-slate-950/60 p-4 border border-slate-800 rounded-xl">
        <h4 class="text-slate-200 text-xs font-bold tracking-wider uppercase">Corporate Central</h4>
        <p class="text-[11px] text-slate-500 leading-normal">DCL Institutional Group, Core Tech-Park, Outer Ring Rd, Bengaluru, KA, India.</p>
        <div class="flex gap-3 text-slate-400 text-sm pt-2">
          <i class="fa-brands fa-linkedin hover:text-white cursor-pointer transition-colors"></i>
          <i class="fa-brands fa-x-twitter hover:text-white cursor-pointer transition-colors"></i>
          <i class="fa-brands fa-facebook hover:text-white cursor-pointer transition-colors"></i>
        </div>
      </div>
    </div>

    <div class="bg-slate-950/80 py-4 text-center text-[11px] text-slate-600 border-t border-slate-900 px-6">
      <p class="max-w-4xl mx-auto leading-relaxed">Disclaimer: DCL Bank never solicits sensitive authorization credentials, account keys, or user PIN patterns over digital channels. Please keep your connection lines encrypted at all times.</p>
      <p class="mt-2 text-slate-500">&copy; 2026 DCL Bank Institutional Platform. All Corporate Rights Reserved.</p>
    </div>
  </footer>

</body>
</html>