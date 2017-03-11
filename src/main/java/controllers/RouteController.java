package controllers;

import java.util.Collection;
import java.util.HashSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import domain.Route;
import services.RouteService;

@Controller
@RequestMapping("/route")
public class RouteController extends AbstractController {
	
	// Services ---------------------------------------------------------------

	@Autowired
	private RouteService routeService;	
	
	// Constructors -----------------------------------------------------------
	
	public RouteController() {
		super();
	}
		
	// Search ------------------------------------------------------------------		

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView search(String origin, String destination, @RequestParam(required=false) String date,
			@RequestParam(required=false) String hour, @RequestParam(required=false) String envelope,
			@RequestParam(required=false) String itemSize) {
		ModelAndView result;
		Collection<Route> routes;
		
		routes = new HashSet<Route>();
		
		routes = routeService.searchRoute(origin, destination, date, hour, envelope, itemSize);
				
		result = new ModelAndView("route/search");
		result.addObject("routes", routes);

		return result;
	}
}