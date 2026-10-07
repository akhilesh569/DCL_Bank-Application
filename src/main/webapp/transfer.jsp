<%@page import="com.bank.dao.impl.AccountDAOImpl"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="com.bank.dto.Account"%>
<%@page import="java.util.List"%>
<%@page import="com.bank.dao.AccountDAO"%>
<%@page import="com.bank.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DCL Bank — Fund Transfer Desk</title>

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
<%User u = (User) session.getAttribute("user");%>
<%if(u != null){%>

  <div class="absolute top-0 right-1/4 w-[600px] h-[600px] bg-purple-200/20 rounded-full blur-3xl pointer-events-none -z-10"></div>
  <div class="absolute bottom-0 left-1/4 w-[500px] h-[500px] bg-rose-100/30 rounded-full blur-3xl pointer-events-none -z-10"></div>

  <!-- Top Navigation Header -->
  <header class="w-full max-w-[1440px] mx-auto px-6 lg:px-16 py-6 flex items-center justify-between z-10">
    <div class="flex items-center gap-3">
      <div class="w-10 h-10 rounded-lg brand-bg-solid flex items-center justify-center shadow-md">
        <i class="fa-solid fa-building-columns text-white text-lg"></i>
      </div>
      <div class="leading-none">
        <span class="text-xl font-black text-slate-900 tracking-tight block">DCL <span class="brand-text-solid">BANK</span></span>
        <span class="text-[10px] font-bold text-slate-400 tracking-widest uppercase block mt-0.5">Transfer Portal</span>
      </div>
    </div>
    
    <a href="moneytransfer.jsp" class="text-xs font-bold text-slate-500 hover:text-[#971B4E] flex items-center gap-2 transition-colors bg-white px-3 py-2 rounded-lg border border-slate-200/60 shadow-xs">
      <i class="fa-solid fa-arrow-left text-[11px]"></i> Back to Transfer Menu
    </a>
  </header>

  <!-- Main Workspace Layout Grid -->
  <main class="flex-grow flex items-center justify-center px-4 py-6 z-10">
    <div class="w-full max-w-5xl bg-slate-900/40 backdrop-blur-xl border border-slate-200/80 rounded-2xl shadow-2xl overflow-hidden grid grid-cols-1 md:grid-cols-12 min-h-[580px] animate-system-up">
      
      <!-- Left Side Context Card -->
      <div class="md:col-span-5 bg-slate-950 p-8 lg:p-10 flex flex-col justify-between relative overflow-hidden text-white border-b md:border-b-0 md:border-r border-slate-800/80">
        <div class="absolute inset-0 bg-gradient-to-br from-slate-950 via-slate-900 to-slate-950/90 z-10"></div>
        
        <!-- Large background icon -->
        <div class="absolute inset-0 flex items-center justify-center opacity-5 select-none pointer-events-none z-10">
          <i class="fa-solid fa-right-left text-[280px]"></i>
        </div>
        
        <!-- Top Title block -->
        <div class="z-20 space-y-4">
          <div class="bg-slate-900 border border-slate-800 text-slate-300 text-[10px] font-bold tracking-wider uppercase px-3 py-1 rounded-md inline-flex items-center gap-1.5 shadow-inner">
            <span class="w-1.5 h-1.5 rounded-full brand-bg-solid animate-pulse"></span> Secure Wire Connection
          </div>
          <h1 class="text-3xl font-extrabold tracking-tight leading-tight">
            Transfer Money <br>Between <span class="brand-text-solid">Accounts.</span>
          </h1>
          <p class="text-slate-400 text-xs leading-relaxed max-w-xs">
            Send money safely to another account anywhere instantly using our direct processing networks.
          </p>
        </div>

        <!-- Lower Matrix Grid Indicators -->
        <div class="grid grid-cols-3 gap-2 bg-slate-900/60 p-4 border border-slate-800/80 rounded-xl z-20">
          <div class="text-center">
            <i class="fa-solid fa-shield-halved text-lg brand-text-solid"></i>
            <h4 class="text-[11px] font-bold text-slate-200 mt-1">Secure</h4>
            <p class="text-[9px] text-slate-500">End-to-End</p>
          </div>
          <div class="text-center border-x border-slate-800/80">
            <i class="fa-solid fa-bolt text-lg text-amber-400"></i>
            <h4 class="text-[11px] font-bold text-slate-200 mt-1">Fast</h4>
            <p class="text-[9px] text-slate-500">Direct Credit</p>
          </div>
          <div class="text-center">
            <i class="fa-solid fa-headset text-lg text-teal-400"></i>
            <h4 class="text-[11px] font-bold text-slate-200 mt-1">24/7</h4>
            <p class="text-[9px] text-slate-500">Live Support</p>
          </div>
        </div>
      </div>

      <!-- Right Side Input Panel -->
      <div class="md:col-span-7 p-8 lg:p-12 flex flex-col justify-center bg-white/80 backdrop-blur-md">
        
        <div class="mb-5">
          <h2 class="text-2xl font-extrabold text-slate-900 tracking-tight">Transfer Money</h2>
          <p class="text-slate-400 text-xs mt-1">Please enter the correct transaction details to begin the wire transfer.</p>
        </div>
        
        <% String msg = (String)request.getAttribute("error"); %>
        <% if(msg != null){ %>
          <div id="msg" class="bg-rose-50 border border-rose-200 text-rose-700 text-xs p-3.5 rounded-xl mb-6 font-semibold flex items-center gap-2.5 shadow-xs">
            <i class="fa-solid fa-circle-exclamation text-sm text-rose-500"></i> <%= msg %>
          </div>
        <% } %>

        <form action="transfer" method="POST" class="space-y-4">

          <!-- Dropdown Field: Source Account -->
          <div class="space-y-1">
            <div class="flex justify-between items-center">
              <label class="text-[10px] font-bold text-slate-400 uppercase tracking-wider">Debit From Account</label>
            </div>
              
               <%
                AccountDAO adao = new AccountDAOImpl();
                List<Account> allAcc = adao.getAllAccounts();
                List<Account> userAcc = allAcc.stream().filter(a->a.getUser_id() == u.getUser_id() && a.getStatus().equalsIgnoreCase("active")).collect(Collectors.toList());
         
                %>
                
            <div class="border border-slate-200 focus-within:border-[#971B4E] focus-within:ring-2 focus-within:ring-[#971B4E]/10 px-4 py-2.5 rounded-lg flex items-center gap-3 bg-white transition-all shadow-xs">
              <i class="fa-solid fa-building-columns text-slate-400 text-xs w-4 text-center"></i>
              <select name="from_account" class="w-full text-sm outline-none bg-transparent text-slate-700 font-medium bg-white cursor-pointer" required>
                <option value="" class="text-slate-400">Select Source Account</option>
                <%for(Account a : userAcc){%>
                <option value="<%=a.getAcc_id()%>"><%=a.getAcc_no() %> - <%=a.getAcc_type()%> Account</option>
                <%}%>
              </select>
            </div>
          </div>

          <!-- Input Field: Beneficiary Account Target -->
          <div class="space-y-1">
            <label class="text-[10px] font-bold text-slate-400 uppercase tracking-wider">Beneficiary Account Number</label>
            <div class="border border-slate-200 focus-within:border-[#971B4E] focus-within:ring-2 focus-within:ring-[#971B4E]/10 px-4 py-2.5 rounded-lg flex items-center gap-3 bg-white transition-all shadow-xs">
              <i class="fa-solid fa-user-plus text-slate-400 text-xs w-4 text-center"></i>
              <input class="w-full text-sm outline-none bg-transparent text-slate-800 placeholder-slate-400 font-medium" 
                     type="text"
                     name="to_account"
                     placeholder="Enter receiver account number"
                     required>
            </div>
          </div>

          <!-- Input Field: Confirm Beneficiary Account Target -->
          <div class="space-y-1">
            <label class="text-[10px] font-bold text-slate-400 uppercase tracking-wider">Confirm Account Number</label>
            <div class="border border-slate-200 focus-within:border-[#971B4E] focus-within:ring-2 focus-within:ring-[#971B4E]/10 px-4 py-2.5 rounded-lg flex items-center gap-3 bg-white transition-all shadow-xs">
              <i class="fa-solid fa-circle-check text-slate-400 text-xs w-4 text-center"></i>
              <input class="w-full text-sm outline-none bg-transparent text-slate-800 placeholder-slate-400 font-medium" 
                     type="text"
                     name="confirm_account"
                     placeholder="Re-enter receiver account number"
                     required>
            </div>
          </div>

          <!-- Input Field: Money Transfer Amount -->
          <div class="space-y-1">
            <label class="text-[10px] font-bold text-slate-400 uppercase tracking-wider">Transfer Amount</label>
            <div class="border border-slate-200 focus-within:border-[#971B4E] focus-within:ring-2 focus-within:ring-[#971B4E]/10 px-4 py-2.5 rounded-lg flex items-center gap-3 bg-white transition-all shadow-xs">
              <span class="text-slate-400 font-bold text-xs w-4 text-center">₹</span>
              <input class="w-full text-sm outline-none bg-transparent text-slate-800 placeholder-slate-400 font-semibold" 
                     type="number"
                     name="amount"
                     placeholder="Enter amount"
                     min="1"
                     required>
            </div>
          </div>

          <!-- Dropdown Field: Payment Mode Selection -->
          <div class="space-y-1">
            <label class="text-[10px] font-bold text-slate-400 uppercase tracking-wider">Transfer Network Mode</label>
            <div class="border border-slate-200 focus-within:border-[#971B4E] focus-within:ring-2 focus-within:ring-[#971B4E]/10 px-4 py-2.5 rounded-lg flex items-center gap-3 bg-white transition-all shadow-xs">
              <i class="fa-solid fa-circle-nodes text-slate-400 text-xs w-4 text-center"></i>
              <select name="mode" class="w-full text-sm outline-none bg-transparent text-slate-700 font-medium bg-white cursor-pointer" required>
                <option value="" class="text-slate-400">Select Mode</option>
                <option value="neft">NEFT (Standard Batch)</option>
                <option value="rtgs">RTGS (High Value Wire)</option>
                <option value="upi">UPI (Instant Link)</option>
              </select>
            </div>
          </div>

          <!-- Input Field: Transaction Remarks -->
         

          <!-- Navigation Action Button Controls -->
          <div class="flex flex-col sm:flex-row gap-3 pt-4 mt-2">
            <button class="w-full order-1 sm:order-2 brand-bg-solid text-white text-sm font-bold py-3 rounded-lg shadow-md hover:brightness-110 active:scale-[0.99] transition-all cursor-pointer flex items-center justify-center gap-2" 
                    type="submit">
              <i class="fa-solid fa-paper-plane text-xs"></i> Proceed to Transfer
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

  <footer class="w-full bg-slate-900 text-center py-4 text-[11px] text-slate-500 px-6 border-t border-slate-800">
    <p>&copy; 2026 DCL Bank Groups Inc. Double-check all receiver account info carefully before confirming payment.</p>
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