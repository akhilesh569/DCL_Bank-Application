<%@page import="com.bank.dto.Transcation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DCL Bank — Payment Receipt</title>

  <!-- FontAwesome Icons & Clean Typography -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght=300;400;500;600;700;800&display=swap" rel="stylesheet">
  
  <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>

  <style>
    body {
      font-family: 'Public Sans', sans-serif;
    }
    .brand-bg-solid { background-color: #971B4E; }
    .brand-text-solid { color: #971B4E; }
    .brand-border-solid { border-color: #971B4E; }
    
    @keyframes receiptPop {
      from { opacity: 0; transform: scale(0.97) translateY(16px); }
      to { opacity: 1; transform: scale(1) translateY(0); }
    }
    .animate-receipt {
      animation: receiptPop 0.6s cubic-bezier(0.16, 1, 0.3, 1) forwards;
    }
  </style>
</head>

<body class="bg-[#f4f7fc] text-slate-800 min-h-screen flex flex-col justify-between antialiased relative overflow-x-hidden">

  <!-- Colorful background ambient blobs to fill the empty white space -->
  <div class="absolute top-[-10%] left-[-10%] w-[500px] h-[500px] bg-rose-200/30 rounded-full blur-3xl pointer-events-none -z-10"></div>
  <div class="absolute bottom-[10%] right-[-5%] w-[600px] h-[600px] bg-blue-100/40 rounded-full blur-3xl pointer-events-none -z-10"></div>

  <!-- Top Navigation Header -->
  <header class="w-full max-w-[1440px] mx-auto px-6 lg:px-16 py-6 flex items-center justify-between z-10">
    <div class="flex items-center gap-3">
      <div class="w-10 h-10 rounded-lg brand-bg-solid flex items-center justify-center shadow-md">
        <i class="fa-solid fa-building-columns text-white text-lg"></i>
      </div>
      <div class="leading-none">
        <span class="text-xl font-black text-slate-900 tracking-tight block">DCL <span class="brand-text-solid">BANK</span></span>
        <span class="text-[10px] font-bold text-slate-400 tracking-widest uppercase block mt-0.5">Payment Desk</span>
      </div>
    </div>
    
    <a href="Logout" class="text-xs font-bold text-rose-600 hover:bg-rose-50 px-4 py-2 rounded-lg border border-rose-200 transition-all flex items-center gap-2 bg-white shadow-xs">
      <i class="fa-solid fa-right-from-bracket text-[11px]"></i> Log Out
    </a>
  </header>

  <!-- Main Presentation Layout Wrapper -->
  <main class="flex-grow flex items-center justify-center px-4 py-8 z-10">
    
    <!-- Outer split container holding receipt and next steps info side-by-side -->
    <div class="w-full max-w-4xl grid grid-cols-1 md:grid-cols-12 gap-6 items-center animate-receipt">
      
      <!-- Left Side: Informative Panel (Fills the layout cleanly) -->
      <div class="md:col-span-5 space-y-5 px-2 text-center md:text-left">
        <div class="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-emerald-50 border border-emerald-200/60 text-emerald-700 text-[11px] font-bold tracking-wide">
          <i class="fa-solid fa-shield-halved"></i> Safe & Secure Connection
        </div>
        
        <div class="space-y-2">
          <h2 class="text-2xl font-extrabold text-slate-900 tracking-tight leading-tight">
            Transaction <br class="hidden md:block"> Processed.
          </h2>
          <p class="text-slate-500 text-xs leading-relaxed max-w-sm mx-auto md:mx-0">
            Your money transfer has been securely updated inside the core balance systems. 
          </p>
        </div>

        <!-- Quick helpful bullet checks using normal words -->
        <div class="space-y-3 pt-2 text-left hidden sm:block max-w-sm mx-auto md:mx-0">
          <div class="flex gap-3 items-start">
            <div class="mt-0.5 text-emerald-600"><i class="fa-solid fa-circle-check text-sm"></i></div>
            <p class="text-xs text-slate-600 font-medium">Your updated balance is now ready for use across web and mobile services.</p>
          </div>
          <div class="flex gap-3 items-start">
            <div class="mt-0.5 text-slate-400"><i class="fa-solid fa-envelope text-sm"></i></div>
            <p class="text-xs text-slate-600 font-medium">A formal digital statement summary has been generated for your transaction logs.</p>
          </div>
        </div>
      </div>

      <!-- Right Side: The Premium Transaction Receipt Card -->
      <div class="md:col-span-7 bg-white border border-slate-200/80 rounded-2xl shadow-xl p-6 lg:p-8 text-center relative overflow-hidden bg-white/90 backdrop-blur-md">
        
        <!-- Top Decorative Status Bar Color -->
        <div class="absolute top-0 left-0 right-0 h-1.5 bg-emerald-500"></div>

        <!-- Success Status Headers -->
        <div class="space-y-3 mt-2">
          <div class="w-14 h-14 bg-emerald-50 border border-emerald-200 rounded-full flex items-center justify-center mx-auto text-emerald-600 shadow-xs">
            <i class="fa-solid fa-check text-2xl"></i>
          </div>
          
          <div>
            <h1 class="text-xl font-black text-slate-900 tracking-tight">Payment Successful</h1>
            <p class="text-slate-400 text-xs mt-1">Your deposit request has been completed successfully.</p>
          </div>
        </div>


        <%Transcation t = (Transcation) request.getAttribute("transcation");%>

        <!-- Live Parameters Breakdown Matrix -->
        <div class="bg-slate-50 border border-slate-200/60 rounded-xl p-4 mt-6 space-y-3 text-xs">
          
          <div class="flex justify-between items-center pb-2 border-b border-dashed border-slate-200">
            <span class="text-slate-400 font-semibold">Transaction Status</span>
            <span class="font-bold text-emerald-700 tracking-wider bg-emerald-100 border border-emerald-300/50 px-2.5 py-0.5 rounded text-[10px]"><%=t.getStatus().toUpperCase()%></span>
          </div>
        
          <div class="flex justify-between items-center py-0.5">
            <span class="text-slate-400 font-semibold">Payment Mode</span>
            <span class="font-bold text-slate-800 uppercase tracking-wide"><%=t.getMode_of_transcation().toUpperCase()%></span>
          </div>

          <div class="flex justify-between items-center pt-2.5 border-t border-slate-200">
            <span class="text-slate-900 font-extrabold text-sm">Transcation Amount</span>
            <span class="text-lg font-black brand-text-solid">₹ <%=t.getAmount()%></span>
          </div>
          
        </div>

        <!-- Core Control Dashboard Link Actions -->
        <div class="flex flex-col sm:flex-row gap-3 mt-8">
          <a href="moneytransfer.jsp" class="w-full order-1 sm:order-2 brand-bg-solid text-white text-xs font-bold py-3 rounded-lg shadow-md hover:brightness-110 active:scale-[0.99] transition-all text-center block">
            Go to Dashboard
          </a>

          <a href="my_transcations.jsp" class="w-full order-2 sm:order-1 bg-slate-100 hover:bg-slate-200 text-slate-600 hover:text-slate-800 text-xs font-bold py-3 rounded-lg border border-slate-200 transition-all text-center block">
            View Transactions
          </a>
        </div>

      </div>

    </div>
    
  </main>

  <footer class="w-full bg-slate-900 text-center py-4 text-[11px] text-slate-500 px-6 border-t border-slate-800">
    <p>&copy; 2026 DCL Bank Groups Inc. Please save your reference updates for secure transaction logs.</p>
  </footer>

</body>
</html>