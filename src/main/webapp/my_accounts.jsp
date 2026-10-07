<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.bank.dto.Branch"%>
<%@page import="com.bank.dao.impl.BranchDAOImpl"%>
<%@page import="com.bank.dao.BranchDAO"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.stream.Collector"%>
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
  <title>DCL Bank My Accounts</title>
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

<body class="bg-[#f0f3f8] text-slate-800 min-h-screen antialiased">
<%User u = (User) session.getAttribute("user");%>
<%if(u != null){%>

  <div class="flex min-h-screen relative overflow-x-hidden">

    <aside class="fixed top-0 h-screen left-0 z-50 w-60 bg-[#0B0F19] text-white px-4 py-4 flex flex-col gap-4 border-r border-white/5 shadow-2xl overflow-y-auto">
      
      <!-- Logo Header Area -->
      <div class="flex gap-3 items-center mb-2 px-2 pt-2">
        <div class="w-9 h-9 rounded-lg bg-gradient-to-br from-[#d53579] to-[#971B4E] flex items-center justify-center shadow-lg">
          <i class="fa-solid fa-building-columns text-white text-base"></i>
        </div>
        <div class="leading-none">
          <span class="text-lg font-black tracking-tight block text-white">DCL <span class="text-[#d53579]">BANK</span></span>
          <span class="text-[9px] font-bold text-slate-500 tracking-widest uppercase block mt-0.5">Portal Hub</span>
        </div>
      </div>

      <!-- Navigation Links Container -->
      <div class="flex flex-col gap-1.5 px-1 flex-1">
        
        <!-- Category 1: Main Menu -->
        <p class="px-3 text-[10px] font-bold tracking-wider text-slate-500 uppercase mt-2 mb-1">Main Menu</p>
        
        <div class="flex gap-3 items-center hover:bg-white/5 rounded-xl p-3 transition-all text-slate-400 hover:text-white group">
          <i class="fa-solid fa-house text-slate-500 group-hover:text-[#d53579] transition-colors text-sm w-4 text-center"></i>
          <a href="user_db.jsp" class="text-xs font-semibold tracking-wide">Dashboard</a>
        </div>

        <!-- Accounts Active State -->
        <div class="flex gap-3 items-center bg-white/5 rounded-xl p-3 text-white group relative">
          <div class="absolute left-0 top-1/2 -translate-y-1/2 w-1 h-5 bg-[#d53579] rounded-r-full"></div>
          <i class="fa-solid fa-wallet text-[#d53579] text-sm w-4 text-center"></i>
          <a href="my_accounts.jsp" class="text-xs font-bold tracking-wide">Accounts</a>
        </div>

        <div class="flex gap-3 items-center hover:bg-white/5 rounded-xl p-3 transition-all text-slate-400 hover:text-white group">
          <i class="fa-solid fa-comments-dollar text-slate-500 group-hover:text-[#d53579] transition-colors text-sm w-4 text-center"></i>
          <a href="my_transcations.jsp" class="text-xs font-semibold tracking-wide">Transactions</a>
        </div>

        <!-- Category 2: Payments -->
        <p class="px-3 text-[10px] font-bold tracking-wider text-slate-500 uppercase mt-4 mb-1">Payments</p>

        <div class="flex gap-3 items-center hover:bg-white/5 rounded-xl p-3 transition-all text-slate-400 hover:text-white group">
          <i class="fa-solid fa-arrow-right-arrow-left text-slate-500 group-hover:text-[#d53579] transition-colors text-sm w-4 text-center"></i>
          <a href="moneytransfer.jsp" class="text-xs font-semibold tracking-wide">Money Transfer</a>
        </div>

        <div class="flex gap-3 items-center hover:bg-white/5 rounded-xl p-3 transition-all text-slate-400 hover:text-white group">
          <i class="fa-solid fa-book text-slate-500 group-hover:text-[#d53579] transition-colors text-sm w-4 text-center"></i>
          <a href="passbook.jsp" class="text-xs font-semibold tracking-wide">Passbook</a>
        </div>

        <!-- Category 3: Settings -->
        <p class="px-3 text-[10px] font-bold tracking-wider text-slate-500 uppercase mt-4 mb-1">Settings</p>

        <div class="flex gap-3 items-center hover:bg-white/5 rounded-xl p-3 transition-all text-slate-400 hover:text-white group">
          <i class="fa-solid fa-building-user text-slate-500 group-hover:text-[#d53579] transition-colors text-sm w-4 text-center"></i>
          <a href="edit_profile.jsp" class="text-xs font-semibold tracking-wide">Edit Profile</a>
        </div>
      </div>

      <!-- Bottom Logout Button -->
      <div class="mt-auto border-t border-white/5 pt-4 px-1 shrink-0">
        <div class="flex gap-3 items-center bg-red-500/10 hover:bg-red-500/20 rounded-xl p-3 transition-all text-red-400 hover:text-red-300 group">
          <i class="fa-solid fa-right-from-bracket text-red-500 text-sm w-4 text-center"></i>
          <a href="Logout" class="text-xs font-bold tracking-wide">Logout</a>
        </div>
      </div>

    </aside>

    <!-- Main Workspace Frame Container -->
    <div class="flex-grow min-h-screen flex flex-col pl-60">

      <!-- Header -->
      <header class="fixed top-0 left-60 right-0 h-20 bg-white/80 backdrop-blur-md border-b border-slate-200/60 shadow-xs flex items-center justify-between px-10 z-40">
        <h3 class="text-xl font-extrabold tracking-tight text-slate-900">
          Welcome back, <span class="brand-text-solid"><%=u.getUser_name()%></span>
        </h3>

        <!-- Profile Dropdown Group -->
        <div class="group relative py-4">
          <div class="flex items-center gap-3 cursor-pointer bg-slate-50 border border-slate-200/60 p-2 rounded-xl hover:bg-slate-100/80 transition-all shadow-xs">
            <div class="h-9 w-9 rounded-lg brand-bg-light border border-[#971B4E]/10 flex justify-center items-center">
              <i class="fa-solid fa-user brand-text-solid text-sm"></i>
            </div>

            <div class="leading-none pr-1">
              <h3 class="font-bold text-xs text-slate-800 tracking-tight"><%=u.getUser_name()%></h3>
              <p class="text-[10px] font-bold text-slate-400 uppercase tracking-wider mt-0.5"><%=u.getRole()%></p>
            </div>

            <i class="fa-solid fa-chevron-down text-slate-400 text-[10px] pl-1 transition-transform group-hover:rotate-180"></i>
          </div>

          <!-- Dropdown Container -->
          <div class="absolute right-0 top-full pt-1 w-52 hidden group-hover:block z-50">
            <div class="bg-white/95 backdrop-blur-md border border-slate-200 rounded-xl shadow-xl overflow-hidden">
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

      <!-- Content Area -->
      <div class="p-8 pt-28 space-y-6 flex-grow max-w-[1200px] w-full mx-auto">

        <!-- Page Title Header Section -->
        <div class="flex flex-col sm:flex-row justify-between sm:items-center gap-4">
          <div>
            <h1 class="text-2xl font-black text-slate-900 tracking-tight">My Accounts</h1>
            <p class="text-xs font-medium text-slate-400 mt-0.5">View and manage all your active and pending bank credentials</p>
          </div>

          <a href="account_request.jsp"
             class="bg-[#971B4E] text-white text-xs font-bold px-5 py-3 rounded-xl hover:bg-[#7d143f] shadow-md shadow-rose-950/10 transition-all flex items-center w-fit">
            <i class="fa-solid fa-plus mr-2"></i>
            Request New Account
          </a>
        </div>

        <!-- Metrics Dashboard Grid Segment -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-5">

          <!-- Card 1: Total Accounts -->
          <div class="bg-white/90 backdrop-blur-md border border-slate-200/80 rounded-2xl shadow-sm p-5 flex justify-between items-center">
            <div>
            <%AccountDAO adao = new AccountDAOImpl();%>
            <%List<Account> Accounts = adao.getAllAccounts();%>
            <%
              List<Account> userAccount = Accounts.stream().filter(a->a.getUser_id() == u.getUser_id()).collect(Collectors.toList());
            %>
            
              <p class="text-[11px] font-extrabold text-slate-400 uppercase tracking-wider">Total Accounts</p>
              <h2 class="text-2xl font-black mt-1 text-slate-900 tracking-tight"><%=userAccount.size()%></h2>
              <p class="text-slate-400 text-[11px] font-medium mt-1">All Accounts</p>
            </div>
            <div class="h-11 w-11 rounded-xl bg-blue-50 border border-blue-100 flex justify-center items-center shadow-xs">
              <i class="fa-solid fa-wallet text-blue-600 text-sm"></i>
            </div>
          </div>

          <!-- Card 2: Pending Accounts -->
          <div class="bg-white/90 backdrop-blur-md border border-slate-200/80 rounded-2xl shadow-sm p-5 flex justify-between items-center">
            <div>
              <p class="text-[11px] font-extrabold text-slate-400 uppercase tracking-wider">Pending Accounts</p>
              <%Long count = userAccount.stream().filter(a->a.getStatus().equalsIgnoreCase("pending")).count();%>
              <h2 class="text-2xl font-black mt-1 text-amber-600 tracking-tight"><%=count%></h2>
              <p class="text-slate-400 text-[11px] font-medium mt-1">Awaiting approval</p>
            </div>
            <div class="h-11 w-11 rounded-xl bg-amber-50 border border-amber-100 flex justify-center items-center shadow-xs">
              <i class="fa-solid fa-hourglass-half text-amber-600 text-sm"></i>
            </div>
          </div>

          <!-- Card 3: Total Balance -->
          <div class="bg-gradient-to-br from-[#e03a83] via-[#ba2161] to-[#971B4E] rounded-2xl shadow-lg shadow-rose-950/10 p-5 flex justify-between items-center relative overflow-hidden group hover:shadow-xl hover:-translate-y-0.5 transition-all duration-300">
            <div class="absolute top-0 right-0 w-20 h-20 bg-white/10 rounded-full blur-lg pointer-events-none"></div>
            <div>
              <p class="text-[11px] font-extrabold text-rose-100/80 uppercase tracking-widest">Total Balance</p>
              <%Double total = userAccount.stream().collect(Collectors.summingDouble(a->a.getBalance()));%>
              <h2 class="text-xl font-black mt-0.5 text-white tracking-tight">₹ <%=total%></h2>
              <p class="text-rose-200/70 text-[11px] font-medium mt-1">Across active Accounts</p>
            </div>
            <div class="h-11 w-11 rounded-xl bg-white/10 backdrop-blur-md border border-white/20 flex justify-center items-center shadow-xs">
              <i class="fa-solid fa-indian-rupee-sign text-white text-sm"></i>
            </div>
          </div>

        </div>

        <!-- Accounts Table -->
        <div class="bg-white/90 backdrop-blur-md border border-slate-200/80 rounded-2xl shadow-sm p-6">
          <h2 class="text-base font-extrabold text-slate-900 tracking-tight mb-4">Your Accounts</h2>

          <div class="overflow-x-auto">
            <table class="w-full text-left text-xs border-collapse">

              <thead>
                <tr class="border-b border-slate-200 text-slate-400 uppercase font-bold tracking-wider text-[10px]">
                  <th class="pb-3 pt-1 px-2">Account Details</th>
                  <th class="pb-3 pt-1 px-2">Account Type</th>
                  <th class="pb-3 pt-1 px-2">Branch Location</th>
                  <th class="pb-3 pt-1 px-2">IFSC Code</th>
                  <th class="pb-3 pt-1 px-2">Available Balance</th>
                  <th class="pb-3 pt-1 px-2">Status</th>
                  <th class="pb-3 pt-1 px-2 text-right">Opened Date</th>
                </tr>
              </thead>

              <tbody class="divide-y divide-slate-100 text-slate-600 font-medium">
               <%for(Account a : userAccount){%>
               <%if(a.getStatus().equalsIgnoreCase("active")){%>
                <!-- Row 1 -->
                <tr class="hover:bg-slate-50/80 transition-colors">
                  <td class="py-2 px-2">
                    <p class="font-bold tracking-wide text-slate-900"><%=a.getAcc_no()%></p>
                  </td>
                  <td class="py-4 px-2 text-slate-500"><%=a.getAcc_type()%></td>
                  <%BranchDAO bdao = new BranchDAOImpl();%>
                  <%Branch b = bdao.getBranchById(a.getBranch_id());%>
                  <td class="py-4 px-2 text-slate-700"><%=b.getBranch_name()%></td>
                  <td class="py-4 px-2 font-mono font-bold tracking-tight text-slate-800"><%=b.getIfsc_code()%></td>
                  <td class="py-4 px-2 font-bold text-emerald-600 text-sm">₹ <%=a.getBalance()%></td>
                  <td class="py-4 px-2">
                    <span class="bg-emerald-50 text-emerald-700 border border-emerald-200/60 text-[10px] font-extrabold px-2.5 py-1 rounded-md tracking-wide">
                      <%=a.getStatus()%>
                    </span>
                  </td>
                  <%LocalDate date = LocalDate.parse(a.getCreated_at());%>
                  <%DateTimeFormatter dt = DateTimeFormatter.ofPattern("dd MMM yyyy");%>
                  <td class="py-4 px-2 text-right text-slate-400 font-bold"><%=date.format(dt)%></td>
                </tr>
                <%} else {%>
                  <tr class="hover:bg-slate-50/80 transition-colors">
                  <td class="py-2 px-2">
                    <p class="font-bold tracking-wide text-red-600">Not Generated</p>
                  </td>
                  <td class="py-4 px-2 text-slate-500"><%=a.getAcc_type()%></td>
                  <%BranchDAO bdao = new BranchDAOImpl();%>
                  <%Branch b = bdao.getBranchById(a.getBranch_id());%>
                  <td class="py-4 px-2 text-slate-700"><%=b.getBranch_name()%></td>
                  <td class="py-4 px-2 font-mono font-bold tracking-tight text-slate-800">Pending</td>
                  <td class="py-4 px-2 font-bold text-emerald-600 text-sm">₹ <%=a.getBalance()%></td>
                  <td class="py-4 px-2">
                    <span class="bg-red-50 text-red-700 border border-emerald-200/60 text-[10px] font-extrabold px-2.5 py-1 rounded-md tracking-wide">
                      <%=a.getStatus()%>
                    </span>
                  </td>
                  <%LocalDate date = LocalDate.parse(a.getCreated_at());%>
                  <%DateTimeFormatter dt = DateTimeFormatter.ofPattern("dd MMM yyyy");%>
                  <td class="py-4 px-2 text-right text-slate-400 font-bold">NA</td>
                </tr>
                <%}%>
                <%}%>

              </tbody>

            </table>
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