package training;

import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.math.BigDecimal;
import java.util.Map;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class TrainingServlet
 */
public class TrainingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final Map<String, Map<String, BigDecimal>> rates = new HashMap<String, Map<String, BigDecimal>>();

	static {
		
		Map<String, BigDecimal> usdRates = new HashMap<String, BigDecimal>();
		usdRates.put("GBP", new BigDecimal("0.80"));
		usdRates.put("EUR", new BigDecimal("0.90"));
		usdRates.put("CAD", new BigDecimal("1.20"));
		rates.put("USD", usdRates);
		Map<String, BigDecimal> cadRates = new HashMap<String, BigDecimal>();
		cadRates.put("USD", new BigDecimal("0.70"));
		cadRates.put("EUR", new BigDecimal("0.90"));
		cadRates.put("GBP", new BigDecimal("1.20"));
		rates.put("CAD", cadRates);
		Map<String, BigDecimal> eurRates = new HashMap<String, BigDecimal>();
		eurRates.put("USD", new BigDecimal("0.80"));
		eurRates.put("CAD", new BigDecimal("0.90"));
		eurRates.put("GBP", new BigDecimal("1.20"));
		rates.put("EUR", cadRates);
	}
    /**
     * Default constructor. 
     */
    public TrainingServlet() {
    	super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String currency = request.getParameter("baseCurrency");
		
		if(null == currency) {
			request.setAttribute("rates", rates.get("USD"));
		}else {
			request.setAttribute("rates", currency);
		}
		
		request.getRequestDispatcher("FXRate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
