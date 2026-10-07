<%@page import="java.time.LocalTime"%>
<%@page import="com.bank.dto.Branch"%>
<%@page import="com.bank.dao.impl.BranchDAOImpl"%>
<%@page import="com.bank.dao.BranchDAO"%>
<%@page import="java.util.Optional"%>
<%@page import="java.util.Comparator"%>
<%@page import="com.bank.dao.impl.TranscationDAOImpl"%>
<%@page import="com.bank.dao.TranscationDAO"%>
<%@page import="com.bank.dto.Transcation"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="com.bank.dto.Account"%>
<%@page import="java.util.List"%>
<%@page import="com.bank.dao.impl.AccountDAOImpl"%>
<%@page import="com.bank.dao.AccountDAO"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
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
  <title>DCL Bank Admin - User Details</title>
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

    <!-- Premium Charcoal Green & Gold Sidebar -->
    <aside class="fixed top-0 h-screen left-0 z-50 w-60 admin-sidebar-bg text-white px-4 py-4 flex flex-col gap-4 border-r border-[#1B3330] shadow-2xl overflow-y-auto">
      
      <!-- Admin Logo Header Area -->
      <div class="flex gap-3 items-center mb-2 px-2 pt-2">
        <div class="w-9 h-9 rounded-xl bg-gradient-to-br from-[#F59E0B] to-[#D97706] flex items-center justify-center shadow-lg shadow-amber-500/20">
          <i class="fa-solid fa-building-columns text-stone-900 text-sm"></i>
        </div>
        <div class="leading-none">
          <span class="text-base font-black tracking-tight block text-white">DCL <span class="text-[#F59E0B]">BANK</span></span>
          <span class="text-[9px] font-extrabold text-[#94A19F] uppercase tracking-widest block mt-0.5">HQ Terminal</span>
        </div>
      </div>

      <!-- Navigation Links Container -->
      <div class="flex flex-col gap-1.5 px-1 flex-1">
        
        <p class="px-3 text-[10px] font-bold tracking-wider text-[#5A6E6B] uppercase mt-2 mb-1">Core Operations</p>
        
        <div class="flex gap-3 items-center hover:bg-white/5 rounded-xl p-3 transition-all text-[#94A19F] hover:text-white group">
          <i class="fa-solid fa-chart-pie text-[#5A6E6B] group-hover:text-[#F59E0B] transition-colors text-sm w-4 text-center"></i>
          <a href="admin.jsp" class="text-xs font-semibold tracking-wide">Dashboard</a>
        </div>

        <!-- Highlighted Active Context: Users Ledger Area -->
        <div class="flex gap-3 items-center bg-white/5 rounded-xl p-3 text-white group relative">
          <div class="absolute left-0 top-1/2 -translate-y-1/2 w-1 h-5 bg-[#F59E0B] rounded-r-full"></div>
          <i class="fa-solid fa-users text-[#F59E0B] text-sm w-4 text-center"></i>
          <a href="viewallusers.jsp" class="text-xs font-bold tracking-wide">View Users</a>
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

      <!-- Bottom Logout Section -->
      <div class="mt-auto border-t border-white/5 pt-4 px-1 shrink-0">
        <div class="flex gap-3 items-center bg-rose-500/10 hover:bg-rose-500/20 rounded-xl p-3 transition-all text-rose-400 hover:text-rose-300 group">
          <i class="fa-solid fa-power-off text-rose-500 text-sm w-4 text-center"></i>
          <a href="Logout" class="text-xs font-bold tracking-wide">Secure Signout</a>
        </div>
      </div>

    </aside>

    <!-- Main System Space Frame -->
    <div class="flex-grow min-h-screen flex flex-col pl-60">

      <!-- Header Frame with Action Route Feature (Back to Users) -->
      <header class="fixed top-0 left-60 right-0 h-20 bg-white/90 border-b border-stone-200/80 shadow-xs flex items-center justify-between px-10 z-40">
        <div class="flex items-center gap-2.5">
          <span class="bg-amber-50 text-amber-800 text-[10px] font-extrabold px-2 py-0.5 rounded-md border border-amber-200 tracking-wide uppercase">Audit Scope</span>
          <h3 class="text-lg font-black tracking-tight text-stone-900">User Profile File</h3>
        </div>

        <!-- Back to Users Action Route Interface (No Hover Profile Menu) -->
        <div>
          <a href="viewallusers.jsp" class="inline-flex items-center gap-2 bg-stone-100 text-stone-700 hover:bg-stone-200/80 border border-stone-200/60 text-xs font-bold px-4 py-2.5 rounded-xl transition-colors">
            <i class="fa-solid fa-arrow-left text-[11px] text-stone-500"></i> Back to users
          </a>
        </div>
      </header>
      
      <%Integer id = Integer.parseInt(request.getParameter("user_id"));
      UserDAO udao = new UserDAOImpl();
      User u1 = udao.getUserById(id);
      %>

      <!-- Content Container Layout Space -->
      <div class="p-8 pt-28 space-y-6 flex-grow max-w-[1240px] w-full mx-auto">

        <!-- Section 1: User Profile & Quick Analytics Summary Segment -->
        <div class="bg-gradient-to-br from-[#FEF3C7] via-[#FDE68A] to-[#FCD34D] border border-amber-200 rounded-2xl shadow-sm p-6">
          <div class="flex flex-col lg:flex-row justify-between items-start lg:items-center gap-6">

            <!-- Profile Core Metadata Badge Panel -->
            <div class=" flex flex-col sm:flex-row items-center sm:items-start gap-6">
              <div class="h-24 w-24 rounded-2xl bg-gradient-to-br from-stone-50 to-stone-100/40 border border-stone-200 flex items-center justify-center shadow-xs shrink-0">
                <i class="fa-solid fa-user text-brown-400 text-4xl"></i>
              </div>

              <div class="space-y-2 text-xs font-medium text-stone-600 w-full">
                <h2 class="text-xl font-black text-[#78350F] tracking-tight mb-2 flex items-center gap-2">
                  <%=u1.getUser_name()%>
                </h2>
                
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-x-8 gap-y-2 pt-1">
                  <p><span class="font-bold text-[#B45309] uppercase tracking-wider text-[10px] inline-block w-28">Email Address</span>: <span class="text-[#451A03] font-semibold"><%=u1.getEmail()%></span></p>
                  <p><span class="font-bold text-[#B45309] uppercase tracking-wider text-[10px] inline-block w-28">Phone</span> : <span class="text-[#451A03] font-semibold"><%=u1.getPhone()%></span></p>
                  <%
                  LocalDate date = LocalDate.parse(u1.getRegistered_date());
                  DateTimeFormatter dd = DateTimeFormatter.ofPattern("dd MMM yyyy");
                  
                  AccountDAO adao = new AccountDAOImpl();
                  List<Account> userAcc = adao.getAllAccounts().stream().filter(a->a.getUser_id() == u1.getUser_id()).collect(Collectors.toList());
                  %>
                  <p><span class="font-bold text-[#B45309] uppercase tracking-wider text-[10px] inline-block w-28">Registred Date</span> : <span class="text-[#451A03] font-semibold"><%=date.format(dd)%></span></p>
                  <p><span class="font-bold text-[#B45309] uppercase tracking-wider text-[10px] inline-block w-28">Accounts</span> : <span class="text-[#451A03] font-semibold"><%=userAcc.size()%> Accounts</span></p>
                </div>
              </div>
            </div>

            <!-- Balanced Allocation Grid Component -->
			<div class="grid grid-cols-2 gap-4 w-full lg:w-[480px] shrink-0 border-t lg:border-t-0 lg:border-l border-amber-300/60 pt-6 lg:pt-0 lg:pl-6">              
              <div class="bg-white/80 border border-emerald-200 rounded-xl p-4 shadow-sm">
                <p class="text-[10px] font-extrabold text-[#92400E] uppercase tracking-wider">Total Balance</p>
                <%
                Double total = userAcc.stream().filter(a->a.getStatus().equalsIgnoreCase("active")).collect(Collectors.summingDouble(a->a.getBalance()));
                %>
                <h2 class="text-xl font-black text-emerald-700 tracking-tight mt-1">₹ <%=total%></h2>
              </div>

              <div class="bg-white/80 border border-amber-200 rounded-xl p-4 shadow-sm">
                <p class="text-[10px] font-extrabold text-[#92400E] uppercase tracking-wider">Active Accounts</p>
                <%
                Long count = userAcc.stream().filter(a->a.getStatus().equalsIgnoreCase("active")).count();
                %>
                <h2 class="text-xl font-black text-stone-800 tracking-tight mt-1"><%=count%> Active</h2>
              </div>
              
              <%
              List<Account> userActive = userAcc.stream().filter(a->a.getStatus().equalsIgnoreCase("active")).collect(Collectors.toList());
              List<Transcation> userTrans = new  ArrayList<>();
              TranscationDAO tdao = new TranscationDAOImpl();
              
              for(Account a : userActive){
            	  List<Transcation> trans = tdao.getTranscationByAccId(a.getAcc_id());
            	  
            	  for(Transcation t : trans){
            		  boolean exists = false;
            		  
            		  for(Transcation old : userTrans){
            			  if(old.getTrans_id() == t.getTrans_id()){
            				  exists = true;
            				  break;
            			  }
            		  }
            		  
            		  if(exists == false){
            			  userTrans.add(t);
            		  }
            	  }
              }
              %>

              <div class="bg-white/80 border border-yellow-300 rounded-xl p-4 shadow-sm">
                <p class="text-[10px] font-extrabold text-[#92400E] uppercase tracking-wider">Transcations</p>
                
                <h2 class="text-xl font-black text-stone-800 tracking-tight mt-1"><%=userTrans.size()%> Txns</h2>
              </div>
               
               <%
                    userTrans = userTrans.stream().sorted(Comparator.comparing((Transcation t)->t.getTranscation_date()).thenComparing((Transcation t)->t.getTranscation_time()).reversed()).collect(Collectors.toList());
               %>
               
               <%if(userTrans != null && !userTrans.isEmpty()){%>
               <%Transcation t = userTrans.get(0);%>
              <div class="bg-white/80 border border-yellow-300 rounded-xl p-4 shadow-sm">
                <p class="text-[10px] font-extrabold text-[#92400E] uppercase tracking-wider">Last Activity Stamp</p>
                <%boolean sent = false;%>
                <%for(Account ac : userActive){
                  if(t.getFrom_acc_id() == ac.getAcc_id()){
                	  sent = true;
                	  break;
                  }
                }
                %>
                <%if(sent){%>
                <h2 class="text-sm font-extrabold text-amber-900 tracking-tight mt-1"> - ₹ <%=t.getAmount()%></h2>
                <%} else {%>
                <h2 class="text-sm font-extrabold text-amber-900 tracking-tight mt-1"> + ₹ <%=t.getAmount()%></h2>
                <%}%>
                <%
                LocalDate date1 = LocalDate.parse(t.getTranscation_date());
                DateTimeFormatter dd1 = DateTimeFormatter.ofPattern("dd MMM yyyy");
                %>
                <p class="text-[10px] font-bold text-amber-600/80 mt-0.5"><%=date1.format(dd1)%></p>
              </div>
              <%} else { %>
              <div class="bg-amber-50/50 border border-amber-200/60 rounded-xl p-4">
			  <p class="text-[10px] font-extrabold text-amber-800 uppercase tracking-wider">Last Activity Stamp</p>
			  <h2 class="text-sm font-extrabold text-amber-900 tracking-tight mt-1">No Activity</h2>
			  <p class="text-[10px] font-bold text-amber-600/80 mt-0.5">No transcations yet</p>
			  </div>
			<%}%>

            </div>

          </div>
        </div>

        <!-- Section 2: User Capital Accounts Matrix Component -->
        <div class="bg-white border border-stone-200/80 rounded-2xl shadow-sm p-5">
          <div class="flex justify-between items-center mb-4 pb-3 border-b border-stone-100">
            <h2 class="text-xs font-black text-stone-900 tracking-tight uppercase flex items-center gap-2">
              <span class="w-2 h-2 rounded-full bg-amber-500"></span> User Accounts
            </h2>
            <span class="bg-stone-100 text-stone-600 border border-stone-200 text-[10px] font-extrabold px-2 py-0.5 rounded-md uppercase tracking-wide">System Deposits</span>
          </div>

          <div class="overflow-x-auto custom-scrollbar">
            <table class="w-full text-left text-xs border-collapse">
              <thead>
                <tr class="bg-stone-50/70 text-stone-400 font-bold uppercase text-[9px] tracking-wider border-b border-stone-100">
                  <th class="p-3">Account Number</th>
                  <th class="p-3">Type</th>
                  <th class="p-3">Branch Location</th>
                  <th class="p-3">IFSC Router Code</th>
                  <th class="p-3">Available Balance</th>
                  <th class="p-3">Status</th>
                  <th class="p-3">Opened Date</th>
                </tr>
              </thead>
               
              <tbody class="divide-y divide-stone-100 text-stone-600 font-medium">
              <%if(userAcc != null && !userAcc.isEmpty()){%>
              <%for(Account a2 : userAcc){%>
                <tr class="hover:bg-stone-50/60 transition-colors">
                  <td class="p-3 font-bold text-stone-900 tracking-wide"><%=a2.getAcc_no()%></td>
                  <td class="p-3"><span class="bg-stone-100 text-stone-700 border border-stone-200 px-2 py-0.5 rounded text-[10px] font-bold"><%=a2.getAcc_type()%></span></td>
                  <%
                  BranchDAO bdao = new BranchDAOImpl();
                  Branch b = bdao.getBranchById(a2.getBranch_id());
                  %>
                  <td class="p-3 text-stone-700"><%=b.getCity()%></td>
                  <td class="p-3 font-mono text-stone-500"><%=b.getIfsc_code()%></td>
                  <td class="p-3 text-emerald-600 font-bold">₹ <%=a2.getBalance()%></td>
                  <td class="p-3">
                  <%if(a2.getStatus().equalsIgnoreCase("active")){%>
                    <span class="bg-emerald-50 text-emerald-700 border border-emerald-200/60 text-[10px] font-extrabold px-2 py-0.5 rounded-md"><%=a2.getStatus()%></span>
                    <%} else {%>
                     <span class="bg-red-50 text-red-700 border border-emerald-200/60 text-[10px] font-extrabold px-2 py-0.5 rounded-md"><%=a2.getStatus()%></span>
                    <%}%>
                  </td>
                  <%
                  LocalDate date3 = LocalDate.parse(a2.getCreated_at());
                  DateTimeFormatter dd3 = DateTimeFormatter.ofPattern("dd MMM yyyy");
                  %>
                  <td class="p-3 text-stone-500"><%=date3.format(dd3)%></td>
                </tr>
                <%}%>
                <%} else {%>
                <tr>
			        <td colspan="7" class="p-8 text-center text-stone-400 font-semibold">
			            No Accounts found
			        </td>
			    </tr>
				<%}%>
              </tbody>
            </table>
          </div>
        </div>

        <!-- Section 3: Live Historical Transaction Stream Monitor -->
        <div class="bg-white border border-stone-200/80 rounded-2xl shadow-sm p-5">
          <div class="flex justify-between items-center mb-4 pb-3 border-b border-stone-100">
            <h2 class="text-xs font-black text-stone-900 tracking-tight uppercase flex items-center gap-2">
              <span class="w-2 h-2 rounded-full bg-emerald-600"></span> Transcation History
            </h2>
          </div>

          <div class="overflow-x-auto custom-scrollbar">
            <table class="w-full text-left text-xs border-collapse">
              <thead>
                <tr class="bg-stone-50/70 text-stone-400 font-bold uppercase text-[9px] tracking-wider border-b border-stone-100">
                  <th class="p-3">Txn ID</th>
                  <th class="p-3">Timestamp</th>
                  <th class="p-3">From Account</th>
                  <th class="p-3">To Account</th>
                  <th class="p-3">Type</th>
                  <th class="p-3">Amount</th>
                  <th class="p-3">Status</th>
                </tr>
              </thead>

              <tbody class="divide-y divide-stone-100 text-stone-600 font-medium">
                <%if(userTrans != null && !userTrans.isEmpty()){%>
                <%for(Transcation t : userTrans){%>
                <!-- Txn 1 -->
                <tr class="hover:bg-stone-50/60 transition-colors">
                  <td class="p-3 font-bold text-stone-900 tracking-wide">TXN<%=t.getTrans_id()%></td>
                  <%
                  LocalDate date4 = LocalDate.parse(t.getTranscation_date());
                  LocalTime time = LocalTime.parse(t.getTranscation_time());
                  DateTimeFormatter dd4 = DateTimeFormatter.ofPattern("dd MMM yyyy");
                  DateTimeFormatter dt = DateTimeFormatter.ofPattern("hh:mm a");
                  %>
                  <td class="p-3 text-stone-500"><%=date4.format(dd4)%>, <%=time.format(dt)%></td>
                  <td class="p-3 text-stone-700">
				    <%if(t.getFrom_acc_id() == 0){%>
				        -
				    <%} else {%>
				        <%Account from = adao.getAccountById(t.getFrom_acc_id());%>
				        <%=from.getAcc_no()%>
				    <%}%>
				</td>
				
				<td class="p-3 text-stone-700">
				    <%if(t.getTo_acc_id() == 0){%>
				        -
				    <%} else {%>
				        <%Account to = adao.getAccountById(t.getTo_acc_id());%>
				        <%=to.getAcc_no()%>
				    <%}%>
				</td>
                  <td class="p-3">
                    <span class="bg-stone-100 text-stone-700 border border-stone-200 px-2 py-0.5 rounded text-[10px] font-bold"><%=t.getTrans_type()%></span>
                  </td>
                  <%if(t.getTrans_type().equalsIgnoreCase("transfer") || t.getTrans_type().equalsIgnoreCase("withdrawl")){%>
                  <td class="p-3 text-red-600 font-bold">- ₹ <%=t.getAmount() %></td>
                  <%} else { %>
                  <td class="p-3 text-green-600 font-bold">+ ₹ <%=t.getAmount()%></td>
                  <%}%>
                  <td class="p-3">
                  <%if(t.getStatus().equalsIgnoreCase("success")){%>
                    <span class="bg-emerald-50 text-emerald-700 border border-emerald-200/60 text-[10px] font-extrabold px-2 py-0.5 rounded-md"><%=t.getStatus()%></span>
                    <%} else { %>
                    <span class="bg-red-50 text-red-700 border border-emerald-200/60 text-[10px] font-extrabold px-2 py-0.5 rounded-md"><%=t.getStatus()%></span>
                    <%}%>
                  </td>
                </tr>
                <%}%>
                <%} else {%>
			    <tr>
			        <td colspan="7" class="p-8 text-center text-stone-400 font-semibold">
			            No transcations found
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