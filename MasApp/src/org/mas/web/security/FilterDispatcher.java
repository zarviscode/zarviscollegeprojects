package org.mas.web.security;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class FilterDispatcher implements Filter {

	private static Logger LOG = Logger.getLogger(FilterDispatcher.class);

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;

		String uri = request.getRequestURI();

		if (uri.equalsIgnoreCase("/")) {

			response.sendRedirect("home");
			return;

		}

		chain.doFilter(req, res);

	}

	@Override
	public void init(FilterConfig config) throws ServletException {

	}

}
