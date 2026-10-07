<%@page import="java.time.LocalTime"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="com.bank.dto.Transcation"%>
<%@page import="java.util.List"%>
<%@page import="com.bank.dao.impl.TranscationDAOImpl"%>
<%@page import="com.bank.dao.TranscationDAO"%>
<%@page import="com.bank.dto.Branch"%>
<%@page import="com.bank.dao.impl.BranchDAOImpl"%>
<%@page import="com.bank.dao.BranchDAO"%>
<%@page import="com.bank.dao.impl.UserDAOImpl"%>
<%@page import="com.bank.dao.UserDAO"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.bank.dto.Account"%>
<%@page import="com.bank.dao.AccountDAO"%>
<%@page import="com.bank.dao.impl.AccountDAOImpl"%>
<%@page import="com.bank.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DCL Bank - Account Details</title>
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

  <div class="mt-auto border-t border-white/5 pt-4 px-1 shrink-0">
    <div class="flex gap-3 items-center bg-rose-500/10 hover:bg-rose-500/20 rounded-xl p-3 transition-all text-rose-400 hover:text-rose-300 group">
      <i class="fa-solid fa-power-off text-rose-500 text-sm w-4 text-center"></i>
      <a href="Logout" class="text-xs font-bold tracking-wide">Secure Signout</a>
    </div>
  </div>

