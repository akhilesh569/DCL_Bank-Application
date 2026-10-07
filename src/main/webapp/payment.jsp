<%@page import="com.bank.dto.Account"%>
<%@page import="com.bank.dao.impl.AccountDAOImpl"%>
<%@page import="com.bank.dao.AccountDAO"%>
<%@page import="com.bank.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DCL Bank — Payment</title>

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

    @keyframes gatewayFadeUp {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }
    .animate-gateway-up {
      animation: gatewayFadeUp 0.6s cubic-bezier(0.16, 1, 0.3, 1) forwards;
    }
  </style>
</head>

<body class="bg-[#f0f3f8] text-slate-800 min-h-screen flex flex-col justify-between antialiased relative overflow-x-hidden">
<%User u = (User) session.getAttribute("user");%>
<%if(u != null){%>

  <!-- Background highlights for visual depth -->
  <div class="absolute top-0 left-1/3 w-[600px] h-[600px] bg-rose-100/30 rounded-full blur-3xl pointer-events-none -z-10"></div>
  <div class="absolute bottom-0 right-1/4 w-[500px] h-[500px] bg-slate-200/50 rounded-full blur-3xl pointer-events-none -z-10"></div>

  <!-- Top Navigation Header -->
  <header class="w-full max-w-[1440px] mx-auto px-6 lg:px-16 py-6 flex items-center justify-between z-10">
    <div class="flex items-center gap-3">
      <div class="w-10 h-10 rounded-lg brand-bg-solid flex items-center justify-center shadow-md">
        <i class="fa-solid fa-shield-halved text-white text-lg"></i>
      </div>
      <div class="leading-none">
        <span class="text-xl font-black text-slate-900 tracking-tight block">DCL <span class="brand-text-solid">BANK</span></span>
        <span class="text-[10px] font-bold text-slate-400 tracking-widest uppercase block mt-0.5">Payment Gateway</span>
      </div>
    </div>
    
    <a href="Logout" class="text-xs font-bold text-rose-600 hover:bg-rose-50 px-3 py-2 rounded-lg border border-rose-200 transition-all flex items-center gap-2 shadow-xs bg-white">
      <i class="fa-solid fa-right-from-bracket text-[11px]"></i> Log Out
    </a>
  </header>

  <!-- Main Authorization Center Workspace -->
  <main class="flex-grow flex items-center justify-center px-4 py-6 z-10">
    <div class="w-full max-w-4xl bg-white border border-slate-200/80 rounded-2xl shadow-2xl overflow-hidden grid grid-cols-1 md:grid-cols-12 min-h-[540px] animate-gateway-up">
      
      <!-- Left Side Card: Visual Security Counter -->
      <div class="md:col-span-5 bg-slate-950 p-8 flex flex-col justify-between relative overflow-hidden text-white border-b md:border-b-0 md:border-r border-slate-900">
        <div class="absolute inset-0 bg-gradient-to-b from-slate-950 via-slate-900 to-slate-950 z-10"></div>
        
        <!-- Large backdrop pattern shield -->
        <div class="absolute inset-0 flex items-center justify-center opacity-5 select-none pointer-events-none z-10">
          <i class="fa-solid fa-shield-halved text-[280px]"></i>
        </div>
        
        <!-- Verification header indicators -->
        <div class="z-20 space-y-4 text-center md:text-left">
          <div class="bg-emerald-950/60 border border-emerald-800/60 text-emerald-400 text-[10px] font-bold tracking-wider uppercase px-3 py-1 rounded-md inline-flex items-center gap-1.5 shadow-inner">
            <span class="w-1.5 h-1.5 rounded-full bg-emerald-400 animate-pulse"></span> 256-Bit SSL Secured
          </div>
          <h1 class="text-2xl font-black tracking-tight leading-tight">
            Secure Payment <br>Authorization
          </h1>
          <p class="text-slate-400 text-xs leading-relaxed max-w-xs">
            Verify the unique one-time verification passcode distributed to your communication channel.
          </p>
        </div>

        <!-- Central Phone Graphic Visualization -->
        <div class="hidden md:flex justify-center items-center z-20 py-6">
          <div class="h-32 w-32 rounded-full bg-slate-900/80 border border-slate-800 flex items-center justify-center relative shadow-inner">
            <i class="fa-solid fa-mobile-screen-button brand-text-solid text-5xl"></i>
            <div class="absolute -right-2 bottom-2 h-10 w-12 bg-[#971B4E] rounded-lg flex items-center justify-center shadow-lg">
              <i class="fa-solid fa-key text-white text-base"></i>
            </div>
            <div class="absolute -left-2 top-2 h-9 w-9 bg-emerald-500/10 border border-emerald-500/30 rounded-full flex items-center justify-center shadow">
              <i class="fa-solid fa-shield text-emerald-400 text-sm"></i>
            </div>
          </div>
        </div>

        <!-- Compliance Disclaimer Block -->
        <div class="z-20 pt-4 border-t border-slate-900 text-center md:text-left">
          <span class="text-[10px] text-slate-500 block font-medium">Verification Lockbox</span>
          <p class="text-[11px] text-slate-400 mt-0.5">Do not share your one-time passwords with anyone, including customer agents.</p>
        </div>
      </div>

      <!-- Right Side Card: Interactive Parameter & Verification Panel -->
      <div class="md:col-span-7 p-8 lg:p-10 flex flex-col justify-center bg-white">
        
        <!-- Target Core Transfer Summary Grid -->
        <div class="bg-slate-50 border border-slate-200/60 rounded-xl p-4 mb-6 space-y-2.5 text-xs">
          <div class="flex justify-between items-center pb-2 border-b border-slate-200/60">
            <span class="text-slate-400 font-semibold">Account Number</span>
            <%
            Integer id = Integer.parseInt(request.getParameter("account_id"));
            AccountDAO adao = new AccountDAOImpl();
            Account a = adao.getAccountById(id);
            %>
            <span class="font-bold text-slate-800 tracking-tight"><%=a.getAcc_no()%></span>
          </div>

          <div class="flex justify-between items-center py-0.5">
            <span class="text-slate-400 font-semibold">Account Holder</span>
            <span class="font-bold text-slate-800"><%=u.getUser_name()%></span>
          </div>

          <div class="flex justify-between items-center py-0.5">
            <span class="text-slate-400 font-semibold">Method Channel</span>
            <span class="font-bold text-slate-800 bg-slate-200/60 px-2 py-0.5 rounded text-[10px]"><%=request.getParameter("mode")%></span>
          </div>

          <div class="flex justify-between items-center pt-2 border-t border-slate-200/60 mt-0.5">
            <span class="text-slate-900 font-extrabold">Total Value</span>
            <span class="text-xl font-black text-emerald-600">₹<%=request.getParameter("amount")%></span>
          </div>
        </div>

        <!-- OTP Verification Submission Form -->
        <% String msg = (String)request.getAttribute("error"); %>
        <% if(msg != null){ %>
          <div id="msg" class="bg-rose-50 border border-rose-200 text-rose-700 text-xs p-3.5 rounded-xl mb-6 font-semibold flex items-center gap-2.5 shadow-xs">
            <i class="fa-solid fa-circle-exclamation text-sm text-rose-500"></i> <%= msg %>
          </div>
        <% } %>
        
        <form action="deposit" method="POST" class="space-y-4">
          
          <!-- Preserved Hidden Back-End Hooks -->
          <input type="hidden" name="account_id" value="<%=request.getParameter("account_id")%>">
          <input type="hidden" name="amount" value="<%=request.getParameter("amount")%>">
          <input type="hidden" name="mode" value="<%=request.getParameter("mode")%>">

          <div class="space-y-1.5">
            <label class="text-[10px] font-bold text-slate-400 uppercase tracking-wider block">Password</label>
            
            <div class="border border-slate-200 focus-within:border-[#971B4E] focus-within:ring-2 focus-within:ring-[#971B4E]/10 px-4 py-3 rounded-lg flex items-center gap-3 bg-white transition-all shadow-xs">
              <i class="fa-solid fa-lock text-slate-400 text-xs w-4 text-center"></i>
              <input class="w-full text-sm outline-none bg-transparent text-slate-800 placeholder-slate-300 font-bold tracking-widest" 
                     type="password" 
                     name="otp" 
                     placeholder="••••" 
                     required>
            </div>

            <!-- Context Simulation Hint Link Box -->
           
          </div>

          <!-- Gateway Execution Action Buttons -->
          <div class="pt-2">
            <button class="w-full bg-emerald-600 text-white text-sm font-bold py-3.5 rounded-lg shadow-md hover:bg-emerald-500 active:scale-[0.99] transition-all cursor-pointer flex items-center justify-center gap-2" 
                    type="submit">
              <i class="fa-solid fa-circle-check text-xs"></i> Complete Secure Payment
            </button>
          </div>

        </form>

        <p class="text-center text-[11px] text-slate-400 mt-5 flex items-center justify-center gap-1.5">
          <i class="fa-solid fa-lock text-emerald-500"></i> Fully authenticated transaction environment
        </p>

      </div>

    </div>
  </main>

  <footer class="w-full bg-slate-900 text-center py-4 text-[11px] text-slate-500 px-6 border-t border-slate-800">
    <p>&copy; 2026 DCL Bank Groups Inc. Please verify all information fields before finalizing parameters.</p>
  </footer>
<%} else {%>
<%request.setAttribute("error", "session already expired");%>
<%request.getRequestDispatcher("login.jsp").forward(request, response);%>
<%}%>
</body>
</html>