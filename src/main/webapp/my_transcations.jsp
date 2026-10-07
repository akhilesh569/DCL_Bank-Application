<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="com.bank.dao.impl.AccountDAOImpl"%>
<%@page import="com.bank.dao.AccountDAO"%>
<%@page import="com.bank.dto.Account"%>
<%@page import="com.bank.dto.Transcation"%>
<%@page import="com.bank.dao.impl.TranscationDAOImpl"%>
<%@page import="com.bank.dao.TranscationDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.bank.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DCL Bank My Transactions</title>
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
    .custom-scrollbar::-webkit-scrollbar-thumb:hover {
      background: #94a3b8;
    }
  </style>
</head>

<body class="bg-[#f0f3f8] text-slate-800 min-h-screen antialiased">
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
          <span class="text-[9px] font-bold text-slate-500 tracking-widest uppercase block mt-0.5">Portal Hub</span>
        </div>
      </div>

      <div class="flex flex-col gap-1.5 px-1 flex-1">
        
        <!-- Category 1: Main Menu -->
        <p class="px-3 text-[10px] font-bold tracking-wider text-slate-500 uppercase mt-2 mb-1">Main Menu</p>
        
        <div class="flex gap-3 items-center hover:bg-white/5 rounded-xl p-3 transition-all text-slate-400 hover:text-white group">
          <i class="fa-solid fa-house text-slate-500 group-hover:text-[#d53579] transition-colors text-sm w-4 text-center"></i>
          <a href="user_db.jsp" class="text-xs font-semibold tracking-wide">Dashboard</a>
        </div>

        <div class="flex gap-3 items-center hover:bg-white/5 rounded-xl p-3 transition-all text-slate-400 hover:text-white group">
          <i class="fa-solid fa-wallet text-slate-500 group-hover:text-[#d53579] transition-colors text-sm w-4 text-center"></i>
          <a href="my_accounts.jsp" class="text-xs font-semibold tracking-wide">Accounts</a>
        </div>

        <!-- Transactions Active State -->
        <div class="flex gap-3 items-center bg-white/5 rounded-xl p-3 text-white group relative">
          <div class="absolute left-0 top-1/2 -translate-y-1/2 w-1 h-5 bg-[#d53579] rounded-r-full"></div>
          <i class="fa-solid fa-comments-dollar text-[#d53579] text-sm w-4 text-center"></i>
          <a href="my_transcations.jsp" class="text-xs font-bold tracking-wide">Transactions</a>
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

      <div class="p-8 pt-28 space-y-6 flex-grow max-w-[1240px] w-full mx-auto">

        <!-- Page Header Segment -->
        <div>
          <h1 class="text-2xl font-black text-slate-900 tracking-tight">My Transactions</h1>
          <p class="text-xs font-medium text-slate-400 mt-0.5">Track, investigate, and analyze your processed system payments</p>
        </div>

        <!-- Search / Filter Component Box -->
        <div class="bg-white/90 backdrop-blur-md border border-slate-200/80 rounded-2xl shadow-sm p-5">
          <form action="searchTranscations" method="POST" class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 items-end">

            <div>
              <label class="text-[11px] font-extrabold text-slate-500 uppercase tracking-wider block mb-1.5">Transaction ID</label>
              <div class="border border-slate-200 rounded-xl px-3 py-2.5 flex items-center gap-2.5 bg-slate-50/50 focus-within:border-[#971B4E]/50 focus-within:bg-white transition-all">
                <i class="fa-solid fa-receipt text-slate-400 text-xs"></i>
                <input type="text" name="transcation_id" placeholder="enter id" class="outline-none text-xs text-slate-800 w-full placeholder:text-slate-400 font-medium">
              </div>
            </div>

			
			<!-- <div>
              <label class="text-[11px] font-extrabold text-slate-500 uppercase tracking-wider block mb-1.5">Account Number</label>
              <div class="border border-slate-200 rounded-xl px-3 py-2.5 flex items-center gap-2.5 bg-slate-50/50 focus-within:border-[#971B4E]/50 focus-within:bg-white transition-all">
                <i class="fa-solid fa-wallet text-slate-400 text-xs"></i>
                <input type="text" name="account_no" placeholder="Enter target no..." class="outline-none text-xs text-slate-800 w-full placeholder:text-slate-400 font-medium">
              </div>
            </div> -->
            

            <div>
              <label class="text-[11px] font-extrabold text-slate-500 uppercase tracking-wider block mb-1.5">Status Filter</label>
              <div class="border border-slate-200 rounded-xl px-3 py-2.5 flex items-center gap-2.5 bg-slate-50/50 focus-within:border-[#971B4E]/50 focus-within:bg-white transition-all relative">
                <i class="fa-solid fa-circle-nodes text-slate-400 text-xs"></i>
                <select name="status" class="w-full bg-transparent outline-none text-xs text-slate-700 font-semibold cursor-pointer appearance-none">
                  <option value="">All Statuses</option>
                  <option value="SUCCESS">SUCCESS</option>
                  <option value="FAILED">FAILED</option>
                </select>
                <i class="fa-solid fa-chevron-down text-slate-400 text-[10px] pointer-events-none absolute right-3"></i>
              </div>
            </div>

            <button type="submit" class="bg-[#971B4E] text-white text-xs font-bold h-[38px] px-4 rounded-xl hover:bg-[#7d143f] shadow-md shadow-rose-950/10 transition-all flex items-center justify-center gap-2 cursor-pointer">
              <i class="fa-solid fa-magnifying-glass text-xs"></i> Search
            </button>

            <a href="my_transcations.jsp" class="bg-slate-100 hover:bg-slate-200 border border-slate-200 text-slate-700 text-xs font-bold h-[38px] px-4 rounded-xl transition-all flex items-center justify-center gap-2">
              <i class="fa-solid fa-rotate-left text-xs"></i> Reset
            </a>

          </form>
        </div>

        <!-- Metrics Analytical Grid Segment -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-5">

          <!-- Card 1: My Transactions -->
          <div class="bg-white/90 backdrop-blur-md border border-slate-200/80 rounded-2xl shadow-sm p-5 flex justify-between items-center">
            <div>
            <%TranscationDAO tdao = new TranscationDAOImpl();%>
            <%AccountDAO adao = new AccountDAOImpl();%>
            <%List<Account> allAcc = adao.getAllAccounts();%>
			<%List<Account> userAcc = allAcc.stream().filter(a->a.getUser_id() == u.getUser_id() && a.getStatus().equalsIgnoreCase("active")).collect(Collectors.toList());%>            
			<%List<Transcation> userTrans = new ArrayList<>();%>
          <%
			for(Account a : userAcc){
				List<Transcation> li = tdao.getTranscationByAccId(a.getAcc_id());
				for(Transcation t : li){
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
              <p class="text-[11px] font-extrabold text-slate-400 uppercase tracking-wider">My Transactions</p>
              <%List<Transcation> sucessTrans = userTrans.stream().filter(t->t.getStatus().equalsIgnoreCase("success")).collect(Collectors.toList());%>
              <h2 class="text-2xl font-black mt-1 text-slate-900 tracking-tight"><%=sucessTrans.size()%></h2>
              <p class="text-slate-400 text-[11px] font-medium mt-1">Total sucessfull transcations</p>
            </div>
            <div class="h-11 w-11 rounded-xl bg-blue-50 border border-blue-100 flex justify-center items-center shadow-xs">
              <i class="fa-solid fa-arrow-right-arrow-left text-blue-600 text-sm"></i>
            </div>
          </div>

          <!-- Card 2: Money Received -->
          <div class="bg-white/90 backdrop-blur-md border border-slate-200/80 rounded-2xl shadow-sm p-5 flex justify-between items-center">
            <div>
            <%
            double received = 0;
            for(Account a : userAcc){
            	double amount = sucessTrans.stream().filter(t->t.getTo_acc_id() == a.getAcc_id()).collect(Collectors.summingDouble(t->t.getAmount()));
            	received += amount;
            }
            %>
              <p class="text-[11px] font-extrabold text-slate-400 uppercase tracking-wider">Money Credited</p>
              <h2 class="text-2xl font-black mt-1 text-emerald-600 tracking-tight">₹ <%=received%></h2>
              <p class="text-slate-400 text-[11px] font-medium mt-1">Total inbound credits</p>
            </div>
            <div class="h-11 w-11 rounded-xl bg-emerald-50 border border-emerald-100 flex justify-center items-center shadow-xs">
              <i class="fa-solid fa-arrow-down text-emerald-600 text-sm"></i>
            </div>
          </div>

          <!-- Card 3: Money Sent -->
          <div class="bg-white/90 backdrop-blur-md border border-slate-200/80 rounded-2xl shadow-sm p-5 flex justify-between items-center">
            <div>
            <%double sent = 0;
             for(Account a : userAcc){
            	 double amount = sucessTrans.stream().filter(t->t.getFrom_acc_id() == a.getAcc_id()).collect(Collectors.summingDouble(t->t.getAmount()));
            	 sent += amount;
             }
            %>
              <p class="text-[11px] font-extrabold text-slate-400 uppercase tracking-wider">Money Debited</p>
              <h2 class="text-2xl font-black mt-1 text-rose-600 tracking-tight">₹ <%=sent%></h2>
              <p class="text-slate-400 text-[11px] font-medium mt-1">Total outward debits</p>
            </div>
            <div class="h-11 w-11 rounded-xl bg-rose-50 border border-rose-100 flex justify-center items-center shadow-xs">
              <i class="fa-solid fa-arrow-up text-rose-600 text-sm"></i>
            </div>
          </div>

          <!-- Card 4: Total Cumulative Balance -->
          <div class="bg-gradient-to-br from-[#e03a83] via-[#ba2161] to-[#971B4E] rounded-2xl shadow-lg shadow-rose-950/10 p-5 flex justify-between items-center relative overflow-hidden group hover:shadow-xl transition-all duration-300">
            <div class="absolute top-0 right-0 w-20 h-20 bg-white/10 rounded-full blur-lg pointer-events-none"></div>
            <div>
            <% double total = userAcc.stream().filter(a->a.getStatus().equalsIgnoreCase("active")).collect(Collectors.summingDouble(a -> a.getBalance()));%>
            <p class="text-[11px] font-extrabold text-rose-100 uppercase">Total Balance</p>
              <h2 class="text-xl font-black mt-1 text-white tracking-tight">₹ <%=total%></h2>
			  <p class="text-rose-200/70 text-[11px] font-medium mt-1">Across active accounts</p>
            </div>
            <div class="h-11 w-11 rounded-xl bg-white/10 backdrop-blur-md border border-white/20 flex justify-center items-center shadow-xs">
              <i class="fa-solid fa-indian-rupee-sign text-white text-sm"></i>
            </div>
          </div>

        </div>

        <!-- History Ledger Table Component -->
        <div class="bg-white/90 backdrop-blur-md border border-slate-200/80 rounded-2xl shadow-sm p-6">
          <h2 class="text-base font-extrabold text-slate-900 tracking-tight mb-4">Transaction History</h2>

          <div class="overflow-x-auto custom-scrollbar max-h-[480px] overflow-y-auto pr-1">
            <table class="w-full text-left text-xs border-collapse">

              <thead class="bg-slate-50 sticky top-0 z-10 shadow-[0_1px_0_0_rgba(226,232,240,1)]">
                <tr class="text-slate-400 uppercase font-bold tracking-wider text-[10px]">
                  <th class="py-3 px-3">Txn ID</th>
                  <th class="py-3 px-3">Date & Time</th>
                  <th class="py-3 px-3">From Account</th>
                  <th class="py-3 px-3">To Account</th>
                  <th class="py-3 px-3">Type</th>
                  <th class="py-3 px-3">Amount</th>
                  <th class="py-3 px-3">Status</th>
                  <th class="py-3 px-3 text-right">Payment Mode</th>
                </tr>
              </thead>
              
             
			  <%List<Transcation> search = (List<Transcation>)request.getAttribute("result");%>
			   <%
			    if(search == null){
			    	search = userTrans.stream()
							.sorted(Comparator.comparing((Transcation t)->t.getTranscation_date())
							.thenComparing((Transcation t)->t.getTranscation_time()).reversed())
							.collect(Collectors.toList());
			    }
				%>

                <tbody class="divide-y divide-slate-100">
                <%if(search != null && !search.isEmpty()){%>
				<%for(Transcation t : search){%>
				
				<%boolean sentMoney = false;
				  Account match = null;
				  
				  for(Account a : userAcc){
					  if(t.getFrom_acc_id() == a.getAcc_id()){
						  sentMoney = true;
						  match = a;
						  break;
					  }
					  else if (t.getTo_acc_id() == a.getAcc_id()){
						  match = a;
					  }
				  }
				
				%>
				
				<%LocalDate date = LocalDate.parse(t.getTranscation_date());%>
				<%LocalTime time = LocalTime.parse(t.getTranscation_time());%>
				<%DateTimeFormatter dd = DateTimeFormatter.ofPattern("dd MMM yyyy");%>
				<%DateTimeFormatter dt = DateTimeFormatter.ofPattern("hh:mm a");%>
                <!-- Row 1 -->
                <tr class="hover:bg-slate-50/80 transition-colors">
                  <td class="py-4 px-3 font-bold tracking-wide text-slate-900"><%=t.getTrans_id()%></td>
                  <td class="py-4 px-3 text-slate-500 whitespace-nowrap"><%=date.format(dd)%>, <%=time.format(dt)%></td>
                  <td class="py-4 px-3">
                  <%if(t.getFrom_acc_id() == 0){%>
                  <p class="font-bold tracking-wide text-slate-800">--</p>
                  <%} else {%>
                  <%Account a = adao.getAccountById(t.getFrom_acc_id());%>
                    <p class="font-bold tracking-wide text-slate-800"><%=a.getAcc_no()%></p>
                    <p class="text-[10px] font-bold text-[#971B4E]/80 uppercase tracking-wide"><%=a.getAcc_type()%></p>
                    <%}%>
                  </td>
                  <td class="py-4 px-3">
                  <%if(t.getTo_acc_id() == 0){%>
                  <p class="font-bold tracking-wide text-slate-800">--</p>
                  <%} else {%>
                  <%Account a = adao.getAccountById(t.getTo_acc_id());%>
                    <p class="font-bold tracking-wide text-slate-800"><%=a.getAcc_no()%></p>
                    <p class="text-[10px] font-bold text-[#971B4E]/80 uppercase tracking-wide"><%=a.getAcc_type()%></p>
                    <%}%>
                  </td>
                  <td class="py-4 px-3">
                    <span class="bg-blue-50 text-blue-700 border border-blue-100 text-[10px] font-extrabold px-2 py-0.5 rounded-md tracking-wide"><%=t.getTrans_type() %></span>
                  </td>
                  <%if(sentMoney){%>
                  <td class="py-4 px-3 text-rose-600 font-bold text-sm whitespace-nowrap">- ₹ <%=t.getAmount()%></td>
                  <%} else {%>
                  <td class="py-4 px-3 text-emerald-600 font-bold text-sm whitespace-nowrap">+ ₹ <%=t.getAmount()%></td>
                  <%}%>
                  <td class="py-4 px-3">
                  <%if(t.getStatus().equalsIgnoreCase("success")){%>
                    <span class="bg-emerald-50 text-emerald-700 border border-emerald-200/60 text-[10px] font-extrabold px-2.5 py-0.5 rounded-md tracking-wide"><%=t.getStatus() %></span>
                    <%} else { %>
                    <span class="bg-rose-50 text-rose-700 border border-rose-200/60 text-[10px] font-extrabold px-2.5 py-0.5 rounded-md tracking-wide"><%=t.getStatus()%></span>
                    <%}%>
                  </td>
                  <td class="py-4 px-3 text-right font-bold text-slate-500"><%=t.getMode_of_transcation()%></td>
                </tr>
                <%}%>
                <%} else {%>
                <tr>
			        <td colspan="8" class="p-8 text-center text-stone-400 font-semibold">
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