</aside>

  <div class="flex-grow min-h-screen flex flex-col pl-60">

    <!-- HEADER FRAME WITH SIMPLE BACK TO ACCOUNTS ANCHOR TAG -->
    <header class="fixed top-0 left-60 right-0 h-20 bg-white/90 border-b border-stone-200/80 shadow-xs flex items-center justify-between px-10 z-40">
      <div class="flex items-center gap-2.5">
        <span class="bg-amber-50 text-amber-800 text-[10px] font-extrabold px-2 py-0.5 rounded-md border border-amber-200 tracking-wide uppercase">System Admin</span>
        <h3 class="text-lg font-black tracking-tight text-stone-900">Control Dashboard</h3>
      </div>

      <!-- Simple Anchor Tag Action -->
      <a href="viewall_accounts.jsp" class="bg-stone-50 border border-stone-200 text-[11px] font-bold px-4 py-2.5 rounded-full text-stone-600 hover:text-stone-900 hover:border-stone-400 hover:bg-stone-100 shadow-xs transition-all flex items-center gap-2">
        <i class="fa-solid fa-arrow-left text-stone-400"></i> Back to Accounts
      </a>
    </header>

    <!-- MAIN SCROLLABLE CONTENT VIEW: Set spacing offset to pt-20 -->
    <main class="pt-20 min-h-screen bg-[#EAEFF1] w-full">
      <div class="p-8 space-y-6">

        <!-- UPDATED: PREMIUM COHESIVE BALANCE SHOWCASE CARD (BROWN/AMBER THEME) -->
        <div class="w-full bg-gradient-to-br from-[#B45309] to-[#78350F] rounded-3xl p-6 shadow-xl border border-[#92400E]/40 grid grid-cols-1 md:grid-cols-12 gap-6 items-center">
          
          <%Integer id = Integer.parseInt(request.getParameter("accid"));
          AccountDAO adao = new AccountDAOImpl();
          Account a = adao.getAccountById(id);
          %>
          
          <!-- Master Balance Highlight Grid Column -->
          <div class="md:col-span-5 border-b md:border-b-0 md:border-r border-white/10 pb-4 md:pb-0 md:pr-6">
            <span class="text-[10px] font-bold text-amber-200/70 uppercase tracking-wider block">Available Current Balance</span>
            <div class="flex items-baseline gap-1.5 mt-0.5">
              <h2 class="text-3xl font-black text-white tracking-tight">₹ <%=a.getBalance()%></h2>
              <span class="text-xs text-amber-300 font-bold">INR</span>
            </div>
          </div>

          <!-- Live Account Ledger Properties Column -->
          <div class="md:col-span-7 grid grid-cols-2 sm:grid-cols-3 gap-4">
            <div>
              <span class="text-[10px] font-bold text-amber-200/70 uppercase tracking-wider block">Account No</span>
              <p class="text-sm font-black text-white tracking-tight mt-1"><%=a.getAcc_no()%></p>
            </div>
            <div>
              <span class="text-[10px] font-bold text-amber-200/70 uppercase tracking-wider block">Classification</span>
              <p class="text-xs font-bold text-amber-100 mt-1.5"><%=a.getAcc_type()%> Account</p>
            </div>
            <div class="col-span-2 sm:col-span-1">
              <span class="text-[10px] font-bold text-amber-200/70 uppercase tracking-wider block">Status</span>
              <div class="mt-1">
                <span class="bg-emerald-500/20 text-emerald-300 text-[10px] font-extrabold px-2.5 py-0.5 rounded-full border border-emerald-500/30 uppercase tracking-wide inline-flex items-center gap-1.5">
                  <span class="w-1.5 h-1.5 rounded-full bg-emerald-400 animate-pulse"></span> <%=a.getStatus()%>
                </span>
              </div>
            </div>
          </div>

        </div>

        <!-- Info Cards Matrix Grid Layout -->
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">

          <!-- Card 1: Account Parameters (Returned to standard crisp white) -->
          <div class="bg-white rounded-3xl p-6 shadow-md border border-stone-200/60">
            <div class="flex items-center gap-2 mb-5">
              <div class="w-6 h-6 rounded bg-stone-100 flex items-center justify-center text-[#B45309]">
                <i class="fa-solid fa-credit-card text-xs"></i>
              </div>
              <h3 class="text-xs font-black text-stone-800 uppercase tracking-wider">Account Information</h3>
            </div>

            <div class="space-y-3.5">
              <div class="flex justify-between items-center border-b border-stone-100 pb-2.5">
                <span class="text-xs text-stone-400 font-semibold">Account Number</span>
                <span class="text-xs font-bold text-stone-800"><%=a.getAcc_no()%></span>
              </div>
              <div class="flex justify-between items-center border-b border-stone-100 pb-2.5">
                <span class="text-xs text-stone-400 font-semibold">Account Type</span>
                <span class="text-xs font-bold text-stone-700"><%=a.getAcc_type()%> Account</span>
              </div>
              <div class="flex justify-between items-center border-b border-stone-100 pb-2.5">
                <span class="text-xs text-stone-400 font-semibold">Status</span>
                <span class="text-[10px] font-bold text-emerald-700 bg-emerald-50 border border-emerald-100 px-2 py-0.5 rounded"><%=a.getStatus()%></span>
              </div>
              <div class="flex justify-between items-center">
                <span class="text-xs text-stone-400 font-semibold">Opened Date</span>
               <%LocalDate date = LocalDate.parse(a.getCreated_at());
                  DateTimeFormatter dd = DateTimeFormatter.ofPattern("dd MMM yyyy");
                %>
                <span class="text-xs font-bold text-stone-700"><%=date.format(dd)%></span>
              </div>
            </div>
          </div>
           
           <%UserDAO udao = new UserDAOImpl();
           User u1 = udao.getUserById(a.getUser_id());
           %>
           
          <!-- Card 2: Customer Identity Profile -->
          <div class="bg-white rounded-3xl p-6 shadow-md border border-stone-200/60">
            <div class="flex items-center gap-2 mb-5">
              <div class="w-6 h-6 rounded bg-stone-100 flex items-center justify-center text-[#B45309]">
                <i class="fa-solid fa-user text-xs"></i>
              </div>
              <h3 class="text-xs font-black text-stone-800 uppercase tracking-wider">Customer Information</h3>
            </div>

            <div class="space-y-3.5">
              <div class="flex justify-between items-center border-b border-stone-100 pb-2.5">
                <span class="text-xs text-stone-400 font-semibold">Customer Name</span>
                <span class="text-xs font-bold text-stone-800"><%=u1.getUser_name()%></span>
              </div>
              <div class="flex justify-between items-center border-b border-stone-100 pb-2.5">
                <span class="text-xs text-stone-400 font-semibold">Email</span>
                <span class="text-xs font-bold text-stone-700"><%=u1.getEmail()%></span>
              </div>
              <div class="flex justify-between items-center border-b border-stone-100 pb-2.5">
                <span class="text-xs text-stone-400 font-semibold">Phone</span>
                <span class="text-xs font-bold text-stone-700"><%=u1.getPhone()%></span>
              </div>
              <div class="flex justify-between items-center">
                <span class="text-xs text-stone-400 font-semibold">User ID</span>
                <span class="text-xs font-bold text-[#B45309]"><%=u1.getUser_id()%></span>
              </div>
            </div>
          </div>
           
           <%BranchDAO bdao = new BranchDAOImpl();
           Branch b = bdao.getBranchById(a.getBranch_id());
           %>
           
          <!-- Card 3: Origin Branch Parameters -->
          <div class="bg-white rounded-3xl p-6 shadow-md border border-stone-200/60">
            <div class="flex items-center gap-2 mb-5">
              <div class="w-6 h-6 rounded bg-stone-100 flex items-center justify-center text-[#B45309]">
                <i class="fa-solid fa-building-columns text-xs"></i>
              </div>
              <h3 class="text-xs font-black text-stone-800 uppercase tracking-wider">Branch Information</h3>
            </div>

            <div class="space-y-3.5">
              <div class="flex justify-between items-center border-b border-stone-100 pb-2.5">
                <span class="text-xs text-stone-400 font-semibold">Branch Office</span>
                <span class="text-xs font-bold text-stone-800"><%=b.getBranch_name()%></span>
              </div>
              <div class="flex justify-between items-center border-b border-stone-100 pb-2.5">
                <span class="text-xs text-stone-400 font-semibold">IFSC Index Code</span>
                <span class="text-xs font-bold text-[#B45309] tracking-wider"><%=b.getIfsc_code()%></span>
              </div>
              <div class="flex justify-between items-center border-b border-stone-100 pb-2.5">
                <span class="text-xs text-stone-400 font-semibold">City</span>
                <span class="text-xs font-bold text-stone-700"><%=b.getCity()%></span>
              </div>
              <div class="flex justify-between items-center">
                <span class="text-xs text-stone-400 font-semibold">State</span>
                <span class="text-xs font-bold text-stone-700"><%=b.getState()%></span>
              </div>
            </div>
          </div>

        </div>
        
        <%TranscationDAO tdao = new TranscationDAOImpl();
        List<Transcation> allTrans = tdao.getTranscationByAccId(a.getAcc_id());
        %>
        

        <!-- Analytical Counters Mini Strip Summary Group -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-5">

          <div class="bg-white p-4 rounded-2xl border border-stone-200/60 shadow-xs flex items-center gap-4">
            <div class="h-11 w-11 rounded-xl bg-sky-50 text-sky-700 flex items-center justify-center">
              <i class="fa-solid fa-right-left text-xs"></i>
            </div>
            <div>
              <p class="text-[10px] font-bold text-stone-400 uppercase tracking-wider block">Total Txns</p>
              <h2 class="text-lg font-black text-stone-800 mt-0.5 tracking-tight"><%=allTrans.size()%></h2>
            </div>
          </div>

          <div class="bg-white p-4 rounded-2xl border border-stone-200/60 shadow-xs flex items-center gap-4">
            <div class="h-11 w-11 rounded-xl bg-emerald-50 text-emerald-700 flex items-center justify-center">
              <i class="fa-solid fa-arrow-down text-xs"></i>
            </div>
            <div>
              <p class="text-[10px] font-bold text-stone-400 uppercase tracking-wider block">Total Credits</p>
              <%Double total = allTrans.stream().filter(t->t.getTo_acc_id() == a.getAcc_id()).filter(t->t.getStatus().equalsIgnoreCase("success")).collect(Collectors.summingDouble(t->t.getAmount()));%>
              <h2 class="text-lg font-black text-stone-800 mt-0.5 tracking-tight">₹ <%=total%></h2>
            </div>
          </div>

          <div class="bg-white p-4 rounded-2xl border border-stone-200/60 shadow-xs flex items-center gap-4">
            <div class="h-11 w-11 rounded-xl bg-rose-50 text-rose-700 flex items-center justify-center">
              <i class="fa-solid fa-arrow-up text-xs"></i>
            </div>
            <div>
             <%Double total1 = allTrans.stream().filter(t->t.getFrom_acc_id() == a.getAcc_id()).filter(t->t.getStatus().equalsIgnoreCase("success")).collect(Collectors.summingDouble(t->t.getAmount()));%>
              <p class="text-[10px] font-bold text-stone-400 uppercase tracking-wider block">Total Debits</p>
              <h2 class="text-lg font-black text-stone-800 mt-0.5 tracking-tight">₹ <%=total1%></h2>
            </div>
          </div>

          <div class="bg-white p-4 rounded-2xl border border-stone-200/60 shadow-xs flex items-center gap-4">
            <div class="h-11 w-11 rounded-xl bg-amber-50 text-amber-700 flex items-center justify-center">
              <i class="fa-solid fa-calendar text-xs"></i>
            </div>
            <div>
            <%Double amt = allTrans.stream().filter(t->t.getStatus().equalsIgnoreCase("success")).filter(t->t.getTrans_type().equalsIgnoreCase("transfer")).collect(Collectors.summingDouble(t->t.getAmount()));%>
              <p class="text-[10px] font-bold text-stone-400 uppercase tracking-wider block">Total Transfer Amount</p>
              <h2 class="text-lg font-black text-stone-800 mt-0.5 tracking-tight">₹ <%=amt%></h2>
            </div>
          </div>

        </div>

        <!-- RECENT TRANSACTIONS TABLE CONTAINER CARD -->
        <div class="bg-white rounded-3xl shadow-md border border-stone-200/60 overflow-hidden w-full">

          <div class="p-5 border-b border-stone-100 flex justify-between items-center">
            <h2 class="text-xs font-black text-stone-900 tracking-wider uppercase">Recent Transactions</h2>
            <span class="text-stone-400 text-[10px] font-bold uppercase tracking-wider">System Log</span>
          </div>

          <div class="overflow-x-auto overflow-y-auto max-h-[500px]">
            <table class="w-full text-left text-xs border-collapse">

              <thead class="bg-[#F9FAFB] border-b border-stone-200/60 text-stone-400 font-bold uppercase tracking-wider sticky top-0 z-10">
                <tr>
                  <th class="p-4 pl-6 font-bold">Txn ID</th>
                  <th class="p-4 font-bold">Date and Time</th>
                  <th class="p-4 font-bold">Type</th>
                  <th class="p-4 font-bold">Amount</th>
                  <th class="p-4 font-bold">Status</th>
                </tr>
              </thead>

              <tbody class="divide-y divide-stone-100 text-stone-700 font-medium">
              <%allTrans = allTrans.stream().sorted(Comparator.comparing((Transcation t)->t.getTranscation_date()).thenComparing((Transcation t)->t.getTranscation_time()).reversed()).collect(Collectors.toList());%>
                <%if(allTrans != null && !allTrans.isEmpty()){%>
                <%for(Transcation t : allTrans){%>
                <tr class="hover:bg-stone-50/60 transition-colors">
                  <td class="p-4 pl-6 font-bold text-stone-900">TXN<%=t.getTrans_id()%></td>
                  
                  <%LocalDate date1 = LocalDate.parse(t.getTranscation_date());
                  DateTimeFormatter dd1 = DateTimeFormatter.ofPattern("dd MMM yyyy");
                  LocalTime time = LocalTime.parse(t.getTranscation_time());
                  DateTimeFormatter dt = DateTimeFormatter.ofPattern("hh:mm a");
                %>
                  
                  <td class="p-4 text-stone-400"><%=date1.format(dd1)%>, <%=time.format(dt)%></td>
                  <td class="p-4">
                  <%if(t.getTrans_type().equalsIgnoreCase("transfer")){%>
                    <span class="text-sky-700 text-[10px] font-bold tracking-wider uppercase"><%=t.getTrans_type()%></span>
                    <%} else if (t.getTrans_type().equalsIgnoreCase("withdrawl")){%>
                    <span class="text-amber-700 text-[10px] font-bold tracking-wider uppercase"><%=t.getTrans_type()%></span>
                    <%} else { %>
                    <span class="text-emerald-700 text-[10px] font-bold tracking-wider uppercase"><%=t.getTrans_type()%></span>
                    <%}%>
                  </td>
                  <%if(t.getTrans_type().equalsIgnoreCase("transfer") || t.getTrans_type().equalsIgnoreCase("withdrawl")){%>
                  <td class="p-4 text-rose-600 font-bold">- ₹ <%=t.getAmount()%></td>
                  <%} else {%>
                  <td class="p-4 text-emerald-600 font-bold">+ ₹ <%=t.getAmount()%></td>
                  <%}%>
                  <td class="p-4">
                  <%if(t.getStatus().equalsIgnoreCase("success")){%>
                    <span class="text-emerald-600 text-[11px] font-bold"><%=t.getStatus()%></span>
                    <%} else {%>
                    <span class="text-red-600 text-[11px] font-bold"><%=t.getStatus()%></span>
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
    </main>

  </div>

</div>
<% } else {

    request.setAttribute("error", "session already expired");
    request.getRequestDispatcher("login.jsp").forward(request, response);

} %> 
</body>
</html>