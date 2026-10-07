<%@page import="java.util.stream.Collectors"%>
<%@page import="com.bank.dto.Account"%>
<%@page import="java.util.List"%>
<%@page import="com.bank.dao.impl.AccountDAOImpl"%>
<%@page import="com.bank.dao.AccountDAO"%>
<%@page import="com.bank.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DCL Bank — Deposit Money</title>

  <!-- FontAwesome Icons & Clean Typography -->
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

  <header class="w-full max-w-[1440px] mx-auto px-6 lg:px-16 py-6 flex items-center justify-between z-10">
    <div class="flex items-center gap-3">
      <div class="w-10 h-10 rounded-lg brand-bg-solid flex items-center justify-center shadow-md">
        <i class="fa-solid fa-building-columns text-white text-lg"></i>
      </div>
      <div class="leading-none">
        <span class="text-xl font-black text-slate-900 tracking-tight block">DCL <span class="brand-text-solid">BANK</span></span>
        <span class="text-[10px] font-bold text-slate-400 tracking-widest uppercase block mt-0.5">Transaction Counter</span>
      </div>
    </div>
    
    <a href="moneytransfer.jsp" class="text-xs font-bold text-rose-600 hover:bg-rose-50 px-3 py-2 rounded-lg border border-rose-200 transition-all flex items-center gap-2 shadow-xs bg-white">
      <i class="fa-solid fa-right-from-bracket text-[11px]"></i> Back To Transfer Menu
    </a>
  </header>

  <!-- Main Transaction Layout Grid -->
  <main class="flex-grow flex items-center justify-center px-4 py-6 z-10">
    <div class="w-full max-w-5xl bg-slate-900/40 backdrop-blur-xl border border-slate-200/80 rounded-2xl shadow-2xl overflow-hidden grid grid-cols-1 md:grid-cols-12 min-h-[580px] animate-system-up">
      
      <div class="md:col-span-5 bg-slate-950 p-8 lg:p-10 flex flex-col justify-between relative overflow-hidden text-white border-b md:border-b-0 md:border-r border-slate-800/80">
        <div class="absolute inset-0 bg-gradient-to-br from-slate-950 via-slate-900 to-slate-950/90 z-10"></div>
        
        <div class="absolute inset-0 flex items-center justify-center opacity-5 select-none pointer-events-none z-10">
          <i class="fa-solid fa-vault text-[300px]"></i>
        </div>
        
        <div class="z-20 space-y-4">
          <div class="bg-slate-900 border border-slate-800 text-slate-300 text-[10px] font-bold tracking-wider uppercase px-3 py-1 rounded-md inline-flex items-center gap-1.5 shadow-inner">
            <span class="w-1.5 h-1.5 rounded-full bg-emerald-500 animate-pulse"></span> Encrypted Transaction Channel
          </div>
          <h1 class="text-3xl font-extrabold tracking-tight leading-tight">
            Deposit Funds <br>To Your <span class="brand-text-solid">Accounts.</span>
          </h1>
          <p class="text-slate-400 text-xs leading-relaxed max-w-xs">
            Add money safely into your balance using our multiple real-time local channel integration modules.
          </p>
        </div>

        <div class="grid grid-cols-3 gap-2 bg-slate-900/60 p-4 border border-slate-800/80 rounded-xl z-20">
          <div class="text-center">
            <i class="fa-solid fa-shield-halved text-lg brand-text-solid"></i>
            <h4 class="text-[11px] font-bold text-slate-200 mt-1">Secure</h4>
            <p class="text-[9px] text-slate-500">Fully Protected</p>
          </div>
          <div class="text-center border-x border-slate-800/80">
            <i class="fa-solid fa-bolt text-lg text-amber-400"></i>
            <h4 class="text-[11px] font-bold text-slate-200 mt-1">Instant</h4>
            <p class="text-[9px] text-slate-500">Fast Sync</p>
          </div>
          <div class="text-center">
            <i class="fa-solid fa-headset text-lg text-teal-400"></i>
            <h4 class="text-[11px] font-bold text-slate-200 mt-1">24/7</h4>
            <p class="text-[9px] text-slate-500">Full Support</p>
          </div>
        </div>
      </div>

      <div class="md:col-span-7 p-8 lg:p-12 flex flex-col justify-center bg-white/80 backdrop-blur-md">
        
        <div class="mb-6">
          <h2 class="text-2xl font-extrabold text-slate-900 tracking-tight">Deposit Money</h2>
          <p class="text-slate-400 text-xs mt-1">Select your account parameters below to complete the transfer.</p>
        </div>

        <form action="payment.jsp" method="POST" class="space-y-4">
          
          <div class="space-y-1">
            <label class="text-[10px] font-bold text-slate-400 uppercase tracking-wider">Target Account</label>
            <div class="border border-slate-200 focus-within:border-[#971B4E] focus-within:ring-2 focus-within:ring-[#971B4E]/10 px-4 py-2.5 rounded-lg flex items-center gap-3 bg-white transition-all shadow-xs">
              <i class="fa-solid fa-building-columns text-slate-400 text-xs w-4 text-center"></i>
              <select name="account_id" class="w-full text-sm outline-none bg-transparent text-slate-700 font-medium bg-white cursor-pointer" required>
                <%
                AccountDAO adao = new AccountDAOImpl();
                List<Account> allAcc = adao.getAllAccounts();
                List<Account> userAcc = allAcc.stream().filter(a->a.getUser_id() == u.getUser_id() && a.getStatus().equalsIgnoreCase("active")).collect(Collectors.toList());
                %>
                <option value="" class="text-slate-400">Select Account</option>
                <%for(Account a : userAcc){%>
                <option value="<%=a.getAcc_id()%>"><%=a.getAcc_no() %> - <%=a.getAcc_type()%> Account</option>
                <%}%>
              </select>
            </div>
          </div>
          
          

          <!-- Balance Input Text Field -->
          <div class="space-y-1">
            <label class="text-[10px] font-bold text-slate-400 uppercase tracking-wider">Amount to Deposit (₹)</label>
            <div class="border border-slate-200 focus-within:border-[#971B4E] focus-within:ring-2 focus-within:ring-[#971B4E]/10 px-4 py-2.5 rounded-lg flex items-center gap-3 bg-white transition-all shadow-xs">
              <i class="fa-solid fa-indian-rupee-sign text-slate-400 text-xs w-4 text-center"></i>
              <input class="w-full text-sm outline-none bg-transparent text-slate-800 placeholder-slate-400 font-semibold" 
                     type="number" 
                     name="amount" 
                     placeholder="Enter amount"
                     min="1"
                     required>
            </div>
          </div>

          <!-- Custom Transaction Channel Picker Module -->
          <div class="space-y-2 pt-2">
            <label class="text-[10px] font-bold text-slate-400 uppercase tracking-wider block">Choose Your Payment Mode</label>
            
            <div class="grid grid-cols-1 sm:grid-cols-3 gap-3">
              
              <!-- Option: UPI -->
              <label class="border border-slate-200 rounded-xl p-3 flex items-center gap-3 bg-white hover:border-[#971B4E]/40 transition-all shadow-xs cursor-pointer group">
                <input type="radio" name="mode" value="upi" class="accent-[#971B4E] scale-110" checked>
                <div class="leading-none">
                  <span class="text-xs font-bold text-slate-700 block">UPI</span>
                  <span class="text-[9px] text-slate-400">Instant Code Link</span>
                </div>
              </label>

              <!-- Option: Card -->
              <label class="border border-slate-200 rounded-xl p-3 flex items-center gap-3 bg-white hover:border-[#971B4E]/40 transition-all shadow-xs cursor-pointer group">
                <input type="radio" name="mode" value="Cards" class="accent-[#971B4E] scale-110">
                <div class="leading-none">
                  <span class="text-xs font-bold text-slate-700 block">Cards</span>
                  <span class="text-[9px] text-slate-400">Debit / Credit</span>
                </div>
              </label>

              <!-- Option: Net Banking -->
              <label class="border border-slate-200 rounded-xl p-3 flex items-center gap-3 bg-white hover:border-[#971B4E]/40 transition-all shadow-xs cursor-pointer group">
                <input type="radio" name="mode" value="Net Banking" class="accent-[#971B4E] scale-110">
                <div class="leading-none">
                  <span class="text-xs font-bold text-slate-700 block">Net Banking</span>
                  <span class="text-[9px] text-slate-400">Direct Bank Portal</span>
                </div>
              </label>
              

            </div>
          </div>

          <!-- Navigation Action Button Controls -->
          <div class="flex flex-col sm:flex-row gap-3 pt-6 mt-2">
            <button class="w-full order-1 sm:order-2 brand-bg-solid text-white text-sm font-bold py-3 rounded-lg shadow-md hover:brightness-110 active:scale-[0.99] transition-all cursor-pointer flex items-center justify-center gap-2" 
                    type="submit">
              <i class="fa-solid fa-circle-check text-xs"></i> Proceed to Payment
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
    <p>&copy; 2026 DCL Bank Groups Inc. Please check your payment credentials carefully before finalizing updates.</p>
  </footer>
<%} else {%>
<%request.setAttribute("error", "session already expired");%>
<%request.getRequestDispatcher("login.jsp").forward(request, response);%>
<%}%>
</body>
</html>