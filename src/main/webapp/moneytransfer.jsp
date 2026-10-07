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
  <title>Money Operations</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght=300;400;500;600;700;800&display=swap" rel="stylesheet">
  
  <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
  
  <style>
    body {
      font-family: 'Public Sans', sans-serif;
    }
    .brand-text-solid { color: #971B4E; }
    .brand-bg-light { background-color: rgba(151, 27, 78, 0.08); }
  </style>
</head>

<body class="bg-[#f8fafc] text-slate-800 min-h-screen antialiased">
<%User u = (User) session.getAttribute("user");%>
<%if(u != null){%>

  <div class="flex min-h-screen relative overflow-x-hidden">

    <aside class="fixed top-0 h-screen left-0 z-50 w-60 bg-[#0B0F19] text-white px-4 py-4 flex flex-col gap-4 border-r border-white/5 shadow-2xl overflow-y-auto">
      
      <div class="flex gap-3 items-center mb-2 px-2 pt-2">
        <div class="w-9 h-9 rounded-lg bg-gradient-to-br from-[#d53579] to-[#971B4E] flex items-center justify-center shadow-lg">
          <i class="fa-solid fa-building-columns text-white text-base"></i>
        </div>
        <div class="leading-none">
          <span class="text-lg font-black tracking-tight block text-white">DCL <span class="text-[#d53579]">BANK</span></span>
          <span class="text-[9px] font-bold text-slate-500 tracking-widest uppercase block mt-0.5">Portal</span>
        </div>
      </div>

      <div class="flex flex-col gap-1.5 px-1 flex-1">
        
        <p class="px-3 text-[10px] font-bold tracking-wider text-slate-500 uppercase mt-2 mb-1">Main Menu</p>
        
        <div class="flex gap-3 items-center hover:bg-white/5 rounded-xl p-3 transition-all text-slate-400 hover:text-white group">
          <i class="fa-solid fa-house text-slate-500 group-hover:text-[#d53579] transition-colors text-sm w-4 text-center"></i>
          <a href="user_db.jsp" class="text-xs font-semibold tracking-wide">Dashboard</a>
        </div>

        <div class="flex gap-3 items-center hover:bg-white/5 rounded-xl p-3 transition-all text-slate-400 hover:text-white group">
          <i class="fa-solid fa-file-invoice-dollar text-slate-500 group-hover:text-[#d53579] transition-colors text-sm w-4 text-center"></i>
          <a href="my_accounts.jsp" class="text-xs font-semibold tracking-wide">Accounts</a>
        </div>

        <div class="flex gap-3 items-center hover:bg-white/5 rounded-xl p-3 transition-all text-slate-400 hover:text-white group">
          <i class="fa-solid fa-comments-dollar text-slate-500 group-hover:text-[#d53579] transition-colors text-sm w-4 text-center"></i>
          <a href="my_transcations.jsp" class="text-xs font-semibold tracking-wide">Transactions</a>
        </div>

        <p class="px-3 text-[10px] font-bold tracking-wider text-slate-500 uppercase mt-4 mb-1">Payments</p>

        <div class="flex gap-3 items-center bg-white/5 rounded-xl p-3 text-white group relative">
          <div class="absolute left-0 top-1/2 -translate-y-1/2 w-1 h-5 bg-[#d53579] rounded-r-full"></div>
          <i class="fa-solid fa-arrow-right-arrow-left text-[#d53579] text-sm w-4 text-center"></i>
          <a href="moneytransfer.jsp" class="text-xs font-bold tracking-wide">Money Transfer</a>
        </div>

        <div class="flex gap-3 items-center hover:bg-white/5 rounded-xl p-3 transition-all text-slate-400 hover:text-white group">
          <i class="fa-solid fa-book text-slate-500 group-hover:text-[#d53579] transition-colors text-sm w-4 text-center"></i>
          <a href="passbook.jsp" class="text-xs font-semibold tracking-wide">Passbook</a>
        </div>

        <p class="px-3 text-[10px] font-bold tracking-wider text-slate-500 uppercase mt-4 mb-1">Settings</p>

        <div class="flex gap-3 items-center hover:bg-white/5 rounded-xl p-3 transition-all text-slate-400 hover:text-white group">
          <i class="fa-solid fa-building-user text-slate-500 group-hover:text-[#d53579] transition-colors text-sm w-4 text-center"></i>
          <a href="edit_profile.jsp" class="text-xs font-semibold tracking-wide">Edit Profile</a>
        </div>
      </div>

      <div class="mt-auto border-t border-white/5 pt-4 px-1 shrink-0">
        <div class="flex gap-3 items-center bg-red-500/10 hover:bg-red-500/20 rounded-xl p-3 transition-all text-red-400 hover:text-red-300 group">
          <i class="fa-solid fa-right-from-bracket text-red-500 text-sm w-4 text-center"></i>
          <a href="Logout" class="text-xs font-bold tracking-wide">Logout</a>
        </div>
      </div>

    </aside>

    <div class="flex-grow min-h-screen flex flex-col pl-60">

      <header class="fixed top-0 left-60 right-0 h-20 bg-white border-b border-slate-200 flex items-center justify-between px-10 z-40 shadow-xs">
        <h3 class="text-xl font-extrabold tracking-tight text-slate-900">
          Welcome back, <span class="brand-text-solid"><%=u.getUser_name()%></span>
        </h3>

        <div class="group relative py-4">
          <div class="flex items-center gap-3 cursor-pointer bg-slate-50 border border-slate-200 p-2 rounded-xl hover:bg-slate-100 transition-all">
            <div class="h-9 w-9 rounded-lg brand-bg-light border border-[#971B4E]/10 flex justify-center items-center">
              <i class="fa-solid fa-user brand-text-solid text-sm"></i>
            </div>

            <div class="leading-none pr-1">
              <h3 class="font-bold text-xs text-slate-800 tracking-tight"><%=u.getUser_name()%></h3>
              <p class="text-[10px] font-bold text-slate-400 uppercase tracking-wider mt-0.5"><%=u.getRole()%></p>
            </div>

            <i class="fa-solid fa-chevron-down text-slate-400 text-[10px] pl-1 transition-transform group-hover:rotate-180"></i>
          </div>

          <div class="absolute right-0 top-full pt-1 w-52 hidden group-hover:block z-50">
            <div class="bg-white border border-slate-200 rounded-xl shadow-xl overflow-hidden">
              <a href="index.jsp" class="flex gap-3 items-center px-4 py-3 hover:bg-slate-50 text-xs font-bold text-slate-600 hover:text-slate-900 transition-colors border-b border-slate-100">
                <i class="fa-solid fa-gauge text-slate-400 text-sm w-4"></i> Home
              </a>
              <a href="edit_profile.jsp" class="flex gap-3 items-center px-4 py-3 hover:bg-slate-50 text-xs font-bold text-slate-600 hover:text-slate-900 transition-colors border-b border-slate-100">
                <i class="fa-solid fa-user text-slate-400 text-sm w-4"></i> Edit Profile
              </a>
              <a href="Logout" class="flex gap-3 items-center px-4 py-3 hover:bg-red-50 text-xs font-bold text-red-600 transition-colors">
                <i class="fa-solid fa-right-from-bracket text-red-400 text-sm w-4"></i> Logout
              </a>
            </div>
          </div>
        </div>
      </header>

      <div class="p-8 pt-28 space-y-6 flex-grow max-w-[1200px] w-full mx-auto">

          <div class="bg-gradient-to-br from-[#e03a83] via-[#ba2161] to-[#971B4E] rounded-2xl shadow-md p-6 flex justify-between items-center relative overflow-hidden max-w-sm group hover:shadow-lg hover:-translate-y-0.5 transition-all duration-300">
            <div class="absolute top-0 right-0 w-24 h-24 bg-white/10 rounded-full blur-xl pointer-events-none"></div>
            <div class="absolute -bottom-6 -right-6 w-16 h-16 bg-black/10 rounded-full pointer-events-none"></div>
            <div>
            <%
            AccountDAO adao = new AccountDAOImpl();
            List<Account> allAcc = adao.getAllAccounts();
            List<Account> userAcc = allAcc.stream().filter(a->a.getUser_id() == u.getUser_id() && a.getStatus().equalsIgnoreCase("active")).collect(Collectors.toList());
            Double total = userAcc.stream().collect(Collectors.summingDouble(a->a.getBalance()));
            %>
              <p class="text-[11px] font-extrabold text-rose-100/80 uppercase tracking-widest">Total Balance</p>
              <h2 class="text-2xl font-black text-white tracking-tight mt-1">₹ <%=total%></h2>
              <p class="text-rose-200/70 mt-1 text-[11px] font-medium">Across all active accounts</p>
            </div>
            <div class="h-12 w-12 rounded-xl bg-white/10 backdrop-blur-md border border-white/20 flex justify-center items-center shadow-sm">
              <i class="fa-solid fa-wallet text-white text-base"></i>
            </div>
          </div>

          <div class="bg-white border border-slate-200 rounded-2xl shadow-xs p-6">
            <h2 class="text-lg font-extrabold text-slate-900 tracking-tight mb-4">Active Accounts</h2>

            <div class="overflow-x-auto">
              <table class="w-full text-left text-xs border-collapse">
                <thead>
                  <tr class="border-b border-slate-200 text-slate-400 uppercase font-bold tracking-wider text-[10px]">
                    <th class="pb-3 pt-1 px-2">Account No.</th>
                    <th class="pb-3 pt-1 px-2">Account Type</th>
                    <th class="pb-3 pt-1 px-2">Balance</th>
                    <th class="pb-3 pt-1 px-2 text-right">Status</th>
                  </tr>
                </thead>
                <tbody class="divide-y divide-slate-100 text-slate-700 font-medium">
                <%for(Account a : userAcc){%>
                  <tr class="hover:bg-slate-50 transition-colors">
                    <td class="py-4 px-2 font-bold tracking-wide text-slate-900"><%=a.getAcc_no()%></td>
                    <td class="py-4 px-2 text-slate-500"><%=a.getAcc_type()%> Account</td>
                    <td class="py-4 px-2 font-bold text-emerald-600 text-sm">₹ <%=a.getBalance()%></td>
                    <td class="py-4 px-2 text-right">
                      <span class="bg-emerald-50 text-emerald-700 border border-emerald-200 text-[10px] font-extrabold px-2.5 py-1 rounded-md tracking-wide">
                        <%=a.getStatus().toUpperCase()%>
                      </span>
                    </td>
                  </tr>
                  <%}%>
                </tbody>
              </table>
            </div>
          </div>

          <div class="bg-white border border-slate-200 rounded-2xl shadow-xs p-6">
            <h2 class="text-lg font-extrabold text-slate-900 tracking-tight mb-5">Quick Actions</h2>

            <div class="grid grid-cols-1 sm:grid-cols-3 gap-5">
              
              <a href="deposit.jsp" class="border border-slate-200 rounded-xl p-5 text-center hover:border-[#971B4E]/30 hover:shadow-sm hover:bg-slate-50/50 transition-all duration-200 relative group block">
                <div class="bg-emerald-50 border border-emerald-100 h-12 w-12 rounded-xl flex justify-center items-center mx-auto shadow-xs">
                  <i class="fa-solid fa-arrow-down text-base text-emerald-600"></i>
                </div>
                <h3 class="text-sm font-extrabold text-slate-800 tracking-tight mt-3">Deposit Money</h3>
                <p class="text-[11px] font-medium text-slate-400 mt-0.5">Add money to your account</p>
              </a>

              <a href="withdraw.jsp" class="border border-slate-200 rounded-xl p-5 text-center hover:border-[#971B4E]/30 hover:shadow-sm hover:bg-slate-50/50 transition-all duration-200 relative group block">
                <div class="bg-orange-50 border border-orange-100 h-12 w-12 rounded-xl flex justify-center items-center mx-auto shadow-xs">
                  <i class="fa-solid fa-arrow-up text-base text-orange-600"></i>
                </div>
                <h3 class="text-sm font-extrabold text-slate-800 tracking-tight mt-3">Withdraw Money</h3>
                <p class="text-[11px] font-medium text-slate-400 mt-0.5">Withdraw from account</p>
              </a>

              <a href="transfer.jsp" class="border border-slate-200 rounded-xl p-5 text-center hover:border-[#971B4E]/30 hover:shadow-sm hover:bg-slate-50/50 transition-all duration-200 relative group block">
                <div class="bg-purple-50 border border-purple-100 h-12 w-12 rounded-xl flex justify-center items-center mx-auto shadow-xs">
                  <i class="fa-solid fa-right-left text-base text-purple-600"></i>
                </div>
                <h3 class="text-sm font-extrabold text-slate-800 tracking-tight mt-3">Transfer Money</h3>
                <p class="text-[11px] font-medium text-slate-400 mt-0.5">Send money securely</p>
              </a>

            </div>
          </div>

      </div>
    </div>

  </div>
<%} else {%>
<%request.setAttribute("error", "session already expired");%>
<%request.getRequestDispatcher("login.jsp").forward(request, response);%>
<%}%>
</body>
</html>