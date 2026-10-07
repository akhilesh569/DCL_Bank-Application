<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.stream.Collectors"%>
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
  <title>DCL Bank Admin - View Users</title>
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
        
        <div class="flex gap-3 items-center hover:bg-white/5 rounded-xl p-3 transition-all text-[#94A19F] hover:text-white group">
          <i class="fa-solid fa-chart-pie text-[#5A6E6B] group-hover:text-[#F59E0B] transition-colors text-sm w-4 text-center"></i>
          <a href="admin.jsp" class="text-xs font-semibold tracking-wide">Dashboard</a>
        </div>

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
              <h3 class="text-stone-800 font-bold text-xs tracking-tight"><%=u.getUser_name()%></h3>
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

      <div class="p-8 pt-28 space-y-6 flex-grow max-w-[1240px] w-full mx-auto">

        <div>
          <h1 class="text-2xl font-black text-stone-900 tracking-tight">Users Details</h1>
          <p class="text-xs font-medium text-stone-400 mt-0.5">Audit, authorize, and evaluate registered customer nodes.</p>
        </div>

        <form action="filteruser" method="POST" class="bg-white border border-stone-200/80 rounded-2xl shadow-sm p-5 flex flex-wrap gap-4 justify-between items-center">

          <div class="bg-stone-50 border border-stone-200/60 rounded-xl px-4 py-2.5 flex items-center gap-3 w-full sm:w-[280px] focus-within:border-amber-500 transition-colors">
            <i class="fa-solid fa-magnifying-glass text-stone-400 text-xs"></i>
            <input type="text" name="name" placeholder="Search by name..." class="outline-none w-full text-xs font-medium text-stone-700 placeholder-stone-400 bg-transparent">
          </div>

          <div class="bg-stone-50 border border-stone-200/60 rounded-xl px-4 py-2.5 flex items-center gap-3 w-full sm:w-[280px] focus-within:border-amber-500 transition-colors">
            <i class="fa-solid fa-envelope text-stone-400 text-xs"></i>
            <input type="email" name="mail" placeholder="Search by email descriptor..." class="outline-none w-full text-xs font-medium text-stone-700 placeholder-stone-400 bg-transparent">
          </div>

          <button type="submit" class="bg-[#B45309] text-white text-xs font-bold px-6 py-2.5 rounded-xl hover:bg-[#92400E] shadow-xs transition-colors cursor-pointer ml-auto sm:ml-0">
            Search
          </button>

          <a href="viewallusers.jsp" class="bg-stone-100 text-stone-600 border border-stone-200 text-xs font-bold px-5 py-2.5 rounded-xl hover:bg-stone-200 transition-colors text-center">
            Reset Filter
          </a>

        </form>

        <div class="bg-white border border-stone-200/80 rounded-2xl shadow-sm p-5">
          <div class="flex justify-between items-center mb-4 pb-3 border-b border-stone-100">
            <h2 class="text-xs font-black text-stone-900 tracking-tight uppercase flex items-center gap-2">
              <span class="w-2 h-2 rounded-full bg-amber-500"></span> Global Registry Log
            </h2>
            <span class="bg-stone-100 text-stone-600 border border-stone-200 text-[10px] font-extrabold px-2 py-0.5 rounded-md uppercase tracking-wide">Verified Entities</span>
          </div>

          <div class="overflow-x-auto custom-scrollbar">
            <table class="w-full text-left text-xs border-collapse">
              
              <thead>
                <tr class="bg-stone-50/70 text-stone-400 font-bold uppercase text-[9px] tracking-wider border-b border-stone-100">
                  <th class="p-3">User ID</th>
                  <th class="p-3">Identity Name</th>
                  <th class="p-3">Email</th>
                  <th class="p-3">Contact</th>
                  <th class="p-3">System Access Role</th>
                  <th class="p-3">Registration Date</th>
                  <th class="p-3 text-right">Action</th>
                </tr>
              </thead>

              <tbody class="divide-y divide-stone-100 text-stone-600 font-medium">
               
               <%UserDAO udao = new UserDAOImpl();
                 List<User> allUser = (List<User>)request.getAttribute("filterUser");
                 if(allUser == null){
                	 allUser = udao.getAllUser().stream().filter(u1->u1.getRole().equalsIgnoreCase("customer")).collect(Collectors.toList());
                 }
               %>
               <%for(User u2 : allUser){%>
                <tr class="hover:bg-stone-50/60 transition-colors">
                  <td class="p-3 font-bold text-stone-400 tracking-wide"><%=u2.getUser_id()%></td>
                  <td class="p-3 text-stone-900 font-bold"><%=u2.getUser_name()%></td>
                  <td class="p-3 text-stone-500"><%=u2.getEmail()%></td>
                  <td class="p-3 text-stone-600"><%=u2.getPhone()%></td>
                  <td class="p-3">
                    <span class="bg-amber-50 text-amber-800 border border-amber-200 text-[10px] font-extrabold px-2.5 py-0.5 rounded-md uppercase tracking-wider">
                      <%=u2.getRole()%>
                    </span>
                  </td>
                  <%
                  LocalDate date = LocalDate.parse(u2.getRegistered_date());
                  DateTimeFormatter dd = DateTimeFormatter.ofPattern("dd MMM yyyy");
                  %>
                  <td class="p-3 text-stone-500"><%=date.format(dd)%></td>
                 <td class="p-3 text-right">
				    <form action="viewuserdetails.jsp" method="post">
				        <input type="hidden" name="user_id" value="<%=u2.getUser_id()%>">
				
				        <button type="submit"
				            class="inline-flex items-center gap-1.5 bg-[#B45309] text-white text-[10px] font-bold px-3 py-1.5 rounded-lg hover:bg-[#92400E] shadow-xs transition-colors">
				            <i class="fa-solid fa-eye text-[9px]"></i> view
				        </button>
				    </form>
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