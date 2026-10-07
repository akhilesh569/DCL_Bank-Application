<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DCL Bank — Login</title>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght=300;400;500;600;700;800&display=swap" rel="stylesheet">
  
  <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>

  <style>
    body {
      font-family: 'Public Sans', sans-serif;
    }
    .brand-bg-solid { background-color: #971B4E; }
    .brand-text-solid { color: #971B4E; }
    .brand-border-solid { border-color: #971B4E; }
    .brand-light-bg { background-color: rgba(151, 27, 78, 0.04); }

    @keyframes systemFadeUp {
      from { opacity: 0; transform: translateY(24px); }
      to { opacity: 1; transform: translateY(0); }
    }
    .animate-system-up {
      animation: systemFadeUp 0.7s cubic-bezier(0.16, 1, 0.3, 1) forwards;
    }
  </style>
</head>

<body class="bg-[#f0f3f8] text-slate-800 min-h-screen flex flex-col justify-between antialiased relative overflow-x-hidden">

  <div class="absolute top-0 left-1/4 w-[600px] h-[600px] bg-purple-200/20 rounded-full blur-3xl pointer-events-none -z-10"></div>
  <div class="absolute bottom-0 right-1/4 w-[500px] h-[500px] bg-rose-100/30 rounded-full blur-3xl pointer-events-none -z-10"></div>

  <header class="w-full max-w-[1440px] mx-auto px-6 lg:px-16 py-6 flex items-center justify-between z-10">
    <div class="flex items-center gap-3">
      <div class="w-10 h-10 rounded-lg brand-bg-solid flex items-center justify-center shadow-md shadow-maroon-900/10">
        <i class="fa-solid fa-building-columns text-white text-lg"></i>
      </div>
      <div class="leading-none">
        <span class="text-xl font-black text-slate-900 tracking-tight block">DCL <span class="brand-text-solid">BANK</span></span>
      </div>
    </div>
    
    <a href="index.jsp" class="text-xs font-bold text-slate-500 hover:text-[#971B4E] flex items-center gap-2 transition-colors bg-white px-3 py-2 rounded-lg border border-slate-200/60 shadow-xs">
      <i class="fa-solid fa-circle-chevron-left text-[11px]"></i> Return to Home Page
    </a>
  </header>

  <main class="flex-grow flex items-center justify-center px-4 py-6 z-10">
    <div class="w-full max-w-5xl bg-slate-900/40 backdrop-blur-xl border border-slate-200/80 rounded-2xl shadow-2xl overflow-hidden grid grid-cols-1 md:grid-cols-12 min-h-[580px] animate-system-up">
      
      <div class="md:col-span-5 bg-slate-950 p-8 lg:p-10 flex flex-col justify-between relative overflow-hidden text-white border-b md:border-b-0 md:border-r border-slate-800/80">
        <div class="absolute inset-0 bg-gradient-to-br from-slate-950 via-slate-900 to-slate-950/90 z-10"></div>
        <img src="DCL/bank_login.png" class="absolute -right-12 -bottom-10 w-72 h-auto object-contain opacity-20 mix-blend-screen pointer-events-none select-none z-10">
        
        <div class="z-20 space-y-4">
          <div class="bg-slate-900 border border-slate-800 text-slate-300 text-[10px] font-bold tracking-widest uppercase px-3 py-1 rounded-md inline-flex items-center gap-1.5 shadow-inner">
            <span class="w-1.5 h-1.5 rounded-full brand-bg-solid animate-ping"></span> Real-time Node Connection
          </div>
          <h1 class="text-3xl font-extrabold tracking-tight leading-tight">
            <span class="brand-text-solid">Identity Gateway.</span>
          </h1>
          <p class="text-slate-400 text-xs leading-relaxed max-w-xs">
            Unlock clearing desks, initialize balance ledger audits, and manage institutional liquidity profiles securely.
          </p>
        </div>

        <div class="grid grid-cols-1 gap-3 mt-10 md:mt-0 z-20">
          <div class="flex items-center gap-3.5 p-3.5 bg-slate-900/70 border border-slate-800/60 rounded-xl shadow-xs">
            <div class="w-8 h-8 rounded-lg brand-bg-solid text-white flex items-center justify-center text-sm shadow-sm">
              <i class="fa-solid fa-fingerprint"></i>
            </div>
            <div>
              <h4 class="text-xs font-bold text-slate-200">Session Encryption</h4>
              <p class="text-[10px] text-slate-500">256-bit point-to-point hardware authentication.</p>
            </div>
          </div>

          <div class="flex items-center gap-3.5 p-3.5 bg-slate-900/70 border border-slate-800/60 rounded-xl shadow-xs">
            <div class="w-8 h-8 rounded-lg brand-bg-solid text-white flex items-center justify-center text-sm shadow-sm">
              <i class="fa-solid fa-shield-halved"></i>
            </div>
            <div>
              <h4 class="text-xs font-bold text-slate-200">Vault Level Integrity</h4>
              <p class="text-[10px] text-slate-500">Continuous risk protection layer actively monitored.</p>
            </div>
          </div>

          <div class="flex items-center gap-3.5 p-3.5 bg-slate-900/70 border border-slate-800/60 rounded-xl shadow-xs">
            <div class="w-8 h-8 rounded-lg brand-bg-solid text-white flex items-center justify-center text-sm shadow-sm">
              <i class="fa-solid fa-headset"></i>
            </div>
            <div>
              <h4 class="text-xs font-bold text-slate-200">Help Desk</h4>
              <p class="text-[10px] text-slate-500">Immediate operations assistance framework online.</p>
            </div>
          </div>
        </div>
      </div>

      <div class="md:col-span-7 p-8 lg:p-12 flex flex-col justify-center bg-white/80 backdrop-blur-md">
        <div class="mb-8">
          <h2 class="text-2xl font-extrabold text-slate-900 tracking-tight">Identity Verification</h2>
          <p class="text-slate-400 text-xs mt-1">Please provide your registered operational account parameters.</p>
        </div>

        <% String msg = (String)request.getAttribute("error"); %>
        <% if(msg != null){ %>
          <div id="msg" class="bg-rose-50 border border-rose-200 text-rose-700 text-xs p-3.5 rounded-xl mb-6 font-semibold flex items-center gap-2.5 shadow-xs">
            <i class="fa-solid fa-circle-exclamation text-sm text-rose-500"></i> <%= msg %>
          </div>
        <% } %>
        
        <% String msg2 = (String)request.getAttribute("sucess"); %>
        <% if(msg2 != null){ %>
          <div id="msg2" class="bg-emerald-50 border border-emerald-200 text-emerald-700 text-xs p-3.5 rounded-xl mb-6 font-semibold flex items-center gap-2.5 shadow-xs">
            <i class="fa-solid fa-circle-check text-sm text-emerald-500"></i> <%= msg2 %>
          </div>
        <% } %>

        <form action="login" method="POST" class="space-y-5">
          <div class="space-y-1.5">
            <label class="text-[11px] font-bold text-slate-400 uppercase tracking-wider">Access Mail</label>
            <div class="border border-slate-200 focus-within:border-[#971B4E] focus-within:ring-2 focus-within:ring-[#971B4E]/10 px-4 py-3 rounded-lg flex items-center gap-3 bg-white transition-all shadow-xs">
              <i class="fa-solid fa-envelope text-slate-400 text-sm w-4 text-center"></i>
              <input class="w-full text-sm outline-none bg-transparent text-slate-800 placeholder-slate-400 font-medium"
                     type="email"
                     name="mail"
                     placeholder="name@institution.com"
                     required>
            </div>
          </div>

          <div class="space-y-1.5">
            <div class="flex items-center justify-between">
              <label class="text-[11px] font-bold text-slate-400 uppercase tracking-wider">Secure Password</label>
              <a href="password.jsp" class="text-xs font-bold brand-text-solid hover:underline">Forgot Access Password?</a>
            </div>
            <div class="border border-slate-200 focus-within:border-[#971B4E] focus-within:ring-2 focus-within:ring-[#971B4E]/10 px-4 py-3 rounded-lg flex items-center gap-3 bg-white transition-all shadow-xs">
              <i class="fa-solid fa-lock text-slate-400 text-sm w-4 text-center"></i>
              <input class="w-full text-sm outline-none bg-transparent text-slate-800 placeholder-slate-400 font-medium"
                     type="password"
                     name="password"
                     placeholder="••••••••••••"
                     required>
            </div>
          </div>

          <button class="w-full brand-bg-solid text-white text-sm font-bold py-3.5 rounded-lg shadow-md shadow-maroon-900/10 hover:brightness-110 active:scale-[0.99] transition-all cursor-pointer mt-2"
                  type="submit">
            login
          </button>
        </form>

        <div class="mt-8 pt-6 border-t border-slate-200/60 text-center text-xs font-medium text-slate-500">
          New system endpoint? 
          <a class="brand-text-solid font-bold hover:underline ml-1" href="register.jsp">Register Credentials</a>
        </div>
      </div>

    </div>
  </main>

  <footer class="w-full bg-slate-900 text-center py-4 text-[11px] text-slate-500 px-6 border-t border-slate-800">
    <p>&copy; 2026 DCL Bank Groups Inc. Advanced cryptographic parameters applied. 256-bit terminal compliance.</p>
  </footer>

  <script>
    let m = document.getElementById("msg");
    if (m) {
      setTimeout(() => {
        m.style.display = 'none';
      }, 2000);
    }

    let n = document.getElementById("msg2");
    if (n) {
      setTimeout(() => {
        n.style.display = 'none';
      }, 2000);
    }
  </script>

</body>
</html>