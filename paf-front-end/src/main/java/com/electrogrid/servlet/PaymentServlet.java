package com.electrogrid.servlet;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.electrogrid.model.Payment;

import com.electrogrid.repository.PaymentRepository;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Payment paymentObject = new Payment();

    public PaymentServlet() {
    	super();
        // TODO Auto-generated constructor stub
    }

    //get payment list
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		String dispatchPage;
		
		try {
			PaymentRepository paymentRepository = new PaymentRepository();
			List <Payment> payments = paymentRepository.getPayments();
			
			request.setAttribute("payment_list", payments);
			
			if(payments != null) {
				dispatchPage = "PaymentList.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(dispatchPage);
				dispatcher.forward(request, response);
			}else {
				pw.println("<script type = 'text/javascript'>");
				pw.println("alert('Not Found Payment Details');");
				pw.println("location = 'PaymentServlet'");
				pw.println("</script>");
			}
			
		}catch (Exception ex){
			ex.printStackTrace();
		}
				
	}
	
	
 //add payment
	protected void doPost(HttpServletRequest request, HttpServletResponse response, Payment payments) throws ServletException, IOException {
		
		PaymentRepository paymentRepository = new PaymentRepository();
		Payment payment = new Payment();
		
		String name = request.getParameter("name");
		String account_no = request.getParameter("account_no");
		String amount = request.getParameter("amount");
		String card_no = request.getParameter("card_no");
		String security_code = request.getParameter("security_code");
		String expiration_date = request.getParameter("expiration_date");
		
		payment.setName(name);
		payment.setAccount_no(account_no);
		payment.setAmount(amount);
		payment.setCard_no(card_no);
        payment.setSecurity_code(security_code);
		payment.setExpiration_date(expiration_date);

		String output = paymentRepository.addPayment(payment);
		response.getWriter().write(output);
	}

	
	//delete payments
		protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			response.setContentType("text/html");
		    PrintWriter pw = response.getWriter();
			
			String Id = request.getParameter("id");
			
		    try {
		        //Class.forName("com.mysql.jdbc.Driver");
		        //String user = "root";
		        //String pass = "root";
		        //String query = "delete from user_details where email=?";
		        Connection con = DriverManager.getConnection("jdbc:mysql://locahost:3310/dbname", "root", "root");
		        PreparedStatement ps = con.prepareStatement("DELETE FROM `electro_grid`.`payment` WHERE (`id` = ?);");
		        ps.setString(1, "name");

		        int i = ps.executeUpdate();

		        if(i > 0) {
		            System.out.println("Payment successfully removed...");
		        }

		    } catch (Exception e) {
		        System.out.println(e);
		    }
		}
		
		
	}


