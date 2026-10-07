<%@page import="java.util.Comparator"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bank.dto.Transcation"%>
<%@page import="com.bank.dao.impl.TranscationDAOImpl"%>
<%@page import="com.bank.dao.TranscationDAO"%>
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
  <title>DCL Bank Passbook</title>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>

  <style>
    body { font-family: 'Public Sans', sans-serif; }
    .brand-text-solid { color: #971B4E; }
    .brand-bg-light { background-color: rgba(151, 27, 78, 0.08); }
    .custom-scrollbar::-webkit-scrollbar { width: 6px; height: 6px; }
    .custom-scrollbar::-webkit-scrollbar-thumb { background: #cbd5e1; border-radius: 10px; }
  </style>
</head>

<body class="bg-[#f0f3f8] text-slate-800 min-h-screen antialiased">
<%User u = (User) session.getAttribute("user");%>
<%if(u != null){%>

<div class="flex min-h-screen relative overflow-x-hidden">

  <!-- Sidebar -->
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
        <i class="fa-solid fa-house text-slate-500 group-hover:text-[#d53579] text-sm w-4 text-center"></i>
        <a href="user_db.jsp" class="text-xs font-semibold tracking-wide">Dashboard</a>
      </div>

      <div class="flex gap-3 items-center hover:bg-white/5 rounded-xl p-3 transition-all text-slate-400 hover:text-white group">
        <i class="fa-solid fa-wallet text-slate-500 group-hover:text-[#d53579] text-sm w-4 text-center"></i>
        <a href="my_accounts.jsp" class="text-xs font-semibold tracking-wide">Accounts</a>
      </div>

      <div class="flex gap-3 items-center hover:bg-white/5 rounded-xl p-3 transition-all text-slate-400 hover:text-white group">
        <i class="fa-solid fa-comments-dollar text-slate-500 group-hover:text-[#d53579] text-sm w-4 text-center"></i>
        <a href="my_transcations.jsp" class="text-xs font-semibold tracking-wide">Transactions</a>
      </div>

      <p class="px-3 text-[10px] font-bold tracking-wider text-slate-500 uppercase mt-4 mb-1">Payments</p>

      <div class="flex gap-3 items-center hover:bg-white/5 rounded-xl p-3 transition-all text-slate-400 hover:text-white group">
        <i class="fa-solid fa-arrow-right-arrow-left text-slate-500 group-hover:text-[#d53579] text-sm w-4 text-center"></i>
        <a href="moneytransfer.jsp" class="text-xs font-semibold tracking-wide">Money Transfer</a>
      </div>

      <!-- Passbook Active -->
      <div class="flex gap-3 items-center bg-white/5 rounded-xl p-3 text-white group relative">
        <div class="absolute left-0 top-1/2 -translate-y-1/2 w-1 h-5 bg-[#d53579] rounded-r-full"></div>
        <i class="fa-solid fa-book text-[#d53579] text-sm w-4 text-center"></i>
        <a href="passbook.jsp" class="text-xs font-bold tracking-wide">Passbook</a>
      </div>

      <p class="px-3 text-[10px] font-bold tracking-wider text-slate-500 uppercase mt-4 mb-1">Settings</p>

      <div class="flex gap-3 items-center hover:bg-white/5 rounded-xl p-3 transition-all text-slate-400 hover:text-white group">
        <i class="fa-solid fa-building-user text-slate-500 group-hover:text-[#d53579] text-sm w-4 text-center"></i>
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

  <!-- Main Area -->
  <div class="flex-grow min-h-screen flex flex-col pl-60">

    <!-- Header -->
    <header class="fixed top-0 left-60 right-0 h-20 bg-white/80 backdrop-blur-md border-b border-slate-200/60 shadow-xs flex items-center justify-between px-10 z-40">
      <h3 class="text-xl font-extrabold tracking-tight text-slate-900">
          Welcome back, <span class="brand-text-solid"><%=u.getUser_name()%></span>
        </h3>

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

        <div class="absolute right-0 top-full pt-1 w-52 hidden group-hover:block z-50">
          <div class="bg-white/95 backdrop-blur-md border border-slate-200 rounded-xl shadow-xl overflow-hidden">
            <a href="index.jsp" class="flex gap-3 items-center px-4 py-3 hover:bg-slate-50 text-xs font-bold text-slate-600 border-b border-slate-100">
              <i class="fa-solid fa-gauge text-slate-400 text-sm w-4"></i> Home
            </a>
            <a href="edit_profile.jsp" class="flex gap-3 items-center px-4 py-3 hover:bg-slate-50 text-xs font-bold text-slate-600 border-b border-slate-100">
              <i class="fa-solid fa-user text-slate-400 text-sm w-4"></i> Edit Profile
            </a>
            <a href="Logout" class="flex gap-3 items-center px-4 py-3 hover:bg-red-50 text-xs font-bold text-red-600">
              <i class="fa-solid fa-right-from-bracket text-red-400 text-sm w-4"></i> Logout
            </a>
          </div>
        </div>
      </div>
    </header>

    <div class="p-8 pt-28 space-y-6 flex-grow max-w-[1240px] w-full mx-auto">

   
      
      <div class="grid grid-cols-1 lg:grid-cols-4 gap-5">

        <!-- Select Account -->
        <div class="bg-white/90 backdrop-blur-md border border-slate-200/80 rounded-2xl shadow-sm p-5">
          <label class="text-[11px] font-extrabold text-slate-500 uppercase tracking-wider block mb-2">
            Select Account
          </label>
          
          <%AccountDAO adao = new AccountDAOImpl();
           List<Account> allAcc = adao.getAllAccounts();
           List<Account> userAcc = allAcc.stream().filter(a->a.getUser_id() == u.getUser_id() && a.getStatus().equalsIgnoreCase("active")).collect(Collectors.toList());
          %>
          
          <form action="passbook" method="POST">
          <select name="selectAcc" class="w-full border border-slate-200 rounded-xl px-3 py-3 text-xs font-bold text-slate-700 outline-none bg-slate-50">
            <%for(Account a : userAcc){%>
            <option value="<%=a.getAcc_id()%>"> <%=a.getAcc_type()%> - <%=a.getAcc_no()%> </option>
            <%}%>
          </select>
          
          <div class="mt-8 space-y-3">
          <button type="submit" class="bg-[#971B4E] text-white text-xs mt-3 font-bold h-[38px] px-4 rounded-xl hover:bg-[#7d143f] shadow-md flex items-center justify-center gap-2">Switch Account</button>
          </div>
          </form>
        </div>
        
        <%Account searchAcc = (Account)request.getAttribute("account");%>
        <%if(searchAcc == null && !userAcc.isEmpty()){
          searchAcc = userAcc.get(0);
        } 
        %>

        <!-- Account Details -->
        <div class="lg:col-span-3 bg-white/90 backdrop-blur-md border border-slate-200/80 rounded-2xl shadow-sm p-5">
         
         <%if(searchAcc != null){%>
          <div class="flex items-center justify-between mb-5">
            <div>
            <%if(searchAcc.getStatus().equalsIgnoreCase("active")){%>
              <span class="text-[10px] font-bold text-emerald-700 bg-emerald-50 border border-emerald-100 px-2 py-0.5 rounded-full">
                <%=searchAcc.getStatus().toUpperCase()%> ACCOUNT
              </span>
              <%} else {%>
              <span class="text-[10px] font-bold text-yellow-700 bg-yellow-50 border border-yellow-100 px-2 py-0.5 rounded-full">
                <%=searchAcc.getStatus().toUpperCase()%> ACCOUNT
              </span>
              <%}%>
              <h2 class="text-xl font-black text-slate-900 mt-3"><%=searchAcc.getAcc_type()%> Account</h2>
            </div>

            <div class="text-right">
              <p class="text-[11px] font-bold text-slate-400 uppercase">Available Balance</p>
              <h2 class="text-2xl font-black brand-text-solid mt-1">₹ <%=searchAcc.getBalance()%></h2>
            </div>
          </div>

          <div class="grid grid-cols-2 md:grid-cols-4 gap-4">

            <div class="flex gap-3 items-center bg-slate-50 border border-slate-200 rounded-xl p-4">
              <div class="h-11 w-11 rounded-xl brand-bg-light flex items-center justify-center">
                <i class="fa-solid fa-user brand-text-solid"></i>
              </div>
              <div>
              <%UserDAO udao = new UserDAOImpl();
               User us = udao.getUserById(searchAcc.getUser_id());
              %>
                <p class="text-[10px] font-bold text-slate-400 uppercase">Holder</p>
                <h3 class="text-xs font-black text-slate-800 mt-1"><%=us.getUser_name()%></h3>
              </div>
            </div>

            <div class="flex gap-3 items-center bg-slate-50 border border-slate-200 rounded-xl p-4">
              <div class="h-11 w-11 rounded-xl bg-blue-50 flex items-center justify-center">
                <i class="fa-solid fa-building-columns text-blue-600"></i>
              </div>
              <div>
              <%BranchDAO bdao = new BranchDAOImpl();
              Branch b = bdao.getBranchById(searchAcc.getBranch_id());
              %>
                <p class="text-[10px] font-bold text-slate-400 uppercase">Branch</p>
                <h3 class="text-xs font-black text-slate-800 mt-1"><%=b.getBranch_name()%></h3>
              </div>
            </div>

            <div class="flex gap-3 items-center bg-slate-50 border border-slate-200 rounded-xl p-4">
              <div class="h-11 w-11 rounded-xl bg-purple-50 flex items-center justify-center">
                <i class="fa-solid fa-wallet text-purple-600"></i>
              </div>
              <div>
                <p class="text-[10px] font-bold text-slate-400 uppercase">Account Type</p>
                <h3 class="text-xs font-black text-slate-800 mt-1"><%=searchAcc.getAcc_type()%></h3>
              </div>
            </div>

            <div class="flex gap-3 items-center bg-slate-50 border border-slate-200 rounded-xl p-4">
              <div class="h-11 w-11 rounded-xl bg-orange-50 flex items-center justify-center">
                <i class="fa-solid fa-code-branch text-orange-600"></i>
              </div>
              <div>
                <p class="text-[10px] font-bold text-slate-400 uppercase">IFSC Code</p>
                <h3 class="text-xs font-black text-slate-800 mt-1"><%=b.getIfsc_code()%></h3>
              </div>
            </div>
            
          </div>
          <%} else {%>
			<div class="flex items-center justify-center min-h-[160px] bg-slate-50 border border-slate-200 rounded-xl">
			    <h2 class="text-xl font-black brand-text-solid">
			        No Accounts found
			    </h2>
			</div>           
            <%}%>
        </div>

      </div>

      <!-- Filters -->
      <div class="bg-white/90 backdrop-blur-md border border-slate-200/80 rounded-2xl shadow-sm p-5">
        <form action="filterPassbook" method="POST" class="grid grid-cols-1 md:grid-cols-5 gap-3 items-end">

          <div>
            <label class="text-[11px] font-extrabold text-slate-500 uppercase tracking-wider block mb-1.5">From Date</label>
            <input name="start" type="date" class="w-full border border-slate-200 rounded-xl px-3 py-2.5 text-xs font-semibold outline-none bg-slate-50">
          </div>

          <div>
            <label class="text-[11px] font-extrabold text-slate-500 uppercase tracking-wider block mb-1.5">To Date</label>
            <input name="end" type="date" class="w-full border border-slate-200 rounded-xl px-3 py-2.5 text-xs font-semibold outline-none bg-slate-50">
          </div>

          <div>
            <label class="text-[11px] font-extrabold text-slate-500 uppercase tracking-wider block mb-1.5">Transaction Type</label>
            <select name="type" class="w-full border border-slate-200 rounded-xl px-3 py-2.5 text-xs font-semibold outline-none bg-slate-50">
              <option value="">All</option>
              <option value="deposit">Deposit</option>
              <option value="withdrawl">Withdrawl</option>
              <option value="transfer">Transfer</option>
            </select>
          </div>
          
          <input type="hidden" name=accId value="<%=searchAcc.getAcc_id()%>">

          <button type="submit" class="bg-[#971B4E] text-white text-xs font-bold h-[38px] px-4 rounded-xl hover:bg-[#7d143f] shadow-md flex items-center justify-center gap-2">
            <i class="fa-solid fa-magnifying-glass"></i> Search
          </button>
          
          <a href="passbook.jsp" class="bg-[#971B4E] text-white text-xs font-bold h-[38px] px-4 rounded-xl hover:bg-[#7d143f] shadow-md flex items-center justify-center gap-2">
             Reset
          </a>

        </form>
      </div>
       
       
      <!-- Passbook Table -->
      <div class="bg-white/90 backdrop-blur-md border border-slate-200/80 rounded-2xl shadow-sm p-6">
        <h2 class="text-base font-extrabold text-slate-900 tracking-tight mb-4">Passbook</h2>
        
        <div class="overflow-x-auto custom-scrollbar">
          <table class="w-full text-left text-xs border-collapse">

            <thead class="bg-slate-200">
              <tr class="text-slate-400 uppercase font-bold tracking-wider text-[10px]">
                <th class="py-3 px-3">Date & Time</th>
                <th class="py-3 px-3">Type</th>
                <th class="py-3 px-3">Status</th>
                <th class="py-3 px-3">Transcation ID</th>
                <th class="py-3 px-3">Debit</th>
                <th class="py-3 px-3">Credit</th>
                <th class="py-3 px-3 text-right">Balance</th>
              </tr>
            </thead>

            <tbody class="divide-y divide-slate-100">
            <%if(searchAcc != null) {%>
            <%
             TranscationDAO tdao = new TranscationDAOImpl();
             List<Transcation> userTrans = tdao.getTranscationByAccId(searchAcc.getAcc_id());
             List<Transcation> filter = (List<Transcation>)request.getAttribute("filter");
             if(filter != null){
            	 userTrans = filter;
             }
            %>
            <% double openingBalance = 0; %>
            <%if(userTrans.isEmpty()) {%>
            <tr>
            <td class="text-2xl font-black brand-text-solid mt-1">No Transcations found</td>
            </tr>
            <%} else {%>
            <%userTrans = userTrans.stream().sorted(Comparator.comparing((Transcation t)->t.getTranscation_date()).thenComparing(t->t.getTranscation_time())).collect(Collectors.toList());%>
               <%
               double runningBalance;
               
               if(filter == null){
   				openingBalance = userTrans.stream().filter(t->t.getStatus().equalsIgnoreCase("success")).findFirst().map(t->t.getAmount()).orElse(0.0);
	   			}
	   			else{
	   				List<Transcation> allTrans = tdao.getTranscationByAccId(searchAcc.getAcc_id());
	   				String start = request.getParameter("start");
	   				for(Transcation t : allTrans){
	   					if(t.getStatus().equalsIgnoreCase("success") && t.getTranscation_date().compareTo(start) < 0){
	   						if(t.getFrom_acc_id() == searchAcc.getAcc_id()){
	   							openingBalance -= t.getAmount();
	   						}
	   						else if(t.getTo_acc_id() == searchAcc.getAcc_id()){
	   							openingBalance += t.getAmount();
	   						}
	   					}
	   				}
	   				
	   			}
               
               if(filter == null){
            	   runningBalance = 0;
               }
               else{
            	   runningBalance = openingBalance;
               }
               %>
               <%for(Transcation t : userTrans){%>
              <tr class="hover:bg-slate-50">
              <%
              LocalDate date = LocalDate.parse(t.getTranscation_date());
              LocalTime time = LocalTime.parse(t.getTranscation_time());
              DateTimeFormatter dd = DateTimeFormatter.ofPattern("dd MMM yyyy");
              DateTimeFormatter dt = DateTimeFormatter.ofPattern("hh:mm a");
              %>
              <%
              double debit = 0;
              double credit = 0;
              if(t.getStatus().equalsIgnoreCase("success")){
            	  
              if(t.getFrom_acc_id() == searchAcc.getAcc_id()){
            	  debit = t.getAmount();
            	  runningBalance -= debit;
              }
              else if(t.getTo_acc_id() == searchAcc.getAcc_id()){
            	  credit = t.getAmount();
            	  runningBalance += credit;
              }
              }
              %>
              
                <td class="py-4 px-3 text-slate-500"><%=date.format(dd)%>, <%=time.format(dt)%></td>
                <td class="py-4 px-3 font-bold text-slate-800"><%=t.getTrans_type()%></td>
                <td class="py-4 px-3">
                  <%if(t.getStatus().equalsIgnoreCase("success")) {%>
                  <span class="bg-emerald-50 text-emerald-700 px-2 py-0.5 rounded-md text-[10px] font-extrabold"><%=t.getStatus()%></span>
                  <%} else { %>
                  <span class="bg-rose-50 text-rose-700 px-2 py-0.5 rounded-md text-[10px] font-extrabold"><%=t.getStatus()%></span>
                  <%}%>
                </td>
                <td class="py-4 px-3 text-slate-500">TXN<%=t.getTrans_id()%></td>
                <%if(debit == 0){%>
                <td class="py-4 px-3 text-slate-400">-</td>
                <%} else { %>
                 <td class="py-4 px-3 text-rose-600 font-bold">₹ <%=debit%></td>
                <%}%>
 				<%if(credit == 0){%>
                <td class="py-4 px-3 text-slate-400">-</td>
                <%} else { %>
                 <td class="py-4 px-3 text-emerald-600 font-bold">₹ <%=credit%></td>
                <%}%>                
                <td class="py-4 px-3 text-right font-black">₹ <%=runningBalance%></td>
              </tr>
              <%}%>
              <%}%>

            </tbody>
          </table>
        </div>
      </div>

      <!-- Summary -->
      <div class="grid grid-cols-1 md:grid-cols-4 gap-5">

        <div class="bg-white rounded-2xl p-5 shadow-sm flex gap-3 items-center">
          <div class="h-12 w-12 rounded-xl bg-blue-50 flex items-center justify-center">
            <i class="fa-solid fa-calendar-check text-blue-600"></i>
          </div>
          <div>
          <%
			double totalDebit = 0;
			double totalCredit = 0;
			
			for(Transcation t : userTrans) {
			
				if(t.getStatus().equalsIgnoreCase("success")) {
			
					if(t.getFrom_acc_id() == searchAcc.getAcc_id()) {
						totalDebit += t.getAmount();
					}
					else if(t.getTo_acc_id() == searchAcc.getAcc_id()) {
						totalCredit += t.getAmount();
					}
				}
			}
			%>
            <p class="text-[10px] font-bold text-slate-400 uppercase">Opening Balance</p>
            <h3 class="text-lg font-black">₹ <%=openingBalance%></h3>
          </div>
        </div>

        <div class="bg-white rounded-2xl p-5 shadow-sm flex gap-3 items-center">
          <div class="h-12 w-12 rounded-xl bg-rose-50 flex items-center justify-center">
            <i class="fa-solid fa-arrow-up text-rose-600"></i>
          </div>
          <div>
            <p class="text-[10px] font-bold text-slate-400 uppercase">Total Debit</p>
            <h3 class="text-lg font-black text-rose-600">₹ <%=totalDebit %></h3>
          </div>
        </div>

        <div class="bg-white rounded-2xl p-5 shadow-sm flex gap-3 items-center">
          <div class="h-12 w-12 rounded-xl bg-emerald-50 flex items-center justify-center">
            <i class="fa-solid fa-arrow-down text-emerald-600"></i>
          </div>
          <div>
            <p class="text-[10px] font-bold text-slate-400 uppercase">Total Credit</p>
            <h3 class="text-lg font-black text-emerald-600">₹ <%=totalCredit%></h3>
          </div>
        </div>

        <div class="bg-gradient-to-br from-[#e03a83] via-[#ba2161] to-[#971B4E] rounded-2xl p-5 shadow-sm flex gap-3 items-center text-white">
          <div class="h-12 w-12 rounded-xl bg-white/10 flex items-center justify-center">
            <i class="fa-solid fa-wallet"></i>
          </div>
          <div>
            <p class="text-[10px] font-bold text-rose-100 uppercase">Closing Balance</p>
            <h3 class="text-lg font-black">₹ <%=searchAcc.getBalance()%></h3>
          </div>
        </div>

      </div>

    </div>
  </div>
 <%}%>

</div>
 <%} else {%>
<%request.setAttribute("error", "session already expired");%>
<%request.getRequestDispatcher("login.jsp").forward(request, response);%>
<%}%>

</body>
</html>