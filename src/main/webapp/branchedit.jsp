<%@page import="com.bank.dto.Branch"%>
<%@page import="com.bank.dao.impl.BranchDAOImpl"%>
<%@page import="com.bank.dao.BranchDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DCL Bank - Edit Branch</title>
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

<body class="bg-[#F2F5F4] text-slate-800 min-h-screen antialiased flex flex-col p-4 md:p-8 relative pt-16 md:pt-20">


  <header class="absolute top-0 left-0 right-0 h-16 flex items-center justify-between px-6 md:px-12 pointer-events-none">
    <!-- Left Side: Bank Logo -->
    <div class="flex gap-3 items-center pointer-events-auto">
      <div class="w-9 h-9 rounded-xl bg-gradient-to-br from-[#0D1F1D] to-[#1B3330] flex items-center justify-center border border-stone-200 shadow-xs">
        <i class="fa-solid fa-building-columns text-[#F59E0B] text-sm"></i>
      </div>
      <span class="text-base font-black tracking-tight text-stone-900 leading-none">DCL <span class="text-[#B45309]">BANK</span></span>
    </div>

    <!-- Right Side: Return Pill Button -->
    <div class="pointer-events-auto">
      <a href="branch.jsp" class="bg-white border border-stone-200 text-[11px] font-bold px-4 py-2 rounded-full text-stone-600 hover:text-stone-900 hover:border-stone-300 shadow-xs transition-all flex items-center gap-2">
        <i class="fa-solid fa-circle-arrow-left text-stone-400"></i> Return to Branches
      </a>
    </div>
  </header>


  <div class="w-full max-w-[1100px] grid grid-cols-1 lg:grid-cols-12 rounded-3xl overflow-hidden shadow-2xl border border-stone-200 min-h-[600px] mx-auto mt-4 mb-auto">
    
    <!-- Left Panel: Brand Info Box -->
    <div class="lg:col-span-5 admin-bg-gradient p-8 md:p-12 flex flex-col justify-between text-white relative overflow-hidden border-b lg:border-b-0 lg:border-r border-[#1B3330]">
      
      <div class="flex gap-2 items-center relative z-10">
        <div class="w-2 h-2 rounded-full bg-amber-500 animate-pulse"></div>
        <span class="text-[10px] font-bold text-[#94A19F] uppercase tracking-widest block">System Configuration</span>
      </div>

      <div class="my-10 relative z-10 space-y-2">
        <h1 class="text-3xl font-black text-white tracking-tight">Edit Branch</h1>
        <p class="text-xs text-[#94A19F] font-medium leading-relaxed max-w-sm">
          Change branch settings, adjust operational locations, and keep branch information accurate.
        </p>
      </div>


      <div class="space-y-3 bg-white/5 border border-white/5 p-4 rounded-2xl relative z-10 backdrop-blur-xs">
        
        <div class="flex gap-3 items-center">
          <div class="w-7 h-7 rounded-lg bg-[#1B3330] border border-white/10 flex items-center justify-center text-[#F59E0B]">
            <i class="fa-solid fa-location-dot text-xs"></i>
          </div>
          <div>
            <h4 class="text-xs font-bold text-white">Branch Location</h4>
            <p class="text-[10px] text-[#94A19F]">Regional geographic zoning</p>
          </div>
        </div>

        <div class="flex gap-3 items-center border-t border-white/5 pt-3">
          <div class="w-7 h-7 rounded-lg bg-[#1B3330] border border-white/10 flex items-center justify-center text-[#F59E0B]">
            <i class="fa-solid fa-code-branch text-xs"></i>
          </div>
          <div>
            <h4 class="text-xs font-bold text-white">Unique Gateway</h4>
            <p class="text-[10px] text-[#94A19F]">Verified clearing IFSC index code</p>
          </div>
        </div>

        <div class="flex gap-3 items-center border-t border-white/5 pt-3">
          <div class="w-7 h-7 rounded-lg bg-[#1B3330] border border-white/10 flex items-center justify-center text-[#F59E0B]">
            <i class="fa-solid fa-shield-halved text-xs"></i>
          </div>
          <div>
            <h4 class="text-xs font-bold text-white">System Security</h4>
            <p class="text-[10px] text-[#94A19F]">Changes are tracked in the database logs</p>
          </div>
        </div>

      </div>


      <i class="fa-solid fa-building-columns text-[240px] text-white/[0.02] absolute -right-16 -bottom-16 pointer-events-none"></i>
    
    </div>


    <div class="lg:col-span-7 bg-white p-8 md:p-12 flex flex-col justify-center">
    
      <!-- Form Input Header -->
      <div class="mb-6">
        <h2 class="text-xl font-black text-stone-900 tracking-tight">Update Details</h2>
        <p class="text-xs font-medium text-stone-400 mt-1">Please update the fields below to correct the branch file records.</p>
      </div>
      
      <%
      Integer id = null;
      if(request.getParameter("branch_id") != null){
    	  id = Integer.parseInt(request.getParameter("branch_id"));
      }
      else{
    	  id = (Integer)request.getAttribute("branch_id");
      }
      BranchDAO bdao = new BranchDAOImpl();
      Branch b = bdao.getBranchById(id);
      %>
      
       <% String msg2 = (String)request.getAttribute("sucess"); %>
       <% if(msg2 != null){ %>
         <div id="msg2" class="bg-emerald-50 border border-emerald-200 text-emerald-700 text-xs p-3.5 rounded-xl mb-6 font-semibold flex items-center gap-2.5 shadow-xs">
           <i class="fa-solid fa-circle-check text-sm text-emerald-500"></i> <%= msg2 %>
         </div>
       <% } %>
      <!-- Action Form Content -->
      <form action="updateBranch" method="POST" class="space-y-4">

        <!-- Hidden branch id input link -->
        <input type="hidden" name="id" value="<%=b.getBranch_id()%>">

        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
          <!-- Branch Name Field -->
          <div class="md:col-span-2">
            <label class="text-[10px] font-bold text-stone-400 uppercase tracking-wider block mb-1.5">Branch Name</label>
            <div class="bg-stone-50 border border-stone-200 rounded-xl px-3 py-2.5 flex gap-3 items-center focus-within:border-[#B45309] focus-within:bg-white transition-all">
              <i class="fa-solid fa-building-columns text-stone-400 text-sm w-5 text-center"></i>
              <input class="bg-transparent border-0 focus:outline-none w-full text-xs font-semibold text-stone-800 placeholder-stone-400"
                     type="text"
                     name="name"
                     placeholder="Enter branch name"
                     value="<%=b.getBranch_name()%>">
            </div>
          </div>

          <!-- Location Field -->
          <div class="md:col-span-2">
            <label class="text-[10px] font-bold text-stone-400 uppercase tracking-wider block mb-1.5">Location Details</label>
            <div class="bg-stone-50 border border-stone-200 rounded-xl px-3 py-2.5 flex gap-3 items-center focus-within:border-[#B45309] focus-within:bg-white transition-all">
              <i class="fa-solid fa-location-dot text-stone-400 text-sm w-5 text-center"></i>
              <input class="bg-transparent border-0 focus:outline-none w-full text-xs font-semibold text-stone-800 placeholder-stone-400"
                     type="text"
                     name="location"
                     placeholder="Enter location address"
                     value="<%=b.getLocation()%>">
            </div>
          </div>

          <!-- City Field -->
          <div>
            <label class="text-[10px] font-bold text-stone-400 uppercase tracking-wider block mb-1.5">City</label>
            <div class="bg-stone-50 border border-stone-200 rounded-xl px-3 py-2.5 flex gap-3 items-center focus-within:border-[#B45309] focus-within:bg-white transition-all">
              <i class="fa-solid fa-city text-stone-400 text-sm w-5 text-center"></i>
              <input class="bg-transparent border-0 focus:outline-none w-full text-xs font-semibold text-stone-800 placeholder-stone-400"
                     type="text"
                     name="city"
                     placeholder="Enter city"
                     value="<%=b.getCity()%>">
            </div>
          </div>

          <!-- State Field -->
          <div>
            <label class="text-[10px] font-bold text-stone-400 uppercase tracking-wider block mb-1.5">State</label>
            <div class="bg-stone-50 border border-stone-200 rounded-xl px-3 py-2.5 flex gap-3 items-center focus-within:border-[#B45309] focus-within:bg-white transition-all">
              <i class="fa-solid fa-map text-stone-400 text-sm w-5 text-center"></i>
              <input class="bg-transparent border-0 focus:outline-none w-full text-xs font-semibold text-stone-800 placeholder-stone-400"
                     type="text"
                     name="state"
                     placeholder="Enter state"
                     value="<%=b.getState()%>">
            </div>
          </div>

          <!-- IFSC Code Field -->
          <!-- <div class="md:col-span-2">
            <label class="text-[10px] font-bold text-stone-400 uppercase tracking-wider block mb-1.5">IFSC Code Mapping</label>
            <div class="bg-stone-50 border border-stone-200 rounded-xl px-3 py-2.5 flex gap-3 items-center focus-within:border-[#B45309] focus-within:bg-white transition-all">
              <i class="fa-solid fa-code text-stone-400 text-sm w-5 text-center"></i>
              <input class="bg-transparent border-0 focus:outline-none w-full text-xs font-bold text-[#B45309] tracking-wider placeholder-stone-400 uppercase"
                     type="text"
                     name="ifsc_code"
                     placeholder="Enter unique IFSC code"
                     value="DCLB0001234">
            </div>
          </div>  -->
          
          
        </div>
   
        <!-- Form Action Area -->
        <div class="pt-2 flex justify-end">
          <button type="submit" class="w-full sm:w-auto bg-[#B45309] hover:bg-[#92400E] px-8 py-3 rounded-xl text-white text-xs font-bold tracking-wide transition-colors shadow-md shadow-amber-700/10 cursor-pointer flex items-center justify-center gap-2" type="submit">
            <i class="fa-solid fa-circle-check"></i> Update Branch
          </button>
        </div>

      </form>

    </div>
  
  </div>

  <!-- Small Footer Tag -->
  <div class="text-center text-[10px] font-bold text-stone-400 uppercase tracking-wider pt-4 pointer-events-none">
    DCL Security Network © 2026
  </div>


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