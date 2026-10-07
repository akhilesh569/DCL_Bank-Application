<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.Comparator"%>
<%@page import="com.bank.dto.Transcation"%>
<%@page import="com.bank.dao.impl.TranscationDAOImpl"%>
<%@page import="com.bank.dao.TranscationDAO"%>
<%@page import="com.bank.dto.Branch"%>
<%@page import="com.bank.dao.impl.BranchDAOImpl"%>
<%@page import="com.bank.dao.BranchDAO"%>
<%@page import="com.bank.dto.Account"%>
<%@page import="com.bank.dao.impl.AccountDAOImpl"%>
<%@page import="com.bank.dao.AccountDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.bank.dao.impl.UserDAOImpl"%>
<%@page import="com.bank.dao.UserDAO"%>
<%@page import="com.bank.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DCL Bank Admin Dashboard</title>
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

    <aside class="fixed top-0 h-screen left-0 z-50 w-60 admin-sidebar-bg text-white px-4 py-4 flex flex-col gap-4 border-r border-[#1B3330] shadow-2xl overflow-y-auto">
      
      <div class="flex gap-3 items-center mb-2 px-2 pt-2">
        <div class="w-9 h-9 rounded-xl bg-gradient-to-br from-[#F59E0B] to-[#D97706] flex items-center justify-center shadow-lg shadow-amber-500/20">
          <i class="fa-solid fa-building-columns text-stone-900 text-sm"></i>
        </div>
        <div class="leading-none">
          <span class="text-base font-black tracking-tight block text-white">DCL <span class="text-[#F59E0B]">BANK</span></span>
          <span class="text-[9px] font-extrabold text-[#94A19F] uppercase tracking-widest block mt-0.5">HQ Terminal</span>
        </div>
      </div>

      <div class="flex flex-col gap-1.5 px-1 flex-1">
        
        <p class="px-3 text-[10px] font-bold tracking-wider text-[#5A6E6B] uppercase mt-2 mb-1">Core Operations</p>
        
        <div class="flex gap-3 items-center bg-white/5 rounded-xl p-3 text-white group relative">
          <div class="absolute left-0 top-1/2 -translate-y-1/2 w-1 h-5 bg-[#F59E0B] rounded-r-full"></div>
          <i class="fa-solid fa-chart-pie text-[#F59E0B] text-sm w-4 text-center"></i>
          <a href="admin.jsp" class="text-xs font-bold tracking-wide">Dashboard</a>
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

        <div class="flex gap-3 items-center hover:bg-white/5 rounded-xl p-3 transition-all text-[#94A19F] hover:text-white group">
          <i class="fa-solid fa-credit-card text-[#5A6E6B] group-hover:text-[#F59E0B] transition-colors text-sm w-4 text-center"></i>
          <a href="viewall_accounts.jsp" class="text-xs font-semibold tracking-wide">Accounts</a>
        </div>

        <div class="flex gap-3 items-center hover:bg-white/5 rounded-xl p-3 transition-all text-[#94A19F] hover:text-white group">
          <i class="fa-solid fa-arrow-right-arrow-left text-[#5A6E6B] group-hover:text-[#F59E0B] transition-colors text-sm w-4 text-center"></i>
          <a href="viewalltransactions.jsp" class="text-xs font-semibold tracking-wide">All Transcations</a>
        </div>

        <p class="px-3 text-[10px] font-bold tracking-wider text-[#5A6E6B] uppercase mt-4 mb-1">Account settings</p>

        <div class="flex gap-3 items-center hover:bg-white/5 rounded-xl p-3 transition-all text-[#94A19F] hover:text-white group">
          <i class="fa-solid fa-user-gear text-[#5A6E6B] group-hover:text-[#F59E0B] transition-colors text-sm w-4 text-center"></i>
          <a href="edit_profile.jsp" class="text-xs font-semibold tracking-wide">Profile Config</a>
        </div>
      </div>

      <div class="mt-auto border-t border-white/5 pt-4 px-1 shrink-0">
        <div class="flex gap-3 items-center bg-rose-500/10 hover:bg-rose-500/20 rounded-xl p-3 transition-all text-rose-400 hover:text-rose-300 group">
          <i class="fa-solid fa-power-off text-rose-500 text-sm w-4 text-center"></i>
          <a href="Logout" class="text-xs font-bold tracking-wide">Secure Signout</a>
        </div>
      </div>

    </aside>

    <div class="flex-grow min-h-screen flex flex-col pl-60">

      <header class="fixed top-0 left-60 right-0 h-20 bg-white/90 border-b border-stone-200/80 shadow-xs flex items-center justify-between px-10 z-40">
        <div class="flex items-center gap-2.5">
          <span class="bg-amber-50 text-amber-800 text-[10px] font-extrabold px-2 py-0.5 rounded-md border border-amber-200 tracking-wide uppercase">System Admin</span>
          <h3 class="text-lg font-black tracking-tight text-stone-900">Control Dashboard</h3>
        </div>

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

          <div class="absolute right-0 top-full pt-2 w-52 hidden group-hover:block z-50">
            <div class="bg-white border border-stone-200/80 rounded-xl shadow-2xl overflow-hidden">
              <a href="index.jsp" class="flex gap-3 items-center px-4 py-3 hover:bg-stone-50 text-xs font-bold text-stone-600 hover:text-stone-900 transition-colors border-b border-stone-100">
                <i class="fa-solid fa-gauge text-stone-400 text-sm w-4"></i> Home Portal
              </a>
              <a href="edit_profile.jsp" class="flex gap-3 items-center px-4 py-3 hover:bg-stone-50 text-xs font-bold text-stone-600 hover:text-stone-900 transition-colors border-b border-stone-100">
                <i class="fa-solid fa-user text-stone-400 text-sm w-4"></i> Edit Profile
              </a>
              <a href="Logout" class="flex gap-3 items-center px-4 py-3 hover:bg-rose-50 text-xs font-bold text-rose-600 transition-colors">
                <i class="fa-solid fa-right-from-bracket text-rose-400 text-sm w-4"></i> Secure Signout
              </a>
            </div>
          </div>
        </div>

      </header>

      <!-- Dashboard Content Space -->
      <div class="p-8 pt-28 space-y-6 flex-grow max-w-[1240px] w-full mx-auto">

        <!-- Metrics Analytics Row -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-5">

          <!-- Card 1: Total Users -->
          <div class="bg-white border border-stone-200/80 rounded-2xl shadow-xs p-5 flex justify-between items-center hover:scale-[1.01] transition-transform">
            <div>
              <p class="text-[11px] font-extrabold text-stone-400 uppercase tracking-wider">Total Users</p>
              <%
              UserDAO udao = new UserDAOImpl();
              List<User> lu = udao.getAllUser();
              %>
              <h2 class="text-2xl font-black mt-1 text-stone-900 tracking-tight"><%=lu.size()%></h2>
              <p class="text-stone-400 text-[11px] font-medium mt-1">All verified</p>
            </div>
            <div class="h-11 w-11 rounded-xl bg-stone-50 border border-stone-100 flex justify-center items-center shadow-xs">
              <i class="fa-solid fa-users text-stone-600 text-sm"></i>
            </div>
          </div>

          <!-- Card 2: Total Accounts -->
          <div class="bg-white border border-stone-200/80 rounded-2xl shadow-xs p-5 flex justify-between items-center hover:scale-[1.01] transition-transform">
            <div>
              <p class="text-[11px] font-extrabold text-stone-400 uppercase tracking-wider">Total Accounts</p>
              <%
              AccountDAO adao = new AccountDAOImpl();
              List<Account> la = adao.getAllAccounts();
              %>
              <h2 class="text-2xl font-black mt-1 text-stone-900 tracking-tight"><%=la.size()%></h2>
              <p class="text-stone-400 text-[11px] font-medium mt-1">All Accounts</p>
            </div>
            <div class="h-11 w-11 rounded-xl bg-stone-50 border border-stone-100 flex justify-center items-center shadow-xs">
              <i class="fa-solid fa-credit-card text-stone-600 text-sm"></i>
            </div>
          </div>

          <!-- Card 3: Total Branches -->
          <div class="bg-white border border-stone-200/80 rounded-2xl shadow-xs p-5 flex justify-between items-center hover:scale-[1.01] transition-transform">
            <div>
              <p class="text-[11px] font-extrabold text-stone-400 uppercase tracking-wider">Total Branches</p>
              <%
              BranchDAO bdao = new BranchDAOImpl();
              List<Branch> lb = bdao.getAllBranch();
              %>
              <h2 class="text-2xl font-black mt-1 text-stone-900 tracking-tight"><%=lb.size()%></h2>
              <p class="text-stone-400 text-[11px] font-medium mt-1">Operational local zones</p>
            </div>
            <div class="h-11 w-11 rounded-xl bg-amber-50 border border-amber-100 flex justify-center items-center shadow-xs">
              <i class="fa-solid fa-building text-amber-600 text-sm"></i>
            </div>
          </div>

          <!-- Card 4: Gold Luxury Highlight Accent Card -->
          <div class="bg-gradient-to-br from-[#D97706] via-[#B45309] to-[#78350F] rounded-2xl shadow-lg shadow-amber-950/20 p-5 flex justify-between items-center overflow-hidden group relative hover:scale-[1.01] transition-transform">
            <div class="absolute top-0 right-0 w-16 h-16 bg-white/10 rounded-full blur-md pointer-events-none"></div>
            <div>
              <p class="text-[11px] font-extrabold text-amber-100/90 uppercase tracking-wider">Transactions</p>
              <%
              TranscationDAO tdao = new TranscationDAOImpl();
              List<Transcation> lt = tdao.getAllTranscation();
              %>
              <h2 class="text-2xl font-black mt-1 text-white tracking-tight"><%=lt.size()%></h2>
              <p class="text-amber-100/70 text-[11px] font-medium mt-1">All Transcations</p>
            </div>
            <div class="h-11 w-11 rounded-xl bg-white/10 border border-white/20 flex justify-center items-center">
              <i class="fa-solid fa-arrow-right-arrow-left text-white text-sm"></i>
            </div>
          </div>

        </div>

        <!-- Table Grid Systems Split layout -->
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">

          <!-- Left Panel: Pending Account Requests Workflow -->
          <div class="bg-white border border-stone-200/80 rounded-2xl shadow-sm p-5">
            <div class="flex justify-between items-center mb-4 border-b border-stone-100 pb-3">
              <h2 class="text-xs font-black text-stone-900 tracking-tight uppercase flex items-center gap-2">
                <span class="w-2 h-2 rounded-full bg-amber-500"></span> Pending Verifications
              </h2>
              <span class="bg-amber-50 text-amber-800 border border-amber-200 text-[10px] font-extrabold px-2 py-0.5 rounded-md uppercase tracking-wide">Action Required</span>
            </div>

            <div class="overflow-x-auto custom-scrollbar">
              <table class="w-full text-left text-xs border-collapse">
                <thead class="bg-stone-50/70">
                  <tr class="text-stone-400 font-bold uppercase text-[9px] tracking-wider border-b border-stone-100">
                    <th class="p-3">Account No</th>
                    <th class="p-3">User</th>
                    <th class="p-3">Account Type</th>
                    <th class="p-3">Branch Location</th>
                    <th class="p-3 text-right">Action</th>
                  </tr>
                </thead>

                <tbody class="divide-y divide-stone-100 text-stone-600 font-medium">
                <%
                List<Account> pending = la.stream().filter(a->a.getStatus().equalsIgnoreCase("pending")).sorted(Comparator.comparing((Account a)->a.getCreated_at()).reversed()).limit(5).collect(Collectors.toList());
                %>
                <%if(!pending.isEmpty()){%>
                <%for(Account a :pending){%>
                  <tr class="hover:bg-stone-50/60 transition-colors">
                    <td class="p-3 font-bold text-stone-900 tracking-wide"><%=a.getAcc_no()%></td>
                    <%
                    User holder = udao.getUserById(a.getUser_id());
                    %>
                    <td class="p-3 text-stone-700 font-semibold"><%=holder.getUser_name()%></td>
                    <td class="p-3"><span class="bg-stone-100 text-stone-700 border border-stone-200 px-2 py-0.5 rounded text-[10px] font-bold"><%=a.getAcc_type()%></span></td>
                    <%Branch b = bdao.getBranchById(a.getBranch_id());%>
                    <td class="p-3 text-stone-500"><%=b.getCity()%></td>
                    <td class="p-3 flex justify-end gap-2 whitespace-nowrap">
                     
                     <form action="approveAccount" method="post" style="display:inline;">
					    <input type="hidden" name="accid" value="<%=a.getAcc_id()%>">
					    <button type="submit" class="bg-[#B45309] text-white text-[10px] font-bold px-2.5 py-1 rounded-lg hover:bg-[#92400E] shadow-xs transition-colors cursor-pointer">Approve</button>
					</form>
                      
					<form action="rejectAccount" method="post" style="display:inline;">
					    <input type="hidden" name="accid" value="<%=a.getAcc_id()%>">
					    <button type="submit" class="bg-rose-50 text-rose-700 border border-rose-200 text-[10px] font-bold px-2.5 py-1 rounded-lg hover:bg-rose-100 transition-colors cursor-pointer">Reject</button>
					</form>                    
					</td>
                  </tr>
                  <%}%>
                  <%} else {%>
                 <tr>
			        <td colspan="5"
			            class="p-8 text-center text-stone-400 font-bold">
			            No Pending Accounts
			        </td>
			    </tr>
                  <%}%>
                </tbody>
              </table>
            </div>

          </div>

          <!-- Right Panel: Live Dynamic Recent Transactions Monitor -->
          <div class="bg-white border border-stone-200/80 rounded-2xl shadow-sm p-5">
            <div class="flex justify-between items-center mb-4 border-b border-stone-100 pb-3">
              <h2 class="text-xs font-black text-stone-900 tracking-tight uppercase flex items-center gap-2">
                <span class="w-2 h-2 rounded-full bg-emerald-600 animate-pulse"></span>Transcation Activity
              </h2>
              <span class="text-[10px] font-extrabold text-emerald-600 bg-emerald-50 border border-emerald-100 px-2 py-0.5 rounded-md uppercase tracking-wider">Live Feed</span>
            </div>

            <div class="overflow-x-auto custom-scrollbar">
              <table class="w-full text-left text-xs border-collapse">
                <thead class="bg-stone-50/70">
                  <tr class="text-stone-400 font-bold uppercase text-[9px] tracking-wider border-b border-stone-100">
                    <th class="p-3">Txn ID</th>
                    <th class="p-3">Profile</th>
                    <th class="p-3">Type</th>
                    <th class="p-3">Amount</th>
                    <th class="p-3 text-right">Status</th>
                  </tr>
                </thead>
                
                <%
                List<Transcation> allTrans = tdao.getAllTranscation().stream().sorted(Comparator.comparing((Transcation t)->t.getTranscation_date()).thenComparing((Transcation t)->t.getTranscation_time()).reversed()).limit(5).collect(Collectors.toList());
                %>

                <tbody class="divide-y divide-stone-100 text-stone-600 font-medium">
                <%for(Transcation t : allTrans){%>
                  <tr class="hover:bg-stone-50/60 transition-colors">
                    <td class="p-3 font-bold text-stone-900 tracking-wide">TXN<%=t.getTrans_id()%></td>
                    <%User u1 = null;%>
                    <%
                    if(t.getTrans_type().equalsIgnoreCase("transfer") || t.getTrans_type().equalsIgnoreCase("withdrawl")){
                    	Account a = adao.getAccountById(t.getFrom_acc_id());
                    	u1 = udao.getUserById(a.getUser_id());
                    }
                    else{
                    	Account a = adao.getAccountById(t.getTo_acc_id());
                    	u1 = udao.getUserById(a.getUser_id());
                    }
                    %>
                    <td class="p-3 text-stone-700 font-semibold"><%=u1.getUser_name()%></td>
                    <td class="p-3 text-stone-500"><%=t.getTrans_type() %></td>
                    <%if(t.getTrans_type().equalsIgnoreCase("transfer") || t.getTrans_type().equalsIgnoreCase("withdrawl")){%>
                    <td class="p-3 text-rose-600 font-bold">- ₹ <%=t.getAmount() %></td>
                    <%} else { %>
                    <td class="p-3 text-emerald-600 font-bold">+ ₹ <%=t.getAmount()%></td>
                    <%}%>
                    <td class="p-3 text-right">
                    <%if(t.getStatus().equalsIgnoreCase("success")){%>
                      <span class="bg-emerald-50 text-emerald-700 border border-emerald-200/60 text-[10px] font-extrabold px-2 py-0.5 rounded-md"><%=t.getStatus()%></span>
                      <%} else {%>
                      <span class="bg-rose-50 text-rose-700 border border-rose-100 text-[10px] font-extrabold px-2 py-0.5 rounded-md"><%=t.getStatus()%></span>
                      <%}%>
                    </td>
                  </tr>
                  <%}%>
                </tbody>
              </table>
            </div>

          </div>

        </div>


        <div class="bg-white border border-stone-200/80 rounded-2xl shadow-sm p-6">
          <h2 class="text-xs font-black text-stone-900 tracking-tight uppercase mb-4 border-b border-stone-100 pb-3">Accounts Info</h2>

          <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">

            <div class="bg-emerald-50/40 border border-emerald-100 rounded-xl p-4 flex items-center gap-3.5">
              <div class="h-10 w-10 rounded-xl bg-emerald-100/80 flex justify-center items-center shrink-0">
                <i class="fa-solid fa-circle-check text-emerald-600 text-base"></i>
              </div>
              <div>
                <p class="text-[10px] font-extrabold text-stone-400 uppercase tracking-wide">Active Accounts</p>
                <%Long count = la.stream().filter(a->a.getStatus().equalsIgnoreCase("active")).count();%>
                <h2 class="text-xl font-black text-slate-900 tracking-tight"><%=count %></h2>
              </div>
            </div>

            <div class="bg-amber-50/40 border border-amber-100 rounded-xl p-4 flex items-center gap-3.5">
              <div class="h-10 w-10 rounded-xl bg-amber-100/80 flex justify-center items-center shrink-0">
                <i class="fa-solid fa-hourglass-half text-amber-600 text-base"></i>
              </div>
              <div>
                <p class="text-[10px] font-extrabold text-stone-400 uppercase tracking-wide">Pending Review</p>
                <%Long count1 = la.stream().filter(a->a.getStatus().equalsIgnoreCase("pending")).count();%>
                <h2 class="text-xl font-black text-slate-900 tracking-tight"><%=count1%></h2>
              </div>
            </div>

            <div class="bg-rose-50/40 border border-rose-100 rounded-xl p-4 flex items-center gap-3.5">
              <div class="h-10 w-10 rounded-xl bg-rose-100/80 flex justify-center items-center shrink-0">
                <i class="fa-solid fa-hand text-rose-600 text-base"></i>
              </div>
              <div>
                <p class="text-[10px] font-extrabold text-stone-400 uppercase tracking-wide">Rejected Logs</p>
                <%Long count3 = la.stream().filter(a->a.getStatus().equalsIgnoreCase("rejected")).count();%>
                <h2 class="text-xl font-black text-slate-900 tracking-tight"><%=count3%></h2>
              </div>
            </div>

            <div class="bg-stone-100 border border-stone-200 rounded-xl p-4 flex items-center gap-3.5">
              <div class="h-10 w-10 rounded-xl bg-slate-200/80 flex justify-center items-center shrink-0">
                <i class="fa-solid fa-box-archive text-stone-600 text-base"></i>
              </div>
              <div>
                <p class="text-[10px] font-extrabold text-stone-400 uppercase tracking-wide">Terminated Accounts</p>
                <%Long count4 = la.stream().filter(a->a.getStatus().equalsIgnoreCase("blocked")).count();%>
                <h2 class="text-xl font-black text-stone-900 tracking-tight"><%=count4%></h2>
              </div>
            </div>

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