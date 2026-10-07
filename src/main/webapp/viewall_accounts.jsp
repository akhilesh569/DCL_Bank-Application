<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.bank.dto.Branch"%>
<%@page import="com.bank.dao.impl.BranchDAOImpl"%>
<%@page import="com.bank.dao.BranchDAO"%>
<%@page import="com.bank.dao.impl.UserDAOImpl"%>
<%@page import="com.bank.dao.UserDAO"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="com.bank.dto.Account"%>
<%@page import="java.util.List"%>
<%@page import="com.bank.dao.impl.AccountDAOImpl"%>
<%@page import="com.bank.dao.AccountDAO"%>
<%@page import="com.bank.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DCL Bank - Account Management</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght=300;400;500;600;700;800&display=swap" rel="stylesheet">
  
  <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
  
  <style>
    body {
      font-family: 'Public Sans', sans-serif;
    }
    .admin-sidebar-bg { background-color: #0D1F1D; }
    
    .custom-scrollbar::-webkit-scrollbar {
      width: 6px;
      height: 6px;
    }
    .custom-scrollbar::-webkit-scrollbar-track {
      background: transparent;
    }
    .custom-scrollbar::-webkit-scrollbar-thumb {
      background: #cbd5e1;
      border-radius: 10px;
    }
  </style>
</head>

<body class="bg-[#F2F5F4] text-slate-800 min-h-screen antialiased">
<%User u = (User) session.getAttribute("user");%>
<%if(u != null){%>

  <div class="flex min-h-screen relative overflow-x-hidden">

    <!-- Sidebar Menu -->
    <aside class="fixed top-0 h-screen left-0 z-50 w-60 admin-sidebar-bg text-white px-4 py-4 flex flex-col gap-4 border-r border-[#1B3330] shadow-2xl overflow-y-auto">
      
      <!-- Brand Logo Area -->
      <div class="flex gap-3 items-center mb-2 px-2 pt-2">
        <div class="w-9 h-9 rounded-xl bg-gradient-to-br from-[#F59E0B] to-[#D97706] flex items-center justify-center shadow-lg shadow-amber-500/20">
          <i class="fa-solid fa-building-columns text-stone-900 text-sm"></i>
        </div>
        <div class="leading-none">
          <span class="text-base font-black tracking-tight block text-white">DCL <span class="text-[#F59E0B]">BANK</span></span>
          <span class="text-[9px] font-bold text-[#94A19F] uppercase tracking-widest block mt-0.5">Admin Terminal</span>
        </div>
      </div>

      <!-- Navigation Links -->
      <div class="flex flex-col gap-1.5 px-1 flex-1">
        
        <p class="px-3 text-[10px] font-bold tracking-wider text-[#5A6E6B] uppercase mt-2 mb-1">Core Operations</p>
        
        <div class="flex gap-3 items-center hover:bg-white/5 rounded-xl p-3 transition-all text-[#94A19F] hover:text-white group">
          <i class="fa-solid fa-chart-pie text-[#5A6E6B] group-hover:text-[#F59E0B] transition-colors text-sm w-4 text-center"></i>
          <a href="admin.jsp" class="text-xs font-semibold tracking-wide">Dashboard</a>
        </div>

        <div class="flex gap-3 items-center hover:bg-white/5 rounded-xl p-3 transition-all text-[#94A19F] hover:text-white group">
          <i class="fa-solid fa-users text-[#5A6E6B] group-hover:text-[#F59E0B] transition-colors text-sm w-4 text-center"></i>
          <a href="viewallusers.jsp" class="text-xs font-semibold tracking-wide">View Users</a>
        </div>

        <div class="flex gap-3 items-center hover:bg-white/5 rounded-xl p-3 transition-all text-[#94A19F] hover:text-white group">
          <i class="fa-solid fa-code-branch text-[#5A6E6B] group-hover:text-[#F59E0B] transition-colors text-sm w-4 text-center"></i>
          <a href="branch.jsp" class="text-xs font-semibold tracking-wide">Branches</a>
        </div>

        <p class="px-3 text-[10px] font-bold tracking-wider text-[#5A6E6B] uppercase mt-4 mb-1">Audits & Assets</p>

        <!-- Active Accounts Link -->
        <div class="flex gap-3 items-center bg-white/5 rounded-xl p-3 text-white group relative">
          <div class="absolute left-0 top-1/2 -translate-y-1/2 w-1 h-5 bg-[#F59E0B] rounded-r-full"></div>
          <i class="fa-solid fa-credit-card text-[#F59E0B] text-sm w-4 text-center"></i>
          <a href="viewall_accounts.jsp" class="text-xs font-bold tracking-wide">Accounts</a>
        </div>

        <div class="flex gap-3 items-center hover:bg-white/5 rounded-xl p-3 transition-all text-[#94A19F] hover:text-white group">
          <i class="fa-solid fa-arrow-right-arrow-left text-[#5A6E6B] group-hover:text-[#F59E0B] transition-colors text-sm w-4 text-center"></i>
          <a href="viewalltransactions.jsp" class="text-xs font-semibold tracking-wide">All Transcations</a>
        </div>

        <p class="px-3 text-[10px] font-bold tracking-wider text-[#5A6E6B] uppercase mt-4 mb-1">Account Settings</p>

        <div class="flex gap-3 items-center hover:bg-white/5 rounded-xl p-3 transition-all text-[#94A19F] hover:text-white group">
          <i class="fa-solid fa-user-gear text-[#5A6E6B] group-hover:text-[#F59E0B] transition-colors text-sm w-4 text-center"></i>
          <a href="edit_profile.jsp" class="text-xs font-semibold tracking-wide">Profile</a>
        </div>
      </div>

      <!-- Logout Button -->
      <div class="mt-auto border-t border-white/5 pt-4 px-1 shrink-0">
        <div class="flex gap-3 items-center bg-rose-500/10 hover:bg-rose-500/20 rounded-xl p-3 transition-all text-rose-400 hover:text-rose-300 group">
          <i class="fa-solid fa-power-off text-rose-500 text-sm w-4 text-center"></i>
          <a href="Logout" class="text-xs font-bold tracking-wide">Secure Signout</a>
        </div>
      </div>

    </aside>

    <!-- Main Workspace -->
    <div class="flex-grow min-h-screen flex flex-col pl-60">

      <!-- Top Header Area -->
      <header class="fixed top-0 left-60 right-0 h-20 bg-white/80 backdrop-blur-md border-b border-stone-200/80 shadow-xs flex items-center justify-between px-10 z-40">
        <div class="flex items-center gap-2.5">
          <span class="bg-amber-50 text-amber-800 text-[10px] font-extrabold px-2 py-0.5 rounded-md border border-amber-200 tracking-wide uppercase">System Admin</span>
          <h3 class="text-lg font-black tracking-tight text-stone-900">Account Registry Matrix</h3>
        </div>

        <!-- Profile Box with Hover Dropdown -->
        <div class="relative group">
          <div class="flex items-center gap-3 bg-stone-50 border border-stone-200/60 p-2 rounded-xl cursor-pointer hover:bg-stone-100/70 transition-colors">
            <div class="h-9 w-9 rounded-lg bg-amber-50 border border-amber-100 flex items-center justify-center">
              <i class="fa-solid fa-user-shield text-amber-800 text-sm"></i>
            </div>
            <div class="leading-none pr-6 relative">
              <h3 class="text-stone-800 font-bold text-xs tracking-tight"><%=u.getUser_name().toUpperCase()%></h3>
              <p class="text-[10px] font-bold text-stone-400 uppercase tracking-wider mt-0.5">Manager</p>
              <i class="fa-solid fa-chevron-down text-[10px] text-stone-400 absolute right-0 top-1/2 -translate-y-1/2 group-hover:rotate-180 transition-transform"></i>
            </div>
          </div>

          <!-- Dropdown Options on Hover -->
          <div class="absolute right-0 top-full pt-1 w-52 hidden group-hover:block z-50 animate-in fade-in slide-in-from-top-2 duration-150">
            <div class="bg-white/95 backdrop-blur-md border border-stone-200 rounded-xl shadow-xl overflow-hidden">
              <a href="index.jsp" class="flex gap-3 items-center px-4 py-3 hover:bg-stone-50 text-xs font-bold text-stone-600 hover:text-slate-900 transition-colors border-b border-stone-100">
                <i class="fa-solid fa-gauge text-stone-400 text-sm w-4"></i> Home Portal
              </a>
              <a href="edit_profile.jsp" class="flex gap-3 items-center px-4 py-3 hover:bg-stone-50 text-xs font-bold text-stone-600 hover:text-slate-900 transition-colors border-b border-stone-100">
                <i class="fa-solid fa-user text-stone-400 text-sm w-4"></i> Edit Profile
              </a>
              <a href="Logout" class="flex gap-3 items-center px-4 py-3 hover:bg-rose-50 text-xs font-bold text-rose-600 transition-colors">
                <i class="fa-solid fa-right-from-bracket text-rose-400 text-sm w-4"></i> Secure Signout
              </a>
            </div>
          </div>
        </div>

      </header>

      <!-- Dashboard Content View Area -->
      <div class="p-8 pt-28 space-y-6 flex-grow w-full mx-auto">

        <!-- Summary Metrics Bar (Optimized 5-Column Grid Layout) -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-4">

          <!-- Total Accounts -->
          <div class="bg-white border border-stone-200/80 rounded-2xl shadow-xs p-4 flex justify-between items-center">
            <div>
              <p class="text-[10px] font-extrabold text-stone-400 uppercase tracking-wider">Total Accounts</p>
              <%AccountDAO adao = new AccountDAOImpl(); 
              List<Account> la = adao.getAllAccounts();
              %>
              <h2 class="text-xl font-black text-stone-900 tracking-tight mt-1"><%=la.size()%></h2>
              <p class="text-[9px] font-bold text-stone-400 mt-0.5">System registered</p>
            </div>
            <div class="h-11 w-11 rounded-xl bg-stone-50 border border-stone-200 flex justify-center items-center text-stone-600">
              <i class="fa-solid fa-credit-card text-xs"></i>
            </div>
          </div>

          <!-- Active Accounts -->
          <div class="bg-white border border-stone-200/80 rounded-2xl shadow-xs p-4 flex justify-between items-center">
            <div>
              <p class="text-[10px] font-extrabold text-[#5A6E6B] uppercase tracking-wider">Active Accounts</p>
              <%Long count = la.stream().filter(a->a.getStatus().equalsIgnoreCase("active")).count();%>
              <h2 class="text-xl font-black text-emerald-700 tracking-tight mt-1"><%=count%></h2>
              <p class="text-[9px] font-bold text-emerald-600/70 mt-0.5">Live & cleared</p>
            </div>
            <div class="h-11 w-11 rounded-xl bg-emerald-50 border border-emerald-100 flex justify-center items-center text-emerald-600">
              <i class="fa-solid fa-circle-check text-xs"></i>
            </div>
          </div>

          <!-- Pending Approvals -->
          <div class="bg-white border border-stone-200/80 rounded-2xl shadow-xs p-4 flex justify-between items-center">
            <div>
              <p class="text-[10px] font-extrabold text-amber-600 uppercase tracking-wider">In Verification</p>
              <%Long count1 = la.stream().filter(a->a.getStatus().equalsIgnoreCase("pending")).count();%>
              <h2 class="text-xl font-black text-amber-700 tracking-tight mt-1"><%=count1%></h2>
              <p class="text-[9px] font-bold text-amber-600/70 mt-0.5">Awaiting check</p>
            </div>
            <div class="h-11 w-11 rounded-xl bg-amber-50 border border-amber-100 flex justify-center items-center text-amber-600">
              <i class="fa-solid fa-clock text-xs"></i>
            </div>
          </div>

          <!-- Blocked Accounts -->
          <div class="bg-white border border-stone-200/80 rounded-2xl shadow-xs p-4 flex justify-between items-center">
            <div>
              <p class="text-[10px] font-extrabold text-rose-500 uppercase tracking-wider">Blocked Accounts</p>
              <%Long count2 = la.stream().filter(a->a.getStatus().equalsIgnoreCase("blocked")).count();%>
              <h2 class="text-xl font-black text-rose-700 tracking-tight mt-1"><%=count2%></h2>
              <p class="text-[9px] font-bold text-rose-500/70 mt-0.5">Security isolated</p>
            </div>
            <div class="h-11 w-11 rounded-xl bg-rose-50 border border-rose-100 flex justify-center items-center text-rose-600">
              <i class="fa-solid fa-ban text-xs"></i>
            </div>
          </div>

          <!-- Total Net Balance -->
          <div class="bg-white border border-stone-200/80 rounded-2xl shadow-xs p-4 flex justify-between items-center">
            <div>
              <p class="text-[10px] font-extrabold text-stone-500 uppercase tracking-wider">Total Balance</p>
              <%Double total = la.stream().collect(Collectors.summingDouble(a->a.getBalance()));%>
              <h2 class="text-xl font-black text-stone-900 tracking-tight mt-1">₹ <%=total%></h2>
              <p class="text-[9px] font-bold text-stone-400 mt-0.5">Accross Accounts</p>
            </div>
            <div class="h-11 w-11 rounded-xl bg-purple-50 border border-purple-100 flex justify-center items-center text-purple-600">
              <i class="fa-solid fa-wallet text-xs"></i>
            </div>
          </div>

        </div>

        <!-- Accounts Registry Data Table Panel -->
        <div class="bg-white border border-stone-200/80 rounded-2xl shadow-sm p-5">
          <div class="flex justify-between items-center mb-4 border-b border-stone-100 pb-3">
            <h2 class="text-xs font-black text-stone-900 tracking-tight uppercase flex items-center gap-2">
              <span class="w-2 h-2 rounded-full bg-amber-500"></span> All Accounts 
            </h2>
          </div>

          <div class="overflow-x-auto custom-scrollbar max-h-[500px]">
            <table class="w-full text-left text-xs border-collapse">
              <thead class="bg-stone-50 sticky top-0 z-10">
                <tr class="text-stone-400 font-bold uppercase text-[9px] tracking-wider border-b border-stone-100">
                  <th class="p-3">Account No</th>
                  <th class="p-3">Customer Identity</th>
                  <th class="p-3">Type</th>
                  <th class="p-3">Branch</th>
                  <th class="p-3">Available Balance</th>
                  <th class="p-3">Status</th>
                  <th class="p-3">Opened Date</th>
                  <th class="p-3 text-right">Actions</th>
                </tr>
              </thead>

              <tbody class="divide-y divide-stone-100 text-stone-600 font-medium">
                 <%for(Account a : la){%>
                <!-- Row 1: Pending Account -->
                <tr class="hover:bg-stone-50/60 transition-colors">
                  <td class="p-3 font-bold text-stone-900 tracking-wide"><%=a.getAcc_no()%></td>
                  <%UserDAO udao = new UserDAOImpl();
                   User u1 = udao.getUserById(a.getUser_id());
                  %>
                  <td class="p-3 text-stone-700 font-semibold"><%=u1.getUser_name()%></td>
                  <td class="p-3 text-stone-500"><%=a.getAcc_type()%> Account</td>
                  <%BranchDAO bdao = new BranchDAOImpl();
                  Branch b = bdao.getBranchById(a.getBranch_id());
                  %>
                  <td class="p-3 text-stone-500"><%=b.getBranch_name()%></td>
                  <td class="p-3 font-semibold text-stone-700">₹ <%=a.getBalance()%></td>
                  <td class="p-3">
                  <%if(a.getStatus().equalsIgnoreCase("active")){%>
                   <span class="bg-emerald-50 text-emerald-800 text-[10px] font-bold px-2 py-0.5 rounded-md border border-emerald-200">
                      Active
                    </span>
                    <%} else {%>
                    <span class="bg-yellow-50 text-yellow-800 text-[10px] font-bold px-2 py-0.5 rounded-md border border-emerald-200">
                      Pending
                    </span>
                    <%}%>
                  </td>
                  <%LocalDate date = LocalDate.parse(a.getCreated_at());
                  DateTimeFormatter dd = DateTimeFormatter.ofPattern("dd MMM yyyy");
                  %>
                  <td class="p-3 text-stone-400 font-semibold"><%=date.format(dd)%></td>
                  <td class="p-3 flex justify-end gap-2 whitespace-nowrap">
                  <%if(a.getStatus().equalsIgnoreCase("pending")){%>
                    <form action="approveAccount" method="post" class="inline">
					    <input type="hidden" name="accid" value="<%=a.getAcc_id()%>">
					    <button type="submit"
					        class="bg-emerald-50 text-emerald-700 border border-emerald-200 text-[10px] font-bold px-2.5 py-1.5 rounded-lg hover:bg-emerald-100 transition-colors">
					        <i class="fa-solid fa-check mr-1"></i> Approve
					    </button>
					</form>
                    
                    <form action="rejectAccount" method="post" class="inline">
					    <input type="hidden" name="accid" value="<%=a.getAcc_id()%>">
					
					    <button type="submit"
					        class="bg-rose-50 text-rose-700 border border-rose-200 text-[10px] font-bold px-2.5 py-1.5 rounded-lg hover:bg-rose-100 transition-colors">
					        <i class="fa-solid fa-xmark mr-1"></i> Reject
					    </button>
					</form>
                    <%} else {%>
                    <form action="viewuser_account.jsp" method="post" class="inline">
					    <input type="hidden" name="accid" value="<%=a.getAcc_id()%>">
					
					    <button type="submit"
					        class="bg-stone-100 text-stone-700 border border-stone-200 text-[10px] font-bold px-2.5 py-1.5 rounded-lg hover:bg-stone-200 transition-colors">
					        <i class="fa-solid fa-eye mr-1"></i> View
					    </button>
					</form>
                    
                    
                    <form action="updateaccount.jsp" method="post" class="inline">
					    <input type="hidden" name="accid" value="<%=a.getAcc_id()%>">
					
					    <button type="submit"
					        class="bg-purple-50 text-purple-700 border border-purple-200 text-[10px] font-bold px-2.5 py-1.5 rounded-lg hover:bg-purple-100 transition-colors">
					        <i class="fa-solid fa-pen-to-square mr-1"></i> Update
					    </button>
					</form>
                    <%}%>
                  </td>
                </tr>
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