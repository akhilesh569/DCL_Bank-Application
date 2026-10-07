<%@page import="java.util.stream.Collectors"%>
<%@page import="com.bank.dto.Account"%>
<%@page import="com.bank.dao.impl.AccountDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.bank.dao.AccountDAO"%>
<%@page import="com.bank.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DCL Bank — Cash Debit Desk</title>

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
<%User u = (User) session.getAttribute("user");%>
<%if(u != null){%>

  <!-- Background depth lights to fill layout empty spaces seamlessly -->
  <div class="absolute top-0 right-1/4 w-[600px] h-[600px] bg-amber-100/20 rounded-full blur-3xl pointer-events-none -z-10"></div>
  <div class="absolute bottom-0 left-1/4 w-[500px] h-[500px] bg-rose-100/30 rounded-full blur-3xl pointer-events-none -z-10"></div>

  <!-- Top Navigation Header -->
  <header class="w-full max-w-[1440px] mx-auto px-6 lg:px-16 py-6 flex items-center justify-between z-10">
    <div class="flex items-center gap-3">
      <div class="w-10 h-10 rounded-lg brand-bg-solid flex items-center justify-center shadow-md">
        <i class="fa-solid fa-building-columns text-white text-lg"></i>
      </div>
      <div class="leading-none">
        <span class="text-xl font-black text-slate-900 tracking-tight block">DCL <span class="brand-text-solid">BANK</span></span>
        <span class="text-[10px] font-bold text-slate-400 tracking-widest uppercase block mt-0.5">Withdraw Portal</span>
      </div>
    </div>
    
    <a href="moneytransfer.jsp" class="text-xs font-bold text-slate-500 hover:text-[#971B4E] flex items-center gap-2 transition-colors bg-white px-3 py-2 rounded-lg border border-slate-200/60 shadow-xs">
      <i class="fa-solid fa-arrow-left text-[11px]"></i> Back to Transfer Menu
    </a>
  </header>

  <!-- Main Security Workspace Container -->
  <main class="flex-grow flex items-center justify-center px-4 py-6 z-10">
    <div class="w-full max-w-5xl bg-slate-900/40 backdrop-blur-xl border border-slate-200/80 rounded-2xl shadow-2xl overflow-hidden grid grid-cols-1 md:grid-cols-12 min-h-[540px] animate-system-up">
      
      <!-- Left Presentation Sidebar Layout Panel -->
      <div class="md:col-span-5 bg-slate-950 p-8 lg:p-10 flex flex-col justify-between relative overflow-hidden text-white border-b md:border-b-0 md:border-r border-slate-800/80">
        <div class="absolute inset-0 bg-gradient-to-br from-slate-950 via-slate-900 to-slate-950/90 z-10"></div>
        
        <!-- Large backdrop pattern layout block icon -->
        <div class="absolute inset-0 flex items-center justify-center opacity-5 select-none pointer-events-none z-10">
          <i class="fa-solid fa-money-bill-transfer text-[240px]"></i>
        </div>
        
        <!-- Sidebar context info cards block -->
        <div class="z-20 space-y-4">
          <div class="bg-slate-900 border border-slate-800 text-slate-300 text-[10px] font-bold tracking-wider uppercase px-3 py-1 rounded-md inline-flex items-center gap-1.5 shadow-inner">
            <span class="w-1.5 h-1.5 rounded-full bg-amber-500 animate-pulse"></span> Instant Debit Route
          </div>
          <h1 class="text-3xl font-extrabold tracking-tight leading-tight">
            Withdraw Money <br>From Your <span class="brand-text-solid">Vault.</span>
          </h1>
          <p class="text-slate-400 text-xs leading-relaxed max-w-xs">
            Initiate seamless currency debits across decentralized ATM clusters or authorized banking desks.
          </p>
        </div>

        <!-- Lower Matrix Grid Indicators -->
        <div class="grid grid-cols-3 gap-2 bg-slate-900/60 p-4 border border-slate-800/80 rounded-xl z-20">
          <div class="text-center">
            <i class="fa-solid fa-shield-halved text-lg brand-text-solid"></i>
            <h4 class="text-[11px] font-bold text-slate-200 mt-1">Secure</h4>
            <p class="text-[9px] text-slate-500">Protected</p>
          </div>
          <div class="text-center border-x border-slate-800/80">
            <i class="fa-solid fa-wallet text-lg text-amber-400"></i>
            <h4 class="text-[11px] font-bold text-slate-200 mt-1">Balance</h4>
            <p class="text-[9px] text-slate-500">Real-time Check</p>
          </div>
          <div class="text-center">
            <i class="fa-solid fa-headset text-lg text-teal-400"></i>
            <h4 class="text-[11px] font-bold text-slate-200 mt-1">24/7</h4>
            <p class="text-[9px] text-slate-500">Live Desk</p>
          </div>
        </div>
      </div>

      <!-- Right Panel Input Dashboard Workspace -->
      <div class="md:col-span-7 p-8 lg:p-12 flex flex-col justify-center bg-white/80 backdrop-blur-md">
        
        <div class="mb-6">
          <h2 class="text-2xl font-extrabold text-slate-900 tracking-tight">Withdraw Money</h2>
          <p class="text-slate-400 text-xs mt-1">Configure your settlement source channel parameters below to continue.</p>
        </div>
        
         <% String msg = (String)request.getAttribute("error"); %>
        <% if(msg != null){ %>
          <div id="msg" class="bg-rose-50 border border-rose-200 text-rose-700 text-xs p-3.5 rounded-xl mb-6 font-semibold flex items-center gap-2.5 shadow-xs">
            <i class="fa-solid fa-circle-exclamation text-sm text-rose-500"></i> <%= msg %>
          </div>
        <% } %>

        <form action="withdraw" method="POST" class="space-y-5">

          <!-- Dropdown Field Selector: Source Account Identification -->
          <div class="space-y-1">
           <%
                AccountDAO adao = new AccountDAOImpl();
                List<Account> allAcc = adao.getAllAccounts();
                List<Account> userAcc = allAcc.stream().filter(a->a.getUser_id() == u.getUser_id() && a.getStatus().equalsIgnoreCase("active")).collect(Collectors.toList());
         
                %>
            <div class="flex justify-between items-center">
              <label class="text-[10px] font-bold text-slate-400 uppercase tracking-wider">Source Account</label>
              <!-- <span class="text-xs font-bold text-emerald-600 bg-emerald-50 px-2 py-0.5 rounded border border-emerald-100 shadow-inner">Balance: ₹ 1,25,430.50</span> -->
            </div>
            <div class="border border-slate-200 focus-within:border-[#971B4E] focus-within:ring-2 focus-within:ring-[#971B4E]/10 px-4 py-2.5 rounded-lg flex items-center gap-3 bg-white transition-all shadow-xs">
              <i class="fa-solid fa-building-columns text-slate-400 text-xs w-4 text-center"></i>
             
              <select name="account_id" class="w-full text-sm outline-none bg-transparent text-slate-700 font-medium bg-white cursor-pointer" required>
                <option value="" class="text-slate-400">Select Account</option>
                <%for(Account a : userAcc){%>
                <option value="<%=a.getAcc_id()%>"><%=a.getAcc_no() %> - <%=a.getAcc_type()%> Account</option>
                <%}%>
              </select>
            </div>
          </div>

          <!-- Input Field: Cash Amount Definition Block -->
          <div class="space-y-1">
            <label class="text-[10px] font-bold text-slate-400 uppercase tracking-wider">Debit Amount</label>
            <div class="border border-slate-200 focus-within:border-[#971B4E] focus-within:ring-2 focus-within:ring-[#971B4E]/10 px-4 py-2.5 rounded-lg flex items-center gap-3 bg-white transition-all shadow-xs">
              <span class="text-slate-400 font-bold text-xs w-4 text-center">₹</span>
              <input class="w-full text-sm outline-none bg-transparent text-slate-800 placeholder-slate-400 font-semibold" 
                     type="number"
                     name="amount"
                     placeholder="Enter amount to withdraw"
                     min="1"
                     required>
            </div>
          </div>

          <!-- Dropdown Field: Payment Mode Selection Block -->
          <div class="space-y-1">
            <label class="text-[10px] font-bold text-slate-400 uppercase tracking-wider">Payment Processing Mode</label>
            <div class="border border-slate-200 focus-within:border-[#971B4E] focus-within:ring-2 focus-within:ring-[#971B4E]/10 px-4 py-2.5 rounded-lg flex items-center gap-3 bg-white transition-all shadow-xs">
              <i class="fa-solid fa-circle-nodes text-slate-400 text-xs w-4 text-center"></i>
              <select name="mode" class="w-full text-sm outline-none bg-transparent text-slate-700 font-medium bg-white cursor-pointer" required>
                <option value="" class="text-slate-400">Select Mode</option>
                <option value="ATM">ATM Network Link</option>
                <option value="Cash">Counter Cash Delivery</option>
              </select>
            </div>
          </div>

          <!-- Layout Control Button Matrices -->
          <div class="flex flex-col sm:flex-row gap-3 pt-4 mt-2">
            <button class="w-full order-1 sm:order-2 brand-bg-solid text-white text-sm font-bold py-3 rounded-lg shadow-md hover:brightness-110 active:scale-[0.99] transition-all cursor-pointer flex items-center justify-center gap-2" 
                    type="submit">
              <i class="fa-solid fa-money-bill-wave text-xs"></i> Confirm Withdrawal
            </button>
            
            <a href="moneytransfer.jsp" 
               class="w-full order-2 sm:order-1 bg-slate-100 hover:bg-slate-200 text-slate-600 hover:text-slate-800 text-sm font-bold py-3 rounded-lg border border-slate-200 transition-all text-center flex items-center justify-center gap-2">
               Cancel
            </a>
          </div>

        </form>
      </div>

    </div>
  </main>

  <!-- Simple Footer Disclosure -->
  <footer class="w-full bg-slate-900 text-center py-4 text-[11px] text-slate-500 px-6 border-t border-slate-800">
    <p>&copy; 2026 DCL Bank Groups Inc. Always audit ATM vault logs before closing your browser sessions.</p>
  </footer>
<%} else {%>
<%request.setAttribute("error", "session already expired");%>
<%request.getRequestDispatcher("login.jsp").forward(request, response);%>
<%}%>


 <script>
    let m = document.getElementById("msg");
    if (m) {
      setTimeout(() => {
        m.style.display = 'none';
      }, 2000);
    }
  </script>
</body>
</html>