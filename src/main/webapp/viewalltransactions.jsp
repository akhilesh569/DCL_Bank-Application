<%@page import="java.util.Comparator"%>
<%@page import="com.bank.dao.impl.UserDAOImpl"%>
<%@page import="com.bank.dao.UserDAO"%>
<%@page import="com.bank.dto.Account"%>
<%@page import="com.bank.dao.impl.AccountDAOImpl"%>
<%@page import="com.bank.dao.AccountDAO"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="com.bank.dto.Transcation"%>
<%@page import="java.util.List"%>
<%@page import="com.bank.dao.impl.TranscationDAOImpl"%>
<%@page import="com.bank.dao.TranscationDAO"%>
<%@page import="com.bank.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DCL Bank - Transactions</title>
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
    
    .admin-bg-gradient {
      background: radial-gradient(circle at top right, #1B3330 0%, #0D1F1D 100%);
    }
  </style>
</head>

<body class="bg-[#EAEFF1] text-slate-800 min-h-screen antialiased">
<%User u = (User) session.getAttribute("user");%>
<%if(u != null){%>

<div class="flex min-h-screen">

  <aside class="fixed top-0 h-screen left-0 z-50 w-60 admin-sidebar-bg text-white px-4 py-4 flex flex-col gap-4 border-r border-[#1B3330] shadow-2xl overflow-y-auto">
      
  <div class="flex gap-3 items-center mb-2 px-2 pt-2">
    <div class="w-9 h-9 rounded-xl bg-gradient-to-br from-[#F59E0B] to-[#D97706] flex items-center justify-center shadow-lg shadow-amber-500/20">
      <i class="fa-solid fa-building-columns text-stone-900 text-sm"></i>
    </div>
    <div class="leading-none">
      <span class="text-base font-black tracking-tight block text-white">DCL <span class="text-[#F59E0B]">BANK</span></span>
      <span class="text-[9px] font-bold text-[#94A19F] uppercase tracking-widest block mt-0.5">Admin Terminal</span>
    </div>
  </div>

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

    <div class="flex gap-3 items-center hover:bg-white/5 rounded-xl p-3 transition-all text-[#94A19F] hover:text-white group">
	  <i class="fa-solid fa-credit-card text-[#5A6E6B] group-hover:text-[#F59E0B] transition-colors text-sm w-4 text-center"></i>
	  <a href="viewall_accounts.jsp" class="text-xs font-semibold tracking-wide">Accounts</a>
	</div>

    <div class="flex gap-3 items-center bg-white/5 rounded-xl p-3 text-white group relative">
	  <div class="absolute left-0 top-1/2 -translate-y-1/2 w-1 h-5 bg-[#F59E0B] rounded-r-full"></div>
	  <i class="fa-solid fa-arrow-right-arrow-left text-[#F59E0B] text-sm w-4 text-center"></i>
	  <a href="viewalltransactions.jsp" class="text-xs font-bold tracking-wide">All Transcations</a>
	</div>

    <p class="px-3 text-[10px] font-bold tracking-wider text-[#5A6E6B] uppercase mt-4 mb-1">Account Settings</p>

    <div class="flex gap-3 items-center hover:bg-white/5 rounded-xl p-3 transition-all text-[#94A19F] hover:text-white group">
      <i class="fa-solid fa-user-gear text-[#5A6E6B] group-hover:text-[#F59E0B] transition-colors text-sm w-4 text-center"></i>
      <a href="edit_profile.jsp" class="text-xs font-semibold tracking-wide">Profile</a>
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
        <h3 class="text-lg font-black tracking-tight text-stone-900">Transaction <span class="text-[#B45309]">Management</span></h3>
      </div>

     <div class="relative inline-block group py-2">
  <div class="flex items-center gap-3 bg-white group-hover:bg-stone-50 border border-stone-200/80 px-3 py-2 rounded-2xl cursor-pointer shadow-xs transition-all">

    <div class="h-9 w-9 rounded-xl bg-amber-50 text-[#B45309] flex items-center justify-center border border-amber-200">
      <i class="fa-solid fa-user-shield text-xs"></i>
    </div>

    <div class="text-left select-none pr-2">
      <h4 class="text-xs font-black text-stone-800 leading-tight">
        <%=u.getUser_name()%>
      </h4>
      <p class="text-[10px] text-stone-400 font-black tracking-wide uppercase">
        Manager
      </p>
    </div>

  </div>

<div class="absolute right-0 top-[calc(100%-2px)] w-52 bg-white rounded-2xl shadow-xl border border-stone-200/70 p-2 hidden group-hover:block transition-all duration-200 z-50">
    <a href="index.jsp" class="flex items-center gap-3 text-xs font-semibold text-stone-700 hover:bg-stone-50 rounded-xl p-2.5 transition-colors">
      <i class="fa-solid fa-circle-user text-stone-400 text-sm"></i>
      Home portal
    </a>

    <a href="edit_profile.jsp" class="flex items-center gap-3 text-xs font-semibold text-stone-700 hover:bg-stone-50 rounded-xl p-2.5 transition-colors">
      <i class="fa-solid fa-gear text-stone-400 text-sm"></i>
      Profile Settings
    </a>

    <div class="h-px bg-stone-100 my-1.5"></div>

    <a href="Logout" class="flex items-center gap-3 text-xs font-bold text-rose-600 hover:bg-rose-50 rounded-xl p-2.5 transition-colors">
      <i class="fa-solid fa-right-from-bracket text-sm"></i>
      Secure Signout
    </a>

  </div>
</div>
    </header>

    <main class="pt-20 min-h-screen bg-[#EAEFF1] w-full">
      <div class="p-8 space-y-6">

        <div class="bg-white rounded-3xl p-6 shadow-md border border-stone-200/60">
          <form action="Transactionsfilt" method="POST" class="flex flex-wrap items-end gap-5">
            
            <div class="flex-grow min-w-[240px]">
              <label class="text-[10px] font-black text-stone-400 uppercase tracking-wider block">Account Number</label>
              <div class="border border-stone-200 bg-stone-50/50 rounded-xl px-4 py-3 flex items-center gap-3 mt-1.5 focus-within:border-amber-500 focus-within:bg-white transition-all shadow-xs">
                <i class="fa-solid fa-magnifying-glass text-stone-400 text-xs"></i>
                <input type="number" name="account_no" placeholder="Search accounts..." class="outline-none w-full text-xs font-medium text-stone-800 placeholder-stone-400">
              </div>
            </div>

            <div class="w-56">
              <label class="text-[10px] font-black text-stone-400 uppercase tracking-wider block">Transcation Status</label>
              <div class="relative mt-1.5">
                <select name="status" class="w-full appearance-none border border-stone-200 bg-stone-50/50 rounded-xl px-4 py-3 text-xs font-bold text-stone-700 outline-none focus:border-amber-500 focus:bg-white transition-all shadow-xs pr-10">
                  <option value="">All Operational Status</option>
                  <option value="success">SUCCESS</option>
                  <option value="failed">FAILED</option>
                </select>
                <div class="absolute right-4 top-1/2 -translate-y-1/2 pointer-events-none text-stone-400 text-[10px]">
                  <i class="fa-solid fa-chevron-down"></i>
                </div>
              </div>
            </div>

            <div class="flex gap-3 ml-auto">
              <button type="submit" class="bg-[#B45309] hover:bg-[#92400E] text-white text-xs font-bold px-6 py-3 rounded-xl shadow-md hover:shadow-lg active:scale-98 transition-all flex items-center gap-2 cursor-pointer">
                <i class="fa-solid fa-filter text-xs text-amber-200"></i> Search
              </button>
              
              <a href="viewalltransactions.jsp" class="bg-stone-100 hover:bg-stone-200 text-stone-600 text-xs font-bold px-5 py-3 rounded-xl border border-stone-200/80 transition-all flex items-center gap-2">
                <i class="fa-solid fa-arrow-rotate-left text-xs"></i> Reset
              </a>
            </div>

          </form>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-5">
          <%
          List<Transcation> allTrans = (List<Transcation>)request.getAttribute("result");
          if(allTrans == null){
        	  TranscationDAO tdao = new TranscationDAOImpl();
              allTrans = tdao.getAllTranscation();
              allTrans = allTrans.stream().sorted(Comparator.comparing((Transcation t)->t.getTranscation_date()).thenComparing((Transcation t)->t.getTranscation_time()).reversed()).collect(Collectors.toList()); 
          }
          %>
          <div class="bg-white p-5 rounded-3xl border border-stone-200/60 shadow-md flex items-center justify-between">
            <div>
              <span class="text-[10px] font-bold text-stone-400 uppercase tracking-wider block">Total Transcations</span>
              <h2 class="text-2xl font-black text-stone-900 tracking-tight mt-1"><%=allTrans.size()%></h2>
              <p class="text-[10px] text-stone-400 mt-1.5 font-medium">All system Transcations</p>
            </div>
            <div class="h-12 w-12 rounded-2xl bg-stone-50 text-[#B45309] border border-stone-100 flex items-center justify-center">
              <i class="fa-solid fa-arrow-right-arrow-left text-sm"></i>
            </div>
          </div>

          <div class="bg-white p-5 rounded-3xl border border-stone-200/60 shadow-md flex items-center justify-between">
            <div>
            <%
            Long count = allTrans.stream().filter(t->t.getStatus().equalsIgnoreCase("success")).count();
            %>
              <span class="text-[10px] font-bold text-stone-400 uppercase tracking-wider block">Successful Transcations</span>
              <h2 class="text-2xl font-black text-emerald-600 tracking-tight mt-1"><%=count%></h2>
              <p class="text-[10px] text-emerald-600 font-extrabold mt-1.5 tracking-wide uppercase">Cleared Settlement</p>
            </div>
            <div class="h-12 w-12 rounded-2xl bg-emerald-50 text-emerald-600 border border-emerald-100 flex items-center justify-center">
              <i class="fa-solid fa-circle-check text-sm"></i>
            </div>
          </div>

          <div class="bg-white p-5 rounded-3xl border border-stone-200/60 shadow-md flex items-center justify-between">
            <div>
              <span class="text-[10px] font-bold text-stone-400 uppercase tracking-wider block">Failed Transcations</span>
              <%Long count1 = allTrans.stream().filter(t->t.getStatus().equalsIgnoreCase("failed")).count();%>
              <h2 class="text-2xl font-black text-rose-600 tracking-tight mt-1"><%=count1%></h2>
              <p class="text-[10px] text-rose-500 font-extrabold mt-1.5 tracking-wide uppercase">Failed records</p>
            </div>
            <div class="h-12 w-12 rounded-2xl bg-rose-50 text-rose-600 border border-rose-100 flex items-center justify-center">
              <i class="fa-solid fa-circle-xmark text-sm"></i>
            </div>
          </div>

          <div class="bg-gradient-to-br from-[#B45309] to-[#78350F] p-5 rounded-3xl border border-[#92400E]/40 shadow-xl flex items-center justify-between text-white">
            <div>
              <span class="text-[10px] font-bold text-amber-200/70 uppercase tracking-wider block">Total amount Transferred</span>
              <%Double total = allTrans.stream().filter(t->t.getStatus().equalsIgnoreCase("success")).filter(t->t.getTrans_type().equalsIgnoreCase("transfer")).collect(Collectors.summingDouble(t->t.getAmount()));%>
              <h2 class="text-xl font-black text-white tracking-tight mt-1">₹ <%=total%></h2>
              <p class="text-[10px] text-amber-300 font-bold mt-1.5 tracking-wide uppercase">Transferred Amount</p>
            </div>
            <div class="h-12 w-12 rounded-2xl bg-white/10 text-amber-300 border border-white/5 flex items-center justify-center">
              <i class="fa-solid fa-indian-rupee-sign text-sm"></i>
            </div>
          </div>

        </div>

        <div class="bg-white rounded-3xl shadow-md border border-stone-200/60 overflow-hidden w-full">
          
          <div class="p-5 border-b border-stone-100 flex justify-between items-center bg-white">
            <h3 class="text-xs font-black text-stone-900 tracking-wider uppercase">Transcations List</h3>
            <span class="bg-stone-50 border border-stone-200 text-[10px] font-extrabold px-2.5 py-0.5 rounded text-stone-500 uppercase tracking-wider">Live Repository</span>
          </div>

          <div class="overflow-x-auto max-h-[460px] overflow-y-auto">
            <table class="w-full text-left text-xs border-collapse">
              
              <thead class="bg-[#F9FAFB] border-b border-stone-200/60 text-stone-400 font-bold uppercase tracking-wider sticky top-0 z-10">
                <tr>
                  <th class="p-4 pl-6 font-bold bg-[#F9FAFB]">Txn ID</th>
                  <th class="p-4 font-bold bg-[#F9FAFB]">Date & Time</th>
                  <th class="p-4 font-bold bg-[#F9FAFB]">Customer Name</th>
                  <th class="p-4 font-bold bg-[#F9FAFB]">From Account</th>
                  <th class="p-4 font-bold bg-[#F9FAFB]">To Account</th>
                  <th class="p-4 font-bold bg-[#F9FAFB]">Type</th>
                  <th class="p-4 font-bold bg-[#F9FAFB]">Amount</th>
                  <th class="p-4 font-bold bg-[#F9FAFB]">Status</th>
                  <th class="p-4 pr-6 font-bold bg-[#F9FAFB]">Payment Mode</th>
                </tr>
              </thead>

              <tbody class="divide-y divide-stone-100 text-stone-700 font-medium bg-white">
                <%if(allTrans != null && !allTrans.isEmpty()){%>
                 <%for(Transcation t : allTrans){%>
                <tr class="hover:bg-stone-50/60 transition-colors">
                  <td class="p-4 pl-6 font-bold text-stone-900">TXN<%=t.getTrans_id()%></td>
                  <%
                  LocalDate date = LocalDate.parse(t.getTranscation_date());
                  LocalTime time = LocalTime.parse(t.getTranscation_time());
                  DateTimeFormatter dd = DateTimeFormatter.ofPattern("dd MMM yyyy");
                  DateTimeFormatter dt = DateTimeFormatter.ofPattern("hh:mm a");
                  %>
                  <td class="p-4 text-stone-400"><%=date.format(dd)%>, <%=time.format(dt)%></td>
          
                  
                  <%
                  UserDAO udao = new UserDAOImpl();
                  AccountDAO adao = new AccountDAOImpl();
                  User us = null;
                  if(t.getTrans_type().equalsIgnoreCase("deposit")){
                	  Account ac = adao.getAccountById(t.getTo_acc_id());
                	  us = udao.getUserById(ac.getUser_id());
                  }
                  else{
                	  Account ac = adao.getAccountById(t.getFrom_acc_id());
                	  us = udao.getUserById(ac.getUser_id());
                  }
                  %>
                  
                  <td class="p-4 font-bold text-stone-800"><%=us.getUser_name()%></td>
                  
                  <%if(t.getFrom_acc_id() == 0){%>
					    <td class="p-4 tracking-wider text-stone-600 font-mono">--</td>
					<%} else {%>
					    <%Account from = adao.getAccountById(t.getFrom_acc_id());%>
					    <td class="p-4 tracking-wider text-stone-600 font-mono"><%=from.getAcc_no()%></td>
					<%}%>
					
					<%if(t.getTo_acc_id() == 0){%>
					    <td class="p-4 tracking-wider text-stone-600 font-mono">--</td>
					<%} else {%>
					    <%Account to = adao.getAccountById(t.getTo_acc_id());%>
					    <td class="p-4 tracking-wider text-stone-600 font-mono"><%=to.getAcc_no()%></td>
				  <%}%>
                                    
                  <td class="p-4">
                   <%if(t.getTrans_type().equalsIgnoreCase("transfer") || t.getTrans_type().equalsIgnoreCase("withdrawl")){%>
                    <span class="bg-amber-50 text-amber-800 border border-amber-200 text-[9px] font-black tracking-wider px-2.5 py-0.5 rounded uppercase"><%=t.getTrans_type() %></span>
                    <%} else {%>
                    <span class="bg-green-50 text-green-800 border border-amber-200 text-[9px] font-black tracking-wider px-2.5 py-0.5 rounded uppercase"><%=t.getTrans_type() %></span>
                    <%}%>
                  </td>
                  
                  <%if(t.getTrans_type().equalsIgnoreCase("transfer") || t.getTrans_type().equalsIgnoreCase("withdrawl")){%>
					<td class="p-4 text-rose-600 font-bold">₹ <%=t.getAmount() %></td>                    
					<%} else {%>
					<td class="p-4 text-green-600 font-bold">₹ <%=t.getAmount() %></td>                    
					<%}%>
                  
                  <td class="p-4">
                  <%if(t.getStatus().equalsIgnoreCase("success")){%>
                    <span class="text-emerald-700 bg-emerald-50 border border-emerald-100 text-[10px] font-extrabold px-2 py-0.5 rounded uppercase"><%=t.getStatus() %></span>
                    <%} else {%>
                     <span class="text-rose-700 bg-rose-50 border border-rose-100 text-[10px] font-extrabold px-2 py-0.5 rounded uppercase"><%=t.getStatus()%></span>
                    <%}%>
                  </td>
                  <td class="p-4 pr-6 font-bold text-stone-500"><%=t.getMode_of_transcation() %></td>
                </tr>
                <%}%>
                <%} else {%>
                 <tr>
			        <td colspan="9" class="p-10 text-center text-stone-400 font-bold">
			            No Transactions Found
			        </td>
			    </tr>
                <%}%>

              </tbody>

            </table>
          </div>

        </div>

      </div>
    </main>

  </div>

</div>
<%} else {%>
<%request.setAttribute("error", "session already expired");%>
<%request.getRequestDispatcher("login.jsp").forward(request, response);%>
<%}%>   
</body>
</html>