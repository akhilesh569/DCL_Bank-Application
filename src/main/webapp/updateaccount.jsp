<%@page import="java.util.List"%>
<%@page import="com.bank.dto.Branch"%>
<%@page import="com.bank.dao.impl.BranchDAOImpl"%>
<%@page import="com.bank.dao.BranchDAO"%>
<%@page import="com.bank.dto.Account"%>
<%@page import="com.bank.dao.impl.AccountDAOImpl"%>
<%@page import="com.bank.dao.AccountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DCL Bank - Update Account</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght=300;400;500;600;700;800&display=swap" rel="stylesheet">
  
  <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
  
  <style>
    body {
      font-family: 'Public Sans', sans-serif;
    }
    .admin-bg-gradient {
      background: radial-gradient(circle at top right, #1B3330 0%, #0D1F1D 100%);
    }
  </style>
</head>

<body class="bg-[#EAEFF1] text-slate-800 min-h-screen antialiased flex flex-col px-6 md:px-12 py-4 gap-2">

  <header class="w-full h-14 flex items-center justify-between bg-transparent shrink-0">
    <div class="flex gap-3 items-center">
      <div class="w-9 h-9 rounded-xl bg-gradient-to-br from-[#0D1F1D] to-[#1B3330] flex items-center justify-center border border-stone-200 shadow-xs">
        <i class="fa-solid fa-building-columns text-[#F59E0B] text-sm"></i>
      </div>
      <span class="text-base font-black tracking-tight text-stone-900 leading-none">DCL <span class="text-[#B45309]">BANK</span></span>
    </div>

    <div>
      <a href="viewall_accounts.jsp" class="bg-white border border-stone-200 text-[11px] font-bold px-4 py-2 rounded-full text-stone-600 hover:text-stone-900 hover:border-stone-300 shadow-xs transition-all flex items-center gap-2">
        <i class="fa-solid fa-arrow-left text-stone-400"></i> Return to Accounts
      </a>
    </div>
  </header>

  <main class="w-full max-w-[1100px] mx-auto flex-grow flex items-start justify-center w-full mt-6">
    
    <div class="w-full grid grid-cols-1 lg:grid-cols-12 rounded-3xl overflow-hidden shadow-xl border border-stone-200/60 bg-white min-h-[560px]">
      
      <div class="lg:col-span-5 admin-bg-gradient p-8 md:p-12 flex flex-col justify-between text-white relative overflow-hidden border-b lg:border-b-0 lg:border-r border-[#1B3330]">
        
        <div class="flex gap-2 items-center relative z-10">
          <div class="w-2 h-2 rounded-full bg-amber-500 animate-pulse"></div>
          <span class="text-[10px] font-bold text-[#94A19F] uppercase tracking-widest block">System Configuration</span>
        </div>

        <div class="my-10 relative z-10 space-y-2">
          <h1 class="text-3xl font-black text-white tracking-tight">Update Account</h1>
          <p class="text-xs text-[#94A19F] font-medium leading-relaxed max-w-sm">
            Modify account settings, switch branches, or adjust system status settings here.
          </p>
        </div>

        <div class="space-y-3 bg-white/5 border border-white/5 p-4 rounded-2xl relative z-10 backdrop-blur-xs">
          
          <div class="flex gap-3 items-center">
            <div class="w-7 h-7 rounded-lg bg-[#1B3330] border border-white/10 flex items-center justify-center text-[#F59E0B]">
              <i class="fa-solid fa-building-columns text-xs"></i>
            </div>
            <div>
              <h4 class="text-xs font-bold text-white">Update Branch</h4>
              <p class="text-[10px] text-[#94A19F]">Assign to a different city office</p>
            </div>
          </div>

          <div class="flex gap-3 items-center border-t border-white/5 pt-3">
            <div class="w-7 h-7 rounded-lg bg-[#1B3330] border border-white/10 flex items-center justify-center text-[#F59E0B]">
              <i class="fa-solid fa-list-check text-xs"></i>
            </div>
            <div>
              <h4 class="text-xs font-bold text-white">Change Status</h4>
              <p class="text-[10px] text-[#94A19F]">Approve, block, or close user accounts</p>
            </div>
          </div>

          <div class="flex gap-3 items-center border-t border-white/5 pt-3">
            <div class="w-7 h-7 rounded-lg bg-[#1B3330] border border-white/10 flex items-center justify-center text-[#F59E0B]">
              <i class="fa-solid fa-shield-halved text-xs"></i>
            </div>
            <div>
              <h4 class="text-xs font-bold text-white">Secure Control</h4>
              <p class="text-[10px] text-[#94A19F]">All account adjustments are securely logged</p>
            </div>
          </div>

        </div>

        <i class="fa-solid fa-building-columns text-[240px] text-white/[0.02] absolute -right-16 -bottom-16 pointer-events-none"></i>
      
      </div>

      <div class="lg:col-span-7 bg-[#F9FAFB] p-8 md:p-12 flex flex-col justify-center">
      
        <div class="mb-8">
          <h2 class="text-xl font-bold text-stone-800 tracking-tight">Update Details</h2>
          <p class="text-xs font-medium text-stone-400 mt-1">Please update the fields below to correct the account records.</p>
        </div>
        
        <%Integer id = null;
        if(request.getParameter("accid") != null){
        	id = Integer.parseInt(request.getParameter("accid"));
        }
        else{
        	id = (Integer) request.getAttribute("accid");
        }
         AccountDAO adao = new AccountDAOImpl();
         Account a = adao.getAccountById(id);
        %>
        
        
       <% String msg2 = (String)request.getAttribute("sucess"); %>
       <% if(msg2 != null){ %>
         <div id="msg2" class="bg-emerald-50 border border-emerald-200 text-emerald-700 text-xs p-3.5 rounded-xl mb-6 font-semibold flex items-center gap-2.5 shadow-xs">
           <i class="fa-solid fa-circle-check text-sm text-emerald-500"></i> <%= msg2 %>
         </div>
       <% } %>
      
        <form action="updateAccount" method="POST" class="space-y-6">

          <input type="hidden" name="accid" value="<%=a.getAcc_id()%>">

          <div class="grid grid-cols-1 gap-5">
            
            <div>
              <label class="text-[10px] font-bold text-stone-400 uppercase tracking-wider block mb-1.5">Branch Name</label>
              <div class="border-b border-stone-200 py-1.5 flex gap-3 items-center focus-within:border-[#B45309] transition-all">
                <i class="fa-solid fa-building-columns text-stone-400 text-sm w-5 text-center"></i>
                <select name="branch_id" class="bg-transparent border-0 focus:outline-none w-full text-xs font-semibold text-stone-700 cursor-pointer">
                  <%BranchDAO bdao = new BranchDAOImpl();
                   List<Branch> lb = bdao.getAllBranch();
                  %>
                  <%for(Branch b : lb){%>
                  <option value="<%=b.getBranch_id()%>" selected><%=b.getBranch_name()%></option>
                  <%}%>
                </select>
              </div>
            </div>

            <div>
              <label class="text-[10px] font-bold text-stone-400 uppercase tracking-wider block mb-1.5">Account Type</label>
              <div class="border-b border-stone-200 py-1.5 flex gap-3 items-center focus-within:border-[#B45309] transition-all">
                <i class="fa-solid fa-layer-group text-stone-400 text-sm w-5 text-center"></i>
                <select name="type" class="bg-transparent border-0 focus:outline-none w-full text-xs font-semibold text-stone-700 cursor-pointer">
                  <option value="savings" selected>Savings Account</option>
                  <option value="current">Current Account</option>
                  <option value="salary">Salary Account</option>
                </select>
              </div>
            </div>

            <div>
              <label class="text-[10px] font-bold text-stone-400 uppercase tracking-wider block mb-1.5">Account Status</label>
              <div class="border-b border-stone-200 py-1.5 flex gap-3 items-center focus-within:border-[#B45309] transition-all">
                <i class="fa-solid fa-circle-check text-stone-400 text-sm w-5 text-center"></i>
                <select name="status" class="bg-transparent border-0 focus:outline-none w-full text-xs font-bold text-[#B45309] tracking-wide cursor-pointer uppercase">
                  <option value="active" selected>ACTIVE</option>
                  <option value="pending">PENDING</option>
                  <option value="rejected">REJECTED</option>
                  <option value="blocked">BLOCKED</option>
                  <option value="closed">CLOSED</option>
                </select>
              </div>
            </div>

          </div>
     
          <div class="pt-6 flex justify-end">
            <button type="submit" class="w-full sm:w-auto bg-[#B45309] hover:bg-[#92400E] px-8 py-2.5 rounded-xl text-white text-xs font-bold tracking-wide transition-colors shadow-md shadow-amber-700/10 cursor-pointer flex items-center justify-center gap-2" type="submit">
              <i class="fa-solid fa-circle-check"></i> Update Account
            </button>
          </div>

        </form>

      </div>
    
    </div>
  </main>

 <script>
    let n = document.getElementById("msg2");
    if (n) {
      setTimeout(() => {
        n.style.display = 'none';
      }, 2000);
    }
  </script>
</body>
</html>